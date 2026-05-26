import 'dart:developer';
import 'package:dio/dio.dart';
import '../models/gemini_response_model.dart';

class GeminiService {
  final Dio dio;
  final String baseUrl =
      'https://generativelanguage.googleapis.com/v1beta/models';
  final String apiKey = 'AIzaSyAPRsNcPVYZDbaLPHQ6orUIj3_Ib1V0vy4';

  GeminiService(this.dio);

  Future<GeminiResponseModel> generateContent(String prompt) async {
    try {
      Response response = await dio.post(
        '$baseUrl/gemini-1.5-flash:generateContent?key=$apiKey',
        data: {
          'contents': [
            {
              'parts': [
                {'text': prompt},
              ],
            },
          ],
        },
      );
      GeminiResponseModel geminiResponse = GeminiResponseModel.fromJson(
        response.data,
      );
      return geminiResponse;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ??
          'An error occurred while generating content.';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('An unexpected error occurred');
    }
  }

  Future<GeminiResponseModel> chat(
    String message, {
    List<Map<String, dynamic>>? conversationHistory,
  }) async {
    try {
      final contents = [
        ...?conversationHistory,
        {
          'parts': [
            {'text': message},
          ],
          'role': 'user',
        },
      ];

      Response response = await dio.post(
        '$baseUrl/gemini-1.5-flash:generateContent?key=$apiKey',
        data: {'contents': contents},
      );
      GeminiResponseModel geminiResponse = GeminiResponseModel.fromJson(
        response.data,
      );
      return geminiResponse;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ??
          'An error occurred while sending chat message.';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('An unexpected error occurred');
    }
  }
}
