import 'dart:convert';
/*import 'package:http/http.dart' as http;

class ChatService {
  final String inputText;

  ChatService({required this.inputText});

  Future<String> callOpenAIAPI() async {
    String apiKey = 'YOUR_API_KEY';
    String apiUrl = 'https://api.openai.com/v1/engines/davinci/completions';

    Map<String, dynamic>? requestBody = {
      'role': 'user',
      'content': inputText,
    };

    String requestBodyJson = json.encode(requestBody);

    print('Request Body: $requestBodyJson');

    try {
      http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Authorization': 'Bearer $apiKey',
          'OpenAI-Beta': 'assistants=v1',
        },
        body: requestBodyJson,
      );

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        Map<String, dynamic>? data = json.decode(response.body);

        // Assuming 'choices' is an array, pick the first one
        String generatedText = data?['choices'][0]['text'];

        return generatedText;
      } else {
        throw Exception('Failed to generate text: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to generate text: $e');
    }
  }
}

void main() async {
  ChatService chatService = ChatService(inputText: "Hello, how are you?");
  try {
    String generatedText = await chatService.callOpenAIAPI();
    print('Generated Text: $generatedText');
  } catch (e) {
    print('Error: $e');
  }
}
*/