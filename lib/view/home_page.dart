import 'package:flutter/material.dart';
import '../model/user.dart';
import '../services/user_api.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Demo'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SizedBox(
        // height: 1000,
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final email = user.email;
            return ListTile(
              title: Text(user.fullName),
              // subtitle: Text(email),
              subtitle: Text(user.location.city),
            );
          },
        ),
      ),
    );
  }

  Future<void> fetchUser() async {
    final response = await UserApi.fetchUser();
    setState(() {
      users = response;
      print('fetch user complete');
    });
  }
}