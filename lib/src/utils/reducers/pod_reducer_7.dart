//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. Use of this
// source code is governed by an MIT-style license that can be found in the
// LICENSE file.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import '/src/_index.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// A class to handle reducing operations for 7 Pods.
final class PodReducer7 {
  PodReducer7._();

  /// Reduces 7 Pods into a [ChildPod].
  static ChildPod<dynamic, C> reduce<C, P1, P2, P3, P4, P5, P6, P7>(
    TResponderFn7<P1, P2, P3, P4, P5, P6, P7> responder,
    TNullableReducerFn7<C, P1, P2, P3, P4, P5, P6, P7> reducer,
  ) {
    return ChildPod<dynamic, C>(
      responder: () => _toList(responder),
      reducer: (_) => _reduce(responder, reducer),
    );
  }

  /// Reduces 7 Pods into a temporary [ChildPod].
  static ChildPod<dynamic, C> reduceToTemp<C, P1, P2, P3, P4, P5, P6, P7>(
    TResponderFn7<P1, P2, P3, P4, P5, P6, P7> responder,
    TNullableReducerFn7<C, P1, P2, P3, P4, P5, P6, P7> reducer,
  ) {
    return ChildPod<dynamic, C>.temp(
      responder: () => _toList(responder),
      reducer: (_) => _reduce(responder, reducer),
    );
  }

  /// Converts the response from the responder function into a list of Pods.
  static List<PodMixin<dynamic>?> _toList<P1, P2, P3, P4, P5, P6, P7>(
    TResponderFn7<P1, P2, P3, P4, P5, P6, P7> responder,
  ) {
    final response = responder.call();
    return [
      response.$1,
      response.$2,
      response.$3,
      response.$4,
      response.$5,
      response.$6,
      response.$7,
    ];
  }

  /// Reduces the values from 7 Pods using the provided reducer function.
  static C _reduce<C, P1, P2, P3, P4, P5, P6, P7>(
    TResponderFn7<P1, P2, P3, P4, P5, P6, P7> responder,
    TNullableReducerFn7<C, P1, P2, P3, P4, P5, P6, P7> reducer,
  ) {
    final response = responder();
    return reducer(
      response.$1,
      response.$2,
      response.$3,
      response.$4,
      response.$5,
      response.$6,
      response.$7,
    );
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

typedef TResponderFn7<P1, P2, P3, P4, P5, P6, P7> = (
  PodMixin<P1>? p1,
  PodMixin<P2>? p2,
  PodMixin<P3>? p3,
  PodMixin<P4>? p4,
  PodMixin<P5>? p5,
  PodMixin<P6>? p6,
  PodMixin<P7>? p7,
)
    Function();

typedef TNullableReducerFn7<C, P1, P2, P3, P4, P5, P6, P7> = C Function(
  PodMixin<P1>? p1,
  PodMixin<P2>? p2,
  PodMixin<P3>? p3,
  PodMixin<P4>? p4,
  PodMixin<P5>? p5,
  PodMixin<P6>? p6,
  PodMixin<P7>? p7,
);

typedef TReducerFn7<C, P1, P2, P3, P4, P5, P6, P7> = C Function(
  PodMixin<P1> p1,
  PodMixin<P2> p2,
  PodMixin<P3> p3,
  PodMixin<P4> p4,
  PodMixin<P5> p5,
  PodMixin<P6> p6,
  PodMixin<P7> p7,
);