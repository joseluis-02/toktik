import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_2024/config/theme/app_theme.dart';
import 'package:tiktok_2024/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:tiktok_2024/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:tiktok_2024/presentation/providers/discover_provider.dart';
import 'package:tiktok_2024/presentation/screens/discover/dicover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository = VideoPostRepositoryImpl(
      videosDatasource: LocalVideoDatasource()
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (context) => DiscoverProvider(videosRepository: videoPostRepository)..LoadNextPage(),
        )
      ],
      child: MaterialApp(
        //Desactiva el modo debug de la pantalla
        debugShowCheckedModeBanner: false,
        //Establecer el tema de la aplicacion
        theme: AppTheme().getTheme(),
        //Titulo de la aplicacion
        title: 'TikGuti',
        //Home
        home:const DiscoverScreen(),
      ),
    );
  }
}