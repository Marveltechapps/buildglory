import 'package:equatable/equatable.dart';
import '../../models/sell.dart';

/// Sell Events
abstract class SellEvent extends Equatable {
  const SellEvent();

  @override
  List<Object?> get props => [];
}

/// Load all sell listings
class LoadSellsEvent extends SellEvent {
  const LoadSellsEvent();
}

/// Load sell listing by ID
class LoadSellDetailsEvent extends SellEvent {
  final String sellId;

  const LoadSellDetailsEvent(this.sellId);

  @override
  List<Object?> get props => [sellId];
}

/// Create new sell listing
class CreateSellEvent extends SellEvent {
  final Sell sell;
  final List<String>? imagePaths;

  const CreateSellEvent({
    required this.sell,
    this.imagePaths,
  });

  @override
  List<Object?> get props => [sell, imagePaths];
}

/// Update sell listing
class UpdateSellEvent extends SellEvent {
  final String sellId;
  final Sell sell;

  const UpdateSellEvent({
    required this.sellId,
    required this.sell,
  });

  @override
  List<Object?> get props => [sellId, sell];
}

/// Delete sell listing
class DeleteSellEvent extends SellEvent {
  final String sellId;

  const DeleteSellEvent(this.sellId);

  @override
  List<Object?> get props => [sellId];
}

/// Clear sell error
class ClearSellErrorEvent extends SellEvent {
  const ClearSellErrorEvent();
}

