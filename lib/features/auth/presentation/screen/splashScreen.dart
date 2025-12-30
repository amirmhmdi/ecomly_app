import 'package:ecomly_app/core/common/app/cache_helper.dart';
import 'package:ecomly_app/core/services/injection_container.dart';
import 'package:ecomly_app/core/utils/core_utils.dart';
import 'package:ecomly_app/features/auth/presentation/provider/auth_adapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  static const String path = "/splash";

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authAdapterProvider.notifier).verifyToken();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authAdapterProvider, (previous, next) async {
      if (next is TokenVerified) {
        if (next.isValid) {
          // TODO(Get User Data) : get user's data from user adapter
        } else {
          await sl<CacheHelper>().resetSession();
          CoreUtils.postFrameCallback(() => context.go('/'));
        }
      } else if (next is AuthError) {
        if (next.message.startsWith("401")) {
          await sl<CacheHelper>().resetSession();
          CoreUtils.postFrameCallback(() => context.go('/'));
          return;
        }
      }
    });
    return Scaffold(appBar: AppBar(), body: Container());
  }
}
