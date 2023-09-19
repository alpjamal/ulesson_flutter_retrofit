import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  num? userId;
  num? id;
  String? title;
  String? body;

  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return _$PostModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PostModelToJson(this);
  }
}
