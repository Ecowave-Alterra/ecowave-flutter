import 'package:ecowave/features/ecommerce/model/services/product_image_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/models/product_image_model.dart';

part 'product_image_event.dart';
part 'product_image_state.dart';

class ProductImageBloc extends Bloc<ProductImageEvent, ProductImageState> {
  final ProductImageService service;
  ProductImageBloc(this.service) : super(ProductImageInitial()) {
    List<ProductImageModel> img = [];
    on<GetProductImageEvent>((event, emit) async {
      try {
        emit(ProductImageLoading());
        img = await service.getProductImage();
        List<ProductImageModel> imgWithId = [];
        for (var element in img) {
          if (element.productId
              .toString()
              .contains(event.productId.toString())) {
            imgWithId.add(element);
          }
        }
        emit(ProductImageSuccess(data: imgWithId));
      } catch (e) {
        emit(ProductImageFailed(message: e.toString()));
      }
    });
  }
}
