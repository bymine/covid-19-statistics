import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final String image;
  const CustomAppBar({Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * 0.35,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            const Color(0xff1C44AE),
            const Color(0xff1C44AE).withOpacity(0.8)
          ],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Container(
        padding: EdgeInsets.only(
          top: context.mediaQueryPadding.top,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset("assets/images/virus.png").image),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      image,
                      height: Get.height * 0.45,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                    Text(
                      title,
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
