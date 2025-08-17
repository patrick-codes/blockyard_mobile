import 'package:blockyard_mobile/helpers/widgets/cedi_widget.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../helpers/text_widgets.dart';
import '../../../utils/constants/color constants/colors.dart';

class ProductDetailPage extends StatelessWidget {
  final String id;
  const ProductDetailPage({super.key, required this.id});

  static final _controller = PageController();

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
          controller: _controller,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemCount: imgs.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(imgs[index]).image,
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
      body: Expanded(
        flex: 1,
        child: Container(
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
                    controller: _controller,
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
                  'Hollow Blocks',
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
                          '32 lbs each',
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
                          'Soft Gray',
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
                            '2.99',
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
                  'Precast cement bricks, available in solid or hollow variants. Used for paving, landscaping, and decorative walls. Resistant to weathering and erosion. Designed with grooves that lock together without mortar, speeding up construction. Great for quick DIY projects, retaining walls, and temporary structures.',
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
      ),
    );
  }
}
