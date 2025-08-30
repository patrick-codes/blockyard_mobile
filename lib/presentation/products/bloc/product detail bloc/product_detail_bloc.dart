import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/model/product_repository.dart';
import '../../repository/model/products_model.dart';

part 'product_detail_events.dart';
part 'product_detail_states.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final ProductRepository productRepository = ProductRepository();
  Product? product;

  ProductDetailBloc() : super(ProductDetailInitial()) {
    on<LoadProductDetail>(fetchProductDetail);
  }

  Future<void> fetchProductDetail(
      LoadProductDetail event, Emitter<ProductDetailState> emit) async {
    emit(ProductDetailLoading());
    try {
      product = await productRepository.fetchProductById(event.id);
      emit(ProductDetailLoaded(product));
    } catch (e) {
      emit(ProductDetailError(e.toString()));
    }
  }
}
