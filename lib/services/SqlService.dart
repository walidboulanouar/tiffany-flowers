import 'package:ecomerceapp/models/CartItem.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/User.dart';
import '../providers/CartProvider.dart';
import '../providers/UserProvider.dart';
import '../providers/WishListProvider.dart';

class SqlService {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, "test.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE IF NOT EXISTS User(id INTEGER PRIMARY KEY,phone TEXT,email TEXT,firstName TEXT,lastName TEXT)");
    await db
        .execute("CREATE TABLE IF NOT EXISTS Product(id INTEGER PRIMARY KEY )");
    await db.execute(
        "CREATE TABLE IF NOT EXISTS Carts(productId INTEGER PRIMARY KEY ,name TEXT,sizePrice INTEGER,color INTEGER ,count INTEGER,image TEXT, price INTEGER,size TEXT)");
    print("Created tables");
  }

  void saveProduct(int id, WishListProvider wishListProvider) async {
    var dbClient = await db;
    await dbClient!.transaction((txn) async {
      List ids = await txn.rawQuery('SELECT * FROM Product WHERE id=${id}');

      if (ids.isEmpty) {
        await txn.rawInsert('INSERT INTO Product(id) VALUES(${id})');
        wishListProvider.addToWishList(id);
      }
    });
  }

  void saveUser(User user, UserProvider userProvider) async {
    var dbClient = await db;
    await dbClient!.transaction((txn) async {
      List ids = await txn.rawQuery('SELECT * FROM User WHERE id=${user.id}');

      if (ids.isEmpty) {
        await txn.rawInsert(
            "INSERT INTO User(id,phone,email,firstName,lastName) VALUES(${user.id},'${user.phone}','${user.email}','${user.firstName}','${user.lastName}')");
        userProvider.user = user;
      }
    });
  }

  void deleteProduct(int id, WishListProvider wishListProvider) async {
    var dbClient = await db;
    await dbClient!.transaction((txn) async {
      wishListProvider.removeFromWishList(id);
      await txn.rawDelete('DELETE FROM Product WHERE id = ?', [id]);
    });
  }
  void clearWishList( WishListProvider wishListProvider) async {
    var dbClient = await db;
    await dbClient!.transaction((txn) async {
      wishListProvider.wishListProducts=[];
      await txn.rawDelete('DELETE FROM Product');
    });
  }

  void deleteUser(UserProvider userProvider) async {
    var dbClient = await db;
    await dbClient!.transaction((txn) async {
      userProvider.deleteUser();
      await txn.rawDelete('DELETE FROM User');
    });
    print("done");
  }

  getProducts(WishListProvider wishListProvider) async {
    var dbClient = await db;
    List<Map> list = await dbClient!.rawQuery('SELECT * FROM Product');
    List<int> products = [];
    for (int i = 0; i < list.length; i++) {
      products.add(list[i]["id"]);
    }
    wishListProvider.wishList = products;
  }

  getUser(
    UserProvider userProvider,
  ) async {
    var dbClient = await db;
    List<Map> list = await dbClient!.rawQuery('SELECT * FROM User');

    list.isNotEmpty
        ? userProvider.user = User(
            id: list[0]['id'],
            phone: list[0]['phone'],
            email: list[0]['email'],
            firstName: list[0]['firstName'],
            lastName: list[0]['lastName'])
        : null;
  }

  //  getUserFromStorage(User? user) async {
  //   var dbClient = await db;
  //   List<Map> list = await dbClient!.rawQuery('SELECT * FROM User');

  //   if (list.isNotEmpty) {
  //     user= User(
  //         id: list[0]['id'],
  //         phone: list[0]['phone'],
  //         email: list[0]['email'],
  //         firstName: list[0]['firstName'],
  //         lastName: list[0]['lastName']);
  //   }
  // }

  void addToCart(CartItem item, CartProvider cartProvider) async {
    var dbClient = await db;

    await dbClient!.transaction((txn) async {
      List ids = await txn
          .rawQuery('SELECT * FROM Carts WHERE productId=${item.productId}');

      if (ids.isEmpty) {
        await txn.rawInsert(
            "INSERT INTO Carts(productId,name,sizePrice,color,count,image,price,size) VALUES(${item.productId},'${item.name}','${item.sizePrice}',${item.color},${item.count},'${item.image}',${item.price},'${item.size}')");
        cartProvider.addToCart(item);
      }
    });
  }

  void editCount(int itemId, int count, CartProvider cartProvider) async {
    var dbClient = await db;
    await dbClient!.transaction((txn) async {
      await txn.rawUpdate(
          'UPDATE Carts SET count = ${count} WHERE productId =${itemId}');
    });
    cartProvider.updateItemCount(itemId, count);
  }

  void deleteItem(int id, CartProvider cartProvider) async {
    var dbClient = await db;
    await dbClient!.transaction((txn) async {
      cartProvider.removeFromCart(id);
      await txn.rawDelete('DELETE FROM Carts WHERE productId = ?', [id]);
    });
  }

  void deleteCartItems(CartProvider cartProvider) async {
    var dbClient = await db;
    await dbClient!.transaction((txn) async {
      cartProvider.deleteItems();
      await txn.rawDelete('DELETE FROM Carts');
    });
  }

  getItems(CartProvider cartProvider) async {
    var dbClient = await db;
    List<Map> list = await dbClient!.rawQuery('SELECT * FROM Carts');
    List<CartItem> its = [];
    for (int i = 0; i < list.length; i++) {
      its.add(CartItem(
          productId: list[i]["productId"],
          name: list[i]["name"],
          color: list[i]["color"],
          count: list[i]["count"],
          image: list[i]["image"],
          price: list[i]["price"],
          size: list[i]["size"],
          sizePrice: list[i]["sizePrice"]));
    }
    cartProvider.items = its;
  }
}
