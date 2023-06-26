import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void onSignUpTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.size20),
          child: Column(
            children: [
              Gaps.v80,
              Text(
                "TikTok에 로그인",
                style: TextStyle(
                    fontSize: Sizes.size24, fontWeight: FontWeight.w600),
              ),
              Gaps.v20,
              Text(
                "계정 관리, 알림 확인, 동영상에 댓글 달기 등.",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v20,
              AuthButton(text: "전화 또는 이메일 사용"),
              AuthButton(text: "전화 또는 이메일 사용"),
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
