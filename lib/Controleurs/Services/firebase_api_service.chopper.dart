// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$FirebaseApiService extends FirebaseApiService {
  _$FirebaseApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = FirebaseApiService;

  @override
  Future<Response<dynamic>> IsExist(Map<String, dynamic> body) {
    final $url = '/bloodonMobile-IsExist';
    final $body = body;
    print('url :'+$url);
    print($body);
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }
  Future<Response<dynamic>> UpdateClient(Map<String, dynamic> body) {
    final $url = '/bloodonMobile-UpdateClient';
    final $body = body;
    print('url :'+$url);
    print($body);
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

}
