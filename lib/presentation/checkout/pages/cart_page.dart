import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../helpers/text_widgets.dart';
import '../../../helpers/widgets/cedi_widget.dart';
import '../../../helpers/widgets/custom_appbar.dart';
import '../../../helpers/widgets/custom_button.dart';
import '../../../utils/constants/color constants/colors.dart';
import '../bloc/cart_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          title: 'My Cart',
          actions: [
            GestureDetector(
              onTap: () {
                context.read<CartBloc>().add(ClearCart());
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Cart cleared!")),
                );
              },
              child: const Icon(MingCute.delete_back_line),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
      backgroundColor: secondaryBg,
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.items.isEmpty) {
            return const Center(
              child: Text(
                "Your cart is empty",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      final item = state.items[index];
                      final itemTotal = item.price * item.quantity;

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(width: 10),
                                SizedBox(
                                  width: 300,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      headingCustomSemiBold(
                                          context, item.name, FontWeight.w500),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          subheadingText(
                                              context, "${item.quantity} × "),
                                          const CediSign(
                                            size: 13,
                                            color: subtitleColor,
                                          ),
                                          subheadingText(context,
                                              item.price.toStringAsFixed(2)),
                                        ],
                                      ),
                                      const SizedBox(height: 14),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Quantity Controls
                                          Row(
                                            children: [
                                              IconButton(
                                                icon: const Icon(Icons
                                                    .remove_circle_outline),
                                                onPressed: () {
                                                  context.read<CartBloc>().add(
                                                      DecreaseQuantity(
                                                          item.id));
                                                },
                                              ),
                                              Text(
                                                item.quantity.toString(),
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              IconButton(
                                                icon: const Icon(
                                                    Icons.add_circle_outline),
                                                onPressed: () {
                                                  context.read<CartBloc>().add(
                                                      IncreaseQuantity(
                                                          item.id));
                                                },
                                              ),
                                            ],
                                          ),

                                          // Price total per item
                                          Row(
                                            children: [
                                              const CediSign(
                                                  size: 20,
                                                  weight: FontWeight.bold),
                                              headingTextMedium(
                                                context,
                                                itemTotal.toStringAsFixed(2),
                                                FontWeight.w600,
                                                20,
                                              ),
                                            ],
                                          ),

                                          // Delete Item
                                          GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<CartBloc>()
                                                  .add(RemoveFromCart(item.id));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                    content: Text(
                                                        "Item removed from cart!")),
                                              );
                                            },
                                            child: const Icon(
                                                MingCute.delete_2_line,
                                                color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Divider(color: outlineGrey),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // CART TOTAL + CHECKOUT
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Total: ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const CediSign(size: 20, weight: FontWeight.bold),
                          Text(
                            state.totalPrice.toStringAsFixed(2),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        onpressed: () {
                          Navigator.pushNamed(context, '/checkout');
                        },
                        text: 'Proceed to Checkout',
                        color: secondaryColor,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
