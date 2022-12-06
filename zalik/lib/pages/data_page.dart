import 'package:flutter/material.dart';

class DataPage extends StatelessWidget {
  const DataPage({super.key, required this.data});
  final Future data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 248, 204, 57),
        title: const Text('Marian`s Zalik'),
      ),
      body: Center(
        child: FutureBuilder(
          future: data,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Your predicted age is: ${snapshot.data.age}',
                   style: TextStyle(height: 2, fontSize: 40),),
                  Text('Status of prediction: ${snapshot.data.status}',
                   style: TextStyle(height: 2, fontSize: 40),),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
