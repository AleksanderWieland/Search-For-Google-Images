import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();
}

class LoadInitalEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}

class LoadUserEvent extends UserEvent {
  final String queryText;
  const LoadUserEvent(this.queryText);
  @override
  List<Object?> get props => [];
}
