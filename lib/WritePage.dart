import 'package:flutter/material.dart';

import 'MemoProvider.dart';

class WritePage extends StatelessWidget {

  final title = TextEditingController();
  final content = TextEditingController();

  // ignore: non_constant_identifier_names
  Future<void> _insertDB() async {
    var provider = MemoProvider();
    var memo = Memo(title: title.text, content: content.text);
    provider.insert(memo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(
                controller: title,
                decoration: InputDecoration(
                    labelText: '제목을 입력하세요'
                ),
              ),
              TextField(
                controller: content,
                decoration: InputDecoration(
                    labelText: '내용을 입력하세요',
                    isDense: true
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _insertDB();
            Navigator.pop(context);
          },
          child: Icon(Icons.add)
      ),
    );
  }
}