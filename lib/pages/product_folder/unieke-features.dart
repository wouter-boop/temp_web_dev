import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:odontium_website/widgets/over_odontium.dart';
import 'package:odontium_website/widgets/product_page/comparison_cards.dart';
import 'package:odontium_website/widgets/product_page/features_List.dart';
import 'package:odontium_website/widgets/product_page/sidekick_hero.dart';
import 'package:odontium_website/widgets/product_page/tab_features.dart';

import '../../widgets/general/block_container.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  //Product -> Odontium Overzicht
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlockContainer(child: SidekickHero()),
            BlockContainer(child: OverOdontium()),
            BlockContainer(child: Text("")),
            BlockContainer(child: TabFeatures()),
            BlockContainer(child: ComparisonCards()),
            BlockContainer(child: FeatureList())
          ],
        ),
      ),
    );
  }
}

