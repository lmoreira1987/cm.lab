import 'package:flutter/material.dart';

class ButtonsPage extends StatefulWidget {
  @override
  _ButtonsPageState createState() => new _ButtonsPageState();
}

class _ButtonsPageState extends State<ButtonsPage> {
  ShapeBorder _buttonShape;

  @override
  Widget build(BuildContext context) {
    final ButtonThemeData buttonTheme = ButtonTheme.of(context).copyWith(
      shape: _buttonShape
    );

    return new Scaffold(
      body: new DefaultTabController(
        length: 5,
        child: new Scaffold(
          appBar: new AppBar(
            bottom: new TabBar(
              tabs: [
                new Tab(text: "Raised"),
                new Tab(text: "Flat"),
                new Tab(text: "Outline"),
                new Tab(text: "Icon"),
                new Tab(text: "Action"),
              ],
            ),
            title: new Text('Buttons page'),   
            backgroundColor: Colors.red,         
          ),
          body: new TabBarView(children: [
                new ButtonTheme.fromButtonThemeData(
                  data: buttonTheme,
                  child: buildRaisedButton("Raised button add dimension to simple layout and enfasize functions in spaces."),
                ),
                new ButtonTheme.fromButtonThemeData(
                  data: buttonTheme,
                  child: buildFlatButton('Flat button is a clean button. We can use in toolbar and dialog box.'),
                ),
                new ButtonTheme.fromButtonThemeData(
                  data: buttonTheme,
                  child: buildOutlineButton('Outline button are close to flat button but with a border. It is a secondary button.'),
                ),
                new ButtonTheme.fromButtonThemeData(
                  data: buttonTheme,
                  child: buildIconButton(),
                ),
                new ButtonTheme.fromButtonThemeData(
                  data: buttonTheme,
                  child: buildActionButton(),
                ),
          ]),
        ),
      ),
    );
  }
}

Widget buildActionButton() {
  return Align(
    alignment: const Alignment(0.0, -0.2),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FloatingActionButton(
              child: const Icon(Icons.thumb_up),
              onPressed: () {

              },
            ),
            FloatingActionButton(
              child: const Icon(Icons.thumb_down)
            )
          ],
        ),
      ],
    ),
  );
}

Widget buildIconButton() {
  return Align(
    alignment: const Alignment(0.0, -0.2),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.thumb_up),
              onPressed: () {

              },
            ),
            IconButton(
              icon: const Icon(Icons.thumb_up),
            )
          ],
        ),
      ],
    ),
  );
}

Widget buildOutlineButton(title) {
  return Align(
    alignment: const Alignment(0.0, -0.2),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(title,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            OutlineButton(
              child: Text('OUTLINE BUTTON'),
              onPressed: () {

              },
            ),
            OutlineButton(
              child: Text('DISABLED'),
            )
          ],
        ),
        ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            OutlineButton.icon(
                icon: const Icon(Icons.add, size: 18.0),
                label: const Text('OUTLINE BUTTON'),
                onPressed: () {

                },
            ),
            OutlineButton.icon(
              icon: const Icon(Icons.add, size: 18.0),
              label: const Text('DISABLED'),
            )
          ],
        )
      ],
    ),
  );
}

Widget buildFlatButton(title) {
  return Align(
    alignment: const Alignment(0.0, -0.2),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(title,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FlatButton(
              child: Text('FLAT BUTTON'),
              onPressed: () {

              },
            ),
            FlatButton(
              child: Text('DISABLED'),
            )
          ],
        ),
        ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FlatButton.icon(
              icon: const Icon(Icons.add_circle_outline, size: 18.0),
              label: const Text('FLAT BUTTON'),
              onPressed: () {

              },
            ),
            FlatButton.icon(
              icon: const Icon(Icons.add_circle_outline, size: 18.0),
              label: const Text('DISABLED'),
            )
          ],
        )
      ],
    ),
  );
}

Widget buildRaisedButton(title) {
  return Align(
    alignment: const Alignment(0.0, -0.2),
    child: new Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Text(title, textAlign: TextAlign.center, style: new TextStyle(fontWeight: FontWeight.bold)),
        new ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new RaisedButton(
              child: const Text("RAISED BUTTON"),
              onPressed: () {

              },
            ),
            const RaisedButton(
              child: const Text("DISABLED"),
              onPressed: null,
            )
          ],
        ),
        new ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new RaisedButton.icon(
              icon: const Icon(Icons.add, size: 18.0),
              label: const Text("RAISED BUTTON"),
              onPressed: () {

              },
            ),
            new RaisedButton.icon(
              icon: const Icon(Icons.add, size: 18.0),
              label: const Text("RAISED BUTTON"),
              onPressed: null
            ),
          ],
        )
      ],
    ),
  );
}