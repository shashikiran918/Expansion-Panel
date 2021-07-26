import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SHASHI',
      home: ExpansionPanelListExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Item {
  Item({
    required this.id,
    required this.name,
    required this.description,
    this.isExpanded = false,
  });

  int id;
  String name;
  String description;
  bool isExpanded;
}

class ExpansionPanelListExample extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ExpansionPanelListExampleState();
  }
}

class ExpansionPanelListExampleState extends State<ExpansionPanelListExample> {

  late List<Item> _items;

  @override
  void initState() {
    super.initState();
    setState(() {
      _items = _generateItems();
    });
  }

  List<Item> _generateItems() {
    return List.generate(20, (int index) {
      return Item(
        id: index,
        name: 'Item $index',
        description: 'Details of item $index',
      );
    });
  }

  ExpansionPanel _buildExpansionPanel(Item item) {
    return ExpansionPanel(
      isExpanded: item.isExpanded,
      backgroundColor: Colors.lightBlueAccent,
      canTapOnHeader: true,
      headerBuilder: (BuildContext context, bool isExpanded) {
        return Container(
          child: ListTile(
            title: Text(item.name),
            subtitle: Text(item.name),
          ),
        );
      },
      body: ListTile(
        title: Text(item.description),
      ),
    );
  }

  ExpansionPanelRadio _buildExpansionPanelRadio(Item item) {
    return ExpansionPanelRadio(
      value: item.id,
      backgroundColor: Colors.lightBlueAccent,
      canTapOnHeader: true,
      headerBuilder: (BuildContext context, bool isExpanded) {
        return Container(
          child: ListTile(
            title: Text(item.name),
            subtitle: Text(item.name),
          ),
        );
      },
      body: ListTile(
        title: Text(item.description),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SHASHI"),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          animationDuration: const Duration(seconds: 2),
          expandedHeaderPadding: EdgeInsets.all(10),
          dividerColor: Colors.red,
          elevation: 4,
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _items[index].isExpanded = !isExpanded;
            });
          },
          children: _items.map((item) => _buildExpansionPanel(item)).toList(),
        ),
      ),
    );
  }
}