import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
final hello=Provider<String>((ref){
  return "Hello, Riverpod!";
  //to read contant value
});
final age=Provider((ref){
  return 45;

});


class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final gretting=ref.watch(hello);
    final tepage=ref.watch(age);
    return Scaffold(appBar:AppBar(),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(gretting,style: TextStyle(fontSize: 50),),
          ),

        ],
      ),
    );
  }
}
