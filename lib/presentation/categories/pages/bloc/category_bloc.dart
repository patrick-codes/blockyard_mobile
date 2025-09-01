import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../products/repository/model/product_repository.dart';
import '../../../products/repository/model/products_model.dart';

part 'category_events.dart';
part 'category_states.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ProductRepository productRepository = ProductRepository();

  CategoryBloc() : super(CategoryInitial()) {
    on<FetchProductsByCategory>(_fetchProductsByCategory);
  }

  Future<void> _fetchProductsByCategory(
      FetchProductsByCategory event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    try {
      // fetch products based on category name
      final products =
          await productRepository.fetchProductsByCategory(event.categoryName);
      emit(CategoryLoaded(products));
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }
}
