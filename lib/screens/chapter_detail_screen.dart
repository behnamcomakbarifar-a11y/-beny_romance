import 'package:flutter/material.dart';
import 'models/chapter.dart';

class ChapterDetailScreen extends StatelessWidget {
  final Chapter chapter;

    const ChapterDetailScreen({super.key, required this.chapter});

      @override
        Widget build(BuildContext context) {
            return Scaffold(
                  appBar: AppBar(
                          title: Text(chapter.title),
                                ),
                                      body: Padding(
                                              padding: const EdgeInsets.all(16),
                                                      child: Text(
                                                                chapter.content,
                                                                          style: const TextStyle(
                                                                                      fontSize: 16,
                                                                                                  height: 1.6,
                                                                                                            ),
                                                                                                                    ),
                                                                                                                          ),
                                                                                                                              );
                                                                                                                                }
                                                                                                                                }
                                                                                                                                