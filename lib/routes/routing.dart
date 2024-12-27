import 'package:flutter/material.dart';
import 'package:skills_swap/home_page.dart';
import 'package:skills_swap/presentation/auth/forgot/forgot_email.dart';
import 'package:skills_swap/presentation/auth/forgot/forgot_error_screen.dart';
import 'package:skills_swap/presentation/auth/forgot/forgot_success.dart';
import 'package:skills_swap/presentation/auth/sign_in/sign_in_error.dart';
import 'package:skills_swap/presentation/auth/sign_in/sign_in_success.dart';
import 'package:skills_swap/presentation/auth/sign_in/signin_screen.dart';
import 'package:skills_swap/presentation/auth/sign_up/sign_up_error.dart';
import 'package:skills_swap/presentation/auth/sign_up/sign_up_success.dart';
import 'package:skills_swap/presentation/auth/sign_up/signup_screen.dart';
import 'package:skills_swap/presentation/fragments/PostFragment/create_post.dart';
import 'package:skills_swap/presentation/fragments/PostFragment/see_profile_details.dart';
import 'package:skills_swap/presentation/fragments/ProfileFragment/friends_list.dart';
import 'package:skills_swap/presentation/intro/start_intro.dart';
import 'package:skills_swap/presentation/splash/splash_screen.dart';
import 'package:skills_swap/routes/routing_string.dart';

class Routing {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //
      //
      //
      // Intro
      case IntroScreenroute:
        return MaterialPageRoute(
          builder: (context) => const StartIntro(),
        );

      //
      //
      //
      // Auth
      // Sign Up
      case SignUpScreenroute:
        return MaterialPageRoute(
          builder: (context) => const SignupScreen(),
        );
      // Sign Up Success
      case SignUpSuccessScreenroute:
        return MaterialPageRoute(
          builder: (context) => const SignUpSuccess(),
        );
      // Sign Up Error
      case SignUpErrorScreenroute:
        return MaterialPageRoute(
          builder: (context) => const SignUpError(),
        );
      // Sign In
      case SignInScreenroute:
        return MaterialPageRoute(
          builder: (context) => const SigninScreen(),
        );
      // Sign In Success
      case SignInSuccessScreenroute:
        return MaterialPageRoute(
          builder: (context) => const SignInSuccess(),
        );
      // Sign In Error
      case SignInErrorScreenroute:
        return MaterialPageRoute(
          builder: (context) => const SignInError(),
        );
      // Forgot Email
      case ForgotEmailScreenroute:
        return MaterialPageRoute(
          builder: (context) => const ForgotEmail(),
        );
      // Forgot Password
      // case ForgotPasswordScreenroute:
      //   return MaterialPageRoute(
      //     builder: (context) => const ForgotPassword(),
      //   );
      // Forgot Verify
      // case ForgotVerifyScreenroute:
      //   return MaterialPageRoute(
      //     builder: (context) => const ForgotVerification(),
      //   );
      // Forgot Success
      case ForgotSuccessScreenroute:
        return MaterialPageRoute(
          builder: (context) => const ForgotSuccess(),
        );
      // Forgot Success
      case ForgotErrorScreenroute:
        return MaterialPageRoute(
          builder: (context) => const ForgotErrorScreen(),
        );

      //
      //
      //
      // Home
      // Home Page
      case HomePageScreenroute:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );

      //
      //
      //
      // Profile Fragment
      // Frinds List
      case friendsListScreenroute:
        return MaterialPageRoute(
          builder: (context) => const FriendsList(),
        );
      // See Friends Details
      // case seeFriendsDetailsScreenroute:
      //   return MaterialPageRoute(
      //     builder: (context) => const SeeFriendsDetails(),
      //   );
      // See Request Details
      // case seeRequestDetailsScreenroute:
      //   return MaterialPageRoute(
      //     builder: (context) => const SeeRequestDetails(),
      //   );

      //
      //
      //
      // Post Fragment
      // Post Create
      case PostCreateScreenroute:
        return MaterialPageRoute(
          builder: (context) => const CreatePost(),
        );
      // See Post Details
      // case SeePostDetailsScreenroute:
      //   return MaterialPageRoute(
      //     builder: (context) => const SeePostDetails(),
      //   );
      // See Profile Details
      case SeeProfileDetailsScreenroute:
        return MaterialPageRoute(
          builder: (context) => const SeeProfileDetails(),
        );

      //
      //
      //
      // Search Fragment
      // Post Details
      // case PostDetailsScreenroute:
      //   return MaterialPageRoute(
      //     builder: (context) => const PostDetails(),
      //   );
      // Profile Details
      // case ProfielDetailsScreenroute:
      //   return MaterialPageRoute(
      //     builder: (context) => const ProfileDetails(),
      //   );

      //
      //
      //
      // Message Fragment
      // Message Room
      // case messageRoomScreenroute:
      //   return MaterialPageRoute(
      //     builder: (context) => const MessageRoom(),
      //   );

      //
      //
      //
      // Default
      default:
        // Splash Screen
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }
  }
}
