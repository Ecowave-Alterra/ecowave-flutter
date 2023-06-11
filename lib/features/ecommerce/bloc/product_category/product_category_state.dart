part of 'product_category_bloc.dart';

abstract class ProductCategoryState extends Equatable {
  const ProductCategoryState();

  @override
  List<Object> get props => [];
}

class ProductCategoryInitial extends ProductCategoryState {}

class ProductCategoryLoading extends ProductCategoryState {}

class ProductCategoryFailed extends ProductCategoryState {
  final String message;

  const ProductCategoryFailed({required this.message});
}

class ProductCategorySuccess extends ProductCategoryState {
  final List<ProductCategoryModel> data;

  const ProductCategorySuccess({required this.data});
}
