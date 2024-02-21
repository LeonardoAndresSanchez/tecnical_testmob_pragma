import 'package:freezed_annotation/freezed_annotation.dart';

part 'weight.freezed.dart';
part 'weight.g.dart';

@freezed
class Weight with _$Weight {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Weight({
    String? imperial,
    String? metric,
  }) = _Weight;

  factory Weight.fromJson(Map<String, dynamic> json) => _$WeightFromJson(json);
}
