import 'dart:convert';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

Client client =
    HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);
const String baseUrl = "http://192.168.0.22:8080/transactions";

Future<List<Transaction>> findAll() async {
  final Response response =
      await client.get(baseUrl).timeout(Duration(seconds: 15));
  final List<dynamic> decodedJson = jsonDecode(response.body);

  return decodedJson.map((dynamic json) => Transaction.fromJson(json)).toList();
}

Future<Transaction> save(Transaction transaction) async {
  final Response response = await client.post(baseUrl,
      headers: {
        'Content-type': 'application/json',
        'password': '1000',
      },
      body: jsonEncode(transaction.toJson()));

  return Transaction.fromJson(jsonDecode(response.body));
}

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print('Request');
    print('url: ${data.url}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print('Response');
    print('status code: ${data.statusCode}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }
}
