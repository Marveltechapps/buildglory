import 'package:equatable/equatable.dart';
import '../../models/exchange.dart';

/// Exchange State
abstract class ExchangeState extends Equatable {
  const ExchangeState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class ExchangeInitial extends ExchangeState {
  const ExchangeInitial();
}

/// Loading state
class ExchangeLoading extends ExchangeState {
  const ExchangeLoading();
}

/// Exchanges loaded successfully
class ExchangesLoaded extends ExchangeState {
  final List<Exchange> exchanges;

  const ExchangesLoaded(this.exchanges);

  @override
  List<Object?> get props => [exchanges];
}

/// Exchange details loaded
class ExchangeDetailsLoaded extends ExchangeState {
  final Exchange exchange;

  const ExchangeDetailsLoaded(this.exchange);

  @override
  List<Object?> get props => [exchange];
}

/// Exchange created successfully
class ExchangeCreated extends ExchangeState {
  final Exchange exchange;

  const ExchangeCreated(this.exchange);

  @override
  List<Object?> get props => [exchange];
}

/// Exchange updated successfully
class ExchangeUpdated extends ExchangeState {
  final Exchange exchange;

  const ExchangeUpdated(this.exchange);

  @override
  List<Object?> get props => [exchange];
}

/// Exchange deleted successfully
class ExchangeDeleted extends ExchangeState {
  final String exchangeId;

  const ExchangeDeleted(this.exchangeId);

  @override
  List<Object?> get props => [exchangeId];
}

/// Exchange error state
class ExchangeError extends ExchangeState {
  final String message;

  const ExchangeError(this.message);

  @override
  List<Object?> get props => [message];
}

/// Empty state
class ExchangesEmpty extends ExchangeState {
  const ExchangesEmpty();
}

