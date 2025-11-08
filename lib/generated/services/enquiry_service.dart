import '../core/api_client.dart';
import '../core/api_response.dart';
import '../models/enquiry.dart';

/// Enquiry service for property enquiries
class EnquiryService {
  final ApiClient _apiClient;

  EnquiryService(this._apiClient);

  /// Submit enquiry (requires authentication)
  Future<ApiResponse<Enquiry>> submitEnquiry({
    required String propertyId,
    required EnquiryType type,
    String? message,
  }) async {
    final body = <String, dynamic>{
      'propertyId': propertyId,
      'type': type.value,
    };
    if (message != null) body['message'] = message;

    return await _apiClient.post(
      '/enquiry',
      body: body,
      fromJson: (json) => Enquiry.fromJson(json as Map<String, dynamic>),
    );
  }
}

