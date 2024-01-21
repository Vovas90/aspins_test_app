import 'package:aspins_test_app/constants/colors.dart';
import 'package:aspins_test_app/constants/styles.dart';
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final String ratingNumber;
  final String name;
  final String cost;
  final bool isPro;
  final String? avatarSrc;

  const UserItem({
    super.key,
    required this.ratingNumber,
    required this.name,
    required this.cost,
    required this.isPro,
    this.avatarSrc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(ratingNumber, style: Styles.text16w700),
          avatarSrc != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          avatarSrc!,
                          width: 60,
                          height: 60,
                        ),
                      ),
                      if (isPro)
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AspinsColors.orange,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(3),
                              child: Text('Pro', style: Styles.text8),
                            ),
                          ),
                        ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Card(
                      color: AspinsColors.randomColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 17, horizontal: 22),
                        child: Text(name[0], style: Styles.text22w700),
                      )),
                ),
          Expanded(child: Text(name, style: Styles.text11)),
          Text(cost, style: Styles.text15),
        ],
      ),
    );
  }
}
