import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  bool _isWriting = false;

  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  void _stopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.7,
      clipBehavior: Clip.hardEdge,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(Sizes.size10)),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("댓글 245개"),
          actions: [
            IconButton(
                onPressed: _onClosePressed,
                icon: const FaIcon(FontAwesomeIcons.xmark))
          ],
        ),
        body: GestureDetector(
          onTap: _stopWriting,
          child: Stack(children: [
            ListView.separated(
              separatorBuilder: (context, index) => Gaps.v20,
              padding: const EdgeInsets.only(
                top: Sizes.size10,
                bottom: Sizes.size80,
                left: Sizes.size16,
                right: Sizes.size16,
              ),
              itemCount: 10,
              itemBuilder: (context, index) =>
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const CircleAvatar(
                  radius: 18,
                  child: Text("준영"),
                ),
                Gaps.h10,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "준영",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade900,
                            fontSize: Sizes.size14),
                      ),
                      Gaps.v3,
                      const Text(
                          "미안하다 이거 보여주려고 어그로 끌었다.. 나루토 사스케 싸움수준 ㄹㅇ 실화냐? 진짜 세계관 최강자들의 싸움이다.. 그 찐따같던 나루토가 맞나?"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "06-30",
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontSize: Sizes.size12,
                                ),
                              ),
                              Gaps.h16,
                              Text(
                                "회신",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade500,
                                    fontSize: Sizes.size12),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.heart,
                                size: Sizes.size20,
                                color: Colors.grey.shade700,
                              ),
                              Gaps.h2,
                              Text(
                                "50",
                                style: TextStyle(color: Colors.grey.shade700),
                              ),
                              Gaps.h10,
                              FaIcon(
                                FontAwesomeIcons.thumbsDown,
                                size: Sizes.size20,
                                color: Colors.grey.shade700,
                              ),
                              Gaps.h2,
                              Text(
                                "5",
                                style: TextStyle(color: Colors.grey.shade700),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            Positioned(
              bottom: 0,
              width: size.width,
              child: BottomAppBar(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size16,
                      vertical: Sizes.size10,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.grey.shade500,
                            foregroundColor: Colors.white,
                            child: const Text("준영")),
                        Gaps.h10,
                        Expanded(
                          child: SizedBox(
                            height: Sizes.size44,
                            child: TextField(
                              onTap: _onStartWriting,
                              expands: true,
                              minLines: null,
                              maxLines: null,
                              textInputAction: TextInputAction.newline,
                              cursorColor: Theme.of(context).primaryColor,
                              decoration: InputDecoration(
                                hintText: "따뜻한 말을 적어주세요",
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.circular(Sizes.size12),
                                    borderSide: BorderSide.none),
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: Sizes.size10,
                                    horizontal: Sizes.size12),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      right: Sizes.size14),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.at,
                                          color: Colors.grey.shade900,
                                        ),
                                        Gaps.h14,
                                        FaIcon(
                                          FontAwesomeIcons.faceSmile,
                                          color: Colors.grey.shade900,
                                        ),
                                        Gaps.h14,
                                        if (_isWriting)
                                          GestureDetector(
                                            onTap: _stopWriting,
                                            child: FaIcon(
                                              FontAwesomeIcons.circleArrowUp,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          )
                                      ]),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
