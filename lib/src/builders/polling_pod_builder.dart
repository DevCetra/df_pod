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

import 'package:flutter/foundation.dart' show ValueListenable;

import 'package:flutter/widgets.dart';

import '/src/_index.g.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class PollingPodBuilder<T> extends StatefulWidget {
  //
  //
  //

  final TFutureListenable<T>? Function() podPoller;

  //
  //
  //

  final TOnValueBuilder<T?, PodBuilderSnapshot<T>> builder;

  //
  //
  //

  final Widget? child;

  //
  //
  //

  final void Function(ValueListenable<T>? pod)? onDispose;

  //
  //
  //

  const PollingPodBuilder({
    super.key,
    required this.podPoller,
    required this.builder,
    this.child,
    this.onDispose,
  });

  //
  //
  //

  @override
  State<PollingPodBuilder<T>> createState() => _PollingPodBuilderState<T>();
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class _PollingPodBuilderState<T> extends State<PollingPodBuilder<T>> {
  //
  //
  //

  late final Widget? _staticChild = widget.child;
  TFutureListenable<T>? _currentPod;

  //
  //
  //

  @override
  void initState() {
    super.initState();
    _checkAndUpdate();
  }

  //
  //
  //

  void _checkAndUpdate() {
    final tempPod = widget.podPoller();
    if (_currentPod != tempPod) {
      _currentPod = tempPod;
      if (mounted) {
        setState(() {});
      }
    }
    if (_currentPod != null) {
      // Stop polling once we have a valid Pod.
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkAndUpdate());
  }

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    if (_currentPod != null) {
      return PodBuilder<T>(
        key: widget.key,
        pod: _currentPod!,
        builder: widget.builder,
        onDispose: widget.onDispose,
        child: _staticChild,
      );
    } else {
      final snapshot = PodBuilderSnapshot<T>(
        pod: null,
        value: null,
        child: _staticChild,
      );
      final result = widget.builder(context, snapshot);
      return result;
    }
  }
}
