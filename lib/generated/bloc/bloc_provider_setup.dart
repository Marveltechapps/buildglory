import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../api_client_factory.dart';
import 'bloc_exports.dart';

/// Global BLoC Provider Setup
/// 
/// Use this to wrap your app with all BLoC providers
class BlocProviderSetup extends StatelessWidget {
  final Widget child;
  final ApiClientFactory? apiClientFactory;

  const BlocProviderSetup({
    super.key,
    required this.child,
    this.apiClientFactory,
  });

  @override
  Widget build(BuildContext context) {
    final api = apiClientFactory ??
        ApiClientFactory(
          baseUrl: const String.fromEnvironment(
            'API_BASE_URL',
            defaultValue: 'http://localhost:6000/api',
          ),
        );

    return MultiBlocProvider(
      providers: [
        // Auth BLoC
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            authService: api.auth,
            profileService: api.profile,
          ),
        ),

        // Property BLoC
        BlocProvider<PropertyBloc>(
          create: (context) => PropertyBloc(
            propertyService: api.property,
            savedPropertyService: api.savedProperty,
          ),
        ),

        // Notification BLoC
        BlocProvider<NotificationBloc>(
          create: (context) => NotificationBloc(
            notificationService: api.notification,
          ),
        ),
      ],
      child: child,
    );
  }
}

/// BLoC Observer for debugging
class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('${bloc.runtimeType} $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}

