//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. Use of this
// source code is governed by an MIT-style license that can be found in the
// LICENSE file located in this project's root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

part of 'core.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

abstract base class _ChildPodBase<TParent, TChild> extends PodNotifier<TChild>
    with GenericPod<TChild> {
  //
  //
  //

  final TPodsResponderFn<TParent> _responder;
  final TValuesReducerFn<TChild, TParent> _reducer;

  //
  //
  //

  _ChildPodBase({
    required TPodsResponderFn<TParent> responder,
    required TValuesReducerFn<TChild, TParent> reducer,
    required TChild initialValue,
    super.onBeforeDispose,
  })  : _reducer = reducer,
        _responder = responder,
        super(initialValue);

  //
  //
  //

  void _initializeParents(Iterable<GenericPod<TParent>?> parents) {
    for (var parent in parents) {
      parent?._addChild(this);
    }
  }

  //
  //
  //

  Future<void> _refresh() async {
    final parents = _responder();
    _initializeParents(parents);
    final newValue = _reducer(parents.map((p) => p?.value).toList());
    await _set(newValue);
  }

  //
  //
  //

  /// Do not add listeners to this Pod directly.
  @protected
  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
  }

  /// Do not add listeners to this Pod directly.
  @protected
  @override
  void dispose() {
    final parents = _responder();
    for (var parent in parents) {
      parent?._removeChild(this);
    }
    super.dispose();
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

typedef TValuesReducerFn<TChild, TParentList> = TChild Function(
  List<TParentList?> parentValues,
);

typedef TPodsResponderFn<T> = Iterable<GenericPod<T>?> Function();
