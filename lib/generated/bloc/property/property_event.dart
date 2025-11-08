import 'package:equatable/equatable.dart';

/// Property Events
abstract class PropertyEvent extends Equatable {
  const PropertyEvent();

  @override
  List<Object?> get props => [];
}

/// Load all properties
class LoadPropertiesEvent extends PropertyEvent {
  final String? filterType;
  final String? filterCity;

  const LoadPropertiesEvent({
    this.filterType,
    this.filterCity,
  });

  @override
  List<Object?> get props => [filterType, filterCity];
}

/// Load homepage properties
class LoadHomepagePropertiesEvent extends PropertyEvent {
  final String? type;

  const LoadHomepagePropertiesEvent({this.type});

  @override
  List<Object?> get props => [type];
}

/// Load property details
class LoadPropertyDetailsEvent extends PropertyEvent {
  final String propertyId;

  const LoadPropertyDetailsEvent(this.propertyId);

  @override
  List<Object?> get props => [propertyId];
}

/// Search properties
class SearchPropertiesEvent extends PropertyEvent {
  final String? city;
  final String? type;
  final String? locality;
  final double? minPrice;
  final double? maxPrice;
  final int? bedrooms;

  const SearchPropertiesEvent({
    this.city,
    this.type,
    this.locality,
    this.minPrice,
    this.maxPrice,
    this.bedrooms,
  });

  @override
  List<Object?> get props => [
        city,
        type,
        locality,
        minPrice,
        maxPrice,
        bedrooms,
      ];
}

/// Save property to wishlist
class SavePropertyEvent extends PropertyEvent {
  final String propertyId;

  const SavePropertyEvent(this.propertyId);

  @override
  List<Object?> get props => [propertyId];
}

/// Remove property from wishlist
class RemovePropertyEvent extends PropertyEvent {
  final String propertyId;

  const RemovePropertyEvent(this.propertyId);

  @override
  List<Object?> get props => [propertyId];
}

/// Clear property selection
class ClearPropertySelectionEvent extends PropertyEvent {
  const ClearPropertySelectionEvent();
}

/// Clear error
class ClearPropertyErrorEvent extends PropertyEvent {
  const ClearPropertyErrorEvent();
}

