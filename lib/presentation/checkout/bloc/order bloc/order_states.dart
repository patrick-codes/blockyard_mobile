part of 'order_bloc.dart';

sealed class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}

class OrderSuccess extends OrderState {
  final OrderResponse order;
  OrderSuccess(this.order);
}

class OrderFailure extends OrderState {
  final String error;
  OrderFailure(this.error);
}

class OrdersLoaded extends OrderState {
  final List<OrderResponse> orders;
  OrdersLoaded(this.orders);
}
