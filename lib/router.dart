import 'package:go_router/go_router.dart';
import 'package:tiktok_clone/common/widgets/main_navigation/main_navigation_screen.dart';
import 'package:tiktok_clone/features/authentication/login_screen.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/features/inbox/activity_screen.dart';
import 'package:tiktok_clone/features/inbox/chat_detail_screen.dart';
import 'package:tiktok_clone/features/inbox/chats_screen.dart';
import 'package:tiktok_clone/features/onboarding/intersets_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: SignUpScreen.routeName,
      path: SignUpScreen.routeURL,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      name: LoginScreen.routeName,
      path: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: InterestsScreen.routeName,
      path: InterestsScreen.routeURL,
      builder: (context, state) => const InterestsScreen(),
    ),
    GoRoute(
      path: "/:tab(home|discover|inbox|profile)",
      name: MainNavigationScreen.routeName,
      builder: (context, state) {
        final tab = state.params["tab"]!;
        return MainNavigationScreen(tab: tab);
      },
    ),
    GoRoute(
      name: ActivityScreen.routeName,
      path: ActivityScreen.routeURL,
      builder: (context, state) => const ActivityScreen(),
    ),
    GoRoute(
      name: ChatsScreen.routeName,
      path: ChatsScreen.routeURL,
      builder: (context, state) => const ChatsScreen(),
      routes: [
        GoRoute(
          name: ChatDetailScreen.routeName,
          path: ChatDetailScreen.routeURL,
          builder: (context, state) {
            final chatId = state.params["chatId"]!;
            return ChatDetailScreen(
              chatId: chatId,
            );
          },
        )
      ],
    ),
    //  GoRoute(
    //     path: VideoRecordingScreen.routeURL,
    //     name: VideoRecordingScreen.routeName,
    //     builder: (context, state) => const VideoRecordingScreen(),
    //   ),
  ],
);



















// final router = GoRouter(routes: [
//   GoRoute(
//     name: SignUpScreen.routeName,
//     path: SignUpScreen.routeURL,

//     // path: SignUpScreen.routeName,

//     builder: (context, state) => const SignUpScreen(),
//   ),
//   GoRoute(
//     path: LoginScreen.routeName,
//     builder: (context, state) => const LoginScreen(),
//   ),
//   GoRoute(
//     name: "username_screen", // context.pushNamed("username_screen"); 로 라우팅할때 사용
//     path: UsernameScreen.routeName,
//     pageBuilder: (context, state) {
//       return CustomTransitionPage(
//         child: const UsernameScreen(),
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           return FadeTransition(
//             opacity: animation,
//             child: ScaleTransition(
//               scale: animation,
//               child: child,
//             ),
//           );
//         },
//       );
//     },
//   ),
//   // GoRoute(
//   //   path: UsernameScreen.routeName,
//   //   builder: (context, state) => const UsernameScreen(),
//   // ),
//   GoRoute(
//     path: EmailScreen.routeName,
//     builder: (context, state) {
//       final args = state.extra as EmailScreenArgs;
//       return EmailScreen(username: args.username);
//     },
//   ),
//   GoRoute(
//     path: "/users/:username",
//     builder: (context, state) {
//       final username = state.params['username'];
//       final tab = state.queryParams["show"];
//       return UserProfileScreen(username: username!, tab: tab!);
//     },
//   ),
// ]);
