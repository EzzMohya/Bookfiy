import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          suffixIcon: const Icon(Icons.search),
          hintText: 'Search',
          border: outLinBorder(),
          enabledBorder: outLinBorder()),
    );
  }

  OutlineInputBorder outLinBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: const BorderSide(color: Colors.white, width: 0.8));
  }
}
