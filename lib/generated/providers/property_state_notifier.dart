import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../api_exports.dart';
import 'api_providers.dart';

/// =============================================================================
/// PROPERTY STATE
/// =============================================================================

class PropertyState {
  final List<Property> properties;
  final Property? selectedProperty;
  final bool isLoading;
  final String? error;
  final String? filterType;
  final String? filterCity;

  const PropertyState({
    this.properties = const [],
    this.selectedProperty,
    this.isLoading = false,
    this.error,
    this.filterType,
    this.filterCity,
  });

  PropertyState copyWith({
    List<Property>? properties,
    Property? selectedProperty,
    bool? isLoading,
    String? error,
    String? filterType,
    String? filterCity,
  }) {
    return PropertyState(
      properties: properties ?? this.properties,
      selectedProperty: selectedProperty ?? this.selectedProperty,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      filterType: filterType ?? this.filterType,
      filterCity: filterCity ?? this.filterCity,
    );
  }
}

/// =============================================================================
/// PROPERTY STATE NOTIFIER
/// =============================================================================

class PropertyStateNotifier extends StateNotifier<PropertyState> {
  final PropertyService _propertyService;
  final SavedPropertyService _savedPropertyService;

  PropertyStateNotifier(this._propertyService, this._savedPropertyService)
      : super(const PropertyState()) {
    loadProperties();
  }

  /// Load all properties
  Future<void> loadProperties() async {
    state = state.copyWith(isLoading: true, error: null);

    final response = await _propertyService.getAllProperties(
      type: state.filterType,
      city: state.filterCity,
    );

    response.when(
      success: (properties) {
        state = state.copyWith(
          properties: properties,
          isLoading: false,
          error: null,
        );
      },
      failure: (error) {
        state = state.copyWith(
          isLoading: false,
          error: error.message,
        );
      },
    );
  }

  /// Load homepage properties by type
  Future<void> loadHomepageProperties(String? type) async {
    state = state.copyWith(isLoading: true, error: null, filterType: type);

    final response = await _propertyService.getHomepageProperties(type: type);

    response.when(
      success: (properties) {
        state = state.copyWith(
          properties: properties,
          isLoading: false,
          error: null,
        );
      },
      failure: (error) {
        state = state.copyWith(
          isLoading: false,
          error: error.message,
        );
      },
    );
  }

  /// Search properties
  Future<void> searchProperties({
    String? city,
    String? type,
    String? locality,
    double? minPrice,
    double? maxPrice,
    int? bedrooms,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    final response = await _propertyService.searchProperties(
      city: city,
      type: type,
      locality: locality,
      minPrice: minPrice,
      maxPrice: maxPrice,
      bedrooms: bedrooms,
    );

    response.when(
      success: (properties) {
        state = state.copyWith(
          properties: properties,
          isLoading: false,
          error: null,
          filterType: type,
          filterCity: city,
        );
      },
      failure: (error) {
        state = state.copyWith(
          isLoading: false,
          error: error.message,
        );
      },
    );
  }

  /// Load property details
  Future<void> loadPropertyDetails(String id) async {
    state = state.copyWith(isLoading: true, error: null);

    final response = await _propertyService.getPropertyById(id);

    response.when(
      success: (property) {
        state = state.copyWith(
          selectedProperty: property,
          isLoading: false,
          error: null,
        );
      },
      failure: (error) {
        state = state.copyWith(
          isLoading: false,
          error: error.message,
        );
      },
    );
  }

  /// Save property to wishlist
  Future<bool> saveProperty(String propertyId) async {
    final response = await _savedPropertyService.saveProperty(propertyId);
    return response.isSuccess;
  }

  /// Remove property from wishlist
  Future<bool> removeSavedProperty(String propertyId) async {
    final response = await _savedPropertyService.removeSavedProperty(propertyId);
    return response.isSuccess;
  }

  /// Set filter type
  void setFilterType(String? type) {
    state = state.copyWith(filterType: type);
    loadProperties();
  }

  /// Set filter city
  void setFilterCity(String? city) {
    state = state.copyWith(filterCity: city);
    loadProperties();
  }

  /// Clear filters
  void clearFilters() {
    state = state.copyWith(filterType: null, filterCity: null);
    loadProperties();
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(error: null);
  }
}

/// =============================================================================
/// PROPERTY STATE PROVIDER
/// =============================================================================

final propertyStateProvider = StateNotifierProvider<PropertyStateNotifier, PropertyState>((ref) {
  final propertyService = ref.watch(propertyServiceProvider);
  final savedPropertyService = ref.watch(savedPropertyServiceProvider);
  return PropertyStateNotifier(propertyService, savedPropertyService);
});

