import 'package:adminui/models/product.dart';
import 'package:adminui/screens/new_product_page.dart';
import 'package:adminui/screens/search_product_in_group.dart';
import 'package:adminui/services/remote_service.dart';
import 'package:adminui/utils/color_palette.dart';
import 'package:adminui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProductGroupPage extends StatefulWidget {
  final String? name;
  ProductGroupPage({Key? key, this.name}) : super(key: key);

  @override
  State<ProductGroupPage> createState() => _ProductGroupPageState();
}

class _ProductGroupPageState extends State<ProductGroupPage> {
  var isLoaded = false;
  List<Product>? products;

  @override
  void initState() {
    super.initState();
    //fetch data from api
    getData();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // do something
      getData();
      print("Build Completed");
    });
  }

  getData() async {
    products = await RemoteService().getProduct();
    if (products != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
            right: 10,
          ),
          // Add product
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return NewProductPage(
                      group: '1',
                    );
                  },
                ),
              );
              setState(() {
                getData();
              });
            },
            splashColor: ColorPalette.bondyBlue,
            backgroundColor: ColorPalette.pacificBlue,
            child: const Icon(
              Icons.add,
              color: ColorPalette.white,
            ),
          ),
        ),
        body: Container(
            color: ColorPalette.pacificBlue,
            child: SafeArea(
                child: Container(
              color: ColorPalette.aquaHaze,
              height: double.infinity,
              width: double.infinity,
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 15,
                  ),
                  width: double.infinity,
                  height: 90,
                  decoration: const BoxDecoration(
                    color: ColorPalette.pacificBlue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.chevron_left_rounded,
                              size: 35,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          Text(
                            widget.name!.length > 14
                                ? '${widget.name!.substring(0, 12)}..'
                                : widget.name!,
                            style: const TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 28,
                              color: ColorPalette.timberGreen,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            splashColor: ColorPalette.timberGreen,
                            icon: const Icon(
                              Icons.search,
                              color: ColorPalette.timberGreen,
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      SearchProductInGroupPage(
                                    name: widget.name,
                                  ),
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: ColorPalette.timberGreen,
                            ),
                            onPressed: () {
                              //TODO
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                          const Text(
                            "Products",
                            style: TextStyle(
                              color: ColorPalette.timberGreen,
                              fontSize: 20,
                              fontFamily: "Nunito",
                            ),
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                            child: ListView.builder(
                              itemCount: products?.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ProductCard(
                                  // product: Product.fromJson(
                                  //   snapshot.data.docs[index].data(),
                                  // ),
                                  product: products![index],
                                  docID: products![index].id,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ))));
  }
}
