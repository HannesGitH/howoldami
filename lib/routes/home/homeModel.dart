import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:howoldami/common/enums.dart';
import 'package:howoldami/data/age/ageData.dart';
import 'package:howoldami/data/age/ageRepository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'homeModel.freezed.dart';
part 'homeModel.g.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    AgeData? age,
    @Default(Progress.initial) Progress progress,
  }) = _HomeState;
}

@riverpod
class HomeModel extends _$HomeModel {
  final _ageRepository = AgeRepository();
  String? name;
  @override
  HomeState build() {
    return const HomeState();
  }

  void setName(String name) async {
    this.name = name;
    calculateAge();
  }

  void calculateAge() async {
    if (name == null) return;
    state = state.copyWith(progress: Progress.loading);
    try {
      final ageData =
          await _ageRepository.getAgeInCountries(name: name!, countries: []);
      state = state.copyWith(age: ageData, progress: Progress.success);
    } catch (e) {
      state = state.copyWith(progress: Progress.error);
    }
  }
}
