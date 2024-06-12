// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ageData.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AgeData _$AgeDataFromJson(Map<String, dynamic> json) {
  return _AgeData.fromJson(json);
}

/// @nodoc
mixin _$AgeData {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: countryKey)
  String get country => throw _privateConstructorUsedError;
  num get age => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AgeDataCopyWith<AgeData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgeDataCopyWith<$Res> {
  factory $AgeDataCopyWith(AgeData value, $Res Function(AgeData) then) =
      _$AgeDataCopyWithImpl<$Res, AgeData>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: countryKey) String country,
      num age,
      int count});
}

/// @nodoc
class _$AgeDataCopyWithImpl<$Res, $Val extends AgeData>
    implements $AgeDataCopyWith<$Res> {
  _$AgeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? country = null,
    Object? age = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as num,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AgeDataImplCopyWith<$Res> implements $AgeDataCopyWith<$Res> {
  factory _$$AgeDataImplCopyWith(
          _$AgeDataImpl value, $Res Function(_$AgeDataImpl) then) =
      __$$AgeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(name: countryKey) String country,
      num age,
      int count});
}

/// @nodoc
class __$$AgeDataImplCopyWithImpl<$Res>
    extends _$AgeDataCopyWithImpl<$Res, _$AgeDataImpl>
    implements _$$AgeDataImplCopyWith<$Res> {
  __$$AgeDataImplCopyWithImpl(
      _$AgeDataImpl _value, $Res Function(_$AgeDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? country = null,
    Object? age = null,
    Object? count = null,
  }) {
    return _then(_$AgeDataImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as num,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AgeDataImpl implements _AgeData {
  const _$AgeDataImpl(
      {required this.name,
      @JsonKey(name: countryKey) this.country = worldCountry,
      required this.age,
      required this.count});

  factory _$AgeDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgeDataImplFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: countryKey)
  final String country;
  @override
  final num age;
  @override
  final int count;

  @override
  String toString() {
    return 'AgeData(name: $name, country: $country, age: $age, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgeDataImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, country, age, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AgeDataImplCopyWith<_$AgeDataImpl> get copyWith =>
      __$$AgeDataImplCopyWithImpl<_$AgeDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgeDataImplToJson(
      this,
    );
  }
}

abstract class _AgeData implements AgeData {
  const factory _AgeData(
      {required final String name,
      @JsonKey(name: countryKey) final String country,
      required final num age,
      required final int count}) = _$AgeDataImpl;

  factory _AgeData.fromJson(Map<String, dynamic> json) = _$AgeDataImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: countryKey)
  String get country;
  @override
  num get age;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$AgeDataImplCopyWith<_$AgeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
