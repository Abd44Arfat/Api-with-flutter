import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../model/model.dart';


class CharacterDetails extends StatelessWidget {
  final Result character;

  CharacterDetails({required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: character.image,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(height: 16),
          Text(
            character.name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            character.status,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}