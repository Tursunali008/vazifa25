import 'package:bloc/bloc.dart';
import 'package:vazifa25/logic/repostories/currency_repostory.dart';
import 'currency_event.dart';
import 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  final CurrencyRepository repository;

  CurrencyBloc(this.repository) : super(CurrencyInitial()) {
    on<FetchCurrencies>((event, emit) async {
      emit(CurrencyLoading());
      try {
        final currencies = await repository.fetchCurrencies();
        emit(CurrencyLoaded(currencies));
      } catch (e) {
        emit(CurrencyError(e.toString()));
      }
    });
  }
}