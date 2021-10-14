// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_sales_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemSalesModel _$ItemSalesModelFromJson(Map<String, dynamic> json) {
  return ItemSalesModel(
    data: json['data'] == null
        ? null
        : ItemData.fromJson(json['data'] as Map<String, dynamic>),
    errors: json['errors'] as String?,
  );
}

Map<String, dynamic> _$ItemSalesModelToJson(ItemSalesModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'errors': instance.errors,
    };

ItemData _$ItemDataFromJson(Map<String, dynamic> json) {
  return ItemData(
    getCustomReport: json['getCustomReport'] == null
        ? null
        : GetCustomReport.fromJson(
            json['getCustomReport'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ItemDataToJson(ItemData instance) => <String, dynamic>{
      'getCustomReport': instance.getCustomReport?.toJson(),
    };

GetCustomReport _$GetCustomReportFromJson(Map<String, dynamic> json) {
  return GetCustomReport(
    name: json['name'] as String?,
    header: json['header'] as String?,
    startDate: json['startDate'] as String?,
    endDate: json['endDate'] as String?,
    tables: (json['tables'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Tables.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$GetCustomReportToJson(GetCustomReport instance) =>
    <String, dynamic>{
      'name': instance.name,
      'header': instance.header,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'tables': instance.tables?.map((e) => e?.toJson()).toList(),
    };

Tables _$TablesFromJson(Map<String, dynamic> json) {
  return Tables(
    name: json['name'] as String?,
    maxHeight: (json['maxHeight'] as num?)?.toDouble(),
    columns: (json['columns'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Columns.fromJson(e as Map<String, dynamic>))
        .toList(),
    rows: (json['rows'] as List<dynamic>?)
        ?.map(
            (e) => e == null ? null : Rows.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TablesToJson(Tables instance) => <String, dynamic>{
      'name': instance.name,
      'maxHeight': instance.maxHeight,
      'columns': instance.columns?.map((e) => e?.toJson()).toList(),
      'rows': instance.rows?.map((e) => e?.toJson()).toList(),
    };

Rows _$RowsFromJson(Map<String, dynamic> json) {
  return Rows(
    cells: (json['cells'] as List<dynamic>?)?.map((e) => e as String?).toList(),
  );
}

Map<String, dynamic> _$RowsToJson(Rows instance) => <String, dynamic>{
      'cells': instance.cells,
    };

Columns _$ColumnsFromJson(Map<String, dynamic> json) {
  return Columns(
    header: json['header'] as String?,
  );
}

Map<String, dynamic> _$ColumnsToJson(Columns instance) => <String, dynamic>{
      'header': instance.header,
    };
