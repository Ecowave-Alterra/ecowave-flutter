part of 'product_image_bloc.dart';

abstract class ProductImageState extends Equatable {
  const ProductImageState();

  @override
  List<Object> get props => [];
}

class ProductImageInitial extends ProductImageState {}

class ProductImageLoading extends ProductImageState {}

class ProductImageFailed extends ProductImageState {
  final String message;

  const ProductImageFailed({required this.message});
}

class ProductImageSuccess extends ProductImageState {
  final List<ProductImageModel> data;

  const ProductImageSuccess({required this.data});
}
