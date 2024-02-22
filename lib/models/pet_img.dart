import 'package:freezed_annotation/freezed_annotation.dart';

part 'pet_img.freezed.dart';
part 'pet_img.g.dart';

@freezed
class PetImg with _$PetImg {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PetImg({
    String? id,
    String? url,
    int? width,
    int? height,
  }) = _PetImg;

  factory PetImg.fromJson(Map<String, dynamic> json) => _$PetImgFromJson(json);
}
