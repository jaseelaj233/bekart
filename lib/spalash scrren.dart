// import 'package:bekart/ob1.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class Splashscreen extends StatefulWidget {
//   const Splashscreen({super.key});

//   @override
//   State<Splashscreen> createState() => _SplashscreenState();
// }

// class _SplashscreenState extends State<Splashscreen>
//     with SingleTickerProviderStateMixin {
//   @override
//   void initState() {
//     super.initState();

//     // Enable immersive mode (hides the system UI for a full-screen splash)
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

//     // Navigate to another screen after a delay
//     Future.delayed(const Duration(seconds: 5), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (context) => const Ob1(), // Destination screen
//         ),
//       );
//     });
//   }

//   @override
//   void dispose() {
//     // Restore the system UI mode to normal when the splash screen is disposed
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
//         overlays: SystemUiOverlay.values);
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         decoration:  BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color.fromARGB(255, 157, 73, 21), Colors.black],
//             begin: Alignment.topRight,
//             end: Alignment.bottomLeft,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 30,
//               backgroundImage: AssetImage(
//                   'assets/WhatsApp Image 2024-10-05 at 6.52.37 PM.jpeg'),
//             ),
//             Text(
//               'Bekart'
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:bekart/ob1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    // Enable immersive mode (hides the system UI for a full-screen splash)
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // Navigate to another screen after a delay
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Ob1(), // Destination screen
        ),
      );
    });
  }

  @override
  void dispose() {
    // Restore the system UI mode to normal when the splash screen is disposed
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 157, 73, 21), Colors.black],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                  'assets/WhatsApp Image 2024-10-05 at 6.52.36 PM.jpeg'),
              onBackgroundImageError: (error, stackTrace) {
                // Handle image loading error
                print("Error loading image: $error");
              },
            ),
            const SizedBox(
                height: 20), // Add some space between the image and text
            const Text(
              'BEKART',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
