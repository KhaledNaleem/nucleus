import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onLogin;
  const LoginPage({super.key, required this.onLogin});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _user = TextEditingController();
  final _pass = TextEditingController();
  bool _show = false;
  bool _loading = false;
  String? _error;

  Future<void> _submit() async {
    setState(() { _loading = true; _error = null; });
    await Future<void>.delayed(const Duration(milliseconds: 800));
    if (_user.text == 'admin' && _pass.text == 'admin@123') {
      widget.onLogin();
    } else {
      setState(() { _error = 'Invalid username or password. Please try again.'; });
    }
    setState(() { _loading = false; });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 64, height: 64,
                  decoration: BoxDecoration(
                    color: const Color(0xFF284B63),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: const Text('E', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)),
                ),
                const SizedBox(height: 16),
                Text('Welcome to EGUARDIAN', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 4),
                Text('Sign in to access Nucleus', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurface.withValues(alpha: .6))),
                const SizedBox(height: 16),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          if (_error != null) ...[
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFE5E9),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: const Color(0xFFEEA4B1)),
                              ),
                              child: Text(_error!, style: const TextStyle(color: Color(0xFFB00020))),
                            ),
                            const SizedBox(height: 8),
                          ],
                          const Text('Username'),
                          const SizedBox(height: 6),
                          TextFormField(
                            controller: _user,
                            decoration: const InputDecoration(hintText: 'Enter your username'),
                            enabled: !_loading,
                          ),
                          const SizedBox(height: 12),
                          const Text('Password'),
                          const SizedBox(height: 6),
                          TextFormField(
                            controller: _pass,
                            obscureText: !_show,
                            decoration: InputDecoration(
                              hintText: 'Enter your password',
                              suffixIcon: IconButton(
                                onPressed: () => setState(() => _show = !_show),
                                icon: Icon(_show ? Icons.visibility_off : Icons.visibility),
                              ),
                            ),
                            enabled: !_loading,
                          ),
                          const SizedBox(height: 16),
                          FilledButton(
                            onPressed: _loading ? null : _submit,
                            child: _loading ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)) : const Text('Sign in'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text('© 2025 EGUARDIAN. All rights reserved.', style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
