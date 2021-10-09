import 'package:flutter/material.dart';
import 'package:payapp/shared/themes/app_colors.dart';
import 'package:payapp/shared/themes/app_text_style.dart';
import 'package:payapp/shared/themes/images.dart';

class BoletoInfoWidget extends StatefulWidget {
  final int size;
  const BoletoInfoWidget({Key? key, required this.size }) : super(key: key);

  @override
  _BoletoInfoWidgetState createState() => _BoletoInfoWidgetState();
}

class _BoletoInfoWidgetState extends State<BoletoInfoWidget> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              AppImages.logomini,
              color: AppColors.background,
              width: 56,
              height: 34,
            ),
            Container(
              width: 1,
              height: 32,
              color: AppColors.background,
            ),
            Text.rich(TextSpan(
              text: "Você tem ",
              style: TextStyles.captionBackground,
              children: [
                TextSpan(
                  text: "12 boletos\n",
                  style: TextStyles.captionBoldBackground
                ),
                TextSpan(
                  text: "cadastrados para pagar",
                  style: TextStyles.captionBackground
                ),
              ],
            ))
          ]
        ),
      ),
    );
  }
}