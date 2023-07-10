import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/password_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class EmailScreenArgs {
  final String username;

  EmailScreenArgs({required this.username});
}

class EmailScreen extends StatefulWidget {
  final String username;
  const EmailScreen({
    super.key,
    required this.username,
  });

  // final String username;
  static String routeName = "/email";

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  String _email = '';
  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  String? _isEmailValid() {
    if (_email.isEmpty) return null;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(_email)) {
      return "Email not valid";
    }
    return null;
  }

  void _onSaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (_email.isEmpty || _isEmailValid() != null) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const PasswordScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)?.settings.arguments as EmailScreenArgs;

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
            Text(
              "${widget.username}님  이메일을 입력하세요.", //${args.username} 님 이메일을 입력하ㅅ0ㅇㅅ
              style: const TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gaps.v16,
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              onEditingComplete: _onSubmit,
              autocorrect: false,
              decoration: InputDecoration(
                hintText: "이메일 주소",
                errorText: _isEmailValid(),
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
            RichText(
              text: const TextSpan(
                text: '계속하면 TikTok의 ',
                style: TextStyle(fontSize: 12, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: '서비스 약관',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: '에 동의하고 TikTok의 \n',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  TextSpan(
                    text: '개인정보 처리방침',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text:
                        '을(를) 읽었음을 확인하는 것입니다. 이메일은 회원님이 알 수도 있는 사람과 연결하고 광고 경험을 개인화하는 것을 포함하여 TiKTok 경험을 개선하는 데 사용됩니다. ',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  TextSpan(
                    text: ' 자세히 알아보기',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                    text: "다음",
                    disabled: _email.isEmpty || _isEmailValid() != null))
          ]),
        ),
      ),
    );
  }
}
