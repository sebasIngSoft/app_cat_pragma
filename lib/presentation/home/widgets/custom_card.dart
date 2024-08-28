import 'package:app_cat/domain/cat/model/cat.dart';
import 'package:app_cat/presentation/description/view/description_pg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      this.color = Colors.white,
      this.borderRadius = 2,
      this.padding = const EdgeInsets.all(0),
      this.margin = const EdgeInsets.all(0),
      required this.cat});

  final Color color;
  final double borderRadius;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Card(
          color: color,
          surfaceTintColor: color,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          child: Padding(
            padding: padding,
            child: Column(
              children: [
                Flexible(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(cat.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                    TextButton(
                      onPressed: () => Get.to(DescriptionPage(cat: cat)),
                      child: const Text('More...',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    )
                  ],
                )),
                Flexible(
                    flex: 6,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      height: Get.height * 0.5,
                      width: Get.width * 0.5,
                      child: CachedNetworkImage(
                        imageUrl: cat.urlImage ?? '',
                        errorWidget: (context, url, error) =>
                            Image.asset('assets/imagen-no-disponible.png'),
                        fit: BoxFit.cover,
                      ),
                    )),
                Flexible(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: Text('Origin: ${cat.origin}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16))),
                    Flexible(
                        child: Text('Intelligence: ${cat.intelligence}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)))
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
