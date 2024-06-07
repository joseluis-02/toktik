import 'package:flutter/material.dart';
import 'package:tiktok_2024/domain/entities/video_post.dart';
import 'package:tiktok_2024/domain/repositories/video_posts_repository.dart';
//import 'package:tiktok_2024/infrastructure/models/local_video_model.dart';
//import 'package:tiktok_2024/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier{

  final VideoPostRepository videosRepository;
  
  //TODO: rpository, Datasource
  //Fuentes datos

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({
      required this.videosRepository
    });

  Future<void> LoadNextPage() async {

    //await Future.delayed(const Duration(seconds: 2));
    
    // final List<VideoPost> newVideos = videoPosts.map(
    //   (video) => LocalVideoModel.fromJson(video).toVideoPostEntity()
    // ).toList();
    final newVideos = await videosRepository.getTrendingViewVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading=false;
    //todo: Loading videos
    notifyListeners();
  }

}