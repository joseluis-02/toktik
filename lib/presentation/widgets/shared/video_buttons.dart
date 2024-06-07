import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_2024/domain/entities/video_post.dart';
import 'package:tiktok_2024/helpers/human_formats.dart';

class VideoButtons extends StatelessWidget {

  final VideoPost video;
  const VideoButtons({
      super.key, 
      required this.video
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _customIconButton(
            value: video.likes, 
            iconData: Icons.favorite, 
            iconColor: Colors.red,
          ),

          const SizedBox(height: 10,),

          _customIconButton(
            value: video.views, 
            iconData: Icons.remove_red_eye_outlined
          ),

          const SizedBox(height: 10,),

          SpinPerfect(
            infinite: true,
            duration: const Duration(seconds: 2),
            child: const _customIconButton(
              value: 0, 
              iconData: Icons.play_circle_outline
            ),
          ),
      ],
    );
  }
}

class _customIconButton extends StatelessWidget {

  final int value;
  final IconData iconData;
  final Color? color;
  const _customIconButton({
      required this.value, 
      required this.iconData, 
      iconColor
    }): color = iconColor?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        IconButton(
          onPressed: () {
            
          }, 
          icon: Icon( iconData, color: color,size: 30,)
          ),

          if(value>0)
          Text( HumanFormats.humanReadbleNumber(value.toDouble()) )

      ],
    );
  }
}