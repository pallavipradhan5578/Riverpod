import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

//final hello = Provider<String>((ref) {
// return "Hello, Riverpod!";
//to read contant value
//});

//final age = Provider((ref) {
//return 45;
//});

/*class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gretting = ref.watch(hello);
    final tepage = ref.watch(age);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              gretting,
              style: TextStyle(fontSize: 50),
            ),
          ),
        ],
      ),
    );

  }
}*/
/*class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {  final gretting = ref.watch(hello);
  final tepage = ref.watch(age);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.brown.shade200,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              gretting+" "+tepage.toString(),
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );




  }
}*/

final counter = StateProvider<int>((ref) {
  return 0;
});

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("Build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
      ),
      body: Column(
        children: [
          Consumer(builder: (context, ref, child) {
            final count = ref.watch(counter);
            print('build2');
            return Center(
              child: Text(
                count.toString(),
                style: TextStyle(fontSize: 50),
              ),
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    ref.read(counter.notifier).state++;
                  },
                  child: Text("+")),
              SizedBox(width: 30,),
              ElevatedButton(
                  onPressed: () {
                    ref.read(counter.notifier).state--;
                  },
                  child: Text("-"))
            ],
          )
        ],
      ),
    );
  }
}
