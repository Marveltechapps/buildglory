import 'package:equatable/equatable.dart';

/// Exchange Events
abstract class ExchangeEvent extends Equatable {
  const ExchangeEvent();

  @override
  List<Object?> get props => [];
}

/// Load all exchanges
class LoadExchangesEvent extends ExchangeEvent {
  const LoadExchangesEvent();
}

/// Load exchange by ID
class LoadExchangeDetailsEvent extends ExchangeEvent {
  final String exchangeId;

  const LoadExchangeDetailsEvent(this.exchangeId);

  @override
  List<Object?> get props => [exchangeId];
}

/// Create new exchange
class CreateExchangeEvent extends ExchangeEvent {
  final String sellerProperty;
  final List<String>? matchedProperties;
  final bool? fallbackToBuy;

  const CreateExchangeEvent({
    required this.sellerProperty,
    this.matchedProperties,
    this.fallbackToBuy,
  });

  @override
  List<Object?> get props => [sellerProperty, matchedProperties, fallbackToBuy];
}

/// Update exchange
class UpdateExchangeEvent extends ExchangeEvent {
  final String exchangeId;
  final List<String> matchedProperties;

  const UpdateExchangeEvent({
    required this.exchangeId,
    required this.matchedProperties,
  });

  @override
  List<Object?> get props => [exchangeId, matchedProperties];
}

/// Delete exchange
class DeleteExchangeEvent extends ExchangeEvent {
  final String exchangeId;

  const DeleteExchangeEvent(this.exchangeId);

  @override
  List<Object?> get props => [exchangeId];
}

/// Clear error
class ClearExchangeErrorEvent extends ExchangeEvent {
  const ClearExchangeErrorEvent();
}

