import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../translations/locale_keys.g.dart';

class CustomBottomSheet extends StatefulWidget {
  final Widget child;
  final double height;
  final bool withHeader;

  const CustomBottomSheet(
      {Key? key,
      required this.child,
      required this.height,
      this.withHeader = true})
      : super(key: key);

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  bool value2 = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1)).then((value) {
      value2 = true;
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.bounceInOut,
          color: Colors.transparent,
          height: widget.height
          
          ,
          child: Container(
            width: 100.w,
            padding: const EdgeInsets.only(top: 16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (widget.withHeader) const BottomSheetHeader(),
                widget.child,
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BottomSheetHeader extends StatelessWidget {
  const BottomSheetHeader({this.title, this.onCloseSheet});

  final String? title;
  final VoidCallback? onCloseSheet;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(9), topRight: Radius.circular(9)),
      ),
      child: Column(
        children: [
          InkWell(
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () => Navigator.pop(context),
            child: const SizedBox(
              width: 80,
              height: 26,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                ),
                child: Icon(
                  CupertinoIcons.chevron_compact_down,
                  size: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LangWidget extends StatefulWidget {
  String lg;
  LangWidget({Key? key, required this.lg}) : super(key: key);

  @override
  State<LangWidget> createState() => _LangWidgetState();
}

class _LangWidgetState extends State<LangWidget> {
  String language = '';
  @override
  Widget build(BuildContext context) {
    language = widget.lg;
    return Column(
      children: [
        Center(
          child: Text(
            LocaleKeys.ChooseLang.tr(),
            style: TextStyle(fontSize: 15.sp, color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        Divider(
          thickness: 0.1,
          color: Colors.grey,
        ),
        Container(
          height: 40.sp,
          decoration: BoxDecoration(
            border: Border.all(color:  Color(0xff73BFBD),),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Color(0xff73BFBD), spreadRadius: 0.01),
            ],
          ),
          child: RadioListTile(
            activeColor: Color(0xff73BFBD),
            title: Text(
              LocaleKeys.Eng.tr(),
            ),
            value: "en",
            groupValue: language,
            onChanged: (value) {
              setState(() {
                language = value.toString();
                context.setLocale(Locale('en', 'US'));
                Navigator.pop(context);
              });
            },
          ),
        ),
        SizedBox(height: 10.sp,),
        Container(
          height: 40.sp,
          decoration: BoxDecoration(
            border: Border.all(color:  Color(0xff73BFBD),),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Color(0xff73BFBD), spreadRadius: 0.01),
            ],
          ),
          child: RadioListTile(
            activeColor: Color(0xff73BFBD),
            title: Text(
              LocaleKeys.Arab.tr(),
            ),
            value: "ar",
            groupValue: language,
            onChanged: (value) {
              setState(() {
                language = value.toString();
                context.setLocale(Locale('ar', 'AE'));
                Navigator.pop(context);
              });
            },
          ),
        )
      ],
    );
  }
}
