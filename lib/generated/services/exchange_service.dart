import '../core/api_client.dart';
import '../core/api_response.dart';
import '../models/exchange.dart';

/// Exchange service for property exchanges
class ExchangeService {
  final ApiClient _apiClient;

  ExchangeService(this._apiClient);

  /// Get all exchanges (requires authentication)
  Future<ApiResponse<List<Exchange>>> getAllExchanges() async {
    return await _apiClient.get(
      '/exchange',
      fromJson: (json) {
        final list = json as List;
        return list.map((item) => Exchange.fromJson(item as Map<String, dynamic>)).toList();
      },
    );
  }

  /// Get exchange by ID
  Future<ApiResponse<Exchange>> getExchangeById(String id) async {
    return await _apiClient.get(
      '/exchange/$id',
      fromJson: (json) => Exchange.fromJson(json as Map<String, dynamic>),
    );
  }

  /// Create exchange
  Future<ApiResponse<Exchange>> createExchange({
    required String sellerProperty,
    List<String>? matchedProperties,
    bool? fallbackToBuy,
  }) async {
    final body = <String, dynamic>{
      'sellerProperty': sellerProperty,
    };
    if (matchedProperties != null) body['matchedProperties'] = matchedProperties;
    if (fallbackToBuy != null) body['fallbackToBuy'] = fallbackToBuy;

    return await _apiClient.post(
      '/exchange',
      body: body,
      fromJson: (json) => Exchange.fromJson(json as Map<String, dynamic>),
    );
  }

  /// Update exchange
  Future<ApiResponse<Exchange>> updateExchange(String id, Exchange exchange) async {
    return await _apiClient.put(
      '/exchange/$id',
      body: exchange.toJson(),
      fromJson: (json) => Exchange.fromJson(json as Map<String, dynamic>),
    );
  }

  /// Delete exchange
  Future<ApiResponse<Map<String, dynamic>>> deleteExchange(String id) async {
    return await _apiClient.delete(
      '/exchange/$id',
      fromJson: (json) => json as Map<String, dynamic>,
    );
  }
}

