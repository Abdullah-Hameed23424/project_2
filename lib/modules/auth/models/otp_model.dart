import 'package:project_2/core/utils/model_parser.dart';

class OtpResponse {
  final String ticket;

  OtpResponse({required this.ticket});

  factory OtpResponse.fromJson(Map<String, dynamic> json) {
    return OtpResponse(ticket: ModelParser.stringValue(json['ticket']));
  }
}
