import 'package:flutter/material.dart';

class qatraPage extends StatelessWidget {
  final surah;

  final aya;

   qatraPage({Key? key, this.surah, this.aya}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(child: Image.asset('assets/qatra/qatra-$surah-$aya.jpg'),);
  }
}
