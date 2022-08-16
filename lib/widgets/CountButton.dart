import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../providers/IndexProvider.dart';

class CountButton extends StatelessWidget {
  const CountButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IndexProvider indexProvider = Provider.of<IndexProvider>(context);
    return Container(
      width: 35.w,
      height: 6.h,
      padding: EdgeInsets.symmetric(
        horizontal: 6.sp,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color(0xff73BFBD)),
      child: Row(
        children: [
          InkWell(
              onTap: () {
                indexProvider.removeOne();
              },
              child: Icon(
                Icons.remove,
                color: Colors.white,
                size: 17.sp,
              )),
          Flexible(
            child: Center(
              child: Container(
                // margin: EdgeInsets.symmetric(horizontal: 3),
                padding: EdgeInsets.only(
                    bottom: 4.sp, left: 12.sp, right: 12.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Color(0xff73BFBD)),
                child: Text(
                  indexProvider.productCount.toString(),
                  style: TextStyle(
                      color: Colors.white, fontSize: 15.sp),
                ),
              ),
            ),
          ),
          InkWell(
              onTap: () {
                indexProvider.addOne();
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 17.sp,
              )),
        ],
      ),
    );
  }
}