import 'package:buildglory/api/apiservice.dart';
import 'package:http/http.dart' as http;

class ProfileRepository {
  ProfileRepository({ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  final ApiService _apiService;

  Future<ApiResponse> fetchProfile() =>
      _apiService.get('api/profile', authenticated: true);

  Future<ApiResponse> updateProfile(Map<String, dynamic> payload) =>
      _apiService.put(
        'api/profile',
        body: payload,
        authenticated: true,
      );

  Future<ApiResponse> deleteProfile() =>
      _apiService.delete('api/profile', authenticated: true);

  Future<ApiResponse> uploadProfileImage(http.MultipartFile image) =>
      _apiService.multipart(
        'api/user/upload-profile-image',
        files: [image],
        authenticated: true,
      );
}

class SavedPropertiesRepository {
  SavedPropertiesRepository({ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  final ApiService _apiService;

  Future<ApiResponse> listSavedProperties() =>
      _apiService.get('api/saved', authenticated: true);

  Future<ApiResponse> saveProperty(String propertyId) => _apiService.post(
        'api/saved/add',
        body: {'propertyId': propertyId},
        authenticated: true,
      );

  Future<ApiResponse> removeSavedProperty(String propertyId) =>
      _apiService.post(
        'api/saved/remove',
        body: {'propertyId': propertyId},
        authenticated: true,
      );
}

class GeneralInfoRepository {
  GeneralInfoRepository({ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  final ApiService _apiService;

  Future<ApiResponse> createGeneralInfo(Map<String, dynamic> payload) =>
      _apiService.post(
        'api/generalinfo',
        body: payload,
        authenticated: true,
      );

  Future<ApiResponse> listGeneralInfo() =>
      _apiService.get('api/generalinfo', authenticated: true);

  Future<ApiResponse> updateGeneralInfo(
    String id,
    Map<String, dynamic> payload,
  ) =>
      _apiService.put(
        'api/generalinfo/$id',
        body: payload,
        authenticated: true,
      );

  Future<ApiResponse> deleteGeneralInfo(String id) =>
      _apiService.delete('api/generalinfo/$id', authenticated: true);
}

class ExchangeRepository {
  ExchangeRepository({ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  final ApiService _apiService;

  Future<ApiResponse> createExchange(Map<String, dynamic> payload) =>
      _apiService.post(
        'api/exchange',
        body: payload,
        authenticated: true,
      );

  Future<ApiResponse> listExchanges() =>
      _apiService.get('api/exchange', authenticated: true);

  Future<ApiResponse> getExchangeById(String id) =>
      _apiService.get('api/exchange/$id', authenticated: true);

  Future<ApiResponse> updateExchange(
    String id,
    Map<String, dynamic> payload,
  ) =>
      _apiService.put(
        'api/exchange/$id',
        body: payload,
        authenticated: true,
      );

  Future<ApiResponse> deleteExchange(String id) =>
      _apiService.delete('api/exchange/$id', authenticated: true);
}

class HistoryRepository {
  HistoryRepository({ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  final ApiService _apiService;

  Future<ApiResponse> fetchHistory() =>
      _apiService.get('api/history', authenticated: true);

  Future<ApiResponse> addBuyHistory(String propertyId) => _apiService.post(
        'api/history/buy',
        body: {'propertyId': propertyId},
        authenticated: true,
      );

  Future<ApiResponse> addExchangeHistory(String exchangeId) => _apiService.post(
        'api/history/exchange',
        body: {'exchangeId': exchangeId},
        authenticated: true,
      );

  Future<ApiResponse> removeBuyHistory(String propertyId) => _apiService.post(
        'api/history/buy/remove',
        body: {'propertyId': propertyId},
        authenticated: true,
      );

  Future<ApiResponse> removeExchangeHistory(String exchangeId) =>
      _apiService.post(
        'api/history/exchange/remove',
        body: {'exchangeId': exchangeId},
        authenticated: true,
      );
}

class EnquiryRepository {
  EnquiryRepository({ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  final ApiService _apiService;

  Future<ApiResponse> submitEnquiry(Map<String, dynamic> payload) =>
      _apiService.post(
        'api/enquiry',
        body: payload,
        authenticated: true,
      );
}

class FeedbackRepository {
  FeedbackRepository({ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  final ApiService _apiService;

  Future<ApiResponse> createFeedback(Map<String, dynamic> payload) =>
      _apiService.post(
        'api/feedback',
        body: payload,
        authenticated: true,
      );

  Future<ApiResponse> listFeedback() =>
      _apiService.get('api/feedback', authenticated: true);

  Future<ApiResponse> updateFeedback(
    String id,
    Map<String, dynamic> payload,
  ) =>
      _apiService.put(
        'api/feedback/$id',
        body: payload,
        authenticated: true,
      );

  Future<ApiResponse> deleteFeedback(String id) =>
      _apiService.delete('api/feedback/$id', authenticated: true);
}

class NotificationsRepository {
  NotificationsRepository({ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  final ApiService _apiService;

  Future<ApiResponse> createNotification(Map<String, dynamic> payload) =>
      _apiService.post(
        'api/notifications',
        body: payload,
        authenticated: true,
      );

  Future<ApiResponse> listNotifications() =>
      _apiService.get('api/notifications', authenticated: true);

  Future<ApiResponse> markAsRead(String id) =>
      _apiService.put('api/notifications/$id/read', authenticated: true);

  Future<ApiResponse> deleteNotification(String id) =>
      _apiService.delete('api/notifications/$id', authenticated: true);
}
