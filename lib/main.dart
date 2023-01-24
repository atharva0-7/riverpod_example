import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/presentation/data_provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const ProviderScope(
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataList = ref.watch(DataProvider.getDataList);
    return Scaffold(
        appBar: AppBar(),
        body: dataList.when(
          data: (dataList) {
            return SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: dataList
                  .map((e) => ListTile(
                        title: Text(e.title),
                      ))
                  .toList(),
            ));
          },
          error: (err, stack) => Text('Error: $err'),
          loading: () => const CircularProgressIndicator(),
        ));
  }
}
