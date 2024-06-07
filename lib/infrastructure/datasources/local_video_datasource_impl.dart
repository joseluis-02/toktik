import 'package:tiktok_2024/domain/datasources/video_posts_datasource.dart';
import 'package:tiktok_2024/domain/entities/video_post.dart';
import 'package:tiktok_2024/infrastructure/models/local_video_model.dart';

import '../../shared/data/local_video_posts.dart';

class LocalVideoDatasource implements VideoPostDatasource{
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingViewVideosByPage(int page) async{

    await Future.delayed(const Duration(seconds: 3));

    final List<VideoPost> newVideos = videoPosts.map(
      (video) => LocalVideoModel.fromJson(video).toVideoPostEntity()
    ).toList();

    return newVideos;
  }


}