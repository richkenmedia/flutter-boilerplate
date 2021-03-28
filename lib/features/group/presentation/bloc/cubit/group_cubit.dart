import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:boilerplate/features/group/data/repositories/group.dart';
import 'package:boilerplate/features/group/data/models/group.dart';

part 'group_state.dart';

class GroupCubit extends Cubit<GroupState> {
  final GroupRepository _groupRepository;
  GroupCubit(this._groupRepository) : super(GroupInitial());

  Future<void> getGroup(String groupName) async {
    try {
      emit(const GroupLoading());
      final group = await _groupRepository.fetchGroup(groupName);
      emit(GroupLoaded(group));
    } on Exception {
      emit(GroupError("Something went wrong"));
    }
  }
}
