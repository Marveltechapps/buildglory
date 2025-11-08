import 'package:equatable/equatable.dart';
import '../../models/property.dart';

/// Property State
abstract class PropertyState extends Equatable {
  const PropertyState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class PropertyInitial extends PropertyState {
  const PropertyInitial();
}

/// Loading state
class PropertyLoading extends PropertyState {
  const PropertyLoading();
}

/// Properties loaded successfully
class PropertiesLoaded extends PropertyState {
  final List<Property> properties;
  final String? filterType;
  final String? filterCity;

  const PropertiesLoaded({
    required this.properties,
    this.filterType,
    this.filterCity,
  });

  @override
  List<Object?> get props => [properties, filterType, filterCity];
}

/// Property details loaded
class PropertyDetailsLoaded extends PropertyState {
  final Property property;

  const PropertyDetailsLoaded(this.property);

  @override
  List<Object?> get props => [property];
}

/// Property saved successfully
class PropertySaved extends PropertyState {
  final String propertyId;

  const PropertySaved(this.propertyId);

  @override
  List<Object?> get props => [propertyId];
}

/// Property removed successfully
class PropertyRemoved extends PropertyState {
  final String propertyId;

  const PropertyRemoved(this.propertyId);

  @override
  List<Object?> get props => [propertyId];
}

/// Property error state
class PropertyError extends PropertyState {
  final String message;
  final bool canRetry;

  const PropertyError({
    required this.message,
    this.canRetry = true,
  });

  @override
  List<Object?> get props => [message, canRetry];
}

/// Empty state (no properties found)
class PropertiesEmpty extends PropertyState {
  const PropertiesEmpty();
}

