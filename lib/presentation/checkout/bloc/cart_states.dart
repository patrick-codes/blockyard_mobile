part of 'cart_bloc.dart';

class CartState {
  final List<CartItem> items;

  CartState({required this.items});

  double get totalPrice =>
      items.fold(0, (sum, item) => sum + (item.price * item.quantity));
}
