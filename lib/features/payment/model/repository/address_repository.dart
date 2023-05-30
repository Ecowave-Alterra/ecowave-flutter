import 'package:dartz/dartz.dart';

import 'package:ecowave/features/payment/model/datasource/address_remote_datasource.dart';
import 'package:ecowave/features/payment/model/entity/address_entity.dart';
import 'package:ecowave/features/payment/model/response/address_response_model.dart';

abstract class AddressRepository {
  Future<Either<String, List<AddressEntity>>> getaddreses();
}

class AddressRepositoryImpl implements AddressRepository {
  final AddressRemoteDatasource datasource;
  AddressRepositoryImpl(this.datasource);

  @override
  Future<Either<String, List<AddressEntity>>> getaddreses() async {
    try {
      final List<AddressResponseModel> response =
          await datasource.getAddresses();

      return Right(response.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
