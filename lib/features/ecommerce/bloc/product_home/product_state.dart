part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductFailed extends ProductState {
  final String message;

  const ProductFailed({
    required this.message,
  });
}

class ProductSuccess extends ProductState {
  final List<ProductModel> data;

  const ProductSuccess({
    required this.data,
  });
}
