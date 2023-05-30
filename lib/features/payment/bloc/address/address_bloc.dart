import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecowave/features/payment/model/entity/address_entity.dart';
import 'package:ecowave/features/payment/model/repository/address_repository.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddressRepository repository;

  AddressBloc(
    this.repository,
  ) : super(AddressInitial()) {
    on<AddressEvent>((event, emit) async {
      final response = await repository.getaddreses();
      response.fold(
        (failed) => emit(AddressFailed(meesage: failed)),
        (result) => emit(AddressSuccess(data: result)),
      );
    });
  }
}
