import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../api_exports.dart';

/// =============================================================================
/// CORE API PROVIDERS
/// =============================================================================

/// API Client Factory Provider (singleton)
final apiClientProvider = Provider<ApiClientFactory>((ref) {
  const baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://localhost:6000/api',
  );

  final api = ApiClientFactory(
    baseUrl: baseUrl,
    authManager: SecureAuthManager(),
  );

  // Cleanup when provider is disposed
  ref.onDispose(() => api.dispose());

  return api;
});

/// Auth Manager Provider
final authManagerProvider = Provider<AuthManager>((ref) {
  return ref.watch(apiClientProvider).authManager;
});

/// =============================================================================
/// SERVICE PROVIDERS
/// =============================================================================

/// Authentication Service
final authServiceProvider = Provider<AuthService>((ref) {
  return ref.watch(apiClientProvider).auth;
});

/// Profile Service
final profileServiceProvider = Provider<ProfileService>((ref) {
  return ref.watch(apiClientProvider).profile;
});

/// Property Service
final propertyServiceProvider = Provider<PropertyService>((ref) {
  return ref.watch(apiClientProvider).property;
});

/// Sell Service
final sellServiceProvider = Provider<SellService>((ref) {
  return ref.watch(apiClientProvider).sell;
});

/// Exchange Service
final exchangeServiceProvider = Provider<ExchangeService>((ref) {
  return ref.watch(apiClientProvider).exchange;
});

/// Saved Property Service
final savedPropertyServiceProvider = Provider<SavedPropertyService>((ref) {
  return ref.watch(apiClientProvider).savedProperty;
});

/// History Service
final historyServiceProvider = Provider<HistoryService>((ref) {
  return ref.watch(apiClientProvider).history;
});

/// Enquiry Service
final enquiryServiceProvider = Provider<EnquiryService>((ref) {
  return ref.watch(apiClientProvider).enquiry;
});

/// Feedback Service
final feedbackServiceProvider = Provider<FeedbackService>((ref) {
  return ref.watch(apiClientProvider).feedback;
});

/// Notification Service
final notificationServiceProvider = Provider<NotificationService>((ref) {
  return ref.watch(apiClientProvider).notification;
});

/// =============================================================================
/// AUTH STATE PROVIDERS
/// =============================================================================

/// Current authentication status
final isAuthenticatedProvider = FutureProvider<bool>((ref) async {
  final authService = ref.watch(authServiceProvider);
  return await authService.isAuthenticated();
});

/// Current user profile (requires authentication)
final currentUserProvider = FutureProvider<User?>((ref) async {
  final isAuth = await ref.watch(isAuthenticatedProvider.future);
  if (!isAuth) return null;

  final profileService = ref.watch(profileServiceProvider);
  final response = await profileService.getProfile();

  return response.when(
    success: (user) => user,
    failure: (_) => null,
  );
});

/// =============================================================================
/// PROPERTY PROVIDERS
/// =============================================================================

/// All properties
final allPropertiesProvider = FutureProvider<List<Property>>((ref) async {
  final propertyService = ref.watch(propertyServiceProvider);
  final response = await propertyService.getAllProperties();

  return response.when(
    success: (properties) => properties,
    failure: (_) => [],
  );
});

/// Homepage properties by type
final homepagePropertiesProvider = FutureProvider.family<List<Property>, String?>((ref, type) async {
  final propertyService = ref.watch(propertyServiceProvider);
  final response = await propertyService.getHomepageProperties(type: type);

  return response.when(
    success: (properties) => properties,
    failure: (_) => [],
  );
});

/// Property by ID
final propertyByIdProvider = FutureProvider.family<Property?, String>((ref, id) async {
  final propertyService = ref.watch(propertyServiceProvider);
  final response = await propertyService.getPropertyById(id);

  return response.when(
    success: (property) => property,
    failure: (_) => null,
  );
});

/// =============================================================================
/// SELL LISTING PROVIDERS
/// =============================================================================

