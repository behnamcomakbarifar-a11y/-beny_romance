import 'package:flutter/material.dart';
import 'screens/chapter_list_screen.dart';

void main() {
  runApp(const BenyRomanceApp());
  }

  class BenyRomanceApp extends StatelessWidget {
    const BenyRomanceApp({super.key});

      @override
        Widget build(BuildContext context) {
            return MaterialApp(
                  title: 'Beny Romance',
                        debugShowCheckedModeBanner: false,
                              theme: ThemeData(
                                      brightness: Brightness.dark,
                                              fontFamily: 'Serif',
                                                    ),
                                                          home: const ChapterListScreen(),
                                                              );
                                                                }
                                                                }
                                                                