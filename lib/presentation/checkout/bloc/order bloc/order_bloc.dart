import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/order model/order_model.dart';
import '../../repository/order repository/order_repository.dart';

part 'order_events.dart';
part 'order_states.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository orderRepository = OrderRepository();

  OrderBloc() : super(OrderInitial()) {
    on<CreateOrderEvent>(_onCreateOrder);
    on<FetchOrdersEvent>(_onFetchOrders);
  }

  Future<void> _onCreateOrder(
      CreateOrderEvent event, Emitter<OrderState> emit) async {
    emit(OrderLoading());
    try {
      final response = await orderRepository.createOrder(event.orderRequest);
      emit(OrderSuccess(response));
    } catch (e) {
      emit(OrderFailure(e.toString()));

      debugPrint('Error: ${e.toString()}');
    }
  }

  Future<void> _onFetchOrders(
      FetchOrdersEvent event, Emitter<OrderState> emit) async {
    try {
      emit(OrderLoading());
      final orders = await orderRepository.fetchOrders();
      emit(OrdersLoaded(orders));
      debugPrint('Ordes $orders');
    } catch (e) {
      emit(OrderFailure(e.toString()));
      debugPrint('Error $e');
    }
  }
}
