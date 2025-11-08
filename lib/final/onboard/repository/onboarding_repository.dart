import 'package:buildglory/api/apiservice.dart';
import 'package:buildglory/final/onboard/model/onboard_response_model.dart';

class OnboardingRepository {
  OnboardingRepository({ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  final ApiService _apiService;

  Future<List<OnboardResponseModel>> fetchScreens() async {
    final response = await _apiService.get(
      'api/onboarding/screens',
      authenticated: false,
    );

    if (!response.isSuccess) {
      throw Exception(_extractMessage(response));
    }

    if (response.data is List) {
      return (response.data as List)
          .map((item) => OnboardResponseModel.fromJson(
                Map<String, dynamic>.from(item as Map),
              ))
          .toList();
    }

    throw Exception('Unexpected onboarding response format.');
  }

  String _extractMessage(ApiResponse response) {
    if (response.data is Map && (response.data as Map)['message'] != null) {
      return (response.data as Map)['message'].toString();
    }
    if (response.data is Map && (response.data as Map)['error'] != null) {
      return (response.data as Map)['error'].toString();
    }
    return response.error ??
        response.rawBody ??
        'Unable to fetch onboarding screens.';
  }
}
