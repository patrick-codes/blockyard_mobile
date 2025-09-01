import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../products/repository/model/products_model.dart';
import '../repository/model/cart_model.dart';

part 'cart_events.dart';
part 'cart_states.dart';

class CartBloc extends HydratedBloc<CartEvent, CartState> {
  CartBloc() : super(CartState(items: [])) {
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<ClearCart>(_onClearCart);
    on<IncreaseQuantity>(_onIncreaseQuantity);
    on<DecreaseQuantity>(_onDecreaseQuantity);
  }

  void _onAddToCart(AddToCart event, Emitter<CartState> emit) {
    final existing = state.items.firstWhere(
      (item) => item.id == event.item.id,
      orElse: () => CartItem(id: "", name: "", price: 0, quantity: 0),
    );

    if (existing.id.isNotEmpty) {
      final updatedItems = state.items.map((item) {
        if (item.id == event.item.id) {
          return item.copyWith(quantity: item.quantity + event.item.quantity);
        }
        return item;
      }).toList();
      emit(CartState(items: updatedItems));
    } else {
      emit(CartState(items: [...state.items, event.item]));
    }
  }

  void _onRemoveFromCart(RemoveFromCart event, Emitter<CartState> emit) {
    final updatedItems =
        state.items.where((item) => item.id != event.id).toList();
    emit(CartState(items: updatedItems));
  }

  void _onClearCart(ClearCart event, Emitter<CartState> emit) {
    emit(CartState(items: []));
  }

  void _onIncreaseQuantity(IncreaseQuantity event, Emitter<CartState> emit) {
    final updatedItems = state.items.map((item) {
      if (item.id == event.id) {
        return item.copyWith(quantity: item.quantity + 1);
      }
      return item;
    }).toList();
    emit(CartState(items: updatedItems));
  }

  void _onDecreaseQuantity(DecreaseQuantity event, Emitter<CartState> emit) {
    final updatedItems = state.items.map((item) {
      if (item.id == event.id && item.quantity > 1) {
        return item.copyWith(quantity: item.quantity - 1);
      }
      return item;
    }).toList();
    emit(CartState(items: updatedItems));
  }

  @override
  CartState? fromJson(Map<String, dynamic> json) {
    final items =
        (json['items'] as List).map((e) => CartItem.fromJson(e)).toList();
    return CartState(items: items);
  }

  @override
  Map<String, dynamic>? toJson(CartState state) {
    return {"items": state.items.map((e) => e.toJson()).toList()};
  }
}
