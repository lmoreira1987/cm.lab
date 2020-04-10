import 'package:flutter/material.dart';

class TravelCard {
  const TravelCard({
    this.title,
    this.description
  });

  final String title;
  final List<String> description;
}

final List<TravelCard> destinations = <TravelCard> [
  const TravelCard(
    title: 'Rio de Janeiro',
    description: const <String> [
      'Pão de açucar',
      'Cristo redentor',
      'Maracanã'
    ]
  ),
  const TravelCard(
    title: 'São Paulo',
    description: const <String> [
      'Avenida Paulista',
      'Morumbi',
      'Mercado municipal'
    ]
  ),
  const TravelCard(
    title: 'Cuiaba',
    description: const <String> [
    'Orla do Porto',
    'Prainha',
    'Chapada dos guimarães'
    ]
  )
];

class CardItems extends StatelessWidget {
  CardItems({ Key key, @required this.destinations, this.shape}) : super(key: key);

  static const double height = 160.0;
  final TravelCard destinations;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle descriptionStyle = theme.textTheme.subhead;

    return SafeArea (
      top: false,
      bottom: false,
      child: Container (
        padding: const EdgeInsets.all(8.0),
        height: height,
        child: Card (
          shape: shape,
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Padding (
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                child: Text(
                  destinations.title,
                  style: descriptionStyle.copyWith(color: Colors.redAccent),
                ),
              ),
              Expanded (
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: DefaultTextStyle(
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: descriptionStyle,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding (
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text (
                            destinations.description[0],
                            style: descriptionStyle.copyWith(color: Colors.green)
                          ),
                        ),
                        Text (
                          destinations.description[1]
                        ),
                        Text (
                          destinations.description[2]
                        )
                      ],
                    )
                  ),
                ),
              )
            ],
          ),
        )
      )
    );
  }
}

class CardsPage extends StatefulWidget {
  @override
  _CardsPageState createState() => new _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  ShapeBorder _shape;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Cards page'),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.sentiment_very_satisfied),
            onPressed: () {
              setState(() {
                _shape = _shape != null ? null : const RoundedRectangleBorder(
                  borderRadius: const BorderRadius.only(
                      topLeft: const Radius.circular(16.0),
                      topRight: const Radius.circular(16.0),
                      bottomLeft: const Radius.circular(2.0),
                      bottomRight: const Radius.circular(2.0)
                  ),
                );
              });
            },
          )
        ],
      ),
      body: new ListView(
        itemExtent: CardItems.height,
        padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0, bottom: 0.0),
        children: destinations.map((TravelCard dest) {
          return Container (
            margin: const EdgeInsets.only(bottom: 8.0),
            child: CardItems(destinations: dest, shape: _shape),
          );
        }).toList()
      ),
    );
  }
}