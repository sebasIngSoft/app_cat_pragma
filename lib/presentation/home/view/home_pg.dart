import 'package:app_cat/presentation/home/view_model/home_vm.dart';
import 'package:app_cat/presentation/home/widgets/input_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomeViewModel homeViewModel = HomeViewModel.findOrInitialize;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Center(child: Text('Catbreeds')),
      ),
      body: AnimatedOpacity(
        opacity: 1,
        duration: const Duration(seconds: 2),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(children: [
            InputSearch(),
            Obx(() => homeViewModel.listCard.isNotEmpty
                ? Expanded(
                    child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    padding: const EdgeInsets.all(10),
                    itemCount: homeViewModel.listCard.length,
                    itemBuilder: (context, index) =>
                        homeViewModel.listCard[index],
                  ))
                : Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      backgroundColor: Colors.grey,
                    ),
                  )),
          ]),
        ),
      ),
    );
  }
}
