import 'package:chatbot_app/secrets.dart';
import 'package:dio/dio.dart';
import '../models/gemini_response_model.dart';

class GeminiService {
  final Dio dio;
  final String baseUrl =
      'https://generativelanguage.googleapis.com/v1beta/models';
  final List<Map<String, dynamic>> history = [];

  GeminiService(this.dio);

  Future<GeminiResponseModel> generateContent(String prompt) async {
    history.add({
      'role': 'user',
      'parts': [
        {'text': prompt},
      ],
    });

    try {
      final response = await dio.post(
        '$baseUrl/gemini-3.5-flash:generateContent',
        data: {'contents': history},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'x-goog-api-key': apiKey,
          },
        ),
      );

      final geminiResponse = GeminiResponseModel.fromJson(response.data);

      if (geminiResponse.hasContent) {
        history.add({
          'role': 'model',
          'parts': [
            {'text': geminiResponse.generatedText},
          ],
        });
      }

      return geminiResponse;
    } on DioException catch (e) {
      history.removeLast();
      final errorMsg =
          e.response?.data['error']['message'] ??
          'An error occurred while generating content.';
      throw Exception(errorMsg);
    } catch (e) {
      history.removeLast();
      throw Exception('An unexpected error occurred');
    }
  }
}
