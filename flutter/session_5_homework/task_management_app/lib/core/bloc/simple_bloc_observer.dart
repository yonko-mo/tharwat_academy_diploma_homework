import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    debugPrint('onChange -- bloc: ${bloc.runtimeType}, change: $change');
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    debugPrint('onClose -- bloc: ${bloc.runtimeType}');
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    debugPrint('onCreate -- bloc: ${bloc.runtimeType}');
  }

  @override
  void onDone(
    Bloc<dynamic, dynamic> bloc,
    Object? event, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    debugPrint('onDone -- bloc: ${bloc.runtimeType}, event: $event');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    debugPrint('onError -- bloc: ${bloc.runtimeType}, error: $error');
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    debugPrint('onEvent -- bloc: ${bloc.runtimeType}, event: $event');
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    debugPrint(
      'onTransition -- bloc: ${bloc.runtimeType}, transition: $transition',
    );
  }
}
