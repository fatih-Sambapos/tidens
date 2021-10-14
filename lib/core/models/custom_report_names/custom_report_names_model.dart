import 'package:json_annotation/json_annotation.dart';

part 'custom_report_names_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomReportNamesModel {
  Data data;
  String? errors;

  CustomReportNamesModel({required this.data, required this.errors});

  factory CustomReportNamesModel.fromJson(Map<String, dynamic> data) =>
      _$CustomReportNamesModelFromJson(data);

  Map<String, dynamic> toJson() => _$CustomReportNamesModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data {
  List<GetCustomReportNames>? getCustomReportNames;

  Data({
    required this.getCustomReportNames,
  });

  factory Data.fromJson(Map<String, dynamic> data) => _$DataFromJson(data);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class GetCustomReportNames {
  String name;

  GetCustomReportNames({
    required this.name,
  });

  factory GetCustomReportNames.fromJson(Map<String, dynamic> data) =>
      _$GetCustomReportNamesFromJson(data);

  Map<String, dynamic> toJson() => _$GetCustomReportNamesToJson(this);
}
