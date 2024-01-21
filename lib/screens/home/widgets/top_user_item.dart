import 'package:aspins_test_app/constants/colors.dart';
import 'package:aspins_test_app/constants/images.dart';
import 'package:aspins_test_app/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopUserItem extends StatelessWidget {
  final String ratingNumber;
  final String name;
  final String cost;
  final String? avatarSrc;

  const TopUserItem({
    super.key,
    required this.ratingNumber,
    required this.name,
    required this.cost,
    this.avatarSrc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(AspinsImages.topUser),
            Text(ratingNumber, style: Styles.text16w700),
          ],
        ),
        avatarSrc != null
            ? Padding(
                padding: const EdgeInsets.all(4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    avatarSrc!,
                    width: 75,
                    height: 75,
                  ),
                ),
              )
            : Card(
                color: AspinsColors.randomColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 17, horizontal: 25),
                  child: Text(name[0], style: Styles.text35w700),
                )),
        Text(name, style: Styles.text11),
        Text(cost, style: Styles.text15),
      ],
    );
  }
}
