import 'package:http/http.dart' as http;
import '../core/api_client.dart';
import '../core/api_response.dart';
import '../models/sell.dart';

/// Sell listing service
class SellService {
  final ApiClient _apiClient;

  SellService(this._apiClient);

  /// Get all sell listings
  Future<ApiResponse<List<Sell>>> getAllSells() async {
    return await _apiClient.get(
      '/sells',
      fromJson: (json) {
        final list = json as List;
        return list.map((item) => Sell.fromJson(item as Map<String, dynamic>)).toList();
      },
    );
  }

  /// Get sell listing by ID
  Future<ApiResponse<Sell>> getSellById(String id) async {
    return await _apiClient.get(
      '/sells/$id',
      fromJson: (json) => Sell.fromJson(json as Map<String, dynamic>),
    );
  }

  /// Create sell listing (requires authentication)
  Future<ApiResponse<Sell>> createSell(Sell sell) async {
    return await _apiClient.post(
      '/sells',
      body: sell.toJson(),
      fromJson: (json) => Sell.fromJson(json as Map<String, dynamic>),
    );
  }

  /// Create sell listing with images (multipart)
  Future<ApiResponse<Sell>> createSellWithImages({
    required Sell sell,
    required List<http.MultipartFile> images,
  }) async {
    final fields = <String, String>{};
    final sellJson = sell.toJson();
    
    // Convert all fields to strings for multipart request
    sellJson.forEach((key, value) {
      if (value != null) {
        if (value is List) {
          fields[key] = value.join(',');
        } else if (value is Map) {
          // For nested objects like location, convert to JSON string
          fields[key] = value.toString();
        } else {
          fields[key] = value.toString();
        }
      }
    });

    return await _apiClient.postMultipart(
      '/sells',
      fields: fields,
      files: images,
      fromJson: (json) => Sell.fromJson(json as Map<String, dynamic>),
    );
  }

  /// Update sell listing
  Future<ApiResponse<Sell>> updateSell(String id, Sell sell) async {
    return await _apiClient.put(
      '/sells/$id',
      body: sell.toJson(),
      fromJson: (json) => Sell.fromJson(json as Map<String, dynamic>),
    );
  }

  /// Delete sell listing
  Future<ApiResponse<Map<String, dynamic>>> deleteSell(String id) async {
    return await _apiClient.delete(
      '/sells/$id',
      fromJson: (json) => json as Map<String, dynamic>,
    );
  }
}

