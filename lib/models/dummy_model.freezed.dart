// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dummy_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DummyModel {

 String get id; String get title; String get subtitle;
/// Create a copy of DummyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DummyModelCopyWith<DummyModel> get copyWith => _$DummyModelCopyWithImpl<DummyModel>(this as DummyModel, _$identity);

  /// Serializes this DummyModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DummyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle);

@override
String toString() {
  return 'DummyModel(id: $id, title: $title, subtitle: $subtitle)';
}


}

/// @nodoc
abstract mixin class $DummyModelCopyWith<$Res>  {
  factory $DummyModelCopyWith(DummyModel value, $Res Function(DummyModel) _then) = _$DummyModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String subtitle
});




}
/// @nodoc
class _$DummyModelCopyWithImpl<$Res>
    implements $DummyModelCopyWith<$Res> {
  _$DummyModelCopyWithImpl(this._self, this._then);

  final DummyModel _self;
  final $Res Function(DummyModel) _then;

/// Create a copy of DummyModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? subtitle = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _DummyModel implements DummyModel {
  const _DummyModel({required this.id, required this.title, required this.subtitle});
  factory _DummyModel.fromJson(Map<String, dynamic> json) => _$DummyModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String subtitle;

/// Create a copy of DummyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DummyModelCopyWith<_DummyModel> get copyWith => __$DummyModelCopyWithImpl<_DummyModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DummyModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DummyModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,subtitle);

@override
String toString() {
  return 'DummyModel(id: $id, title: $title, subtitle: $subtitle)';
}


}

/// @nodoc
abstract mixin class _$DummyModelCopyWith<$Res> implements $DummyModelCopyWith<$Res> {
  factory _$DummyModelCopyWith(_DummyModel value, $Res Function(_DummyModel) _then) = __$DummyModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String subtitle
});




}
/// @nodoc
class __$DummyModelCopyWithImpl<$Res>
    implements _$DummyModelCopyWith<$Res> {
  __$DummyModelCopyWithImpl(this._self, this._then);

  final _DummyModel _self;
  final $Res Function(_DummyModel) _then;

/// Create a copy of DummyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? subtitle = null,}) {
  return _then(_DummyModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
