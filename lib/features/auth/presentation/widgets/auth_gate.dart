import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_notifier_provider.dart';
import '../providers/auth_state.dart';
import '../pages/splash_page.dart';
import '../pages/login_page.dart';
import '../pages/home_page.dart';

class AuthGate extends ConsumerStatefulWidget {
  const AuthGate({super.key});

  @override
  ConsumerState<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends ConsumerState<AuthGate> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(authNotifierProvider.notifier).restoreSession();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Listen for login/auth errors specifically on the login page
    // ref.listen<AuthState>(
    //   authNotifierProvider,
    //   (previous, next) {
    //     if (next.status == AuthStatus.unAuthenticated &&
    //         next.errorMessage != null &&
    //         next.errorMessage != previous?.errorMessage) {
    //       // Show AlertDialog
    //       showDialog(
    //         context: context,
    //         builder: (context) {
    //           return AlertDialog(
    //             title: const Text('Login Failed'),
    //             content: Text(next.errorMessage!),
    //             actions: [
    //               TextButton(
    //                 onPressed: () => Navigator.of(context).pop(),
    //                 child: const Text('OK'),
    //               ),
    //             ],
    //           );
    //         },
    //       );
    //     }
    //   },
    // );

    // ref.listen<AuthState>(
    //   authNotifierProvider,
    //   (previous, next) {
    //     if (next.status == AuthStatus.unAuthenticated &&
    //         next.errorMessage != null &&
    //         next.errorMessage != previous?.errorMessage) {
    //       showDialog(
    //         context: context,
    //         useSafeArea: true,
    //         barrierColor:
    //             Colors.black54, // Flat dark overlay instead of blurred backdrop
    //         builder: (dialogContext) {
    //           return Dialog(
    //             elevation: 0, // Disable heavy shadow rendering
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(12),
    //             ),
    //             child: Padding(
    //               padding: const EdgeInsets.all(20.0),
    //               child: Column(
    //                 mainAxisSize: MainAxisSize.min,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   const Text(
    //                     'Login Failed',
    //                     style: TextStyle(
    //                       fontSize: 18,
    //                       fontWeight: FontWeight.bold,
    //                     ),
    //                   ),
    //                   const SizedBox(height: 12),
    //                   Text(next.errorMessage!),
    //                   const SizedBox(height: 20),
    //                   Align(
    //                     alignment: Alignment.centerRight,
    //                     child: TextButton(
    //                       onPressed: () => Navigator.of(dialogContext).pop(),
    //                       child: const Text('OK'),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           );
    //         },
    //       );
    //     }
    //   },
    // );


    // / Listen for global session-restoration errors
    // ref.listen<AuthState>(
    //   authNotifierProvider,
    //   (previous, next) {
    //     if (next.status == AuthStatus.unAuthenticated &&
    //         next.errorMessage != null &&
    //         next.errorMessage != previous?.errorMessage) {
          
    //       ScaffoldMessenger.of(context)
    //         ..hideCurrentSnackBar()
    //         ..showSnackBar(
    //           SnackBar(
    //             content: Text("Session expired: ${next.errorMessage}"),
    //             backgroundColor: Theme.of(context).colorScheme.error,
    //             behavior: SnackBarBehavior.floating,
    //           ),
    //         );
    //     }
    //   },
    // );

    final authState = ref.watch(authNotifierProvider);
    switch (authState.status) {
      case AuthStatus.restoring:
        return SplashPage();
      case AuthStatus.unAuthenticated:
        return LoginPage();
      case AuthStatus.authenticated:
        return HomePage();
    }
  }
}
