//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. Use of this
// source code is governed by an MIT-style license that can be found in the
// LICENSE file.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:shared_preferences/shared_preferences.dart';

import '/df_pod.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

base class SharedPod<A, B> extends Pod<A?> {
  //
  //
  //

  static SharedPreferences? _sharedPreferences;

  final String key;

  final A? Function(B? rawValue)? fromValue;
  final B? Function(A? value)? toValue;

  //
  //
  //

  SharedPod(
    this.key, {
    this.fromValue,
    this.toValue,
  }) : super(null);

  SharedPod.temp(
    this.key, {
    this.fromValue,
    this.toValue,
  }) : super.temp(null);

  SharedPod.global(
    this.key, {
    this.fromValue,
    this.toValue,
  }) : super.global(null);

  //
  //
  //

  @override
  Future<void> set(A? newValue) async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    final v = toValue?.call(newValue);
    if (v != null) {
      if (v is String) {
        await _sharedPreferences!.setString(key, v);
      }
      if (v is Iterable<String>) {
        await _sharedPreferences!.setStringList(key, v.toList());
      }
      if (v is bool) {
        await _sharedPreferences!.setBool(key, v);
      }
      if (v is int) {
        await _sharedPreferences!.setInt(key, v);
      }
      if (v is double) {
        await _sharedPreferences!.setDouble(key, v);
      }
      return;
    }
    await _sharedPreferences!.remove(key);
    await super.set(newValue);
  }

  //
  //
  //

  @override
  Future<void> refresh() async {
    if (fromValue != null) {
      _sharedPreferences ??= await SharedPreferences.getInstance();
      final v = _sharedPreferences!.get(key) as B?;
      if (v != null) {
        final newValue = fromValue!(v);
        await super.set(newValue);
      }
    }
  }
}
