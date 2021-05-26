import 'package:bloodon/Controleurs/utils/constants.dart';
import 'package:chopper/chopper.dart';
part 'firebase_api_service.chopper.dart';

@ChopperApi(baseUrl: '/')
abstract class FirebaseApiService extends ChopperService {


  @Post(path: '/bloodonMobile-IsExist')
  Future<Response> IsExist(@Body() Map<String, dynamic> body);
  @Post(path: '/bloodonMobile-UpdateClient')
  Future<Response> UpdateClient(@Body() Map<String, dynamic> body);
  static FirebaseApiService create() {
    final client = ChopperClient(
        baseUrl: DB_URL,
        services: [_$FirebaseApiService()],
        converter: JsonConverter(),
        interceptors: [HttpLoggingInterceptor()]);
    return _$FirebaseApiService(client);
  }
}
