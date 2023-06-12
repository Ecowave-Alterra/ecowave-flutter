import 'package:ecowave/features/ecommerce/model/models/product_model.dart';
import 'package:ecowave/features/ecommerce/model/services/product_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductService service;
  ProductBloc(this.service) : super(ProductInitial()) {
    List<ProductModel> products = [];
    on<GetProductEvent>((event, emit) async {
      try {
        emit(ProductLoading());
        products = await service.getProduct();
        emit(ProductSuccess(data: products));
      } catch (e) {
        emit(ProductFailed(message: e.toString()));
      }
    });

    on<SearchProductEvent>((event, emit) async {
      emit(ProductInitial());
      List<ProductModel> searchResult = [];
      for (var element in products) {
        if (element.name.toLowerCase().contains(event.value)) {
          searchResult.add(element);
        }
      }
      emit(ProductSuccess(data: searchResult));
    });

    on<FilterProductEvent>((event, emit) async {
      emit(ProductInitial());
      List<ProductModel> filterSortResult = [];
      for (var element in products) {
        if (element.productCategoryId
            .toString()
            .contains(event.idFilter.toString())) {
          filterSortResult.add(element);
        }
      }
      if (event.sortFilter == 'terendah') {
        filterSortResult.sort(
          (a, b) => a.price.compareTo(b.price),
        );
      } else {
        filterSortResult.sort(
          (a, b) => b.price.compareTo(a.price),
        );
      }
      emit(ProductSuccess(data: filterSortResult));
    });

    on<SortOnlyProductEvent>((event, emit) async {
      emit(ProductInitial());
      List<ProductModel> sortResult = [];
      sortResult = products;
      if (event.sortFilter == 'terendah') {
        sortResult.sort(
          (a, b) => a.price.compareTo(b.price),
        );
      } else {
        sortResult.sort(
          (a, b) => b.price.compareTo(a.price),
        );
      }
      emit(ProductSuccess(data: sortResult));
    });

    on<GetProductDetailEvent>((event, emit) async {
      emit(ProductInitial());
      List<ProductModel> searchResult = [];
      for (var element in products) {
        if (element.id.toString().contains(event.productId.toString())) {
          searchResult.add(element);
        }
      }
      emit(ProductSuccess(data: searchResult));
    });
  }
}