/// All sell listings
final allSellsProvider = FutureProvider<List<Sell>>((ref) async {
  final sellService = ref.watch(sellServiceProvider);
  final response = await sellService.getAllSells();

  return response.when(
    success: (sells) => sells,
    failure: (_) => [],
  );
});

/// Sell listing by ID
final sellByIdProvider = FutureProvider.family<Sell?, String>((ref, id) async {
  final sellService = ref.watch(sellServiceProvider);
  final response = await sellService.getSellById(id);

  return response.when(
    success: (sell) => sell,
    failure: (_) => null,
  );
});

/// =============================================================================
/// EXCHANGE PROVIDERS
/// =============================================================================

/// All exchanges (requires authentication)
final allExchangesProvider = FutureProvider<List<Exchange>>((ref) async {
  final isAuth = await ref.watch(isAuthenticatedProvider.future);
  if (!isAuth) return [];

  final exchangeService = ref.watch(exchangeServiceProvider);
  final response = await exchangeService.getAllExchanges();

  return response.when(
    success: (exchanges) => exchanges,
    failure: (_) => [],
  );
});

/// =============================================================================
/// USER DATA PROVIDERS
/// =============================================================================

/// Saved properties (requires authentication)
final savedPropertiesProvider = FutureProvider<SavedProperty?>((ref) async {
  final isAuth = await ref.watch(isAuthenticatedProvider.future);
  if (!isAuth) return null;

  final savedPropertyService = ref.watch(savedPropertyServiceProvider);
  final response = await savedPropertyService.getSavedProperties();

  return response.when(
    success: (saved) => saved,
    failure: (_) => null,
  );
});

/// User history (requires authentication)
final userHistoryProvider = FutureProvider<History?>((ref) async {
  final isAuth = await ref.watch(isAuthenticatedProvider.future);
  if (!isAuth) return null;

  final historyService = ref.watch(historyServiceProvider);
  final response = await historyService.getHistory();

  return response.when(
    success: (history) => history,
    failure: (_) => null,
  );
});

/// User notifications (requires authentication)
final userNotificationsProvider = FutureProvider<List<AppNotification>>((ref) async {
  final isAuth = await ref.watch(isAuthenticatedProvider.future);
  if (!isAuth) return [];

  final notificationService = ref.watch(notificationServiceProvider);
  final response = await notificationService.getUserNotifications();

  return response.when(
    success: (notifications) => notifications,
    failure: (_) => [],
  );
});

/// Unread notifications count
final unreadNotificationsCountProvider = FutureProvider<int>((ref) async {
  final notifications = await ref.watch(userNotificationsProvider.future);
  return notifications.where((n) => !n.isRead).length;
});

/// =============================================================================
/// SEARCH PROVIDER
/// =============================================================================

/// Property search parameters
class PropertySearchParams {
  final String? city;
  final String? type;
  final String? locality;
  final double? minPrice;
  final double? maxPrice;
  final int? bedrooms;

  const PropertySearchParams({
    this.city,
    this.type,
    this.locality,
    this.minPrice,
    this.maxPrice,
    this.bedrooms,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PropertySearchParams &&
          runtimeType == other.runtimeType &&
          city == other.city &&
          type == other.type &&
          locality == other.locality &&
          minPrice == other.minPrice &&
          maxPrice == other.maxPrice &&
          bedrooms == other.bedrooms;

  @override
  int get hashCode =>
      city.hashCode ^
      type.hashCode ^
      locality.hashCode ^
      minPrice.hashCode ^
      maxPrice.hashCode ^
      bedrooms.hashCode;
}

/// Property search provider
final propertySearchProvider = FutureProvider.family<List<Property>, PropertySearchParams>(
  (ref, params) async {
    final propertyService = ref.watch(propertyServiceProvider);
    final response = await propertyService.searchProperties(
      city: params.city,
      type: params.type,
      locality: params.locality,
      minPrice: params.minPrice,
      maxPrice: params.maxPrice,
      bedrooms: params.bedrooms,
    );

    return response.when(
      success: (properties) => properties,
      failure: (_) => [],
    );
  },
);

