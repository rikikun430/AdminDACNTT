import 'dart:html';

import 'package:adminui/screens/Order/order.dart';
import 'package:adminui/screens/Order/order_list.dart';
import 'package:adminui/screens/home.dart';
import 'package:adminui/screens/product_group_page.dart';
import 'package:adminui/utils/app_constants.dart';
import 'package:adminui/utils/dimensions.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  var height, width;
  List navigatePage = [
    Home(),
    OrderScreen(),
    "null",
    "null",
    "null",
    "null",
  ];
  List imgData = [
    "https://img.freepik.com/free-photo/tasty-burger-isolated-white-background-fresh-hamburger-fastfood-with-beef-cheese_90220-1063.jpg?size=338&ext=jpg&ga=GA1.1.1700460183.1709683200&semt=sph",
    "https://www.shutterstock.com/image-vector/delivery-man-riding-red-scooter-260nw-1448504840.jpg",
    "https://t3.ftcdn.net/jpg/05/04/28/96/360_F_504289605_zehJiK0tCuZLP2MdfFBpcJdOVxKLnXg1.jpg",
    "https://t3.ftcdn.net/jpg/05/04/28/96/360_F_504289605_zehJiK0tCuZLP2MdfFBpcJdOVxKLnXg1.jpg",
    "https://t3.ftcdn.net/jpg/05/04/28/96/360_F_504289605_zehJiK0tCuZLP2MdfFBpcJdOVxKLnXg1.jpg",
    "https://t3.ftcdn.net/jpg/05/04/28/96/360_F_504289605_zehJiK0tCuZLP2MdfFBpcJdOVxKLnXg1.jpg"
  ];
  List title = [
    "Product",
    "Order",
    "Developing",
    "Developing",
    "Developing",
    "Developing"
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.indigoAccent,
        child: SafeArea(
          child: Column(children: [
            Container(
              decoration: const BoxDecoration(),
              width: width,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(padding: EdgeInsets.only(top: 35)),
                          Container(
                            child: InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.sort,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      "https://img.freepik.com/premium-vector/man-avatar-profile-picture-vector-illustration_268834-538.jpg")),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20, left: 10, bottom: 15),
                      child: Column(
                        children: [
                          Text(
                            "DashBoard",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1),
                          ),
                          Text(
                            "last update: 6/3/2023",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white54,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )),
                  padding: const EdgeInsets.only(bottom: 20),
                  width: width,

                  ////////Item

                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.1,
                      mainAxisSpacing: 25,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => navigatePage[index]));
                        },
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 1,
                                blurRadius: 6,
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.network(
                                imgData[index],
                                height: height * 0.2,
                              ),
                              Text(
                                title[index],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
