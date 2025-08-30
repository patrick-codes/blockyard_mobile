import 'package:blockyard_mobile/helpers/widgets/cedi_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../helpers/text_widgets.dart';
import '../../../utils/constants/color constants/colors.dart';
import '../bloc/product detail bloc/product_detail_bloc.dart';
import '../repository/model/products_model.dart';

class ProductDetailPage extends StatefulWidget {
  final String id;
  const ProductDetailPage({super.key, required this.id});

  static final _controller = PageController();

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    context.read<ProductDetailBloc>().add(LoadProductDetail(widget.id));
    super.initState();
  }

  //Product? state.product;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductDetailBloc, ProductDetailState>(
        listener: (BuildContext context, state) {
      if (state is ProductDetailError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.message)),
        );
      }
    }, builder: (context, state) {
      if (state is ProductDetailLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is ProductDetailLoaded) {
        //state.product = state.product;
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: whiteColor,
          bottomNavigationBar: SizedBox(
            height: 110,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 5,
              ),
              child: Column(
                children: [
                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: headingTextMedium(
                        context,
                        'Add to cart',
                        FontWeight.w600,
                        17,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 10,
                    softWrap: true,
                    'Delivery on 26th October',
                    style: const TextStyle(
                      height: 1.5,
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(250),
            child: PageView.builder(
              controller: ProductDetailPage._controller,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: state.product?.image.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(state.product?.image ?? ''),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 5,
                        top: 50,
                        left: 10,
                        child: headingTextMedium2(
                          context,
                          'Block Yard Ghana',
                          FontWeight.w600,
                          8,
                          Colors.white.withOpacity(0.5),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        top: 100,
                        right: 10,
                        child: headingTextMedium2(
                          context,
                          'Block Yard Ghana',
                          FontWeight.w600,
                          8,
                          Colors.white.withOpacity(0.5),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        top: 200,
                        left: 10,
                        child: headingTextMedium2(
                          context,
                          'Block Yard Ghana',
                          FontWeight.w600,
                          8,
                          Colors.white.withOpacity(0.5),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        top: 250,
                        right: 10,
                        child: headingTextMedium2(
                          context,
                          'Block Yard Ghana',
                          FontWeight.w600,
                          8,
                          Colors.white.withOpacity(0.5),
                        ),
                      ),
                      Positioned(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            AppBar(
                              automaticallyImplyLeading: false,
                              backgroundColor: Colors.transparent,
                              actions: [
                                GestureDetector(
                                  onTap: () {},
                                  child: CircleAvatar(
                                    backgroundColor: whiteColor,
                                    child: Center(
                                      child: Icon(
                                        MingCute.heart_fill,
                                        size: 21,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 18),
                                GestureDetector(
                                  onTap: () {},
                                  child: CircleAvatar(
                                    backgroundColor: whiteColor,
                                    child: Center(
                                      child: Icon(
                                        MingCute.upload_line,
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
                                    backgroundColor: whiteColor,
                                    child: Center(
                                      child: Icon(
                                        Icons.keyboard_arrow_left_rounded,
                                        color: blackColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 5,
                        left: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: whiteColor,
            ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SmoothPageIndicator(
                      controller: ProductDetailPage._controller,
                      count: 5,
                      effect: ScrollingDotsEffect(
                        paintStyle: PaintingStyle.fill,
                        activeDotColor: primaryColor,
                        dotHeight: 5,
                        dotWidth: 5,
                        spacing: 5,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  headingTextMedium(
                    context,
                    state.product?.name ?? '',
                    FontWeight.bold,
                    22,
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 120,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.5,
                            color: outlineGrey,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            'Stock - ${state.product?.stock.toString()}',
                            style: const TextStyle(
                              fontSize: 12.5,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: outlineGrey,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            '16 x 8 x 8',
                            style: const TextStyle(
                              fontSize: 12.5,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.5,
                            color: outlineGrey,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            state.product?.category ?? 'Category',
                            style: const TextStyle(
                              fontSize: 12.5,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 18),
                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      color: outlineGrey.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CediSign(
                              size: 18,
                              weight: FontWeight.bold,
                            ),
                            headingTextMedium(
                              context,
                              state.product?.price.toString() ?? '',
                              FontWeight.w600,
                              18,
                            ),
                            SizedBox(width: 10),
                            Text(
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              'Soft Gray | 32 lbs each',
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          MingCute.information_line,
                          color: Colors.black45,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 10,
                    softWrap: true,
                    state.product?.description ?? '',
                    style: const TextStyle(
                      height: 1.5,
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        return const Scaffold(
          body: Center(child: Text("No product found")),
        );
      }
    });
  }
}
