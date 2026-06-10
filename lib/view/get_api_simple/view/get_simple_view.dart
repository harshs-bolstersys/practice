import 'package:flutter/material.dart';
import 'package:practical/view/get_api_simple/controller/get_simple_controller.dart';

class GetSimpleApiView extends StatefulWidget {
  const GetSimpleApiView({super.key});

  @override
  State<GetSimpleApiView> createState() => _GetSimpleApiViewState();
}

class _GetSimpleApiViewState extends State<GetSimpleApiView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Get Simple API')),
      body: FutureBuilder(
        future: GetApiSimpleController().getApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              final item = snapshot.data?[index];
              return ListTile(
                leading: CircleAvatar(child: Text(item?.id.toString() ?? '')),
                title: Text(item?.title ?? ''),
                subtitle: Text(item?.body ?? ''),
              );
            },
          );
        },
      ),
    );
  }
}
