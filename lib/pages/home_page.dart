import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ulesson_flutter_retrofit/models/post_model.dart';
import 'package:ulesson_flutter_retrofit/repository/repo.dart';

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
    final apiRepo = ApiRepo(Dio(BaseOptions(contentType: 'application/json')));
    return FutureBuilder(
        future: apiRepo.getPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final List<PostModel> posts = snapshot.data ?? [];
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
                  child: Column(
                    children: [
                      Text(
                        posts[index].title!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        posts[index].body!,
                        style: const TextStyle(),
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
