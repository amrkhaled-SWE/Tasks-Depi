import 'package:flutter/material.dart';
@immutable
sealed class GetPostState {}

final class GetPostInitial extends GetPostState {}
final class GetPostLoading extends GetPostState {}
final class GetPostSuccess extends GetPostState {}
final class GetPostError extends GetPostState {
  final String error;
  GetPostError({required this.error});
}