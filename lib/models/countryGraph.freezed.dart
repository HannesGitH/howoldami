// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'countryGraph.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SelectedCountriesModelState {
  Iterable<Country> get selection => throw _privateConstructorUsedError;
  Iterable<Country> get suggestions => throw _privateConstructorUsedError;
  Iterable<Country> get possible => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectedCountriesModelStateCopyWith<SelectedCountriesModelState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedCountriesModelStateCopyWith<$Res> {
  factory $SelectedCountriesModelStateCopyWith(
          SelectedCountriesModelState value,
          $Res Function(SelectedCountriesModelState) then) =
      _$SelectedCountriesModelStateCopyWithImpl<$Res,
          SelectedCountriesModelState>;
  @useResult
  $Res call(
      {Iterable<Country> selection,
      Iterable<Country> suggestions,
      Iterable<Country> possible});
}

/// @nodoc
class _$SelectedCountriesModelStateCopyWithImpl<$Res,
        $Val extends SelectedCountriesModelState>
    implements $SelectedCountriesModelStateCopyWith<$Res> {
  _$SelectedCountriesModelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selection = null,
    Object? suggestions = null,
    Object? possible = null,
  }) {
    return _then(_value.copyWith(
      selection: null == selection
          ? _value.selection
          : selection // ignore: cast_nullable_to_non_nullable
              as Iterable<Country>,
      suggestions: null == suggestions
          ? _value.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as Iterable<Country>,
      possible: null == possible
          ? _value.possible
          : possible // ignore: cast_nullable_to_non_nullable
              as Iterable<Country>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectedCountriesModelStateImplCopyWith<$Res>
    implements $SelectedCountriesModelStateCopyWith<$Res> {
  factory _$$SelectedCountriesModelStateImplCopyWith(
          _$SelectedCountriesModelStateImpl value,
          $Res Function(_$SelectedCountriesModelStateImpl) then) =
      __$$SelectedCountriesModelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Iterable<Country> selection,
      Iterable<Country> suggestions,
      Iterable<Country> possible});
}

/// @nodoc
class __$$SelectedCountriesModelStateImplCopyWithImpl<$Res>
    extends _$SelectedCountriesModelStateCopyWithImpl<$Res,
        _$SelectedCountriesModelStateImpl>
    implements _$$SelectedCountriesModelStateImplCopyWith<$Res> {
  __$$SelectedCountriesModelStateImplCopyWithImpl(
      _$SelectedCountriesModelStateImpl _value,
      $Res Function(_$SelectedCountriesModelStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selection = null,
    Object? suggestions = null,
    Object? possible = null,
  }) {
    return _then(_$SelectedCountriesModelStateImpl(
      selection: null == selection
          ? _value.selection
          : selection // ignore: cast_nullable_to_non_nullable
              as Iterable<Country>,
      suggestions: null == suggestions
          ? _value.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as Iterable<Country>,
      possible: null == possible
          ? _value.possible
          : possible // ignore: cast_nullable_to_non_nullable
              as Iterable<Country>,
    ));
  }
}

/// @nodoc

class _$SelectedCountriesModelStateImpl
    implements _SelectedCountriesModelState {
  const _$SelectedCountriesModelStateImpl(
      {this.selection = const [],
      this.suggestions = const [],
      required this.possible});

  @override
  @JsonKey()
  final Iterable<Country> selection;
  @override
  @JsonKey()
  final Iterable<Country> suggestions;
  @override
  final Iterable<Country> possible;

  @override
  String toString() {
    return 'SelectedCountriesModelState(selection: $selection, suggestions: $suggestions, possible: $possible)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedCountriesModelStateImpl &&
            const DeepCollectionEquality().equals(other.selection, selection) &&
            const DeepCollectionEquality()
                .equals(other.suggestions, suggestions) &&
            const DeepCollectionEquality().equals(other.possible, possible));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(selection),
      const DeepCollectionEquality().hash(suggestions),
      const DeepCollectionEquality().hash(possible));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedCountriesModelStateImplCopyWith<_$SelectedCountriesModelStateImpl>
      get copyWith => __$$SelectedCountriesModelStateImplCopyWithImpl<
          _$SelectedCountriesModelStateImpl>(this, _$identity);
}

abstract class _SelectedCountriesModelState
    implements SelectedCountriesModelState {
  const factory _SelectedCountriesModelState(
          {final Iterable<Country> selection,
          final Iterable<Country> suggestions,
          required final Iterable<Country> possible}) =
      _$SelectedCountriesModelStateImpl;

  @override
  Iterable<Country> get selection;
  @override
  Iterable<Country> get suggestions;
  @override
  Iterable<Country> get possible;
  @override
  @JsonKey(ignore: true)
  _$$SelectedCountriesModelStateImplCopyWith<_$SelectedCountriesModelStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
