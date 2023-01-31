import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'RestaurantModel.g.dart';

@JsonSerializable()
class RestaurantModel{
  final String id;

  RestaurantModel({
    required this.id
});

  factory RestaurantModel.fromJson(Map<String , dynamic> json) => _$RestaurantModelFromJson(json);
  Map<String,dynamic> toJson() => _$RestaurantModelToJson(this);
}
