import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RestrictionButton extends StatefulWidget {
  final String text;
  final String imgSrc;
  final List<bool> optionsRestrictition;
  final int index;
  bool? noRestriction;

  RestrictionButton(
      {Key? key,
      required this.text,
      required this.imgSrc,
      required this.optionsRestrictition,
      required this.index,
      required this.noRestriction})
      : super(key: key);

  @override
  State<RestrictionButton> createState() => _RestrictionButtonState();
}

class _RestrictionButtonState extends State<RestrictionButton> {
  void toggleState() {
    // if (!widget.optionsRestrictition.contains(true)) {
    //   setState(() {
    //     widget.optionsRestrictition[widget.index] = true;
    //   });
    // } else {
    //   if (widget.optionsRestrictition[widget.index] == true) {
    //     setState(() {
    //       widget.optionsRestrictition[widget.index] = false;
    //     });
    //   } else if (widget.optionsRestrictition[0] == false && widget.index > 0) {
    //     widget.optionsRestrictition[widget.index] = true;
    //   }
    // }
    // if (!widget.optionsRestrictition.contains(true)) {
    //   widget.noRestriction = null;
    // }
    // else if (widget.optionsRestrictition[0] == true) {
    //   widget.noRestriction = true;
    // } else {
    //   widget.noRestriction = false;
    // }

    setState(() {
      widget.optionsRestrictition[widget.index] = !widget.optionsRestrictition[widget.index];
    });
    // print(widget.noRestriction);
    // print(widget.optionsRestrictition);
    // print(widget.optionsRestrictition[widget.index]);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 109,
      height: 117,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(
              onPressed: toggleState,
              style: OutlinedButton.styleFrom(
                  fixedSize: const Size(80, 80),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  side: BorderSide(
                      width: 2,
                      color: widget.optionsRestrictition[widget.index]
                          ? const Color(0xffAE97C0)
                          : Colors.black)),
              child: Image.asset("assets/images/${widget.imgSrc}"),
            ),
            Text(
              widget.text,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins'),
            )
          ],
        ),
      ),
    );
  }
}
