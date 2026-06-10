import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practical/service/storage_services.dart';
import 'package:practical/view/post_api_simple/view/post_simple_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const PostSimpleApiView(),
    );
  }
}

/// Find the largest number in the list

// void main() {
//   List<int> numbers = [5, 12, 8, 25, 3];

//   int largest = numbers[0];

//   for (int num in numbers) {
//     if (num > largest) {
//       largest = num;
//     }
//   }
//   print("Largest Number: $largest");
// }
