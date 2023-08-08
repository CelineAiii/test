import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class UploadImageCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? image,
    String? name = 'photo',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'upload image',
      apiUrl: 'a7c6-120-126-16-233.ngrok-free.app',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'image': image,
        'name': name,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic calorie(dynamic response) => getJsonField(
        response,
        r'''$.calorie''',
      );
}

class UploadImageCopyCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? image,
    String? name = 'photo',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'upload image Copy',
      apiUrl: '7ad1-220-128-241-243.ngrok-free.app',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'image': image,
        'name': name,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic calorie(dynamic response) => getJsonField(
        response,
        r'''$.calorie''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
