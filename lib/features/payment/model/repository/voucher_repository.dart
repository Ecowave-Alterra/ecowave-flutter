import 'package:dartz/dartz.dart';

import 'package:ecowave/features/payment/model/datasource/voucher_remote_datasource.dart';
import 'package:ecowave/features/payment/model/entity/voucher_entity.dart';
import 'package:ecowave/features/payment/model/response/voucher_response_model.dart';

abstract class VoucherRepository {
  Future<Either<String, List<VoucherEntity>>> getVouchers();
}

class VoucherRepositoryImpl implements VoucherRepository {
  final VoucherRemoteDatasource datasource;
  VoucherRepositoryImpl(this.datasource);

  @override
  Future<Either<String, List<VoucherEntity>>> getVouchers() async {
    try {
      final List<VoucherResponseModel> response =
          await datasource.getVouchers();

      return Right(response.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
