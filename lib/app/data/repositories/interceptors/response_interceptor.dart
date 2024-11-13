import 'dart:async';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '../../../utils/utils.dart';
import '../../model/response_model/error_response.dart';

FutureOr<dynamic> responseInterceptor(
    Request request, Response response) async {
  if (response.statusCode == 201) {
    return response;
  }
  if (response.statusCode == 250) {
    return response;
  }
  if (response.statusCode != 200) {
    handleErrorStatus(response);
    return;
  }
  return response;
}

void handleErrorStatus(Response response) {
  switch (response.statusCode) {
    case 401:
      CommonWidget.toast(response.body);
      break;
    case 403:
      CommonWidget.toast(response.body);
      break;
    default:
      try {
        final message = ErrorResponse.fromJson(response.body);
        CommonWidget.toast(message.errors);
      } catch (e) {
        CommonWidget.toast(response.body);
      }
  }
  return null;
}
