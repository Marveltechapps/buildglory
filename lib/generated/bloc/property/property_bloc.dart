import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/property_service.dart';
import '../../services/saved_property_service.dart';
import 'property_event.dart';
import 'property_state.dart';

/// Property BLoC
class PropertyBloc extends Bloc<PropertyEvent, PropertyState> {
  final PropertyService _propertyService;
  final SavedPropertyService _savedPropertyService;

  PropertyBloc({
    required PropertyService propertyService,
    required SavedPropertyService savedPropertyService,
  })  : _propertyService = propertyService,
        _savedPropertyService = savedPropertyService,
        super(const PropertyInitial()) {
    on<LoadPropertiesEvent>(_onLoadProperties);
    on<LoadHomepagePropertiesEvent>(_onLoadHomepageProperties);
    on<LoadPropertyDetailsEvent>(_onLoadPropertyDetails);
    on<SearchPropertiesEvent>(_onSearchProperties);
    on<SavePropertyEvent>(_onSaveProperty);
    on<RemovePropertyEvent>(_onRemoveProperty);
    on<ClearPropertySelectionEvent>(_onClearSelection);
    on<ClearPropertyErrorEvent>(_onClearError);
  }

  Future<void> _onLoadProperties(
    LoadPropertiesEvent event,
    Emitter<PropertyState> emit,
  ) async {
    emit(const PropertyLoading());

    final response = await _propertyService.getAllProperties(
      type: event.filterType,
      city: event.filterCity,
    );

    response.when(
      success: (properties) {
        if (properties.isEmpty) {
          emit(const PropertiesEmpty());
        } else {
          emit(PropertiesLoaded(
            properties: properties,
            filterType: event.filterType,
            filterCity: event.filterCity,
          ));
        }
      },
      failure: (error) {
        emit(PropertyError(message: error.message));
      },
    );
  }

  Future<void> _onLoadHomepageProperties(
    LoadHomepagePropertiesEvent event,
    Emitter<PropertyState> emit,
  ) async {
    emit(const PropertyLoading());

    final response = await _propertyService.getHomepageProperties(
      type: event.type,
    );

    response.when(
      success: (properties) {
        if (properties.isEmpty) {
          emit(const PropertiesEmpty());
        } else {
          emit(PropertiesLoaded(
            properties: properties,
            filterType: event.type,
          ));
        }
      },
      failure: (error) {
        emit(PropertyError(message: error.message));
      },
    );
  }

  Future<void> _onLoadPropertyDetails(
    LoadPropertyDetailsEvent event,
    Emitter<PropertyState> emit,
  ) async {
    emit(const PropertyLoading());

    final response = await _propertyService.getPropertyById(event.propertyId);

    response.when(
      success: (property) {
        emit(PropertyDetailsLoaded(property));
      },
      failure: (error) {
        emit(PropertyError(message: error.message));
      },
    );
  }

  Future<void> _onSearchProperties(
    SearchPropertiesEvent event,
    Emitter<PropertyState> emit,
  ) async {
    emit(const PropertyLoading());

    final response = await _propertyService.searchProperties(
      city: event.city,
      type: event.type,
      locality: event.locality,
      minPrice: event.minPrice,
      maxPrice: event.maxPrice,
      bedrooms: event.bedrooms,
    );

    response.when(
      success: (properties) {
        if (properties.isEmpty) {
          emit(const PropertiesEmpty());
        } else {
          emit(PropertiesLoaded(
            properties: properties,
            filterType: event.type,
            filterCity: event.city,
          ));
        }
      },
      failure: (error) {
        emit(PropertyError(message: error.message));
      },
    );
  }

  Future<void> _onSaveProperty(
    SavePropertyEvent event,
    Emitter<PropertyState> emit,
  ) async {
    final response = await _savedPropertyService.saveProperty(event.propertyId);

    response.when(
      success: (_) {
        emit(PropertySaved(event.propertyId));
      },
      failure: (error) {
        emit(PropertyError(message: error.message));
      },
    );
  }

  Future<void> _onRemoveProperty(
    RemovePropertyEvent event,
    Emitter<PropertyState> emit,
  ) async {
    final response = await _savedPropertyService.removeSavedProperty(event.propertyId);

    response.when(
      success: (_) {
        emit(PropertyRemoved(event.propertyId));
      },
      failure: (error) {
        emit(PropertyError(message: error.message));
      },
    );
  }

  void _onClearSelection(
    ClearPropertySelectionEvent event,
    Emitter<PropertyState> emit,
  ) {
    emit(const PropertyInitial());
  }

  void _onClearError(
    ClearPropertyErrorEvent event,
    Emitter<PropertyState> emit,
  ) {
    emit(const PropertyInitial());
  }
}

