import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConsumerClassDemo extends ConsumerStatefulWidget {
  const ConsumerClassDemo({super.key});

  @override
  ConsumerState<ConsumerClassDemo> createState() => _ConsumerClassDemoState();
}

class _ConsumerClassDemoState extends ConsumerState<ConsumerClassDemo> {
  @override
  Widget build(BuildContext context) {
    // final state = ref.watch(postApiControllerProvider);
    // final controller = ref.read(postApiControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text('Consumer Class Demo')),
      body: const Center(child: Text('Consumer Class Demo')),
    );
  }
}

class ConsumerClassDemoWidget extends ConsumerWidget {
  const ConsumerClassDemoWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state = ref.watch(postApiControllerProvider);
    // final controller = ref.read(postApiControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text('Consumer Class Demo')),
      body: const Center(child: Text('Consumer Class Demo')),
    );
  }
}
