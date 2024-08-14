//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Test Questions:
//
// 1. ???
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:df_pod/df_pod.dart';
import 'package:flutter/material.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final _pCounter1 = Pod<int>.global(1);

class CounterTest extends StatelessWidget {
  const CounterTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade200,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          const Text('Counter Test'),
          PodBuilder(
            pod: _pCounter1,
            builder: (context, value, child) {
              return Text('Count: $value');
            },
          ),
          OutlinedButton(
            onPressed: () => _pCounter1.update((e) => e + 1),
            child: const Text('Increase with "update"'),
          ),
          OutlinedButton(
            onPressed: () => _pCounter1.set(_pCounter1.value + 1),
            child: const Text('Increase with "set"'),
          ),
        ],
      ),
    );
  }
}