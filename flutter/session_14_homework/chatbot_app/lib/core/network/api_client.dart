import 'package:chatbot_app/core/network/custom_exceptions.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio = Dio();

  Future<dynamic> post({
    required String url,
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      var response = await dio.post(
        url,
        data: data,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      throw ApiException.fromDio(e);
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}
