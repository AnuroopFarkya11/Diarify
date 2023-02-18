// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionModel _$NotionModelFromJson(Map<String, dynamic> json) {
  return _NotionModel.fromJson(json);
}

/// @nodoc
mixin _$NotionModel {
  String get notionId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get notionContent => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotionModelCopyWith<NotionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionModelCopyWith<$Res> {
  factory $NotionModelCopyWith(
          NotionModel value, $Res Function(NotionModel) then) =
      _$NotionModelCopyWithImpl<$Res, NotionModel>;
  @useResult
  $Res call(
      {String notionId,
      String userId,
      String title,
      String notionContent,
      DateTime dateTime});
}

/// @nodoc
class _$NotionModelCopyWithImpl<$Res, $Val extends NotionModel>
    implements $NotionModelCopyWith<$Res> {
  _$NotionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notionId = null,
    Object? userId = null,
    Object? title = null,
    Object? notionContent = null,
    Object? dateTime = null,
  }) {
    return _then(_value.copyWith(
      notionId: null == notionId
          ? _value.notionId
          : notionId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      notionContent: null == notionContent
          ? _value.notionContent
          : notionContent // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotionModelCopyWith<$Res>
    implements $NotionModelCopyWith<$Res> {
  factory _$$_NotionModelCopyWith(
          _$_NotionModel value, $Res Function(_$_NotionModel) then) =
      __$$_NotionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String notionId,
      String userId,
      String title,
      String notionContent,
      DateTime dateTime});
}

/// @nodoc
class __$$_NotionModelCopyWithImpl<$Res>
    extends _$NotionModelCopyWithImpl<$Res, _$_NotionModel>
    implements _$$_NotionModelCopyWith<$Res> {
  __$$_NotionModelCopyWithImpl(
      _$_NotionModel _value, $Res Function(_$_NotionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notionId = null,
    Object? userId = null,
    Object? title = null,
    Object? notionContent = null,
    Object? dateTime = null,
  }) {
    return _then(_$_NotionModel(
      notionId: null == notionId
          ? _value.notionId
          : notionId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      notionContent: null == notionContent
          ? _value.notionContent
          : notionContent // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotionModel implements _NotionModel {
  const _$_NotionModel(
      {required this.notionId,
      required this.userId,
      required this.title,
      required this.notionContent,
      required this.dateTime});

  factory _$_NotionModel.fromJson(Map<String, dynamic> json) =>
      _$$_NotionModelFromJson(json);

  @override
  final String notionId;
  @override
  final String userId;
  @override
  final String title;
  @override
  final String notionContent;
  @override
  final DateTime dateTime;

  @override
  String toString() {
    return 'NotionModel(notionId: $notionId, userId: $userId, title: $title, notionContent: $notionContent, dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotionModel &&
            (identical(other.notionId, notionId) ||
                other.notionId == notionId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.notionContent, notionContent) ||
                other.notionContent == notionContent) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, notionId, userId, title, notionContent, dateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotionModelCopyWith<_$_NotionModel> get copyWith =>
      __$$_NotionModelCopyWithImpl<_$_NotionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotionModelToJson(
      this,
    );
  }
}

abstract class _NotionModel implements NotionModel {
  const factory _NotionModel(
      {required final String notionId,
      required final String userId,
      required final String title,
      required final String notionContent,
      required final DateTime dateTime}) = _$_NotionModel;

  factory _NotionModel.fromJson(Map<String, dynamic> json) =
      _$_NotionModel.fromJson;

  @override
  String get notionId;
  @override
  String get userId;
  @override
  String get title;
  @override
  String get notionContent;
  @override
  DateTime get dateTime;
  @override
  @JsonKey(ignore: true)
  _$$_NotionModelCopyWith<_$_NotionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
