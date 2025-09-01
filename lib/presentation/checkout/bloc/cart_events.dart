part of 'cart_bloc.dart';

abstract class CartEvent {}

class AddToCart extends CartEvent {
  final CartItem item;
  AddToCart(this.item);
}

class RemoveFromCart extends CartEvent {
  final String id;
  RemoveFromCart(this.id);
}

class ClearCart extends CartEvent {}

class IncreaseQuantity extends CartEvent {
  final String id;
  IncreaseQuantity(this.id);
}

class DecreaseQuantity extends CartEvent {
  final String id;
  DecreaseQuantity(this.id);
}
