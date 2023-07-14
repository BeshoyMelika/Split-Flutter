import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'groups_search_event.dart';
part 'groups_search_state.dart';

class GroupsSearchBloc extends Bloc<GroupsSearchEvent, GroupsSearchState> {
  GroupsSearchBloc() : super(GroupsSearchInitial()) {
    on<GroupsSearchEvent>((event, emit) {});
  }
}
