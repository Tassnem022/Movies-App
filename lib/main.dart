import 'package:flutter/material.dart';
import 'package:project/Pages/firstPage.dart';
import 'package:project/Providers/moviesProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( ChangeNotifierProvider(create: (context)=> MoviesProvider(), child: const First(),));
}

