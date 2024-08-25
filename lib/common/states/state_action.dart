import 'package:equatable/equatable.dart';
import 'package:financial_app/common/errors/failure_response.dart';

enum StateActionEnum { initial, loading, loaded, error, noData }

extension StateActionExtension on StateActionEnum {
  bool get isInitial => this == StateActionEnum.initial;
  bool get isLoading => this == StateActionEnum.loading;
  bool get isHasData => this == StateActionEnum.loaded;
  bool get isError => this == StateActionEnum.error;
  bool get isNoData => this == StateActionEnum.noData;
}

class StateAction<ReturnValue> extends Equatable {
  final ReturnValue? data;
  final StateActionEnum status;
  final String? message;
  final FailureResponse? failureResponse;

  const StateAction._({
    required this.status,
    this.data,
    this.message,
    this.failureResponse,
  });

  factory StateAction.initial() => const StateAction._(
        status: StateActionEnum.initial,
      );

  factory StateAction.loading() => const StateAction._(
        status: StateActionEnum.loading,
      );

  factory StateAction.hasData({ReturnValue? data, String? message}) => StateAction._(
        status: StateActionEnum.loaded,
        data: data,
        message: message,
      );

  factory StateAction.error({FailureResponse? failureResponse, String? message}) => StateAction._(
        status: StateActionEnum.error,
        message: message,
        failureResponse: failureResponse,
      );

  factory StateAction.noData({String? message}) => StateAction._(
        status: StateActionEnum.noData,
        message: message,
      );

  @override
  List<Object?> get props => [
        data,
        status,
        message,
        failureResponse,
      ];
}
