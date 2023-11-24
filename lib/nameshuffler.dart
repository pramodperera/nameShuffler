import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> names = [
    'John',
    'Jane',
    'Bob',
    'saman',
    'Charlie',
    'pramod',
    'visal',
    'pasal',
    'dinith',
    'sahan',
    'oshada'
  ];

  List<List<String>> dividedNames = [];

  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _shuffleAndDivideNames();
  }

  void _shuffleAndDivideNames() {
    names.shuffle();
    dividedNames.clear();

    int range = 5;

    for (int i = 0; i < names.length; i += range) {
      int end = i + range;
      if (end > names.length) {
        end = names.length;
      }
      dividedNames.add(names.sublist(i, end));
    }

    print(dividedNames);
  }

  void _addName() {
    String newName = nameController.text.trim();
    if (newName.isNotEmpty) {
      setState(() {
        names.add(newName);
        _shuffleAndDivideNames();
        nameController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name Shuffler'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Shuffled and Divided Names:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: dividedNames.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('Set ${index + 1}'),
                      subtitle: Text(dividedNames[index].join(', ')),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: nameController,
              decoration:   const InputDecoration(
                labelText: 'Enter a name',
              ),
            ),
            ElevatedButton(
              onPressed: _addName,
              child:const Text('Add Name'),
            ),
          ],
        ),
      ),
    );
  }
}
