import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';
import 'package:tiktok_clone/features/authentication/username_screen.dart';
import 'package:tiktok_clone/features/navigation/main_navigation_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const LoginScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(5, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  void _onUsernameTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const UsernameScreen(),
    ));
  }

  void _mainTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const MainNavigationScreen(),
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
                "TikTok 가입하기",
                style: TextStyle(
                    fontSize: Sizes.size24, fontWeight: FontWeight.w600),
              ),
              Gaps.v10,
              const Text(
                "프로필 만들기, 다른 계정 팔로우, 나만의 동영상 제작 등.",
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
                text: "전화 또는 이메일 사용",
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
              AuthButton(
                tap: _mainTap,
                icon: FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Colors.blue.shade800,
                ),
                text: "모두 스킵하고하고 메인 페이지로",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () => _onLoginTap(context),
        child: BottomAppBar(
          color: Colors.grey.shade100,
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Sizes.size32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "이미 계정이 있으신가요?",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                  ),
                ),
                Gaps.h5,
                Text(
                  "로그인",
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
