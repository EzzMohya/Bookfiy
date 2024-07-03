import 'package:bookliy/Core/utils/styles.dart';
import 'package:bookliy/Core/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).height * .04),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: CustomButton(
              title: 'Free',
              titleStyle: Styles.styleBold20
                  .copyWith(fontSize: 18, color: Colors.black),
              color: const Color(0xffFFFFFF),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
            ),
          ),
          Expanded(
            child: CustomButton(
              title: 'Free preview',
              titleStyle: Styles.styleBold20
                  .copyWith(fontSize: 16, color: Colors.white),
              color: const Color(0xffEF8262),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            ),
          ),
        ],
      ),
    );
  }
}
