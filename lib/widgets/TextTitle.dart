import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

class TextTitle extends StatelessWidget {
  final title;
  TextTitle({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 2.h),
      child: Center(
        
        child: Text(title, style: TextStyle(fontSize: 14.sp,color:  Color(0xff73BFBD),)),
      ),
    );
  }
}
