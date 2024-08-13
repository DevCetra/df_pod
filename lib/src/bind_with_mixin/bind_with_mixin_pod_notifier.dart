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

/// Use `BindWithMixinPodNotifier<T>` instead of PodNotifier<T> to incorporate
/// `BindWithMixin`.
///
/// Example:
/// ```dart
/// class MyPodNotifier<T> extends BindWithMixinPodNotifier<T>> {
///   late final pStatus = Pod<String>('init')..bindParent(this);;
/// }
/// ```
abstract class BindWithMixinPodNotifier<T> extends _PodNotifierWithDisposable<T>
    with BindWithMixin {
  BindWithMixinPodNotifier(
    super.value, {
    required super.disposable,
    required super.temp,
  });
}

abstract class _PodNotifierWithDisposable<T> extends PodNotifier<T> implements DisposeMixin {
  _PodNotifierWithDisposable(
    super.value, {
    required super.disposable,
    required super.temp,
  });
}
