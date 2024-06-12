import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'homeModel.freezed.dart';
part 'homeModel.g.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String name,
    int? age,
  }) = _HomeState;
}

@riverpod
class HomeModel extends _$HomeModel {
  @override
  HomeState build() {
    return const HomeState(name: 'Michael');
  }

  void setName(String name) {
    state = state.copyWith(name: name);
  }

  void calculateAge() async {
    //TODO: demock
    state = state.copyWith(age: 42);
  }
}
