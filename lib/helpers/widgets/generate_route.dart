// import 'package:flutter/material.dart';
// import 'route_transition.dart';

// Route<dynamic> generateRoute(RouteSettings settings) {
//   switch (settings.name) {
//     case '/welcome':
//       return slideFromRight(const WelcomeScreen());

//     case '/onboarding':
//       return slideFromRight(const OnboardingScreen());
//     case '/home':
//       return slideFromRight(MyHomePage());

//     case '/mainhome':
//       return slideFromRight(MainHomePage());

//     case '/events':
//       return slideFromRight(EventsPage());

//     case '/trips':
//       final args = settings.arguments as TripsPageArguments;
//       return slideFromRight(
//         TripsPage(
//           startLocation: args.startLocation,
//           destination: args.destination,
//         ),
//       );

//     case '/tripsInfo':
//       return slideFromRight(TripsMainPage());

//     case '/map':
//       final args = settings.arguments as Map<String, dynamic>;
//       return slideFromRight(
//         MapDirectionScreen(
//           startLat: args['startLat'],
//           startLong: args['startLong'],
//           desLat: args['desLat'],
//           desLong: args['desLong'],
//           start: args['start'],
//           dest: args['dest'],
//           fare: args['fare'],
//         ),
//       );

//     case '/stories':
//       return slideFromRight(StoriesPage());

//     default:
//       return MaterialPageRoute(
//         builder: (_) => const SplashScreen(),
//       );
//   }
// }
