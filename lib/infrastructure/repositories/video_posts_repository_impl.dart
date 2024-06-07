import 'package:tiktok_2024/domain/datasources/video_posts_datasource.dart';
import 'package:tiktok_2024/domain/entities/video_post.dart';
import 'package:tiktok_2024/domain/repositories/video_posts_repository.dart';

class VideoPostRepositoryImpl implements VideoPostRepository{

  final VideoPostDatasource videosDatasource;

  VideoPostRepositoryImpl({
      required this.videosDatasource
    });

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingViewVideosByPage(int page) {

    return videosDatasource.getTrendingViewVideosByPage(page);
  }

}