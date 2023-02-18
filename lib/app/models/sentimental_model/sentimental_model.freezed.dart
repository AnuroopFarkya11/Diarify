// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sentimental_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SentimentalModel _$SentimentalModelFromJson(Map<String, dynamic> json) {
  return _SentimentalModel.fromJson(json);
}

/// @nodoc
mixin _$SentimentalModel {
  String get sentiment => throw _privateConstructorUsedError;
  String get score => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SentimentalModelCopyWith<SentimentalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SentimentalModelCopyWith<$Res> {
  factory $SentimentalModelCopyWith(
          SentimentalModel value, $Res Function(SentimentalModel) then) =
      _$SentimentalModelCopyWithImpl<$Res, SentimentalModel>;
  @useResult
  $Res call({String sentiment, String score});
}

/// @nodoc
class _$SentimentalModelCopyWithImpl<$Res, $Val extends SentimentalModel>
    implements $SentimentalModelCopyWith<$Res> {
  _$SentimentalModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sentiment = null,
    Object? score = null,
  }) {
    return _then(_value.copyWith(
      sentiment: null == sentiment
          ? _value.sentiment
          : sentiment // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SentimentalModelCopyWith<$Res>
    implements $SentimentalModelCopyWith<$Res> {
  factory _$$_SentimentalModelCopyWith(
          _$_SentimentalModel value, $Res Function(_$_SentimentalModel) then) =
      __$$_SentimentalModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sentiment, String score});
}

/// @nodoc
class __$$_SentimentalModelCopyWithImpl<$Res>
    extends _$SentimentalModelCopyWithImpl<$Res, _$_SentimentalModel>
    implements _$$_SentimentalModelCopyWith<$Res> {
  __$$_SentimentalModelCopyWithImpl(
      _$_SentimentalModel _value, $Res Function(_$_SentimentalModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sentiment = null,
    Object? score = null,
  }) {
    return _then(_$_SentimentalModel(
      sentiment: null == sentiment
          ? _value.sentiment
          : sentiment // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SentimentalModel implements _SentimentalModel {
  const _$_SentimentalModel({required this.sentiment, required this.score});

  factory _$_SentimentalModel.fromJson(Map<String, dynamic> json) =>
      _$$_SentimentalModelFromJson(json);

  @override
  final String sentiment;
  @override
  final String score;

  @override
  String toString() {
    return 'SentimentalModel(sentiment: $sentiment, score: $score)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SentimentalModel &&
            (identical(other.sentiment, sentiment) ||
                other.sentiment == sentiment) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sentiment, score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SentimentalModelCopyWith<_$_SentimentalModel> get copyWith =>
      __$$_SentimentalModelCopyWithImpl<_$_SentimentalModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SentimentalModelToJson(
      this,
    );
  }
}

abstract class _SentimentalModel implements SentimentalModel {
  const factory _SentimentalModel(
      {required final String sentiment,
      required final String score}) = _$_SentimentalModel;

  factory _SentimentalModel.fromJson(Map<String, dynamic> json) =
      _$_SentimentalModel.fromJson;

  @override
  String get sentiment;
  @override
  String get score;
  @override
  @JsonKey(ignore: true)
  _$$_SentimentalModelCopyWith<_$_SentimentalModel> get copyWith =>
      throw _privateConstructorUsedError;
}

SendingTextModel _$SendingTextModelFromJson(Map<String, dynamic> json) {
  return _SendingTextModel.fromJson(json);
}

/// @nodoc
mixin _$SendingTextModel {
  String get sentiment => throw _privateConstructorUsedError;
  String get score => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SendingTextModelCopyWith<SendingTextModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendingTextModelCopyWith<$Res> {
  factory $SendingTextModelCopyWith(
          SendingTextModel value, $Res Function(SendingTextModel) then) =
      _$SendingTextModelCopyWithImpl<$Res, SendingTextModel>;
  @useResult
  $Res call({String sentiment, String score});
}

/// @nodoc
class _$SendingTextModelCopyWithImpl<$Res, $Val extends SendingTextModel>
    implements $SendingTextModelCopyWith<$Res> {
  _$SendingTextModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sentiment = null,
    Object? score = null,
  }) {
    return _then(_value.copyWith(
      sentiment: null == sentiment
          ? _value.sentiment
          : sentiment // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SendingTextModelCopyWith<$Res>
    implements $SendingTextModelCopyWith<$Res> {
  factory _$$_SendingTextModelCopyWith(
          _$_SendingTextModel value, $Res Function(_$_SendingTextModel) then) =
      __$$_SendingTextModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sentiment, String score});
}

/// @nodoc
class __$$_SendingTextModelCopyWithImpl<$Res>
    extends _$SendingTextModelCopyWithImpl<$Res, _$_SendingTextModel>
    implements _$$_SendingTextModelCopyWith<$Res> {
  __$$_SendingTextModelCopyWithImpl(
      _$_SendingTextModel _value, $Res Function(_$_SendingTextModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sentiment = null,
    Object? score = null,
  }) {
    return _then(_$_SendingTextModel(
      sentiment: null == sentiment
          ? _value.sentiment
          : sentiment // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SendingTextModel implements _SendingTextModel {
  const _$_SendingTextModel({required this.sentiment, required this.score});

  factory _$_SendingTextModel.fromJson(Map<String, dynamic> json) =>
      _$$_SendingTextModelFromJson(json);

  @override
  final String sentiment;
  @override
  final String score;

  @override
  String toString() {
    return 'SendingTextModel(sentiment: $sentiment, score: $score)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SendingTextModel &&
            (identical(other.sentiment, sentiment) ||
                other.sentiment == sentiment) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sentiment, score);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendingTextModelCopyWith<_$_SendingTextModel> get copyWith =>
      __$$_SendingTextModelCopyWithImpl<_$_SendingTextModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SendingTextModelToJson(
      this,
    );
  }
}

abstract class _SendingTextModel implements SendingTextModel {
  const factory _SendingTextModel(
      {required final String sentiment,
      required final String score}) = _$_SendingTextModel;

  factory _SendingTextModel.fromJson(Map<String, dynamic> json) =
      _$_SendingTextModel.fromJson;

  @override
  String get sentiment;
  @override
  String get score;
  @override
  @JsonKey(ignore: true)
  _$$_SendingTextModelCopyWith<_$_SendingTextModel> get copyWith =>
      throw _privateConstructorUsedError;
}
