import 'package:ecowave/features/ecommerce/model/models/product_category_model.dart';
import 'package:ecowave/features/ecommerce/model/services/product_category_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_category_event.dart';
part 'product_category_state.dart';

class ProductCategoryBloc
    extends Bloc<ProductCategoryEvent, ProductCategoryState> {
  final ProductCategoryService service;
  ProductCategoryBloc(this.service) : super(ProductCategoryInitial()) {
    List<ProductCategoryModel> category = [];
    on<GetProductCategoryEvent>((event, emit) async {
      try {
        emit(ProductCategoryLoading());
        category = await service.getProductCategory();
        List<ProductCategoryModel> categoryWithId = [];
        for (var element in category) {
          if (element.id.toString().contains(event.productId.toString())) {
            categoryWithId.add(element);
          }
        }
        emit(ProductCategorySuccess(data: categoryWithId));
      } catch (e) {
        emit(ProductCategoryFailed(message: e.toString()));
      }
    });
  }
}
