import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/model/product_repository.dart';
import '../repository/model/products_model.dart';

part 'product_events.dart';
part 'product_states.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository = ProductRepository();

  ProductBloc() : super(ProductInitial()) {
    on<FetchProducts>(fetchProducts);
  }

  Future<void> fetchProducts(
      FetchProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final products = await productRepository.fetchProducts();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
