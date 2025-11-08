import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/exchange_service.dart';
import 'exchange_event.dart';
import 'exchange_state.dart';

/// Exchange BLoC
class ExchangeBloc extends Bloc<ExchangeEvent, ExchangeState> {
  final ExchangeService _exchangeService;

  ExchangeBloc({required ExchangeService exchangeService})
      : _exchangeService = exchangeService,
        super(const ExchangeInitial()) {
    on<LoadExchangesEvent>(_onLoadExchanges);
    on<LoadExchangeDetailsEvent>(_onLoadExchangeDetails);
    on<CreateExchangeEvent>(_onCreateExchange);
    on<UpdateExchangeEvent>(_onUpdateExchange);
    on<DeleteExchangeEvent>(_onDeleteExchange);
    on<ClearExchangeErrorEvent>(_onClearError);
  }

  Future<void> _onLoadExchanges(
    LoadExchangesEvent event,
    Emitter<ExchangeState> emit,
  ) async {
    emit(const ExchangeLoading());

    final response = await _exchangeService.getAllExchanges();

    response.when(
      success: (exchanges) {
        if (exchanges.isEmpty) {
          emit(const ExchangesEmpty());
        } else {
          emit(ExchangesLoaded(exchanges));
        }
      },
      failure: (error) {
        emit(ExchangeError(error.message));
      },
    );
  }

  Future<void> _onLoadExchangeDetails(
    LoadExchangeDetailsEvent event,
    Emitter<ExchangeState> emit,
  ) async {
    emit(const ExchangeLoading());

    final response = await _exchangeService.getExchangeById(event.exchangeId);

    response.when(
      success: (exchange) {
        emit(ExchangeDetailsLoaded(exchange));
      },
      failure: (error) {
        emit(ExchangeError(error.message));
      },
    );
  }

  Future<void> _onCreateExchange(
    CreateExchangeEvent event,
    Emitter<ExchangeState> emit,
  ) async {
    emit(const ExchangeLoading());

    final response = await _exchangeService.createExchange(
      sellerProperty: event.sellerProperty,
      matchedProperties: event.matchedProperties,
      fallbackToBuy: event.fallbackToBuy,
    );

    response.when(
      success: (exchange) {
        emit(ExchangeCreated(exchange));
      },
      failure: (error) {
        emit(ExchangeError(error.message));
      },
    );
  }

  Future<void> _onUpdateExchange(
    UpdateExchangeEvent event,
    Emitter<ExchangeState> emit,
  ) async {
    emit(const ExchangeLoading());

    // Create exchange object for update
    final exchange = Exchange(
      userId: '', // Will be filled by backend
      sellerProperty: '',
      matchedProperties: event.matchedProperties,
    );

    final response = await _exchangeService.updateExchange(
      event.exchangeId,
      exchange,
    );

    response.when(
      success: (exchange) {
        emit(ExchangeUpdated(exchange));
      },
      failure: (error) {
        emit(ExchangeError(error.message));
      },
    );
  }

  Future<void> _onDeleteExchange(
    DeleteExchangeEvent event,
    Emitter<ExchangeState> emit,
  ) async {
    emit(const ExchangeLoading());

    final response = await _exchangeService.deleteExchange(event.exchangeId);

    response.when(
      success: (_) {
        emit(ExchangeDeleted(event.exchangeId));
      },
      failure: (error) {
        emit(ExchangeError(error.message));
      },
    );
  }

  void _onClearError(
    ClearExchangeErrorEvent event,
    Emitter<ExchangeState> emit,
  ) {
    emit(const ExchangeInitial());
  }
}

