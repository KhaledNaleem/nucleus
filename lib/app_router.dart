import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pages/login_page.dart';
import 'pages/shell.dart';
import 'pages/settings_page.dart';
import 'pages/profile_page.dart';
import 'pages/product_list_page.dart';
import 'pages/product_details_page.dart';
import 'pages/chat_bot_page.dart';

GoRouter createRouter({required VoidCallback onToggleTheme}) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => LoginPage(
          onLogin: () => context.go('/app/products'),
        ),
      ),
      ShellRoute(
        builder: (context, state, child) => AppShell(
          onToggleTheme: onToggleTheme,
          child: child,
        ),
        routes: [
          GoRoute(
            path: '/app/products',
            name: 'products',
            builder: (context, state) => const ProductListPage(),
          ),
          GoRoute(
            path: '/app/product/:id',
            name: 'product-details',
            builder: (context, state) => ProductDetailsPage(id: state.pathParameters['id'] ?? '1'),
          ),
          GoRoute(
            path: '/app/settings',
            name: 'settings',
            builder: (context, state) => const SettingsPage(),
          ),
          GoRoute(
            path: '/app/profile',
            name: 'profile',
            builder: (context, state) => const ProfilePage(),
          ),
          GoRoute(
            path: '/app/assistant',
            name: 'assistant',
            builder: (context, state) => const ChatBotPage(),
          ),
        ],
      ),
    ],
  );
}
