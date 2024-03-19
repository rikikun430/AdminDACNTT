import 'dart:js_util';
import 'dart:math';

import 'package:adminui/functions/confirm_dialog.dart';
import 'package:adminui/functions/toast.dart';
import 'package:adminui/models/product.dart';
import 'package:adminui/screens/product_group_page.dart';
import 'package:adminui/services/remote_service.dart';
import 'package:adminui/utils/color_palette.dart';
import 'package:adminui/widgets/location_drop_down.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product? product;
  final String? docID;
  ProductDetailsPage({Key? key, this.product, this.docID}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Delete(String? id) async {
    RemoteService().deleteProduct(id!);
    Navigator.pop(context, 'Cancel');
    setState(() {});
  }

  Update(String? id) async {
    final currentTime = DateTime.now();
    final jdt = Jiffy.parseFromDateTime(currentTime);
    final DateTimeNow = jdt.MMMMEEEEd;

    Product udaptedProduct = Product(
        id: widget.product!.id,
        name: widget.product!.name,
        description: widget.product!.description,
        price: widget.product!.price,
        stars: widget.product!.stars,
        img: 'unknownnnnnnnnnnnnnnnnnnnnn',
        location: widget.product!.location,
        createdAt: DateTimeNow,
        updatedAt: DateTimeNow,
        typeId: widget.product!.typeId);
    // print(
    //     "product:${udaptedProduct.id} ${udaptedProduct.name} ${udaptedProduct.description} ${udaptedProduct.price} ${udaptedProduct.stars} ${udaptedProduct.img} ${udaptedProduct.location}${udaptedProduct.createdAt}${udaptedProduct.updatedAt}${udaptedProduct.typeId}");
    RemoteService().updateProduct(id!, udaptedProduct);
    // ignore: use_build_context_synchronously
    const AlertDialog(
      title: Text('Success!!!!'),
    );
  }

  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
          right: 10,
        ),
        child: FloatingActionButton(
          onPressed: () {
            Update(widget.product!.id);
            Navigator.of(context).pop();
          },
          splashColor: ColorPalette.bondyBlue,
          backgroundColor: ColorPalette.pacificBlue,
          child: const Icon(
            Icons.done,
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
            child: Column(
              children: [
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
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          const Text(
                            "Edit Product",
                            style: TextStyle(
                              fontFamily: "Nunito",
                              fontSize: 28,
                              color: ColorPalette.timberGreen,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: ColorPalette.timberGreen,
                        ),
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Warning!!!!'),
                            content: Text(
                                'Do you delete ${widget.product!.name}  product'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Delete(widget.product?.id);
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ProductGroupPage(
                                          name: "All",
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                          //  Navigator.of(context).pop();
                        ),
                      ),
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
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 50,
                                  ),
                                  margin: const EdgeInsets.only(top: 75),
                                  decoration: const BoxDecoration(
                                    color: ColorPalette.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    ),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 8,
                                            bottom: 12,
                                          ),
                                          child: Text(
                                            "Product Group : ${widget.product!.typeId}",
                                            style: const TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 17,
                                              color: ColorPalette.nileBlue,
                                            ),
                                          ),
                                        ),

                                        Container(
                                          decoration: BoxDecoration(
                                            color: ColorPalette.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            boxShadow: [
                                              BoxShadow(
                                                offset: const Offset(0, 3),
                                                blurRadius: 6,
                                                color: ColorPalette.nileBlue
                                                    .withOpacity(0.1),
                                              ),
                                            ],
                                          ),
                                          height: 50,
                                          child: TextFormField(
                                            initialValue:
                                                widget.product!.name ?? '',
                                            onChanged: (value) {
                                              widget.product!.name = value;
                                            },
                                            textInputAction:
                                                TextInputAction.next,
                                            key: UniqueKey(),
                                            keyboardType: TextInputType.text,
                                            style: const TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 16,
                                              color: ColorPalette.nileBlue,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Product Name",
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hintStyle: TextStyle(
                                                fontFamily: "Nunito",
                                                fontSize: 16,
                                                color: ColorPalette.nileBlue
                                                    .withOpacity(0.58),
                                              ),
                                            ),
                                            cursorColor:
                                                ColorPalette.timberGreen,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: ColorPalette.white,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      offset:
                                                          const Offset(0, 3),
                                                      blurRadius: 6,
                                                      color: ColorPalette
                                                          .nileBlue
                                                          .withOpacity(0.1),
                                                    ),
                                                  ],
                                                ),
                                                height: 50,
                                                child: TextFormField(
                                                  initialValue: widget
                                                              .product!.price ==
                                                          null
                                                      ? ''
                                                      : widget.product!.price
                                                          .toString(),
                                                  onChanged: (value) {
                                                    widget.product!.price =
                                                        int.parse(value);
                                                  },
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  key: UniqueKey(),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  style: const TextStyle(
                                                    fontFamily: "Nunito",
                                                    fontSize: 16,
                                                    color:
                                                        ColorPalette.nileBlue,
                                                  ),
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: "Cost",
                                                    filled: true,
                                                    fillColor:
                                                        Colors.transparent,
                                                    hintStyle: TextStyle(
                                                      fontFamily: "Nunito",
                                                      fontSize: 16,
                                                      color: ColorPalette
                                                          .nileBlue
                                                          .withOpacity(0.58),
                                                    ),
                                                  ),
                                                  cursorColor:
                                                      ColorPalette.timberGreen,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: ColorPalette.white,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      offset:
                                                          const Offset(0, 3),
                                                      blurRadius: 6,
                                                      color: ColorPalette
                                                          .nileBlue
                                                          .withOpacity(0.1),
                                                    ),
                                                  ],
                                                ),
                                                height: 50,
                                                child: TextFormField(
                                                  initialValue: widget
                                                              .product!.stars ==
                                                          null
                                                      ? ''
                                                      : widget.product!.stars
                                                          .toString(),
                                                  onChanged: (value) {
                                                    widget.product!.stars =
                                                        int.parse(value);
                                                  },
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  key: UniqueKey(),
                                                  keyboardType:
                                                      TextInputType.number,
                                                  style: const TextStyle(
                                                    fontFamily: "Nunito",
                                                    fontSize: 16,
                                                    color:
                                                        ColorPalette.nileBlue,
                                                  ),
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: "Quantity",
                                                    filled: true,
                                                    fillColor:
                                                        Colors.transparent,
                                                    hintStyle: TextStyle(
                                                      fontFamily: "Nunito",
                                                      fontSize: 16,
                                                      color: ColorPalette
                                                          .nileBlue
                                                          .withOpacity(0.58),
                                                    ),
                                                  ),
                                                  cursorColor:
                                                      ColorPalette.timberGreen,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: ColorPalette.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            boxShadow: [
                                              BoxShadow(
                                                offset: const Offset(0, 3),
                                                blurRadius: 6,
                                                color: ColorPalette.nileBlue
                                                    .withOpacity(0.1),
                                              ),
                                            ],
                                          ),
                                          height: 50,
                                          child: TextFormField(
                                            initialValue:
                                                widget.product!.location ?? '',
                                            onChanged: (value) {
                                              widget.product!.location = value;
                                            },
                                            textInputAction:
                                                TextInputAction.next,
                                            key: UniqueKey(),
                                            keyboardType: TextInputType.text,
                                            style: const TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 16,
                                              color: ColorPalette.nileBlue,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Company",
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hintStyle: TextStyle(
                                                fontFamily: "Nunito",
                                                fontSize: 16,
                                                color: ColorPalette.nileBlue
                                                    .withOpacity(0.58),
                                              ),
                                            ),
                                            cursorColor:
                                                ColorPalette.timberGreen,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: ColorPalette.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            boxShadow: [
                                              BoxShadow(
                                                offset: const Offset(0, 3),
                                                blurRadius: 6,
                                                color: ColorPalette.nileBlue
                                                    .withOpacity(0.1),
                                              ),
                                            ],
                                          ),
                                          height: 50,
                                          child: TextFormField(
                                            initialValue:
                                                widget.product!.description ??
                                                    '',
                                            onChanged: (value) {
                                              widget.product!.description =
                                                  value;
                                            },
                                            textInputAction:
                                                TextInputAction.next,
                                            key: UniqueKey(),
                                            keyboardType: TextInputType.text,
                                            style: const TextStyle(
                                              fontFamily: "Nunito",
                                              fontSize: 16,
                                              color: ColorPalette.nileBlue,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Description",
                                              filled: true,
                                              fillColor: Colors.transparent,
                                              hintStyle: TextStyle(
                                                fontFamily: "Nunito",
                                                fontSize: 16,
                                                color: ColorPalette.nileBlue
                                                    .withOpacity(0.58),
                                              ),
                                            ),
                                            cursorColor:
                                                ColorPalette.timberGreen,
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                            left: 8,
                                            bottom: 5,
                                          ),
                                          // child: Text(
                                          //   "Location",
                                          //   style: TextStyle(
                                          //     fontFamily: "Nunito",
                                          //     fontSize: 14,
                                          //     color: ColorPalette.nileBlue,
                                          //   ),
                                          // ),
                                        ),
                                        // LocationDD(product: product),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(11),
                                        child: Container(
                                          color: ColorPalette.white,
                                          child: Container(
                                            color: ColorPalette.timberGreen
                                                .withOpacity(0.1),
                                            child: (widget.product!.img == null)
                                                ? Center(
                                                    child: Icon(
                                                      Icons.image,
                                                      color: ColorPalette
                                                          .nileBlue
                                                          .withOpacity(0.5),
                                                    ),
                                                  )
                                                : CachedNetworkImage(
                                                    fit: BoxFit.cover,
                                                    imageUrl:
                                                        widget.product!.img!,
                                                    errorWidget:
                                                        (context, s, a) {
                                                      return Icon(
                                                        Icons.image,
                                                        color: ColorPalette
                                                            .nileBlue
                                                            .withOpacity(0.5),
                                                      );
                                                    },
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
