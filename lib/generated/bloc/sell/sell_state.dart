import 'package:equatable/equatable.dart';
import '../../models/sell.dart';

/// Sell State
abstract class SellState extends Equatable {
  const SellState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class SellInitial extends SellState {
  const SellInitial();
}

/// Loading state
class SellLoading extends SellState {
  const SellLoading();
}

/// Sells loaded successfully
class SellsLoaded extends SellState {
  final List<Sell> sells;

  const SellsLoaded(this.sells);

  @override
  List<Object?> get props => [sells];
}

/// Sell details loaded
class SellDetailsLoaded extends SellState {
  final Sell sell;

  const SellDetailsLoaded(this.sell);

  @override
  List<Object?> get props => [sell];
}

/// Sell created successfully
class SellCreated extends SellState {
  final Sell sell;

  const SellCreated(this.sell);

  @override
  List<Object?> get props => [sell];
}

/// Sell updated successfully
class SellUpdated extends SellState {
  final Sell sell;

  const SellUpdated(this.sell);

  @override
  List<Object?> get props => [sell];
}

/// Sell deleted successfully
class SellDeleted extends SellState {
  final String sellId;

  const SellDeleted(this.sellId);

  @override
  List<Object?> get props => [sellId];
}

/// Sell error state
class SellError extends SellState {
  final String message;

  const SellError(this.message);

  @override
  List<Object?> get props => [message];
}

/// Empty state
class SellsEmpty extends SellState {
  const SellsEmpty();
}

