part of 'order_bloc.dart';

sealed class OrderEvent {}

class CreateOrderEvent extends OrderEvent {
  final OrderRequest orderRequest;
  CreateOrderEvent(this.orderRequest);
}

class FetchOrdersEvent extends OrderEvent {}
