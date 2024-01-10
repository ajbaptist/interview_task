import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_bloc_event.dart';
part 'search_bloc_state.dart';

class SearchBlocBloc extends Bloc<SearchBlocEvent, SearchBlocState> {
  int currentPage = 1;
  int totalPages = 1;

  SearchBlocBloc() : super(SearchBlocInitial()) {
    on<SearchBlocEvent>((event, emit) {});
  }
}
