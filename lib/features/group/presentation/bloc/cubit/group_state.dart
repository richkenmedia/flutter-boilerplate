part of 'group_cubit.dart';

abstract class GroupState extends Equatable {
  const GroupState();

  @override
  List<Object> get props => [];
}

class GroupInitial extends GroupState {
  const GroupInitial();
}

class GroupLoading extends GroupState {
  const GroupLoading();
}

class GroupLoaded extends GroupState {
  final Group group;
  const GroupLoaded(this.group);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GroupLoaded && other.group == group;
  }

  @override
  int get hashCode => group.hashCode;
}

class GroupError extends GroupState {
  final String message;
  const GroupError(this.message);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GroupError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
