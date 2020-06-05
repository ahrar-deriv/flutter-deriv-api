import 'package:flutter_deriv_api/api/account/models/self_exclusion_model.dart';
import 'package:flutter_deriv_api/api/account/self_exclusion/exceptions/self_exclusion_exception.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Self exclusion class
class SelfExclusion extends SelfExclusionModel {
  /// Initializes
  SelfExclusion({
    DateTime excludeUntil,
    double max30dayLosses,
    double max30dayTurnover,
    double max7dayLosses,
    double max7dayTurnover,
    double maxBalance,
    double maxDeposit,
    DateTime maxDepositEndDate,
    double maxLosses,
    int maxOpenBets,
    double maxTurnover,
    int sessionDurationLimit,
    DateTime timeoutUntil,
  }) : super(
          excludeUntil: excludeUntil,
          max30dayLosses: max30dayLosses,
          max30dayTurnover: max30dayTurnover,
          max7dayLosses: max7dayLosses,
          max7dayTurnover: max7dayTurnover,
          maxBalance: maxBalance,
          maxDeposit: maxDeposit,
          maxDepositEndDate: maxDepositEndDate,
          maxLosses: maxLosses,
          maxOpenBets: maxOpenBets,
          maxTurnover: maxTurnover,
          sessionDurationLimit: sessionDurationLimit,
          timeoutUntil: timeoutUntil,
        );

  /// Creates an instance from JSON
  factory SelfExclusion.fromJson(Map<String, dynamic> json) => SelfExclusion(
        excludeUntil: DateTime.parse(
          json['exclude_until'],
        ), // TODO(hamed): change format to `yyyy-MM-dd` after adding intl package
        max30dayLosses: json['max_30day_losses']?.toDouble(),
        max30dayTurnover: json['max_30day_turnover']?.toDouble(),
        max7dayLosses: json['max_7day_losses']?.toDouble(),
        max7dayTurnover: json['max_7day_turnover']?.toDouble(),
        maxBalance: json['max_balance']?.toDouble(),
        maxDeposit: json['max_deposit']?.toDouble(),
        maxDepositEndDate: DateTime.parse(
          json['max_deposit_end_date'],
        ), // TODO(hamed): change format to `yyyy-MM-dd` after adding intl package
        maxLosses: json['max_losses']?.toDouble(),
        maxOpenBets: json['max_open_bets'],
        maxTurnover: json['max_turnover']?.toDouble(),
        sessionDurationLimit: json['session_duration_limit'],
        timeoutUntil: getDateTime(json['timeout_until']),
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Creates a copy of instance with given parameters
  SelfExclusion copyWith({
    DateTime excludeUntil,
    double max30dayLosses,
    double max30dayTurnover,
    double max7dayLosses,
    double max7dayTurnover,
    double maxBalance,
    double maxDeposit,
    DateTime maxDepositEndDate,
    double maxLosses,
    int maxOpenBets,
    double maxTurnover,
    int sessionDurationLimit,
    int timeoutUntil,
  }) =>
      SelfExclusion(
        excludeUntil: excludeUntil ?? this.excludeUntil,
        max30dayLosses: max30dayLosses ?? this.max30dayLosses,
        max30dayTurnover: max30dayTurnover ?? this.max30dayTurnover,
        max7dayLosses: max7dayLosses ?? this.max7dayLosses,
        max7dayTurnover: max7dayTurnover ?? this.max7dayTurnover,
        maxBalance: maxBalance ?? this.maxBalance,
        maxDeposit: maxDeposit ?? this.maxDeposit,
        maxDepositEndDate: maxDepositEndDate ?? this.maxDepositEndDate,
        maxLosses: maxLosses ?? this.maxLosses,
        maxOpenBets: maxOpenBets ?? this.maxOpenBets,
        maxTurnover: maxTurnover ?? this.maxTurnover,
        sessionDurationLimit: sessionDurationLimit ?? this.sessionDurationLimit,
        timeoutUntil: timeoutUntil ?? this.timeoutUntil,
      );

  /// Allows users to exclude themselves from the website for certain periods of time,
  /// or to set limits on their trading activities.
  ///
  /// This facility is a regulatory requirement for certain Landing Companies.
  /// For parameters information refer to [GetSelfExclusionRequest].
  /// Throws a [SelfExclusionException] if API response contains an error
  static Future<SelfExclusion> fetchSelfExclusion([
    GetSelfExclusionRequest request,
  ]) async {
    final GetSelfExclusionResponse response = await _api.call(
      request: request ?? const GetSelfExclusionRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: (String message) =>
          SelfExclusionException(message: message),
    );

    return SelfExclusion.fromJson(response.getSelfExclusion);
  }

  /// Sets Self-Exclusion (this call should be used in conjunction with [fetchSelfExclusion])
  ///
  /// For parameters information refer to [SetSelfExclusionRequest].
  /// Throws a [SelfExclusionException] if API response contains an error
  static Future<bool> setSelfExclusion(SetSelfExclusionRequest request) async {
    final SetSelfExclusionResponse response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: (String message) =>
          SelfExclusionException(message: message),
    );

    return getBool(response.setSelfExclusion);
  }

  /// Excludes user from the website based this parameters
  ///
  /// (this call should be used in conjunction with [fetchSelfExclusion])
  /// Throws a [SelfExclusionException] if API response contains an error
  Future<bool> exclude() async {
    final SetSelfExclusionResponse response = await _api.call(
      request: SetSelfExclusionRequest(
        excludeUntil: excludeUntil
            .toString(), // TODO(hamed): change format to `yyyy-MM-dd` after adding intl package
        max30dayLosses: max30dayLosses,
        max30dayTurnover: max30dayTurnover,
        max7dayLosses: max7dayLosses,
        max7dayTurnover: max7dayTurnover,
        maxBalance: maxBalance,
        maxDeposit: maxDeposit,
        maxDepositEndDate: maxDepositEndDate
            .toString(), // TODO(hamed): change format to `yyyy-MM-dd` after adding intl package
        maxLosses: maxLosses,
        maxOpenBets: maxOpenBets,
        maxTurnover: maxTurnover,
        sessionDurationLimit: sessionDurationLimit,
        timeoutUntil: getSecondsSinceEpochDateTime(timeoutUntil),
      ),
    );

    checkException(
      response: response,
      exceptionCreator: (String message) =>
          SelfExclusionException(message: message),
    );

    return getBool(response.setSelfExclusion);
  }
}