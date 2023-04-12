import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../network/response_model.dart';

@immutable
abstract class UserState extends Equatable {}

class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserInitialState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoadedState extends UserState {
  final List<String> urls;
  UserLoadedState(this.urls);

  @override
  List<Object?> get props => [urls];
}

class UserErrorState extends UserState {
  final String error;
  UserErrorState(this.error);
  @override
  List<Object?> get props => [];
}
