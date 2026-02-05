import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
// import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';

import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  // final List<GroceryItem> _groceryItems = [];
  List<GroceryItem> _groceryItems = [];

  var _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(
      'flutterprep-1e5c7-default-rtdb.firebaseio.com',
      'shopping-list.json',
    );
    try {
      final response = await http.get(url);
      // error handling
    if (response.statusCode >= 400) {
      setState(() {
        _error = 'Failed to fetch data. Pleast try again later';
      });
    }

    print(response.body);

    if (response.body == 'null') {
      setState(() {
        _isLoading = false;
      });
      return;
    }

    final Map<String, dynamic> listData = json.decode(response.body);

    final List<GroceryItem> _loadedItems = [];
    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere(
            (catItem) => catItem.value.title == item.value['category'],
          )
          .value;
      _loadedItems.add(
        GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category,
        ),
      );
    }
    setState(() {
        _groceryItems = _loadedItems;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _error = 'Something went wrong. Please try again later.';
      });
      return;
    }
  }

  void _addItem() async {
    // final newItem = await Navigator.of(
    //   context,
    // ).push<GroceryItem>(MaterialPageRoute(builder: (ctx) => NewItem()));

    final newItem = await Navigator.of(
      context,
    ).push<GroceryItem>(MaterialPageRoute(builder: (ctx) => NewItem()));

    if (newItem == null) {
      return;
    }

    setState(() {
      _groceryItems.add(newItem);
    });

    _loadItems();
  }

  void _removeItem(GroceryItem item) async {
    final index = _groceryItems.indexOf(item);

    setState(() {
      _groceryItems.remove(item);
    });

    final url = Uri.https(
      'flutterprep-1e5c7-default-rtdb.firebaseio.com',
      'shopping-list/${item.id}.json',
    );

    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      setState(() {
        _groceryItems.insert(index, item);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Text('No items are selecetd yet.', style: TextStyle(fontSize: 20)),
    );

    if (_isLoading) {
      content = const Center(child: CircularProgressIndicator.adaptive());
    }

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          onDismissed: (direction) {
            _removeItem(_groceryItems[index]);
          },
          key: ValueKey(_groceryItems[index].id),
          child: ListTile(
            title: Text(_groceryItems[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: _groceryItems[index].category.color,
            ),
            trailing: Text(_groceryItems[index].quantity.toString()),
          ),
        ),
      );
    }

    if (_error != null) {
      content = Center(child: Text(_error!, style: TextStyle(fontSize: 20)));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Groceries'),
        actions: [IconButton(onPressed: _addItem, icon: Icon(Icons.add))],
      ),
      body: content,
    );
  }
}
