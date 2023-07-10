import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/email_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class UsernameScreen extends StatefulWidget {
  static String routeName = "/username";
  const UsernameScreen({super.key});

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final TextEditingController _usernameController = TextEditingController();
  String _username = '';
  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.text;
      });
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void onNextTap() {
    if (_username.isEmpty) return;
    // Navigator.pushNamed(
    //   context,
    //   EmailScreen.routeName,
    //   arguments: EmailScreenArgs(username: _username),
    // );

    // context.push(
    //   EmailScreen.routeName,
    //   extra: EmailScreenArgs(username: _username),
    // );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EmailScreen(username: _username),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "가입하기",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Gaps.v40,
          const Text(
            "Username 생성",
            style: TextStyle(
              fontSize: Sizes.size20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Gaps.v10,
          const Text(
            "나중에 언제든지 바꿀 수 있습니다.",
            style: TextStyle(fontSize: Sizes.size16, color: Colors.black38),
          ),
          Gaps.v16,
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              hintText: "Username",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade400,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade400,
                ),
              ),
            ),
            cursorColor: Theme.of(context).primaryColor,
          ),
          Gaps.v16,
          GestureDetector(
              onTap: onNextTap,
              child: FormButton(text: "다음", disabled: _username.isEmpty))
        ]),
      ),
    );
  }
}
