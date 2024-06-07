import 'package:tiktok_2024/domain/entities/video_post.dart';

abstract class VideoPostRepository{

  Future<List<VideoPost>> getFavoriteVideosByUser( String userID );

  Future<List<VideoPost>> getTrendingViewVideosByPage( int page);
}