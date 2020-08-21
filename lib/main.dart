import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: "home",
      routes:{
        "new_page":(context) => NewRoute(),
        "home":(context)=> MyHomePage(title:'Flutter Demo Home Page'),//注册首页路由
        "echo_page":(context) =>EchoRoute(),
      },
//      onGenerateRoute: (RouteSettings settings){
//        return MaterialPageRoute(builder: (context){
//             String routeName = settings.name;
//          // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
//          // 引导用户登录；其它情况则正常打开路由。
//        });
//      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            FlatButton(
              child: Text("open new Route"),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新路由
//                Navigator.push(context, MaterialPageRoute(builder: (context) {
//                  return NewRoute();
//                }));
              Navigator.pushNamed(context, "new_page");
              },
            ),
            FlatButton(
              child: Text("路由传值测试"),
              textColor: Colors.red,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return RouterTestRoute();
                }));
              },
            ),
            FlatButton(
              child: Text("命名路由器参数传递"),
              textColor: Colors.amber,
              onPressed: (){
                Navigator.pushNamed(context, "echo_page",arguments: 'hi');
              },
            ),
            RandomWordsWidget(),
            Text("helloworld",textAlign: TextAlign.left),
            Text("Hello World"*9,maxLines:1, overflow: TextOverflow.ellipsis),
            Text("Hello World",textScaleFactor: 1.5,),
            Text("Hello World",style: TextStyle(
              color: Colors.blue,
              fontSize: 18.0,
              height: 1.0,
              fontFamily: "Courier",
              background: new Paint()..color =Colors.amber,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed

            ),),
            Text.rich(TextSpan(
              children: [
                TextSpan(
                  text: "Home："
                ),
                TextSpan(
                  text: "https://flutterchina.club",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                )
              ]

            )),
            RaisedButton(
              child: Text("raisedButton"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return SwatchAndCheckBox();
                }));
                print("点击了raisedButton");
              },

            ),
            FlatButton(
              child: Text("flatButton"),
              onPressed: (){
                print("点击了flatButton");
              },
            ),
            OutlineButton(
              child: Text("outlineButton"),
              onPressed: (){
                print("点击了outlineButton");
              },
            ),
            IconButton(
              icon:Icon(Icons.thumb_up),
              onPressed: (){
                print("点击了iconButton");
              },
            ),
            RaisedButton.icon(onPressed:null, icon: Icon(Icons.send), label: Text("发送")),
            FlatButton.icon(onPressed: null, icon: Icon(Icons.add), label: Text("添加")),
            OutlineButton.icon(onPressed: null, icon: Icon(Icons.info), label: Text("详情"))

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // Th

      // is trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/**
 * 跳转新路由
 */
class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String icons = "";
    icons+="\uE914";
    icons+="\uE000";
    icons+="\uE90D";



    return Scaffold(
      appBar: AppBar(
        title: Text("NewRoute"),
      ),
      body: Center(
        child:Column(
          children: [
            Text("this is a new route"),
            RaisedButton(
              color:Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("submit"),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: (){
                print("newRoute");
              },
            ),
            Image(
              image:AssetImage("images/icon_tudali.png"),
              width: 100.0,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,
            ),

            Image.asset("images/icon_tudali.png",width: 100.0,),
            Image(
              image: NetworkImage("http://www.tudali.com/Img/%E9%A6%96%E9%A1%B5/%E9%A6%96%E9%A1%B5_27.png"),
              width: 100.0,
            ),
            Image.network("http://www.tudali.com/Img/%E9%A6%96%E9%A1%B5/%E9%A6%96%E9%A1%B5_27.png",width: 200.0,height: 400,repeat: ImageRepeat.repeatY,),

            Text(
              icons,
              style: TextStyle(
                fontFamily: "MaterialIcons",
                fontSize: 50.0,
                color:Colors.amber,

              ),
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(MyIcons.book,color: Colors.purple,),
                Icon(MyIcons.wechat,color: Colors.green,),
              ],
            )


          ],



        ),

      ),
    );
  }
}

class WidgetTestRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return SwatchAndCheckBox();





  }

}

class SwatchAndCheckBox extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _SwitchAndCheckBoxTestRouteState();
  }

}

 class _SwitchAndCheckBoxTestRouteState extends State<SwatchAndCheckBox>{
  bool switchSelected = true;//维护单选开关状态
  bool checkBoxSelected = true;//维护复选框状态


  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
          appBar: AppBar(title: Text("switchAndCheckbox"),),
          body: Center(child:Column(
        children: [
          Switch(
            value: switchSelected,
            onChanged: (value){
              //重构界面
              setState(() {
                switchSelected = value;
              });

            },

          ),
          Checkbox(
              value: checkBoxSelected,
              onChanged: (value){
                //重构界面
                setState(() {
                  checkBoxSelected = value;
                });
              }

          ),

        ],

      ),));


  }

 }


class TipRoute extends StatelessWidget {
  TipRoute({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body:Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: ()=>Navigator.pop(context,"我是返回值"),
                child: Text("返回"),
              ),

            ],
          ),
        ),

      )

    );
  }
}

class RouterTestRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
        child: RaisedButton(
          onPressed: ()async{
            //打开tipRoute并返回结果
            var result = await Navigator.push(context, MaterialPageRoute(
              builder: (context){
                return TipRoute(
                  //路由参数
                  text: "我是提示",
                );
              }

            ));
            //输入tipRoute返回路由结果
            print("路由返回值:$result");
          },

          child: Text("打开提示页"),


        ),

    );

  }

}

class EchoRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

      //获取命名路由传递参数
    var args = ModalRoute.of(context).settings.arguments;
    print(args);

    return Scaffold(
      appBar: AppBar(
        title:Text("命名路由器参数传递"),
      ),
      body:Center(
        child: Column(
          children: [
            Text(args)
          ],
        ),
      ),


    );


  }

}


class RandomWordsWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    final randomWord = new WordPair.random();
     print(randomWord);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(randomWord.toString()),
    );

  }

}

class MyIcons{
  // book 图标
  static const IconData book = const IconData(
      0xe6c0,
      fontFamily: 'myIcon',
      matchTextDirection: true
  );
  // 微信图标
  static const IconData wechat = const IconData(
      0xe636,
      fontFamily: 'myIcon',
      matchTextDirection: true
  );
}