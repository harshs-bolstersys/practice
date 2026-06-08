import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practical/view/get_api/controller/get_api_controler.dart';

class GetApiView extends ConsumerStatefulWidget {
  const GetApiView({super.key});

  @override
  ConsumerState<GetApiView> createState() => _GetApiViewState();
}

class _GetApiViewState extends ConsumerState<GetApiView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(getApiControllerProvider.notifier).getApi());
  }

  @override
  Widget build(BuildContext context) {
    final getApiState = ref.watch(getApiControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Get API')),
      body: getApiState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : getApiState.error.isNotEmpty
          ? Center(child: Text(getApiState.error))
          : ListView.builder(
              itemCount: getApiState.getApiList.length,
              itemBuilder: (context, index) {
                final item = getApiState.getApiList[index];
                return ListTile(
                  leading: CircleAvatar(child: Text('${item.id ?? ''}')),
                  title: Text(item.title ?? ''),
                  subtitle: Text(item.body ?? '', maxLines: 2, overflow: TextOverflow.ellipsis),
                );
              },
            ),
    );
  }
}
