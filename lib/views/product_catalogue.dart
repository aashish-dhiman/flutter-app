import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tortoise/components/search_bar.dart';
import 'package:tortoise/views/home_screen_list.dart';

class ProductCatalogue extends StatelessWidget {
  const ProductCatalogue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SearchBarWithBadge(),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            PhosphorIcons.caretCircleLeft(),
            size: 32.0,
          ),
        ),
        toolbarHeight: 72,
      ),
      body: const HomeScreenList(),
    );
  }
}
