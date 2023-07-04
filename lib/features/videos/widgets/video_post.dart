import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/videos/widgets/video_button.dart';
import 'package:tiktok_clone/features/videos/widgets/video_comments.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  final Function onVideoFinished;
  final int index;
  const VideoPost({
    super.key,
    required this.onVideoFinished,
    required this.index,
  });

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> with TickerProviderStateMixin {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset("assets/videos/video.mp4");

  bool _isPaused = false;
  final Duration _animationDuration = const Duration(milliseconds: 200);

  late final AnimationController _animationController;

  void _onVideoChange() {
    if (_videoPlayerController.value.isInitialized) {
      if (_videoPlayerController.value.duration ==
          _videoPlayerController.value.position) {
        widget.onVideoFinished();
      }
    }
  }

  void _initVideoPlayer() async {
    // await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    // 이걸로 동영상 실행
    //futurebuilder로 바꿔야할수도?
    _videoPlayerController.addListener(_onVideoChange);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();

    _animationController = AnimationController(
        vsync: this,
        lowerBound: 1.0,
        upperBound: 1.5,
        value: 1.5,
        duration: _animationDuration);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 1 &&
        !_videoPlayerController.value.isPlaying &&
        !_isPaused) {
      _videoPlayerController.play();
    }

    if (info.visibleFraction == 0 && _videoPlayerController.value.isPlaying) {
      _onTogglePause();
    }
    //여기서 에러남. 영상 실행중에 다음영상 넘기면 dispose했는데 _onTogglepause한다고
  }

  void _onTogglePause() {
    if (!mounted) return; // 이걸로 위에 에러 해결
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
      _animationController.reverse();
    } else {
      _videoPlayerController.play();
      _animationController.forward();
    }
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  void _onCommentsTap(BuildContext context) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => const VideoComments());
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                // //futurebuilder로 바꿔야할지도

                : Container(
                    color: Colors.green,
                  ),
          ),
          Positioned.fill(
              child: GestureDetector(
            onTap: _onTogglePause,
          )),
          Positioned.fill(
              child: IgnorePointer(
            child: Center(
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _animationController.value,
                    child: child,
                  );
                },
                child: AnimatedOpacity(
                  opacity: _isPaused ? 1 : 0,
                  duration: _animationDuration,
                  child: const FaIcon(
                    FontAwesomeIcons.play,
                    color: Colors.white,
                    size: Sizes.size52,
                  ),
                ),
              ),
            ),
          )),
          const Positioned(
            bottom: 20,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "박준영",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v10,
                Text(
                  "카페 공부 중 아무거나 찍음",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Positioned(
              bottom: 20,
              right: 10,
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    // foregroundImage: NetworkImage(
                    //     "https://scontent-ssn1-1.xx.fbcdn.net/v/t39.30808-6/278504999_3199372880382359_8450734078474215150_n.jpg?_nc_cat=107&cb=99be929b-59f725be&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=jeQ0d_MDaIQAX-yEis9&_nc_ht=scontent-ssn1-1.xx&oh=00_AfAruRzeuBXA2o98njSFWDET4JAXTLb1LDDUGDSEYpRT-Q&oe=64A2C141"),
                    child: Text("박준영"),
                  ),
                  Gaps.v10,
                  const VideoButton(
                      icon: FontAwesomeIcons.solidHeart, text: "2.9M"),
                  Gaps.v10,
                  GestureDetector(
                      onTap: () => _onCommentsTap(context),
                      child: const VideoButton(
                          icon: FontAwesomeIcons.solidComment, text: "33K")),
                  Gaps.v10,
                  const VideoButton(
                      icon: FontAwesomeIcons.solidBookmark, text: "973"),
                  Gaps.v10,
                  const VideoButton(
                      icon: FontAwesomeIcons.share, text: "Share"),
                ],
              ))
        ],
      ),
    );
  }
}
