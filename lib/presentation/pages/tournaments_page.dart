import 'package:flutter/material.dart';

class TournamentsPage extends StatelessWidget {
  const TournamentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tournaments Dashboard"),
      ),
      body: const Center(
        child: Text(
          "Home Page Tournaments Dashboard",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}