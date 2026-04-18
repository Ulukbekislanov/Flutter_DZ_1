class AddState {
  final bool isInitial;
  final bool isSucceed;

  const AddState({required this.isInitial, required this.isSucceed});

  factory AddState.initial() => const AddState(isInitial: true, isSucceed: false);

  AddState copyWith({bool? isInitial, bool? isSucceed}) {
    return AddState(
      isInitial: isInitial ?? this.isInitial,
      isSucceed: isSucceed ?? this.isSucceed,
    );
  }
}