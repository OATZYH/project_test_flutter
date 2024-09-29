import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text('Supabase Auth UI'),
              const SizedBox(height: 20),
              const Text('Remove it already'),
              // SupaEmailAuth(
              //   redirectTo: kIsWeb ? null : 'io.mydomain.myapp://callback',
              //   onSignInComplete: (response) {},
              //   onSignUpComplete: (response) {},
              //   metadataFields: [
              //     MetaDataField(
              //       prefixIcon: const Icon(Icons.person),
              //       label: 'Username',
              //       key: 'username',
              //       validator: (val) {
              //         if (val == null || val.isEmpty) {
              //           return 'Please enter something';
              //         }
              //         return null;
              //       },
              //     ),
              //   ],
              // ),
              // SupaSocialsAuth(
              //   socialProviders: const [
              //     OAuthProvider.apple,
              //     OAuthProvider.google,
              //   ],
              //   colored: true,
              //   redirectUrl: kIsWeb ? null : 'io.mydomain.myapp://callback',
              //   onSuccess: (Session response) {},
              //   onError: (error) {},
              // ),
              ElevatedButton(
                onPressed: () {
                  // Pop the current screen off the stack and return to the first screen
                  Navigator.pop(context);
                },
                child: const Text('Go back to First Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
