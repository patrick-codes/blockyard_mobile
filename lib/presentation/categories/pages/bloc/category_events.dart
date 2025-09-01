part of 'category_bloc.dart';

abstract class CategoryEvent {}

class FetchProductsByCategory extends CategoryEvent {
  final String categoryName;
  FetchProductsByCategory(this.categoryName);
}
