import '../core/api_client.dart';
import '../core/api_response.dart';
import '../models/enquiry.dart';

/// Enquiry service for property enquiries
class EnquiryService {
  final ApiClient _apiClient;

  EnquiryService(this._apiClient);

  /// Submit enquiry (requires authentication)
  Future<ApiResponse<Map<String, dynamic>>> submitEnquiry({
    required String propertyId,
    required EnquiryType type,
    String? message,
  }) async {
    final body = <String, dynamic>{
      'propertyId': propertyId,
      'type': type.value,
    };
    if (message != null && message.isNotEmpty) {
      body['message'] = message;
    }

    print('🔍 EnquiryService: Submitting enquiry with body: $body');

    return await _apiClient.post(
      '/enquiry',
      body: body,
      fromJson: (json) => json as Map<String, dynamic>,
    );
  }
}

