import 'package:flutter/material.dart';

void main() {
  // 最初に表示するWidget
  runApp(MyTodoApp());
}

class MyTodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 右上に表示される"debug"ラベルを消す
      debugShowCheckedModeBanner: false,
      // アプリ名
      title: 'My Todo App',
      theme: ThemeData(
        // テーマカラー
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // リスト一覧画面を表示
      home: TodoListPage(),
    );
  }
}

// リスト一覧画面用Widget
class TodoListPage extends StatelessWidget {
  final String testButton = 'test';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('リスト一覧'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            child: Expanded(
              child: ListView(
                children: <Widget>[
                  Card(
                    child: ListTile(
                      title: Text('にんじんを買う'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('玉ねぎを買う'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('じゃがいもを買う'),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('カレールーを買う'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            //横幅いっぱいに広げる
            width: double.infinity,
            //リスト追加ボタン
            child: RaisedButton(
              color: Colors.blue,
              onPressed: (){},
              child: Text(testButton,style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //"push"で新規画面に遷移
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context){
            //遷移先の画面としてリスト追加画面を指定
              return TodoAddPage();
            }),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// リスト追加画面用Widget
class TodoAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('リストに追加'),
      ),
      body: Container(
        //余白をつける
        padding: EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //テキスト入力
            TextField(),
            Container(
              //横幅いっぱいに広げる
              width: double.infinity,
              //リスト追加ボタン
              child: RaisedButton(
                color: Colors.blue,
                onPressed: (){},
                child: Text('リストに追加',style: TextStyle(color: Colors.white)),
              ),
            ),
            Container(
              //横幅いっぱいに広げる
              width: double.infinity,
              //キャンセルボタン
              child: FlatButton(
                color: Colors.black12,
                //ボタンをクリックした時の処理
                onPressed: (){
                  //"pop"で前の画面に戻る
                  Navigator.of(context).pop();
                },
                child: Text('キャンセル'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
