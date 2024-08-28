import 'package:app_cat/presentation/home/view_model/home_vm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputSearch extends StatelessWidget {
  InputSearch({super.key});
  final HomeViewModel homeViewModel = Get.find();
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        homeViewModel.searchCat(value);
      },
      decoration: InputDecoration(
        labelText: 'Search...',
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          onPressed: () {
            homeViewModel.searchCat(controller.text);
          },
          icon: const Icon(Icons.search),
          color: Colors.black,
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(30)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
