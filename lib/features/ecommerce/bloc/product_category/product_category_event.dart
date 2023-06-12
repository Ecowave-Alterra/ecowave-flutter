part of 'product_category_bloc.dart';

abstract class ProductCategoryEvent extends Equatable {
  const ProductCategoryEvent();

  @override
  List<Object> get props => [];
}

class GetProductCategoryEvent extends ProductCategoryEvent {
  final int productId;

  const GetProductCategoryEvent(this.productId);
}
