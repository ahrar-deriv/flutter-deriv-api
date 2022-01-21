/// Autogenerated from flutter_deriv_api|lib/api/paymentagent_list_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'paymentagent_list_send.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class PaymentagentListRequest {
  PaymentagentListRequest(
      {this.currency, this.passthrough, this.paymentagentList, this.reqId});
  factory PaymentagentListRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentagentListRequestFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentagentListRequestToJson(this);

  // Properties
  /// [Optional] If specified, only payment agents that supports that currency will be returned (obtained from `payout_currencies` call).
  String currency;

  /// [Optional] Used to pass data through the websocket, which may be retrieved via the `echo_req` output field.
  Map<String, dynamic> passthrough;

  /// Client's 2-letter country code (obtained from `residence_list` call).
  String paymentagentList;

  /// [Optional] Used to map request to response.
  int reqId;

  // @override
  // String toString() => name;
  static bool _fromInteger(int v) => (v != 0);
  static int _fromBoolean(bool v) => v ? 1 : 0;
}