import 'dart:convert';

import '../utils/constant.dart';
import 'package:http/http.dart' as http;

// Future<String> generateResponse(String prompt) async {
//   const apiKey = apiSecretKey;

//   var url = Uri.https("api.openai.com", "/v1/completions");
//   final response = await http.post(
//     url,
//     headers: {
//       'Content-Type': 'application/json',
//       "Authorization": "Bearer $apiKey"
//     },
//     body: json.encode({
//       "model": "text-davinci-003",
//       "prompt": prompt,
//       'temperature': 0,
//       'max_tokens': 200,
//       'top_p': 1,
//       'frequency_penalty': 0.0,
//       'presence_penalty': 0.0,
//     }),
//   );

//   // Do something with the response
//   Map<String, dynamic> newresponse = jsonDecode(response.body);

//   return newresponse['choices'][0]['text'];
// }
Future<String> generateResponse(String prompt) async {
  const apiKey = apiSecretKey;

  var url = Uri.https("api.openai.com", "/v1/completions");
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $apiKey"
    },
    body: json.encode({
      "model": "text-davinci-003",
      "prompt": prompt,
      'temperature': 0,
      'max_tokens': 200,
      'top_p': 1,
      'frequency_penalty': 0.0,
      'presence_penalty': 0.0,
    }),
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> newresponse = jsonDecode(response.body);

    if (newresponse != null &&
        newresponse.containsKey('choices') &&
        newresponse['choices'].length > 0 &&
        newresponse['choices'][0].containsKey('text')) {
      return newresponse['choices'][0]['text'];
    } else {
      throw Exception('Invalid response from the OpenAI API.');
    }
  } else {
    throw Exception('Failed to communicate with the OpenAI API.');
  }
}
