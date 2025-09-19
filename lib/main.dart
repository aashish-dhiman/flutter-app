import 'package:flutter/material.dart';
import 'package:tortoise/components/effective_price_sheet.dart';
import 'package:tortoise/data/smartphone_data.dart';
import 'package:tortoise/views/product_view.dart';
import 'package:tortoise/views/product_catalogue.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tortoise',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleSpacing: 0,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tortoise'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductCatalogue(),
                    ),
                  );
                },
                child: const Text('Product Catalogue'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductView(
                          smartphoneDetails: SmartphoneData.iPhone16Pro),
                    ),
                  );
                },
                child: const Text('iPhone 16 Pro'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductView(
                        smartphoneDetails: SmartphoneData.iPhone17Pro,
                      ),
                    ),
                  );
                },
                child: const Text('iPhone 17 Pro'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  showEffectivePriceSheet(context, SmartphoneData.iPhone16Pro);
                },
                child:
                    const Text('Effective Price Bottom Sheet (16 pro details)'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  showEffectivePriceSheet(context, SmartphoneData.iPhone17Pro);
                },
                child:
                    const Text('Effective Price Bottom Sheet (17 pro details)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
