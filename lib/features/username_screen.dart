import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class UsernameScreen extends StatefulWidget {
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
          Gaps.h16,
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
          FractionallySizedBox(
            widthFactor: 1,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(vertical: Sizes.size16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.size5),
                color: _username.isEmpty
                    ? Colors.grey.shade400
                    : Theme.of(context).primaryColor,
              ),
              child: const Text(
                'Next',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: Sizes.size16),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
