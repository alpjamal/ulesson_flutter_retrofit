import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Retrofit'),
      ),
      body: _body(),
    );
  }

  FutureBuilder _body() {
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 1)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final List posts = snapshot.data ?? [];
            if (posts.isEmpty) {
              return const Center(
                child: Text('No Data'),
              );
            }
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black)),
                  child: const Column(
                    children: [
                      Text(
                        'Title',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Description',
                        style: TextStyle(),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.black,
              ),
            );
          }
        });
  }
}
