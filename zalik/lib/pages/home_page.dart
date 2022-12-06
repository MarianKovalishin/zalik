import 'package:flutter/material.dart';

import '../services/http_service.dart';
import 'data_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController name;
  bool isLoading = false;

  @override
  void initState() {
    name = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 248, 204, 57),
          title: const Text('Marian`s Zalik'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
                onChanged: (value) {
                  setState(() {
                    name.text = value;
                    name.selection = TextSelection.fromPosition(
                        TextPosition(offset: name.text.length));
                  });
                },
              ),
            ),
            ElevatedButton(
                onPressed: (() {
                  if (name.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please enter your name')));
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return DataPage(data: HttpService().getUser(name.text));
                      }),
                    );
                  }
                }),
                style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 248, 204, 57)),
                child: const Text('Get my predicted age', 
                style: TextStyle(height: 0, fontSize: 20),)
                ),
          ],
        ));
  }
}
