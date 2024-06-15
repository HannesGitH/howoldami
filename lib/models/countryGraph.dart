import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:neighboring_countries/neighboring_countries.dart' as nc;
import 'package:country_picker/country_picker.dart'; // as cp; //unfortunately alias wont work: https://github.com/rrousselGit/freezed/issues/519

part 'countryGraph.g.dart';
part 'countryGraph.freezed.dart';

@riverpod
class SelectedCountriesModel extends _$SelectedCountriesModel {
  final graph = nc.countryGraph;

  @override
  SelectedCountriesModelState build() {
    final possibleCountries =
        graph.nodes.map((c) => c.toPickerCountry()).whereType<Country>();
    return SelectedCountriesModelState(possible: possibleCountries);
  }

  void select(Country country) {
    state = state.copyWith(selection: [...state.selection, country]);
  }

  void deselect(Country country) {
    state =
        state.copyWith(selection: state.selection.where((c) => c != country));
  }

  void toggle(Country country) {
    if (state.selection.contains(country)) {
      deselect(country);
    } else {
      select(country);
    }
  }

  void search(String query) {
    final suggestions = state.possible
        .where((c) => c.name.toLowerCase().contains(query.toLowerCase()));
    state = state.copyWith(suggestions: suggestions);
  }

  void clearSearch() {
    state = state.copyWith(suggestions: []);
  }

  void clearSelection() {
    state = state.copyWith(selection: []);
  }
}

@freezed
class SelectedCountriesModelState with _$SelectedCountriesModelState {
  const factory SelectedCountriesModelState({
    @Default([]) Iterable<Country> selection,
    @Default([]) Iterable<Country> suggestions,
    required Iterable<Country> possible,
  }) = _SelectedCountriesModelState;
}

extension ToPickerCountry on nc.Country {
  Country? toPickerCountry() => CountryParser.tryParse(name);
}

extension FlagIconWidget on Country {
  Widget get icon => Text(flagEmoji);
}
