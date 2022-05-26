import 'package:flutter/material.dart';
class Favrouites extends StatefulWidget {
  const Favrouites({ Key? key }) : super(key: key);

  @override
  State<Favrouites> createState() => _FavrouitesState();
}

class _FavrouitesState extends State<Favrouites> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Fav'),
    );
  }
}