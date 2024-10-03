//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. The use of this
// source code is governed by an MIT-style license described in the LICENSE
// file located in this project's root directory.
//
// See: https://opensource.org/license/mit
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'dart:ui' show VoidCallback;

import 'package:meta/meta.dart';

import '/src/_index.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// A mixin that protects [addStrongRefListener] and [dispose], hiding these
/// methods from external access to prevent misuse or unintended behavior.
///
/// This is useful when you want to restrict direct access to lifecycle
/// management methods of the Pod, ensuring that these operations are only
/// handled internally or through controlled mechanisms.
@internal
base mixin ProtectedPodMixin<T> on DisposablePod<T> {
  /// ❌ Do not add listeners to this Pod directly.
  @protected
  @override
  void addStrongRefListener({
    required VoidCallback strongRefListener,
  }) {
    super.addStrongRefListener(
      strongRefListener: strongRefListener,
    );
  }

  /// ❌ Do not add listeners to this Pod directly.
  @protected
  @override
  void addSingleExecutionListener(VoidCallback listener) {
    super.addSingleExecutionListener(listener);
  }

  /// ❌ Do not dispose this Pod directly.
  @protected
  @override
  void dispose() {
    super.dispose();
  }
}
