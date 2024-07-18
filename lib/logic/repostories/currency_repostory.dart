import 'package:dio/dio.dart';
import 'package:vazifa25/logic/model/currensy.dart';

class CurrencyRepository {
  final String apiUrl = "https://cbu.uz/uz/arkhiv-kursov-valyut/json/";
  final int maxRetries = 3;
  final Dio _dio = Dio();

  Future<List<Currency>> fetchCurrencies() async {
    int retryCount = 0;
    while (retryCount < maxRetries) {
      try {
        final response = await _dio.get(apiUrl);
        if (response.statusCode == 200) {
          List<dynamic> body = response.data;
          List<Currency> currencies = body.map((dynamic item) => Currency.fromJson(item)).toList();
          print(currencies); // Debug print to ensure the data is parsed
          return currencies;
        } else {
          print("Failed to load currencies with status code: ${response.statusCode}");
          throw Exception("Failed to load currencies");
        }
      } on DioException catch (e) {
        print("Network issue: $e. Retrying...");
        retryCount++;
        await Future.delayed(Duration(seconds: 2)); // Delay before retrying
      } catch (e) {
        print("Error fetching currencies: $e");
        throw Exception("Error fetching currencies");
      }
    }
    throw Exception("Failed to load currencies after $maxRetries attempts");
  }
}
