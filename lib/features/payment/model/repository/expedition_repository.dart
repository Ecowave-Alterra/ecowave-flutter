import 'package:dartz/dartz.dart';

import 'package:ecowave/features/payment/model/datasource/expedition_remote_datasource.dart';
import 'package:ecowave/features/payment/model/entity/expedition_entity.dart';
import 'package:ecowave/features/payment/model/response/expedition_response_model.dart';

abstract class ExpeditionRepository {
  Future<Either<String, List<ExpeditionEntity>>> getaddreses();
}

class ExpeditionRepositoryImpl implements ExpeditionRepository {
  final ExpeditionRemoteDatasource datasource;
  ExpeditionRepositoryImpl(this.datasource);

  @override
  Future<Either<String, List<ExpeditionEntity>>> getaddreses() async {
    try {
      final List<ExpeditionResponseModel> result =
          await datasource.getExpeditions();

      return Right(result.map((e) => e.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
