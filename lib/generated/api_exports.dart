/// Main exports file for Built Glory API Client
/// 
/// Import this file to access all API services, models, and utilities
/// 
/// Example:
/// ```dart
/// import 'package:buildglory/generated/api_exports.dart';
/// 
/// final api = ApiClientFactory(baseUrl: 'https://api.builtglory.com/api');
/// ```

// Core exports
export 'core/api_client.dart';
export 'core/api_error.dart';
export 'core/api_response.dart';
export 'core/auth_manager.dart';
export 'core/secure_auth_manager.dart';

// Model exports
export 'models/user.dart';
export 'models/property.dart';
export 'models/sell.dart';
export 'models/exchange.dart';
export 'models/notification.dart';
export 'models/feedback.dart';
export 'models/enquiry.dart';
export 'models/history.dart';
export 'models/saved_property.dart';

// Service exports
export 'services/auth_service.dart';
export 'services/profile_service.dart';
export 'services/property_service.dart';
export 'services/sell_service.dart';
export 'services/exchange_service.dart';
export 'services/saved_property_service.dart';
export 'services/history_service.dart';
export 'services/enquiry_service.dart';
export 'services/feedback_service.dart';
export 'services/notification_service.dart';

// Factory export
export 'api_client_factory.dart';

