import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/sell_service.dart';
import 'sell_event.dart';
import 'sell_state.dart';

/// Sell BLoC
class SellBloc extends Bloc<SellEvent, SellState> {
  final SellService _sellService;

  SellBloc({required SellService sellService})
      : _sellService = sellService,
        super(const SellInitial()) {
    on<LoadSellsEvent>(_onLoadSells);
    on<LoadSellDetailsEvent>(_onLoadSellDetails);
    on<CreateSellEvent>(_onCreateSell);
    on<UpdateSellEvent>(_onUpdateSell);
    on<DeleteSellEvent>(_onDeleteSell);
    on<ClearSellErrorEvent>(_onClearError);
  }

  Future<void> _onLoadSells(
    LoadSellsEvent event,
    Emitter<SellState> emit,
  ) async {
    emit(const SellLoading());

    final response = await _sellService.getAllSells();

    response.when(
      success: (sells) {
        if (sells.isEmpty) {
          emit(const SellsEmpty());
        } else {
          emit(SellsLoaded(sells));
        }
      },
      failure: (error) {
        emit(SellError(error.message));
      },
    );
  }

  Future<void> _onLoadSellDetails(
    LoadSellDetailsEvent event,
    Emitter<SellState> emit,
  ) async {
    emit(const SellLoading());

    final response = await _sellService.getSellById(event.sellId);

    response.when(
      success: (sell) {
        emit(SellDetailsLoaded(sell));
      },
      failure: (error) {
        emit(SellError(error.message));
      },
    );
  }

  Future<void> _onCreateSell(
    CreateSellEvent event,
    Emitter<SellState> emit,
  ) async {
    emit(const SellLoading());

    final response = await _sellService.createSell(event.sell);

    response.when(
      success: (sell) {
        emit(SellCreated(sell));
      },
      failure: (error) {
        emit(SellError(error.message));
      },
    );
  }

  Future<void> _onUpdateSell(
    UpdateSellEvent event,
    Emitter<SellState> emit,
  ) async {
    emit(const SellLoading());

    final response = await _sellService.updateSell(event.sellId, event.sell);

    response.when(
      success: (sell) {
        emit(SellUpdated(sell));
      },
      failure: (error) {
        emit(SellError(error.message));
      },
    );
  }

  Future<void> _onDeleteSell(
    DeleteSellEvent event,
    Emitter<SellState> emit,
  ) async {
    emit(const SellLoading());

    final response = await _sellService.deleteSell(event.sellId);

    response.when(
      success: (_) {
        emit(SellDeleted(event.sellId));
      },
      failure: (error) {
        emit(SellError(error.message));
      },
    );
  }

  void _onClearError(
    ClearSellErrorEvent event,
    Emitter<SellState> emit,
  ) {
    emit(const SellInitial());
  }
}

