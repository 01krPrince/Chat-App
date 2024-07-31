import 'package:flutter/material.dart';
import 'ChatScreen.dart';
import 'package:collection/collection.dart';

class DataSearch extends SearchDelegate<String> {
  final names = [
    {'name': 'Rahul', 'imagePath': 'assets/img/img_9.png', 'phone': '9876543210'},
    {'name': 'Sandhya', 'imagePath': 'assets/img/img_2.png', 'phone': '8765432109'},
    {'name': 'Aryan', 'imagePath': 'assets/img/img_3.png', 'phone': '7654321098'},
    {'name': 'Nikhil', 'imagePath': 'assets/img/img_4.png', 'phone': '6543210987'},
    {'name': 'Vivek', 'imagePath': 'assets/img/img_5.png', 'phone': '5432109876'},
    {'name': 'Gautam', 'imagePath': 'assets/img/img_6.png', 'phone': '4321098765'},
    {'name': 'Dheeraj', 'imagePath': 'assets/img/img_7.png', 'phone': '3210987654'},
    {'name': 'Dev', 'imagePath': 'assets/img/img_8.png', 'phone': '2109876543'},
    {'name': 'Sahil', 'imagePath': 'assets/img/img_10.png', 'phone': '1098765432'},
  ];

  final recentNames = [
    {'name': 'Sandhya', 'imagePath': 'assets/img/img_2.png', 'phone': '8765432109'},
    {'name': 'Nikhil', 'imagePath': 'assets/img/img_4.png', 'phone': '6543210987'},
    {'name': 'Dev', 'imagePath': 'assets/img/img_8.png', 'phone': '2109876543'},
    {'name': 'Gautam', 'imagePath': 'assets/img/img_6.png', 'phone': '4321098765'},
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final result = names.firstWhereOrNull((name) => name['name']!.toLowerCase() == query.toLowerCase());

    if (result == null) {
      return Center(
        child: Text(
          'No results found',
          style: const TextStyle(fontSize: 22 , color: Colors.grey),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              name: result['name']!,
              imagePath: result['imagePath']!,
              phone: result['phone']!,
            ),
          ),
        );
      },
      child: Center(
        child: Text(
          query,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentNames
        : names.where((p) => p['name']!.toLowerCase().startsWith(query.toLowerCase())).toList();

    return ListView.builder(
      itemBuilder: (context, index) {
        final suggestion = suggestionList[index];
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(
                  name: suggestion['name']!,
                  imagePath: suggestion['imagePath']!,
                  phone: suggestion['phone']!,
                ),
              ),
            );
          },
          leading: const Icon(Icons.person),
          title: Text(suggestion['name']!),
        );
      },
      itemCount: suggestionList.length,
    );
  }
}