import 'package:flutter/material.dart';

//ignore: must_be_immutable
class CardTypeContainer extends StatefulWidget {
  IconData iconData;
  String title;
  TextStyle? titleTextStyle;
  String subTitle;
  TextStyle? subTitleTextStyle;
  String message;
  TextStyle? messageTextStyle;
  Color color;
  double padding = 30;
  int rowItem = 4;
  double height = 200;
  double width = 200;
  double elevation= 5;

  CardTypeContainer({
    super.key,
    this.iconData = Icons.add,
    required this.title,
    this.titleTextStyle,
    this.subTitle="",
    this.subTitleTextStyle,
    this.message = "",
    this.messageTextStyle,
    required this.color,
    padding = 30,
    height = 30,
    rowItem = 4,
    width = 200,
    elevation= 5



  });

  @override
  State<CardTypeContainer> createState() => _CardTypeContainerState();
}
class _CardTypeContainerState extends State<CardTypeContainer> {
  @override
  Widget build(BuildContext context) {
    if(widget.padding == 30){
      widget.padding = (MediaQuery.of(context).size.height*.058);
    }
    return Card(
      elevation: widget.elevation,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child:Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          //color: Color(0xffF99296),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
              colors: [
                widget.color,
                widget.color.withOpacity(.7),
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: const [0.0, 1.0],
              tileMode: TileMode.clamp),

        ),
        height: (MediaQuery.of(context).size.height*.27),
        width: (MediaQuery.of(context).size.width/4)-75,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  padding: EdgeInsets.all(widget.padding*.75),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: widget.titleTextStyle ?? const TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: widget.padding*.29,),
                      Text(
                        widget.subTitle,
                        style: widget.subTitleTextStyle ?? const TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: widget.padding,
                  left: widget.padding*.75,
                  child:  Text(
                    widget.message,
                    style: widget.messageTextStyle ?? const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Positioned(
                  top: -20,
                  right: -65,
                  child: Container(
                    alignment: Alignment.center,
                    width: constraints.maxWidth*.55,
                    height: constraints.maxHeight*.85,
                    decoration: BoxDecoration(
                      color: const Color(0x51FFFFFF),
                      borderRadius: BorderRadius.circular(85,),
                    ),
                    child: LayoutBuilder(
                      builder: (context, constant) {
                        return Container(
                            height: constant.maxHeight*.5,
                            width: constant.maxWidth*.5,
                            alignment: Alignment.topLeft,
                            child: Icon( widget.iconData,color: Colors.white,size: 30,)
                        );
                      },

                    ),
                  ),
                ),
                Positioned(
                  bottom: -60,
                  right: -20,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    width: constraints.maxWidth*.63,
                    height: constraints.maxHeight*.97,
                    decoration: BoxDecoration(
                      color: const Color(0x51FFFFFF),
                      borderRadius: BorderRadius.circular(95,),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
