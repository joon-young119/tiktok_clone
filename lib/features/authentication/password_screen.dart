import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/birthday_screen.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  String _password = '';

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordValid() {
    return (_password.isNotEmpty &&
        _password.length > 8 &&
        _password.length < 20);
  }

  void _onSaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (!_isPasswordValid()) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const BirthDayScreen(),
      ),
    );
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _toggleObscureText() {
    if (_obscureText == true) {
      setState(() {
        _obscureText = false;
      });
    } else {
      setState(() {
        _obscureText = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onSaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "가입하기",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Gaps.v40,
            const Text(
              "비밀번호 만들기",
              style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gaps.v16,
            TextField(
              controller: _passwordController,
              onEditingComplete: _onSubmit,
              autocorrect: false,
              obscureText: _obscureText,
              decoration: InputDecoration(
                suffix: Row(mainAxisSize: MainAxisSize.min, children: [
                  GestureDetector(
                    onTap: _onClearTap,
                    child: FaIcon(
                      FontAwesomeIcons.solidCircleXmark,
                      color: Colors.grey.shade400,
                      size: Sizes.size20,
                    ),
                  ),
                  Gaps.h16,
                  GestureDetector(
                    onTap: _toggleObscureText,
                    child: FaIcon(
                      _obscureText
                          ? FontAwesomeIcons.eyeSlash
                          : FontAwesomeIcons.eye,
                      color: Colors.grey.shade400,
                      size: Sizes.size20,
                    ),
                  ),
                ]),
                hintText: "비밀번호 입력",
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
            Gaps.v10,
            const Text(
              "비밀번호 최소 필수 포함 항목:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Gaps.v10,
            Row(
              children: [
                FaIcon(FontAwesomeIcons.circleCheck,
                    size: Sizes.size20,
                    color: _isPasswordValid()
                        ? Colors.green
                        : Colors.grey.shade400),
                Gaps.h5,
                const Text("8자 (최대 20자)")
              ],
            ),
            Gaps.v16,
            GestureDetector(
                onTap: _onSubmit,
                child: FormButton(text: "다음", disabled: !_isPasswordValid())),
          ]),
        ),
      ),
    );
  }
}
