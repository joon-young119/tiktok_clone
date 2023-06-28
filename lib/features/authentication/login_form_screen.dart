import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/onboarding/intersets_screen.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> formData = {};

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const InterestsScreen(),
            ),
            (route) => false);
      }
      //_formKey.currentState?.validate(); 이거와 같음
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('로그인'),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Gaps.v28,
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "이메일 또는 TikTok ID",
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "이메일을 입력하세요";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      if (newValue != null) {
                        formData['이메일'] = newValue;
                      }
                    },
                  ),
                  Gaps.v16,
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "비밀번호",
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "비밀번호를 입력하세요";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      if (newValue != null) {
                        formData['비밀번호'] = newValue;
                      }
                    },
                  ),
                  Gaps.v20,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "비밀번호를 잊으셨나요?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Gaps.v20,
                  GestureDetector(
                      onTap: _onSubmitTap,
                      child: const FormButton(disabled: false, text: "로그인"))
                ],
              ),
            )));
  }
}
