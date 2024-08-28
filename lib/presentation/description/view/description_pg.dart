import 'package:app_cat/domain/cat/model/cat.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DescriptionPage extends StatelessWidget {
  final Cat cat;

  const DescriptionPage({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          title: Center(child: Text(cat.name)),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
              onPressed: () => Get.back()),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 13, right: 13, top: 5),
          child: Column(
            children: [
              Container(
                height: Get.height * 0.5,
                alignment: Alignment.center,
                child: CachedNetworkImage(
                  imageUrl: cat.urlImage!,
                  errorWidget: (context, url, error) =>
                      Image.asset('assets/imagen-no-disponible.png'),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Expanded(
                                flex: 1,
                                child: Text(
                                  'Origin: ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )),
                            Flexible(
                                flex: 2,
                                child: Text(
                                  cat.origin,
                                  style: const TextStyle(fontSize: 16),
                                ))
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: Text(
                              'Temperament: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            Flexible(
                                flex: 2,
                                child: Text(
                                  cat.temperament,
                                  style: const TextStyle(fontSize: 16),
                                ))
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: Text(
                              'Imperial: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            Flexible(
                                flex: 2,
                                child: Text(
                                  cat.weight.imperial,
                                  style: const TextStyle(fontSize: 16),
                                ))
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: Text(
                              'Metric: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            Flexible(
                                flex: 2,
                                child: Text(
                                  cat.weight.metric,
                                  style: const TextStyle(fontSize: 16),
                                ))
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: Text(
                              'Description: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            Flexible(
                                flex: 2,
                                child: Text(
                                  cat.description,
                                  style: const TextStyle(fontSize: 16),
                                ))
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: Text(
                              'Life Span: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            Flexible(
                                flex: 2,
                                child: Text(
                                  cat.lifeSpan,
                                  style: const TextStyle(fontSize: 16),
                                )),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: Text(
                              'Indoor: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            Flexible(
                                flex: 2,
                                child: Text(
                                  cat.indoor.toString(),
                                  style: const TextStyle(fontSize: 16),
                                )),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: Text(
                              'Lap: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            Flexible(
                                flex: 2,
                                child: Text(
                                  cat.lap.toString(),
                                  style: const TextStyle(fontSize: 16),
                                )),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: Text(
                              'Alt Names: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            Flexible(
                                flex: 2,
                                child: Text(
                                  cat.altNames ?? '',
                                  style: const TextStyle(fontSize: 16),
                                )),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: Text(
                              'Adaptability: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            Flexible(
                                flex: 2,
                                child: Text(
                                  cat.adaptability.toString(),
                                  style: const TextStyle(fontSize: 16),
                                )),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: Text(
                              'Affection Level: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            Flexible(
                                flex: 2,
                                child: Text(
                                  cat.affectionLevel.toString(),
                                  style: const TextStyle(fontSize: 16),
                                )),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: Text(
                              'Child Friendly: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            Flexible(
                                flex: 2,
                                child: Text(
                                  cat.childFriendly.toString(),
                                  style: const TextStyle(fontSize: 16),
                                )),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: Text(
                              'Dog Friendly: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            Flexible(
                                flex: 2,
                                child: Text(
                                  cat.dogFriendly.toString(),
                                  style: const TextStyle(fontSize: 16),
                                )),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: Text(
                              'Energy Level: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            Flexible(
                                flex: 2,
                                child: Text(
                                  cat.energyLevel.toString(),
                                  style: const TextStyle(fontSize: 16),
                                )),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: Text(
                              'Grooming: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            Flexible(
                                flex: 2,
                                child: Text(
                                  cat.grooming.toString(),
                                  style: const TextStyle(fontSize: 16),
                                )),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: Text(
                              'Health Issues: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            Flexible(
                                flex: 2,
                                child: Text(
                                  cat.healthIssues.toString(),
                                  style: const TextStyle(fontSize: 16),
                                )),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: Text(
                              'Intelligence: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            Flexible(
                                flex: 2,
                                child: Text(
                                  cat.intelligence.toString(),
                                  style: const TextStyle(fontSize: 16),
                                )),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: Text(
                              'Shedding Level: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            Flexible(
                                flex: 2,
                                child: Text(
                                  cat.sheddingLevel.toString(),
                                  style: const TextStyle(fontSize: 16),
                                )),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: Text(
                              'Social Needs: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            Flexible(
                                flex: 2,
                                child: Text(
                                  cat.socialNeeds.toString(),
                                  style: const TextStyle(fontSize: 16),
                                )),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: Text(
                              'Stranger Friendly: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            Flexible(
                                flex: 2,
                                child: Text(
                                  cat.strangerFriendly.toString(),
                                  style: const TextStyle(fontSize: 16),
                                )),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: Text(
                              'Vocalisation: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            Flexible(
                                flex: 2,
                                child: Text(
                                  cat.vocalisation.toString(),
                                  style: const TextStyle(fontSize: 16),
                                )),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: Text(
                              'Experimental: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            Flexible(
                                flex: 2,
                                child: Text(
                                  cat.experimental.toString(),
                                  style: const TextStyle(fontSize: 16),
                                )),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: Text(
                              'Hairless: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            Flexible(
                                flex: 2,
                                child: Text(
                                  cat.hairless.toString(),
                                  style: const TextStyle(fontSize: 16),
                                )),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: Text(
                              'Natural: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            Flexible(
                                flex: 2,
                                child: Text(
                                  cat.natural.toString(),
                                  style: const TextStyle(fontSize: 16),
                                )),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: Text(
                              'Rare: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            Flexible(
                                flex: 2,
                                child: Text(
                                  cat.rare.toString(),
                                  style: const TextStyle(fontSize: 16),
                                )),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: Text(
                              'Rex: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            Flexible(
                                flex: 2,
                                child: Text(
                                  cat.rex.toString(),
                                  style: const TextStyle(fontSize: 16),
                                )),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: Text(
                              'Suppressed Tail: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            Flexible(
                                flex: 2,
                                child: Text(
                                  cat.suppressedTail.toString(),
                                  style: const TextStyle(fontSize: 16),
                                )),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                                child: Text(
                              'Short Legs: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                            Flexible(
                                flex: 2,
                                child: Text(
                                  cat.shortLegs.toString(),
                                  style: const TextStyle(fontSize: 16),
                                )),
                          ],
                        ),
                      ]),
                ),
              ))
            ],
          ),
        ));
  }
}
