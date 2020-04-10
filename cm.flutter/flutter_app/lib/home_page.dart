import 'package:flutter/material.dart';
import 'buttons_page.dart';
import 'lists_page.dart';
import 'cards_page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String avatarPicture = 'https://avatars0.githubusercontent.com/u/9979222?s=460&v=4';
  String backgroundHeader = 'http://ak3.picdn.net/shutterstock/videos/20972563/thumb/1.jpg';

  @override
  Widget build (BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Widget App"),
        backgroundColor: Colors.red,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("User"),
              accountEmail: new Text("abc@def.com"),
              currentAccountPicture: new GestureDetector(
                onTap: () => print("Toque na imagem"),
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(avatarPicture),
                ),
              ),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(backgroundHeader)
                )
              ),
            ),
            new ListTile(
              title: new Text("Buttons"),
              trailing: new Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ButtonsPage()));
              },
            ),
            new ListTile(
              title: new Text("Lists"),
              trailing: new Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new ListsPage()));
              },
            ),            
            new ListTile(
              title: new Text("Cards"),
              trailing: new Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new CardsPage()));
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("Cancel"),
              trailing: new Icon(Icons.close),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: new Center(
        child: new Text("Olá mundo"),
      ),
    );
  }
}