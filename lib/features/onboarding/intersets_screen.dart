import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/onboarding/tutorial_screen.dart';
import 'package:tiktok_clone/features/onboarding/widgets/interests_button.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final ScrollController _scrollController = ScrollController();

  bool _showTitle = false;

  void _onScroll() {
    if (_scrollController.offset > 50) {
      if (_showTitle) return;
      setState(() {
        _showTitle = true;
      });
    } else {
      if (!_showTitle) return;
      setState(() {
        _showTitle = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onNextTap() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TutorialScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    const interests = [
      "일상Tlog",
      "코미디",
      "엔터테인먼트 문화",
      "동물",
      "푸드",
      "뷰티",
      "드라마",
      "교육",
      "DIY",
      "스포츠",
      "Auto",
      "가족",
      "헬스",
      "예술",
      "댄스",
      "가정 및 정원",
      "애니메이션 및 만화",
      "ASMR",
      "야외",
      "생활 꿀팁",
      "동기부여 및 조언",
    ];
    return Scaffold(
      appBar: AppBar(
        title: AnimatedOpacity(
            opacity: _showTitle ? 1 : 0,
            duration: const Duration(milliseconds: 300),
            child: const Text("choose your intersets")),
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size24,
              vertical: Sizes.size16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "관심사 선택",
                  style: TextStyle(
                    fontSize: Sizes.size36,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Gaps.v12,
                const Text(
                  "더 나은 동영상 추천을 받아보세요",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gaps.v64,
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    for (var interest in interests)
                      InterestButton(interest: interest),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size20,
              vertical: Sizes.size14,
            ),
            child: GestureDetector(
              onTap: _onNextTap,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: Sizes.size20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor),
                child: const Text(
                  "다음",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size16,
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
