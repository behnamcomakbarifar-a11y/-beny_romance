import '../models/novel.dart';
import '../models/chapter.dart';

final sampleNovel = Novel(
  id: '1',
    title: 'Beny Romance',
      description: 'یک رمان عاشقانه، اجتماعی و روانشناختی',
        chapters: [
            Chapter(
                  id: '1',
                        title: 'فصل اول – آغاز',
                              content: 'این متن آزمایشی فصل اول است...',
                                    isLocked: false,
                                        ),
                                            Chapter(
                                                  id: '2',
                                                        title: 'فصل دوم – تردید',
                                                              content: 'این متن آزمایشی فصل دوم است...',
                                                                    isLocked: true,
                                                                        ),
                                                                          ],
                                                                          );
                                                                          