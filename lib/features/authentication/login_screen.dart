import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';
import 'package:tiktok_clone/features/username_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void onSignUpTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onUsernameTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const UsernameScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
          child: Column(
            children: [
              Gaps.v80,
              const Text(
                "TikTok에 로그인",
                style: TextStyle(
                    fontSize: Sizes.size24, fontWeight: FontWeight.w600),
              ),
              Gaps.v20,
              const Text(
                "계정 관리, 알림 확인, 동영상에 댓글 달기 등.",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v20,
              AuthButton(
                tap: _onUsernameTap,
                icon: const FaIcon(FontAwesomeIcons.user),
                text: "전화 / 이메일 / TikTok ID 사용",
              ),
              Gaps.v14,
              AuthButton(
                tap: _onUsernameTap,
                icon: const FaIcon(FontAwesomeIcons.apple),
                text: "Apple로 계속 진행",
              ),
              Gaps.v14,
              AuthButton(
                tap: _onUsernameTap,
                icon: const FaIcon(FontAwesomeIcons.google),
                text: "Google로 계속 진행",
              ),
              Gaps.v14,
              AuthButton(
                tap: _onUsernameTap,
                icon: FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Colors.blue.shade800,
                ),
                text: "Facebook으로 계속 진행",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () => onSignUpTap(context),
        child: BottomAppBar(
          color: Colors.grey.shade100,
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Sizes.size32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "계정이 없으세요?",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                  ),
                ),
                Gaps.h5,
                Text(
                  "가입하기",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: Sizes.size16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
