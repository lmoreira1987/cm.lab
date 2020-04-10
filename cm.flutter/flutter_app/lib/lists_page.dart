import 'package:flutter/material.dart';

enum _MaterialListType {
  oneLine,
  oneLineWithAvatar,
  twoLines,
  threeLines
}

class ListsPage extends StatefulWidget {
  const ListsPage({ Key key }) : super(key: key);

  @override
  _ListsPageState createState() => new _ListsPageState();
}

class _ListsPageState extends State<ListsPage> {
  static final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  PersistentBottomSheetController<Null> _bottomSheet;
  _MaterialListType _itemType = _MaterialListType.threeLines;
  bool _reverseSort = false;
  bool _showAvatars = true;
  bool _showIcons = false;

  List<String> items = <String>[
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'Y', 'X', 'Z'
  ];

  void changeItemType(_MaterialListType type) {
    setState(() {
      _itemType = type;
    });
    _bottomSheet?.setState(() { });
  }

  void _showConfigurationSheet() {
    final PersistentBottomSheetController<Null> bottomSheet = scaffoldKey.currentState.showBottomSheet((BuildContext bottomSheetContext) {
      return new Container(
        decoration: const BoxDecoration(
          border: const Border(top: const BorderSide(color: Colors.black26)),
        ),
        child: new ListView(
          shrinkWrap: true,
          primary: false,
          children: <Widget>[
            new MergeSemantics(
              child: new ListTile(
                  dense: true,
                  title: const Text('One'),
                  trailing: new Radio<_MaterialListType>(
                    groupValue: _itemType,
                    onChanged: changeItemType,
                    value: null,
                  )
              ),
            ),
            new MergeSemantics(
              child: new ListTile(
                  dense: true,
                  title: const Text('Two lines'),
                  trailing: new Radio<_MaterialListType>(
                    value: _MaterialListType.twoLines,
                    groupValue: _itemType,
                    onChanged: changeItemType,
                  )
              ),
            ),
            new MergeSemantics(
              child: new ListTile(
                dense: true,
                title: const Text('Three lines'),
                trailing: new Radio<_MaterialListType>(
                  value: _MaterialListType.threeLines,
                  groupValue: _itemType,
                  onChanged: changeItemType,
                ),
              ),
            ),
            new MergeSemantics(
                child: ListTile(
                  dense: true,
                  title: const Text('Show Avatar'),
                  trailing: Checkbox(
                      value: _showAvatars,
                      onChanged: (bool value) {
                        setState(() {
                          _showAvatars = value;
                        });
                        _bottomSheet?.setState(() {});
                      }
                  ),
                )
            ),
            new MergeSemantics(
                child: ListTile(
                  dense: true,
                  title: const Text('Show Icon'),
                  trailing: Checkbox(
                      value: _showIcons,
                      onChanged: (bool value) {
                        setState(() {
                          _showIcons = value;
                        });
                        _bottomSheet?.setState(() {});
                      }
                  ),
                )
            ),
          ],
        ),
      );
    });

    setState(() {
      _bottomSheet = bottomSheet;
    });

    _bottomSheet.closed.whenComplete(() {
      if (mounted) {
        setState(() {
          _bottomSheet = null;
        });
      }
    });
  }

  Widget buildListTile(BuildContext context, String item) {
    Widget secondary;
    if (_itemType == _MaterialListType.twoLines) {
      secondary = const Text('Secondary text');
    } else if (_itemType == _MaterialListType.threeLines) {
      secondary = const Text(
        'Essa linha adicional aparece com o modelo 3 linhas. Vou adicionar mais texto aqui para quebrar a terceira linha..',
      );
    }
    return new MergeSemantics(
      child: new ListTile(
        isThreeLine: _itemType == _MaterialListType.threeLines,
        leading: _showAvatars ? ExcludeSemantics(child: CircleAvatar(child: Text(item))): null,
        trailing: _showIcons ? Icon(Icons.info, color: Theme.of(context).disabledColor) : null,
        title: Text('This item is the letter $item.'),
        subtitle: secondary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Iterable<Widget> listTiles = items.map((String item) => buildListTile(context, item));
    listTiles = ListTile.divideTiles(context: context, tiles: listTiles);

    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text('Lists page'),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.sort_by_alpha),
            onPressed: () {
              setState(() {
                _reverseSort = !_reverseSort;
                items.sort((String a, String b) => _reverseSort ? b.compareTo(a) : a.compareTo(b));
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: _bottomSheet == null ? _showConfigurationSheet : null,
          )
        ],
      ),
      body: Scrollbar(
          child: ListView(
            padding: new EdgeInsets.symmetric(vertical: 8.0),
            children: listTiles.toList(),
          )
      ),
    );
  }
}