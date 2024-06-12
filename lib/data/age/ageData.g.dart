// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ageData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgeDataImpl _$$AgeDataImplFromJson(Map<String, dynamic> json) =>
    _$AgeDataImpl(
      name: json['name'] as String,
      country: json['country_id'] as String? ?? worldCountry,
      age: json['age'] as num,
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$$AgeDataImplToJson(_$AgeDataImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country_id': instance.country,
      'age': instance.age,
      'count': instance.count,
    };
