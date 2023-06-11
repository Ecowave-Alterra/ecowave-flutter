part of 'product_image_bloc.dart';

abstract class ProductImageEvent extends Equatable {
  const ProductImageEvent();

  @override
  List<Object> get props => [];
}

class GetProductImageEvent extends ProductImageEvent {
  final int productId;

  const GetProductImageEvent(this.productId);
}
