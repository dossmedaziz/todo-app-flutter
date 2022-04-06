import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List todos = <String>[];
  String content = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todos.add("Learn Flutter");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Todo App"),
        backgroundColor: Colors.purpleAccent.shade700,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade300,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add,color: Colors.white,),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  title: const Text("Add New Todo"),
                  content: TextField(onChanged: (String value) {
                    content = value;
                  }),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          setState(() {
                            todos.add(content);
                            content = "";
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text('add'))
                  ],
                );
              });
        },
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(todos[index]),
              onDismissed: (direction) {
                todos.removeAt(index);
                debugPrint("$todos.length");
              },
              child: Card(
                elevation: 4,
                margin: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: ListTile(
                  title: Text(todos[index]),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        todos.removeAt(index);
                      });
                    },
                  ),
                ),
              ),
            );
          }),
    );
  }
}
