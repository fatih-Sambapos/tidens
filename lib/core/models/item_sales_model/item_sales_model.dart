import 'package:json_annotation/json_annotation.dart';

part 'item_sales_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ItemSalesModel {
  ItemSalesModel({
    this.data,
    this.errors,
  });
  ItemData? data;
  String? errors;

  factory ItemSalesModel.fromJson(Map<String, dynamic> data) =>
      _$ItemSalesModelFromJson(data);

  Map<String, dynamic> toJson() => _$ItemSalesModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ItemData {
  GetCustomReport? getCustomReport;

  ItemData({
    this.getCustomReport,
  });

  factory ItemData.fromJson(Map<String, dynamic> data) =>
      _$ItemDataFromJson(data);

  Map<String, dynamic> toJson() => _$ItemDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCustomReport {
  String? name;
  String? header;
  String? startDate;
  String? endDate;
  List<Tables?>? tables;

  GetCustomReport({
    this.name,
    this.header,
    this.startDate,
    this.endDate,
    this.tables,
  });

  factory GetCustomReport.fromJson(Map<String, dynamic> data) =>
      _$GetCustomReportFromJson(data);

  Map<String, dynamic> toJson() => _$GetCustomReportToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Tables {
  String? name;
  double? maxHeight;
  List<Columns?>? columns;
  List<Rows?>? rows;

  Tables({
    this.name,
    this.maxHeight,
    this.columns,
    this.rows,
  });

  factory Tables.fromJson(Map<String, dynamic> data) => _$TablesFromJson(data);

  Map<String, dynamic> toJson() => _$TablesToJson(this);
}

@JsonSerializable()
class Rows {
  List<String?>? cells;

  Rows({
    this.cells,
  });

  factory Rows.fromJson(Map<String, dynamic> data) => _$RowsFromJson(data);

  Map<String, dynamic> toJson() => _$RowsToJson(this);
}

@JsonSerializable()
class Columns {
  String? header;

  Columns({
    this.header,
  });
  factory Columns.fromJson(Map<String, dynamic> data) =>
      _$ColumnsFromJson(data);

  Map<String, dynamic> toJson() => _$ColumnsToJson(this);
}
