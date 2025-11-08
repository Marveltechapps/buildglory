import 'core/api_client.dart';
import 'core/auth_manager.dart';
import 'services/auth_service.dart';
import 'services/profile_service.dart';
import 'services/property_service.dart';
import 'services/sell_service.dart';
import 'services/exchange_service.dart';
import 'services/saved_property_service.dart';
import 'services/history_service.dart';
import 'services/enquiry_service.dart';
import 'services/feedback_service.dart';
import 'services/notification_service.dart';

/// Factory class to create and manage all API services
class ApiClientFactory {
  final ApiClient _apiClient;
  
  // Lazy-initialized services
  late final AuthService auth;
  late final ProfileService profile;
  late final PropertyService property;
  late final SellService sell;
  late final ExchangeService exchange;
  late final SavedPropertyService savedProperty;
  late final HistoryService history;
  late final EnquiryService enquiry;
  late final FeedbackService feedback;
  late final NotificationService notification;

  ApiClientFactory({
    required String baseUrl,
    AuthManager? authManager,
  }) : _apiClient = ApiClient(
          baseUrl: baseUrl,
          authManager: authManager ?? SharedPreferencesAuthManager(),
        ) {
    _initializeServices();
  }

  /// Initialize all services
  void _initializeServices() {
    auth = AuthService(_apiClient);
    profile = ProfileService(_apiClient);
    property = PropertyService(_apiClient);
    sell = SellService(_apiClient);
    exchange = ExchangeService(_apiClient);
    savedProperty = SavedPropertyService(_apiClient);
    history = HistoryService(_apiClient);
    enquiry = EnquiryService(_apiClient);
    feedback = FeedbackService(_apiClient);
    notification = NotificationService(_apiClient);
  }

  /// Get the underlying API client
  ApiClient get apiClient => _apiClient;

  /// Get the auth manager
  AuthManager get authManager => _apiClient.authManager;

  /// Dispose resources
  void dispose() {
    _apiClient.dispose();
    if (authManager is SharedPreferencesAuthManager) {
      (authManager as SharedPreferencesAuthManager).dispose();
    } else if (authManager is InMemoryAuthManager) {
      (authManager as InMemoryAuthManager).dispose();
    }
  }
}

