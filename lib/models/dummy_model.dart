import 'package:freezed_annotation/freezed_annotation.dart';

part 'dummy_model.freezed.dart';
part 'dummy_model.g.dart';

@freezed
abstract class DummyModel with _$DummyModel {
  const factory DummyModel({
    required String id,
    required String title,
    required String subtitle,
  }) = _DummyModel;

  factory DummyModel.fromJson(Map<String, dynamic> json) =>
      _$DummyModelFromJson(json);
}
