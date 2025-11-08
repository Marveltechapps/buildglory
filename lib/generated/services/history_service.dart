import '../core/api_client.dart';
import '../core/api_response.dart';
import '../models/history.dart';

/// History service for tracking user activity
class HistoryService {
  final ApiClient _apiClient;

  HistoryService(this._apiClient);

  /// Get user history (requires authentication)
  Future<ApiResponse<History>> getHistory() async {
    return await _apiClient.get(
      '/history',
      fromJson: (json) => History.fromJson(json as Map<String, dynamic>),
    );
  }

  /// Add property to buy list
  Future<ApiResponse<Map<String, dynamic>>> addToBuyList(String propertyId) async {
    return await _apiClient.post(
      '/history/buy',
      body: {'propertyId': propertyId},
      fromJson: (json) => json as Map<String, dynamic>,
    );
  }

  /// Remove property from buy list
  Future<ApiResponse<Map<String, dynamic>>> removeFromBuyList(String propertyId) async {
    return await _apiClient.post(
      '/history/buy/remove',
      body: {'propertyId': propertyId},
      fromJson: (json) => json as Map<String, dynamic>,
    );
  }

  /// Add exchange to exchange list
  Future<ApiResponse<Map<String, dynamic>>> addToExchangeList(String exchangeId) async {
    return await _apiClient.post(
      '/history/exchange',
      body: {'exchangeId': exchangeId},
      fromJson: (json) => json as Map<String, dynamic>,
    );
  }

  /// Remove exchange from exchange list
  Future<ApiResponse<Map<String, dynamic>>> removeFromExchangeList(String exchangeId) async {
    return await _apiClient.post(
      '/history/exchange/remove',
      body: {'exchangeId': exchangeId},
      fromJson: (json) => json as Map<String, dynamic>,
    );
  }
}

