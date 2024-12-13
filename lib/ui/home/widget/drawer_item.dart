import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
typedef OnPressed = void Function();
class DrawerItem extends StatelessWidget {
  final String image;
  final String title;
  final OnPressed onPress;
  const DrawerItem({super.key, required this.image,required this.title,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onPress();
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            SvgPicture.asset(image),
            const SizedBox(
              width: 16,
            ),
            Text(
              title,
            )
          ],
        ),
      ),
    );
  }
}
