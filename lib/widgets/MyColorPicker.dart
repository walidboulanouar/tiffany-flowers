// my_color_picker.dart
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyColorPicker extends StatefulWidget {
  // This function sends the selected color to outside
  final Function onSelectColor;

  // List of pickable colors
  final List<Color> availableColors;

  // The default picked color
  final Color initialColor;

  // Determnie shapes of color cells
  final bool circleItem;

  const MyColorPicker(
      {Key? key,
      required this.onSelectColor,
      required this.availableColors,
      required this.initialColor,
      this.circleItem = true})
      : super(key: key);

  @override
  _MyColorPickerState createState() => _MyColorPickerState();
}

class _MyColorPickerState extends State<MyColorPicker> {
  // This variable used to determine where the checkmark will be
  late Color _pickedColor;

  @override
  void initState() {
    _pickedColor = widget.initialColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: double.infinity,
      // height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        //     maxCrossAxisExtent: 50,
        //     childAspectRatio: 1 / 1,
        //     crossAxisSpacing: 10,
        //     mainAxisSpacing: 10),
        itemCount: widget.availableColors.length,
        itemBuilder: (context, index) {
          final itemColor = widget.availableColors[index];
          return InkWell(
            onTap: () {
              widget.onSelectColor(itemColor);
              setState(() {
                _pickedColor = itemColor;
                
              });
            },
            child: Container(
                decoration: itemColor == _pickedColor?BoxDecoration(
                  
                  shape: 
                       BoxShape.circle
                     ,
                  border: Border.all(width: 1.sp, color:Color(0xff73BFBD))):null,
                margin: EdgeInsets.only(right: 10.sp),
                padding: EdgeInsets.all(2.sp),
                child: ImageIcon(
                  size: 12.sp,
                  color:itemColor,
                  AssetImage("assets/images/categoryicon.png"))),

            //  Container(
            //   margin:EdgeInsets.symmetric(horizontal: 5.sp),
            //   width: 20.sp,
            //   height: 20.sp,
              // decoration: BoxDecoration(
              //     color: itemColor,
              //     shape: widget.circleItem == true
              //         ? BoxShape.circle
              //         : BoxShape.rectangle,
              //     border: Border.all(width: 1, color: Colors.grey.shade300)),
            //   child: itemColor == _pickedColor
            //       ?  Center(
            //           child: Icon(
            //             size: 10.sp,
            //             Icons.check,
            //             color: Colors.white,
            //           ),
            //         )
            //       : Container(),
            // ),
          );
        },
      ),
    );
  }
}
