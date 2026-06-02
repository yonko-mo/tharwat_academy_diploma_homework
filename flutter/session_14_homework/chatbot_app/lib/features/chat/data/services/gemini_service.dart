import 'dart:developer';
import 'package:chatbot_app/secrets.dart';
import 'package:dio/dio.dart';
import '../models/gemini_response_model.dart';

class GeminiService {
  final Dio dio;
  final String baseUrl =
      'https://generativelanguage.googleapis.com/v1beta/models';

  /// Stores the full conversation history as a list of role/parts maps.
  final List<Map<String, dynamic>> _conversationHistory = [];

  GeminiService(this.dio);

  Future<GeminiResponseModel> generateContent(String prompt) async {
    // Append the user's message to conversation history
    _conversationHistory.add({
      'role': 'user',
      'parts': [
        {'text': prompt},
      ],
    });

    try {
      Response response = await dio.post(
        '$baseUrl/gemini-3.5-flash:generateContent',
        data: {
          'contents': _conversationHistory,
        },
        options: Options(headers: {
          'Content-Type': 'application/json',
          'x-goog-api-key': apiKey,
        }),
      );
      GeminiResponseModel geminiResponse = GeminiResponseModel.fromJson(
        response.data,
      );

      // Append the model's response to conversation history
      if (geminiResponse.hasContent) {
        _conversationHistory.add({
          'role': 'model',
          'parts': [
            {'text': geminiResponse.generatedText},
          ],
        });
      }

      return geminiResponse;
    } on DioException catch (e) {
      // Remove the failed user message so history stays clean
      _conversationHistory.removeLast();
      final String errorMessage =
          e.response?.data['error']['message'] ??
          'An error occurred while generating content.';
      throw Exception(errorMessage);
    } catch (e) {
      // Remove the failed user message so history stays clean
      _conversationHistory.removeLast();
      log(e.toString());
      throw Exception('An unexpected error occurred');
    }
  }

  /// Clears the conversation history to start a new chat session.
  void clearHistory() {
    _conversationHistory.clear();
  }
}
