import 'package:blockyard_mobile/utils/constants/color%20constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helpers/widgets/custom_appbar.dart';
import 'bloc/category_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  final String categoryName;
  const CategoriesScreen({Key? key, required this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoryBloc()..add(FetchProductsByCategory(categoryName)),
      child: Scaffold(
        backgroundColor: secondaryBg,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(
            title: categoryName,
          ),
        ),
        body: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CategoryLoaded) {
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  if (state.products.length == 0 || state.products.isEmpty) {
                    return Center(
                      child: Text('No product found under this category'),
                    );
                  }
                  return ListTile(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/details',
                        arguments: {
                          "id": product.id,
                        },
                      );
                    },
                    leading:
                        Image.network(product.image, width: 50, height: 50),
                    title: Text(product.name),
                    subtitle: Text("GHS ${product.price}"),
                  );
                },
              );
            } else if (state is CategoryError) {
              return Center(child: Text(state.message));
            }
            return Center(child: Text('No products found'));
          },
        ),
      ),
    );
  }
}
