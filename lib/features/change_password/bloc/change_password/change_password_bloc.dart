import 'package:ecowave/features/change_password/model/models/change_password_model.dart';
import 'package:ecowave/features/change_password/model/services/change_password_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final ChangePasswordService changePasswordService;

  ChangePasswordBloc(this.changePasswordService)
      : super(ChangePasswordInitial()) {
    on<DoChangePasswordEvent>((event, emit) async {
      try {
        emit(ChangePasswordLoading());
        final bool isUpdated =
            await changePasswordService.changePassword(event.request);

        debugPrint("isupdated ini isinya apa $isUpdated");
        if (isUpdated) {
          emit(ChangePasswordSuccess());
        } else {
          emit(const ChangePasswordFailed(meesage: "Gagal ubah password"));
        }
      } catch (e) {
        debugPrint("kenapa error woi ${e.toString()}");
      }
    });
  }
}
