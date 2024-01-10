part of 'search_bloc_bloc.dart';

@immutable
sealed class SearchBlocEvent {}

// Events
abstract class ItemEvent {}

class FetchItems extends ItemEvent {}

class LoadMore extends ItemEvent {}
