/// Autogenerated from flutter_deriv_api|lib/api/set_financial_assessment_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'set_financial_assessment_send.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class SetFinancialAssessmentRequest {
  SetFinancialAssessmentRequest(
      {this.accountTurnover,
      this.binaryOptionsTradingExperience,
      this.binaryOptionsTradingFrequency,
      this.cfdTradingExperience,
      this.cfdTradingFrequency,
      this.educationLevel,
      this.employmentIndustry,
      this.employmentStatus,
      this.estimatedWorth,
      this.forexTradingExperience,
      this.forexTradingFrequency,
      this.incomeSource,
      this.netIncome,
      this.occupation,
      this.otherInstrumentsTradingExperience,
      this.otherInstrumentsTradingFrequency,
      this.passthrough,
      this.reqId,
      this.setFinancialAssessment,
      this.sourceOfWealth});
  factory SetFinancialAssessmentRequest.fromJson(Map<String, dynamic> json) =>
      _$SetFinancialAssessmentRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SetFinancialAssessmentRequestToJson(this);

  // Properties
  /// [Optional] The anticipated account turnover.
  String accountTurnover;

  /// [Optional] Binary options trading experience.
  String binaryOptionsTradingExperience;

  /// [Optional] Binary options trading frequency.
  String binaryOptionsTradingFrequency;

  /// [Optional] CFDs trading experience.
  String cfdTradingExperience;

  /// [Optional] CFDs trading frequency.
  String cfdTradingFrequency;

  /// Level of Education.
  String educationLevel;

  /// Industry of Employment.
  String employmentIndustry;

  /// [Optional] Employment Status.
  String employmentStatus;

  /// Estimated Net Worth.
  String estimatedWorth;

  /// [Optional] Forex trading experience.
  String forexTradingExperience;

  /// [Optional] Forex trading frequency.
  String forexTradingFrequency;

  /// Income Source.
  String incomeSource;

  /// Net Annual Income.
  String netIncome;

  /// Occupation.
  String occupation;

  /// [Optional] Trading experience in other financial instruments.
  String otherInstrumentsTradingExperience;

  /// [Optional] Trading frequency in other financial instruments.
  String otherInstrumentsTradingFrequency;

  /// [Optional] Used to pass data through the websocket, which may be retrieved via the `echo_req` output field.
  Map<String, dynamic> passthrough;

  /// [Optional] Used to map request to response.
  int reqId;

  /// Must be `1`
  int setFinancialAssessment;

  /// [Optional] Source of wealth.
  String sourceOfWealth;

  // @override
  // String toString() => name;
  static bool _fromInteger(int v) => (v != 0);
  static int _fromBoolean(bool v) => v ? 1 : 0;
}