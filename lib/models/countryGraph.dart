import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:neighboring_countries/neighboring_countries.dart' as nc;
import 'package:country_picker/country_picker.dart'
    as cp; //unfortunately alias wont work with freezed: https://github.com/rrousselGit/freezed/issues/519

part 'countryGraph.g.dart';
part 'countryGraph.freezed.dart';

@riverpod
class SelectedCountriesModel extends _$SelectedCountriesModel {
  final graph = nc.countryGraph;

  @override
  SelectedCountriesModelState build() {
    final possibleCountries = _asCountries(graph.nodes);
    graph.neighbors.listen(_graphListener);
    return SelectedCountriesModelState(possible: possibleCountries);
  }

  void _graphListener(countries) {
    debugPrint('got new neighbors');
    state = state.copyWith(suggestions: _asCountries(countries));
  }

  Iterable<Country> _asCountries(Iterable<nc.Country> countries) =>
      countries.map((c) => c.toCountry()).whereType<Country>();

  void select(Country country) {
    state = state.copyWith(selection: [...state.selection, country]);
    graph.selectNode(country._node);
  }

  void deselect(Country country) {
    state =
        state.copyWith(selection: state.selection.where((c) => c != country));
    graph.unselectNode(country._node);
  }

  void toggle(Country country) {
    if (state.selection.contains(country)) {
      deselect(country);
    } else {
      select(country);
    }
  }

  void search(String query) {
    if (query.isEmpty) {
      clearSearch();
      return;
    }
    final suggestions = state.possible
        .where((c) => c.name.toLowerCase().contains(query.toLowerCase()));
    state = state.copyWith(suggestions: suggestions);
  }

  void clearSearch() {
    // mocks a new selection as this overrides the suggestions
    _graphListener(graph.currentNeighbors);
  }

  void clearSelection() {
    state = state.copyWith(selection: []);
    graph.clearSelection();
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

//circumvent freezed alias problems
class Country extends cp.Country {
  Country.fromJson(this._node, {required super.json}) : super.from();
  final nc.Country _node;
}

extension ToCountry on nc.Country {
  // unfortunately (as upposed to e.g. js prototype based approach) we cannot cast to a subclass
  // that is why we take the umweg via json (i hate it but it works)
  Country? toCountry() => ((Map<String, dynamic>? json) =>
          json == null ? null : Country.fromJson(this, json: json))(
      cp.CountryParser.tryParse(name)?.toJson());
}

// misc utils for other parts of the app

extension FlagIconWidget on Country {
  Widget get icon => Text(flagEmoji);
}

extension CountryGetters on Iterable<Country> {
  Iterable<String> get codes => map((c) => c.countryCode);
}
