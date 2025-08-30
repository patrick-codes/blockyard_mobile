import 'package:blockyard_mobile/helpers/widgets/cedi_widget.dart';
import 'package:blockyard_mobile/utils/constants/color%20constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../helpers/text_widgets.dart';
import '../products/bloc/product_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(FetchProducts());
  }

  static var items = [
    'Standard',
    'Hollow',
    'Decorative',
    'Concrete',
    'Specialty',
  ];

  static final List imgs = [
    "assets/images/53192505_1887479504695737_3710208112829923328_o-3.jpg",
    "assets/images/fly-ash-bricks-solid-concrete-bricks-from-visakhapatnam-factory-1000x1000.jpeg",
    "assets/images/Untitled-design-5.png",
    "assets/images/53192505_1887479504695737_3710208112829923328_o-3.jpg",
    "assets/images/fly-ash-bricks-solid-concrete-bricks-from-visakhapatnam-factory-1000x1000.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: outlineGrey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(195),
        child: Container(
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 5,
                top: -230,
                right: 40,
                child: Icon(
                  Icons.circle_outlined,
                  size: 200,
                  color: whiteColor.withOpacity(0.05),
                ),
              ),
              Positioned(
                bottom: -190,
                top: 5,
                right: -90,
                child: Icon(
                  Icons.emoji_objects_outlined,
                  size: 200,
                  color: whiteColor.withOpacity(0.05),
                ),
              ),
              Positioned(
                bottom: -190,
                top: 5,
                left: -10,
                child: Icon(
                  Icons.circle_outlined,
                  size: 280,
                  color: whiteColor.withOpacity(0.05),
                ),
              ),
              Positioned(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: whiteColor,
                      actions: [
                        GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            backgroundColor: outlineGrey,
                            child: Center(
                              child: Icon(
                                MingCute.notification_line,
                                size: 21,
                                color: blackColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                      ],
                      leading: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: primaryColor,
                            child: Center(
                              child: Icon(
                                Icons.verified_outlined,
                                color: blackColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      centerTitle: true,
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          appbarText(
                            context,
                            'Delivery address',
                            iconGrey,
                            12,
                          ),
                          SizedBox(height: 5),
                          headingTextMedium(
                            context,
                            '92 Hight Street, Tanoso',
                            FontWeight.w600,
                            15,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            TextFormField(
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 15,
                                    color: blackColor,
                                    fontWeight: FontWeight.w100,
                                  ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Type something';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Search the entire yard....",
                                hintStyle: TextStyle(
                                    color: Colors.black54, fontSize: 13),
                                prefixIcon: const Icon(
                                  MingCute.search_2_line,
                                  color: Colors.black54,
                                  weight: 5,
                                  size: 25,
                                ),
                                filled: true,
                                isDense: true,
                                fillColor: outlineGrey.withOpacity(0.6),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: 18),
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: outlineGrey,
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    secondaryColor.withOpacity(0.3),
                                    secondaryColor,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  headingTextMedium(
                                    context,
                                    'Delivery is',
                                    FontWeight.w600,
                                    15,
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    height: 25,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: subheadingText(
                                        context,
                                        '50%',
                                        color: blackColor,
                                        weight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  headingTextMedium(
                                    context,
                                    'cheaper',
                                    FontWeight.w600,
                                    15,
                                  ),
                                ],
                              ),
                            ),
                          ],
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
      body: Stack(
        children: [
          SizedBox(height: 30),
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: outlineGrey,
            ),
            child: Column(
              children: [
                SizedBox(height: 8),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              headingTextMedium(
                                context,
                                'Categories',
                                FontWeight.bold,
                                18,
                              ),
                              Row(
                                children: [
                                  subheadingText(
                                    context,
                                    'see all',
                                    size: 13,
                                  ),
                                  SizedBox(width: 7),
                                  Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      color: outlineGrey,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: blackColor,
                                        size: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          SizedBox(
                            height: 90,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 5,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 65,
                                      width: 65,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(45),
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.asset(
                                            imgs[index],
                                          ).image,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Center(
                                      child: Text(
                                        items[index],
                                        softWrap: true,
                                        overflow: TextOverflow.visible,
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  headingTextMedium(
                                    context,
                                    'Flash Sale',
                                    FontWeight.bold,
                                    18,
                                  ),
                                  SizedBox(width: 8),
                                  Container(
                                    height: 25,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: headingTextMedium(
                                        context,
                                        '02:59:23',
                                        FontWeight.w500,
                                        13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  subheadingText(
                                    context,
                                    'see all',
                                    size: 13,
                                  ),
                                  SizedBox(width: 7),
                                  Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      color: outlineGrey,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: blackColor,
                                        size: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 6),
                          // SizedBox(
                          //     height: 240,
                          //     child: ListView.builder(
                          //       scrollDirection: Axis.horizontal,
                          //       itemCount: 4,
                          //       itemBuilder: (BuildContext context, int index) {
                          //         return Row(
                          //           children: [
                          //             GestureDetector(
                          //               onTap: () {
                          //                 Navigator.pushNamed(
                          //                   context,
                          //                   '/details',
                          //                   arguments: {"id": imgs[index]},
                          //                 );
                          //               },
                          //               child: Container(
                          //                 width: 150,
                          //                 height: 220,
                          //                 margin: const EdgeInsets.all(8),
                          //                 decoration: BoxDecoration(
                          //                   color: Colors.white,
                          //                   borderRadius:
                          //                       BorderRadius.circular(8),
                          //                 ),
                          //                 child: Stack(
                          //                   children: [
                          //                     Column(
                          //                       mainAxisAlignment:
                          //                           MainAxisAlignment.start,
                          //                       crossAxisAlignment:
                          //                           CrossAxisAlignment.start,
                          //                       children: [
                          //                         Container(
                          //                           height: 130,
                          //                           decoration: BoxDecoration(
                          //                             image: DecorationImage(
                          //                               image: Image.asset(
                          //                                 imgs[index],
                          //                               ).image,
                          //                               fit: BoxFit.cover,
                          //                             ),
                          //                             color: outlineGrey,
                          //                             // color: const Color.fromARGB(
                          //                             //   255, 233, 248, 255),
                          //                             borderRadius:
                          //                                 BorderRadius.circular(
                          //                                     8),
                          //                           ),
                          //                           child: Column(
                          //                             children: [
                          //                               SizedBox(height: 5),
                          //                               Row(
                          //                                 mainAxisAlignment:
                          //                                     MainAxisAlignment
                          //                                         .end,
                          //                                 children: [
                          //                                   Container(
                          //                                     height: 20,
                          //                                     width: 90,
                          //                                     decoration:
                          //                                         BoxDecoration(
                          //                                       color: const Color
                          //                                           .fromARGB(
                          //                                           156,
                          //                                           238,
                          //                                           238,
                          //                                           238),
                          //                                       borderRadius:
                          //                                           BorderRadius
                          //                                               .circular(
                          //                                                   10),
                          //                                       boxShadow: [
                          //                                         BoxShadow(
                          //                                           blurRadius:
                          //                                               2,
                          //                                           spreadRadius:
                          //                                               1,
                          //                                           color: Colors
                          //                                               .grey
                          //                                               .withOpacity(
                          //                                                   0.5),
                          //                                         ),
                          //                                       ],
                          //                                     ),
                          //                                     child: Center(
                          //                                       child: Text(
                          //                                         overflow:
                          //                                             TextOverflow
                          //                                                 .ellipsis,
                          //                                         softWrap:
                          //                                             true,
                          //                                         '16x8x8 inches',
                          //                                         style:
                          //                                             const TextStyle(
                          //                                           fontWeight:
                          //                                               FontWeight
                          //                                                   .bold,
                          //                                           fontSize:
                          //                                               10,
                          //                                           color:
                          //                                               blackColor,
                          //                                         ),
                          //                                       ),
                          //                                     ),
                          //                                   ),
                          //                                 ],
                          //                               )
                          //                             ],
                          //                           ),
                          //                         ),
                          //                         const SizedBox(height: 5),
                          //                         Padding(
                          //                           padding:
                          //                               const EdgeInsets.all(
                          //                                   5.0),
                          //                           child: Column(
                          //                             crossAxisAlignment:
                          //                                 CrossAxisAlignment
                          //                                     .start,
                          //                             children: [
                          //                               Text(
                          //                                 overflow: TextOverflow
                          //                                     .ellipsis,
                          //                                 softWrap: true,
                          //                                 '${items[index]} Blocks',
                          //                                 style: TextStyle(
                          //                                   fontSize: 14,
                          //                                   color: blackColor,
                          //                                   fontWeight:
                          //                                       FontWeight.bold,
                          //                                 ),
                          //                               ),
                          //                               SizedBox(height: 3),
                          //                               Text(
                          //                                 overflow: TextOverflow
                          //                                     .ellipsis,
                          //                                 softWrap: true,
                          //                                 'Soft Gray | 32 lbs each',
                          //                                 style:
                          //                                     const TextStyle(
                          //                                   fontSize: 10,
                          //                                   color:
                          //                                       Colors.black45,
                          //                                 ),
                          //                               ),
                          //                               SizedBox(height: 5),
                          //                               Row(
                          //                                 mainAxisAlignment:
                          //                                     MainAxisAlignment
                          //                                         .spaceBetween,
                          //                                 children: [
                          //                                   Row(
                          //                                     children: [
                          //                                       CediSign(
                          //                                         size: 20,
                          //                                         weight:
                          //                                             FontWeight
                          //                                                 .bold,
                          //                                       ),
                          //                                       Text(
                          //                                         '2.99',
                          //                                         style: TextStyle(
                          //                                             fontSize:
                          //                                                 20,
                          //                                             color:
                          //                                                 blackColor,
                          //                                             fontWeight:
                          //                                                 FontWeight
                          //                                                     .bold),
                          //                                       ),
                          //                                     ],
                          //                                   ),
                          //                                   Row(
                          //                                     children: [
                          //                                       const Icon(
                          //                                         Icons
                          //                                             .location_on,
                          //                                         color:
                          //                                             iconGrey,
                          //                                         size: 10,
                          //                                       ),
                          //                                       Text(
                          //                                         'Accra',
                          //                                         style:
                          //                                             TextStyle(
                          //                                           fontSize:
                          //                                               10,
                          //                                           color:
                          //                                               iconGrey,
                          //                                         ),
                          //                                       ),
                          //                                     ],
                          //                                   ),
                          //                                 ],
                          //                               ),
                          //                             ],
                          //                           ),
                          //                         ),
                          //                       ],
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ),
                          //             ),
                          //           ],
                          //         );
                          //       },
                          //     ))

                          SizedBox(
                            height: 240,
                            child: BlocBuilder<ProductBloc, ProductState>(
                              builder: (context, state) {
                                if (state is ProductLoading) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else if (state is ProductLoaded) {
                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: state.products.length,
                                    itemBuilder: (context, index) {
                                      final product = state.products[index];
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            '/details',
                                            arguments: {
                                              "id": product.id,
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: 150,
                                          height: 220,
                                          margin: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Stack(
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 130,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                          product.image,
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                      color: outlineGrey,
                                                      // color: const Color.fromARGB(
                                                      //   255, 233, 248, 255),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        SizedBox(height: 5),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Container(
                                                              height: 20,
                                                              width: 90,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color
                                                                    .fromARGB(
                                                                    156,
                                                                    238,
                                                                    238,
                                                                    238),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        2,
                                                                    spreadRadius:
                                                                        1,
                                                                    color: Colors
                                                                        .grey
                                                                        .withOpacity(
                                                                            0.5),
                                                                  ),
                                                                ],
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  softWrap:
                                                                      true,
                                                                  product.stock
                                                                      .toString(),
                                                                  style:
                                                                      const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        10,
                                                                    color:
                                                                        blackColor,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          softWrap: true,
                                                          product.name,
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color: blackColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        SizedBox(height: 3),
                                                        Text(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          softWrap: true,
                                                          product.stock
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.black45,
                                                          ),
                                                        ),
                                                        SizedBox(height: 5),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                CediSign(
                                                                  size: 20,
                                                                  weight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                                Text(
                                                                  product.price
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          20,
                                                                      color:
                                                                          blackColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                const Icon(
                                                                  Icons
                                                                      .location_on,
                                                                  color:
                                                                      iconGrey,
                                                                  size: 10,
                                                                ),
                                                                Text(
                                                                  'Accra',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    color:
                                                                        iconGrey,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                } else if (state is ProductError) {
                                  return Center(
                                      child: Text("Error: ${state.message}"));
                                }
                                return const SizedBox();
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
