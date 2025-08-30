part of 'product_detail_bloc.dart';

sealed class ProductDetailEvent {}

class LoadProductDetail extends ProductDetailEvent {
  final String id;
  LoadProductDetail(this.id);
}

class LoadProductDetailSuccess extends ProductDetailEvent {}
