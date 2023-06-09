part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetProductEvent extends ProductEvent {}

class SearchProductEvent extends ProductEvent {
  final String value;

  const SearchProductEvent(this.value);
}

class FilterProductEvent extends ProductEvent {
  final int idFilter;
  final String sortFilter;

  const FilterProductEvent(this.idFilter, this.sortFilter);
}

class SortOnlyProductEvent extends ProductEvent {
  final String sortFilter;

  const SortOnlyProductEvent(this.sortFilter);
}
