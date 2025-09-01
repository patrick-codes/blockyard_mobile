import 'package:blockyard_mobile/helpers/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../helpers/widgets/custom_appbar.dart';
import '../../../helpers/widgets/custom_button.dart';
import '../../../utils/constants/color constants/colors.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/order bloc/order_bloc.dart';
import '../repository/order model/order_model.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderBloc, OrderState>(
      listener: (context, state) {
        if (state is OrderSuccess) {
          context.read<CartBloc>().add(ClearCart());
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Thanks ${_nameController.text}, your order will be delivered to ${_addressController.text}.",
              ),
              action: SnackBarAction(
                label: 'Ok',
                onPressed: () {},
              ),
            ),
          );
        }

        if (state is OrderLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Placing order...")),
          );
        } else if (state is OrderSuccess) {
          Navigator.pushNamed(context, '/mainhome');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Order placed successfully!")),
          );
          // Navigator.pop(context); // Go back after success
        } else if (state is OrderFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed: ${state.error}")),
          );
        }
      },
      builder: (context, state) {
        if (state is OrderLoading) {
          return Container(
            height: MediaQuery.of(context).size.height,
            color: secondaryBg,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: CircularProgressIndicator(),
                ),
                SizedBox(height: 20),
                headingTextMedium(
                  context,
                  'Placing your order.....',
                  FontWeight.w500,
                  12,
                  subtitleColor,
                ),
              ],
            ),
          );
        }

        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(
              title: 'Checkout',
            ),
          ),
          backgroundColor: secondaryBg,
          body: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.items.length,
                        itemBuilder: (context, index) {
                          final item = state.items[index];
                          return ListTile(
                            title: Text(item.name),
                            subtitle: Text(
                              "Qty: ${item.quantity} • GHS ${(item.price * item.quantity).toStringAsFixed(2)}",
                            ),
                          );
                        },
                      ),
                    ),
                    Text("Total: GHS ${state.totalPrice.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const Divider(),

                    // Delivery Address Form
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _nameController,
                            decoration:
                                const InputDecoration(labelText: "Full Name"),
                            validator: (val) =>
                                val == null || val.isEmpty ? "Required" : null,
                          ),
                          TextFormField(
                            controller: _phoneController,
                            decoration: const InputDecoration(
                                labelText: "Phone Number"),
                            keyboardType: TextInputType.phone,
                            validator: (val) =>
                                val == null || val.isEmpty ? "Required" : null,
                          ),
                          TextFormField(
                            controller: _addressController,
                            decoration: const InputDecoration(
                                labelText: "Delivery Address"),
                            validator: (val) =>
                                val == null || val.isEmpty ? "Required" : null,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      textColor: blackColor,
                      text: 'Place Order',
                      onpressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          final cartState = context.read<CartBloc>().state;

                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();

                          final userid = prefs.getString('userId') ?? "";
                          final orderRequest = OrderRequest(
                            userId: userid,
                            products: cartState.items
                                .map((item) => {
                                      "productId": item.id,
                                      "quantity": item.quantity,
                                    })
                                .toList(),
                          );

                          context
                              .read<OrderBloc>()
                              .add(CreateOrderEvent(orderRequest));
                        }
                      },
                      color: primaryColor,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
