import 'package:flutter/material.dart';
import 'chapter_detail_screen.dart';

class ChapterListScreen extends StatelessWidget {
  const ChapterListScreen({super.key});

    @override
      Widget build(BuildContext context) {
          return Scaffold(
                appBar: AppBar(
                        title: const Text('Beny Romance'),
                                centerTitle: true,
                                      ),
                                            body: ListView(
                                                    children: [
                                                              _chapterItem(
                                                                          context,
                                                                                      title: 'فصل اول – آسمان شب',
                                                                                                  content: 'شروع یک عاشقانه آرام زیر ستاره‌ها...',
                                                                                                            ),
                                                                                                                    ],
                                                                                                                          ),
                                                                                                                              );
                                                                                                                                }

                                                                                                                                  Widget _chapterItem(BuildContext context,
                                                                                                                                        {required String title, required String content}) {
                                                                                                                                            return ListTile(
                                                                                                                                                  title: Text(title),
                                                                                                                                                        trailing: const Icon(Icons.arrow_forward_ios),
                                                                                                                                                              onTap: () {
                                                                                                                                                                      Navigator.push(
                                                                                                                                                                                context,
                                                                                                                                                                                          MaterialPageRoute(
                                                                                                                                                                                                      builder: (_) => ChapterDetailScreen(
                                                                                                                                                                                                                    title: title,
                                                                                                                                                                                                                                  content: content,
                                                                                                                                                                                                                                              ),
                                                                                                                                                                                                                                                        ),
                                                                                                                                                                                                                                                                );
                                                                                                                                                                                                                                                                      },
                                                                                                                                                                                                                                                                          );
                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                            