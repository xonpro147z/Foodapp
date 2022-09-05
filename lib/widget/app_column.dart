import 'package:flutter/material.dart';
import 'package:untitled/widget/small_text.dart';

import '../utils/color.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';
class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text,size: Dimensions.font26),
        SizedBox(height: Dimensions.heigth10),
        Row(
          children: [
            Wrap(
              children:List.generate(5, (index) {return Icon(Icons.star,color: AppColors.mainColor,size: 15,);}),
            ),
            SizedBox(width: 10,),
            SmallText(text:"4.5"),
            SizedBox(width: 10,),
            SmallText(text:"1287"),
            SizedBox(width: 10,),
            SmallText(text:"Bình luận"),
          ],
        ),
        SizedBox(height: Dimensions.heigth20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
              icon: Icons.circle_sharp,
              text: "Thường" ,
              iconColor: AppColors.iconColor1,
            ),
            IconAndTextWidget(
              icon: Icons.location_on,
              text: "12km" ,
              iconColor: AppColors.mainColor,
            ),
            IconAndTextWidget(
              icon: Icons.access_time_rounded,
              text: "37 phút" ,
              iconColor: AppColors.iconColor2,
            ),
          ],
        )
      ],
    );
  }
}
