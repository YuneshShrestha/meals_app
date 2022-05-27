import 'package:flutter/material.dart';
class FavrouitesScreen extends StatefulWidget {
  const FavrouitesScreen({ Key? key }) : super(key: key);

  @override
  State<FavrouitesScreen> createState() => _FavrouitesScreenState();
}

class _FavrouitesScreenState extends State<FavrouitesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Fav'),
    );
  }
}