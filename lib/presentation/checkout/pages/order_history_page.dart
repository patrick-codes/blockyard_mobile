import 'package:blockyard_mobile/presentation/checkout/bloc/order%20bloc/order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/order model/order_model.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderBloc()..add(FetchOrdersEvent()), // fetch all
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Order History"),
        ),
        body: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            if (state is OrderLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is OrdersLoaded) {
              if (state.orders.isEmpty) {
                return const Center(child: Text("No orders found."));
              }
              return ListView.builder(
                itemCount: state.orders.length,
                itemBuilder: (context, index) {
                  final order = state.orders[index];
                  return Card(
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      title: Text("Order #${order.id}"),
                      onTap: () {
                        // optional: navigate to order details
                      },
                    ),
                  );
                },
              );
            } else if (state is OrderFailure) {
              return Center(child: Text("Error: ${state.error}"));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
