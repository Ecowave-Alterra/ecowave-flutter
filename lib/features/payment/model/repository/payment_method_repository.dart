import 'package:dartz/dartz.dart';
import 'package:ecowave/features/payment/model/datasource/payment_method_remote_datasource.dart';
import 'package:ecowave/features/payment/model/entity/payment_method_entity.dart';
import 'package:ecowave/features/payment/model/response/payment_method_response_model.dart';

abstract class PaymentMethodRepository {
  Future<Either<String, List<PaymentMethodEntity>>> getPaymentMethods();
}

class PaymentMethodRepositoryImpl implements PaymentMethodRepository {
  final PaymentMethodRemoteDatasource datasource;
  PaymentMethodRepositoryImpl(this.datasource);

  @override
  Future<Either<String, List<PaymentMethodEntity>>> getPaymentMethods() async {
    try {
      final List<PaymentMethodResponseModel> response =
          await datasource.getPaymentMethods();

      return Right(response.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
