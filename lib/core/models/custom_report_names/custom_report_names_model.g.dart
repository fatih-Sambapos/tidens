// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_report_names_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomReportNamesModel _$CustomReportNamesModelFromJson(
    Map<String, dynamic> json) {
  return CustomReportNamesModel(
    data: Data.fromJson(json['data'] as Map<String, dynamic>),
    errors: json['errors'] as String?,
  );
}

Map<String, dynamic> _$CustomReportNamesModelToJson(
        CustomReportNamesModel instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
      'errors': instance.errors,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    getCustomReportNames: (json['getCustomReportNames'] as List<dynamic>?)
        ?.map((e) => GetCustomReportNames.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'getCustomReportNames':
          instance.getCustomReportNames?.map((e) => e.toJson()).toList(),
    };

GetCustomReportNames _$GetCustomReportNamesFromJson(Map<String, dynamic> json) {
  return GetCustomReportNames(
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$GetCustomReportNamesToJson(
        GetCustomReportNames instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
