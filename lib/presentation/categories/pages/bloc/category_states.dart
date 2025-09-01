part of 'category_bloc.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Product> products;
  CategoryLoaded(this.products);
}

class CategoryError extends CategoryState {
  final String message;
  CategoryError(this.message);
}
