//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. Use of this
// source code is governed by an MIT-style license that can be found in the
// LICENSE file.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:tuple/tuple.dart';

import '/src/_index.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// A tuple of 6 [PodMixin] instances.
final class Pods6<P1, P2, P3, P4, P5, P6>
    extends Tuple6<P1?, P2?, P3?, P4?, P5?, P6?> implements ManyPods<dynamic> {
  final PodMixin<P1>? p1;
  final PodMixin<P2>? p2;
  final PodMixin<P3>? p3;
  final PodMixin<P4>? p4;
  final PodMixin<P5>? p5;
  final PodMixin<P6>? p6;

  Pods6(this.p1, this.p2, this.p3, this.p4, this.p5, this.p6)
      : super(null, null, null, null, null, null);

  @override
  P1? get item1 => p1?.value;

  @override
  P2? get item2 => p2?.value;

  @override
  P3? get item3 => p3?.value;

  @override
  P4? get item4 => p4?.value;

  @override
  P5? get item5 => p5?.value;

  @override
  P6? get item6 => p6?.value;

  @override
  List<PodMixin<dynamic>?> get pods => [
        p1,
        p2,
        p3,
        p4,
        p5,
        p6,
      ];

  @override
  List<T> valuesWhereType<T>() => toList().whereType<T>().toList();
}