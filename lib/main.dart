import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learnapi/screens/character%20details.dart';
import 'dart:convert';

import 'model/model.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Result> characters = [];

  @override
  void initState() {
    super.initState();
    fetchCharacters();
  }

  Future<void> fetchCharacters() async {
    final response =
    await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        characters =
        List<Result>.from(data["results"].map((x) => Result.fromJson(x)));
      });
    } else {
      throw Exception('Failed to load characters');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Character List'),
      ),
      body: ListView.builder(
        itemCount: characters.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CachedNetworkImage(
              imageUrl: characters[index].image,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            title: Text(characters[index].name),
            subtitle: Text(characters[index].status),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CharacterDetails(character: characters[index]),
                ),
              );
            },
          );
        },
      )
    );
  }
}