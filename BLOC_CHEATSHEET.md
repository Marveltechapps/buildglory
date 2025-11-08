# 🚀 BLoC Cheatsheet - Built Glory API

## ⚡ Quick Reference for BLoC Pattern

---

## 🏁 Initial Setup

```dart
// main.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:buildglory/generated/bloc/bloc_provider_setup.dart';
import 'package:buildglory/generated/screens_bloc/home_screen_bloc.dart';

void main() {
  Bloc.observer = AppBlocObserver(); // Optional
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProviderSetup(
      child: MaterialApp(
        home: HomeScreenBloc(),
      ),
    );
  }
}
```

---

## 🔐 Authentication

### Send OTP
```dart
context.read<AuthBloc>().add(SendOTPEvent('9876543210'));
```

### Verify OTP
```dart
context.read<AuthBloc>().add(
  VerifyOTPEvent(
    mobileNumber: '9876543210',
    otp: '123456',
  ),
);
```

### Logout
```dart
context.read<AuthBloc>().add(const LogoutEvent());
```

### Listen to Auth State
```dart
BlocListener<AuthBloc, AuthState>(
  listener: (context, state) {
    if (state is Authenticated) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    } else if (state is AuthError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message)),
      );
    }
  },
  child: YourWidget(),
);
```

### Display Auth State
```dart
BlocBuilder<AuthBloc, AuthState>(
  builder: (context, state) {
    if (state is AuthLoading) {
      return CircularProgressIndicator();
    }
    if (state is Authenticated) {
      return Text('Welcome ${state.user.name}!');
    }
    return LoginButton();
  },
);
```

---

## 🏠 Properties

### Load Properties
```dart
context.read<PropertyBloc>().add(
  const LoadHomepagePropertiesEvent(),
);
```

### Load with Filter
```dart
context.read<PropertyBloc>().add(
  LoadHomepagePropertiesEvent(type: 'Apartment'),
);
```

### Search Properties
```dart
context.read<PropertyBloc>().add(
  SearchPropertiesEvent(
    city: 'Bangalore',
    type: 'Apartment',
    bedrooms: 3,
    minPrice: 5000000,
    maxPrice: 10000000,
  ),
);
```

### Save Property
```dart
context.read<PropertyBloc>().add(
  SavePropertyEvent('property-id'),
);
```

### Display Properties
```dart
BlocBuilder<PropertyBloc, PropertyState>(
  builder: (context, state) {
    if (state is PropertyLoading) {
      return CircularProgressIndicator();
    }
    if (state is PropertiesLoaded) {
      return ListView.builder(
        itemCount: state.properties.length,
        itemBuilder: (context, index) {
          return PropertyCard(state.properties[index]);
        },
      );
    }
    if (state is PropertyError) {
      return Text('Error: ${state.message}');
    }
    return SizedBox.shrink();
  },
);
```

### Use Property Widget
```dart
PropertyListBlocWidget(
  filterType: 'Apartment',
  onPropertyTap: (property) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PropertyDetailsScreenBloc(
          propertyId: property.id!,
        ),
      ),
    );
  },
);
```

---

## 🔔 Notifications

### Load Notifications
```dart
context.read<NotificationBloc>().add(
  const LoadNotificationsEvent(),
);
```

### Mark as Read
```dart
context.read<NotificationBloc>().add(
  MarkNotificationAsReadEvent('notification-id'),
);
```

### Display Unread Badge
```dart
BlocBuilder<NotificationBloc, NotificationState>(
  builder: (context, state) {
    if (state is NotificationsLoaded) {
      return Badge(
        label: Text('${state.unreadCount}'),
        child: Icon(Icons.notifications),
      );
    }
    return Icon(Icons.notifications);
  },
);
```

---

## 🎯 BLoC Patterns

### Pattern 1: BlocBuilder (Display)
```dart
BlocBuilder<PropertyBloc, PropertyState>(
  builder: (context, state) {
    // Build UI based on state
    return Widget();
  },
);
```

### Pattern 2: BlocListener (Side Effects)
```dart
BlocListener<AuthBloc, AuthState>(
  listener: (context, state) {
    // React to state changes
    if (state is Authenticated) {
      // Navigate, show snackbar, etc.
    }
  },
  child: Widget(),
);
```

### Pattern 3: BlocConsumer (Both)
```dart
BlocConsumer<PropertyBloc, PropertyState>(
  listener: (context, state) {
    // Side effects
    if (state is PropertySaved) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Saved!')),
      );
    }
  },
  builder: (context, state) {
    // Build UI
    return Widget();
  },
);
```

### Pattern 4: BlocProvider.value
```dart
BlocProvider.value(
  value: context.read<PropertyBloc>(),
  child: ChildWidget(),
);
```

---

## 🔧 Common Tasks

### Get BLoC Instance
```dart
// Read (doesn't rebuild)
final bloc = context.read<AuthBloc>();

// Watch (rebuilds on change)
final bloc = context.watch<AuthBloc>();

// Select (rebuilds only when specific value changes)
final user = context.select<AuthBloc, User?>(
  (bloc) => bloc.state is Authenticated 
    ? (bloc.state as Authenticated).user 
    : null,
);
```

### Dispatch Event
```dart
context.read<PropertyBloc>().add(LoadPropertiesEvent());
```

### Access Current State
```dart
final state = context.read<PropertyBloc>().state;

if (state is PropertiesLoaded) {
  final properties = state.properties;
}
```

---

## 🐛 Error Handling

### Handle Errors in UI
```dart
BlocBuilder<PropertyBloc, PropertyState>(
  builder: (context, state) {
    if (state is PropertyError) {
      return Column(
        children: [
          Icon(Icons.error, color: Colors.red),
          Text(state.message),
          if (state.canRetry)
            ElevatedButton(
              onPressed: () {
                context.read<PropertyBloc>().add(
                  const LoadPropertiesEvent(),
                );
              },
              child: Text('Retry'),
            ),
        ],
      );
    }
    return YourContent();
  },
);
```

---

## 📱 Ready-to-Use Widgets

```dart
// Login Widget
OTPLoginBlocWidget(
  onSuccess: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomeScreenBloc()),
    );
  },
);

// Property List
PropertyListBlocWidget(
  filterType: 'Apartment',
  onPropertyTap: (property) { ... },
);

// User Profile
UserProfileBlocWidget();

// Home Screen
HomeScreenBloc();

// Notifications
NotificationScreenBloc();
```

---

## 🎨 BLoC + Widget Lifecycle

### Load Data on Screen Init
```dart
class MyScreen extends StatefulWidget {
  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PropertyBloc>().add(
      const LoadPropertiesEvent(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyBloc, PropertyState>(
      builder: (context, state) {
        // Build UI
      },
    );
  }
}
```

---

## 🔄 Refresh Data

### Pull to Refresh
```dart
RefreshIndicator(
  onRefresh: () async {
    context.read<PropertyBloc>().add(
      const LoadPropertiesEvent(),
    );
    // Wait for loading state to complete
    await Future.delayed(Duration(seconds: 1));
  },
  child: PropertyListBlocWidget(),
);
```

---

## 🧪 Testing

```dart
void main() {
  group('AuthBloc', () {
    late AuthBloc authBloc;

    setUp(() {
      authBloc = AuthBloc(
        authService: mockAuthService,
        profileService: mockProfileService,
      );
    });

    test('emits OTPSent when SendOTPEvent is added', () {
      expectLater(
        authBloc.stream,
        emitsInOrder([
          isA<AuthLoading>(),
          isA<OTPSent>(),
        ]),
      );

      authBloc.add(SendOTPEvent('9876543210'));
    });
  });
}
```

---

## 📚 Full Docs

- `BLOC_INTEGRATION_GUIDE.md` - Complete guide
- `BLOC_COMPLETE_SUMMARY.md` - Overview
- `API_CLIENT_GUIDE.md` - API usage
- `BUILDERIO_MAPPING_GUIDE.md` - Builder.io

---

## 💡 Pro Tips

1. **Use `context.read()`** - For one-time actions
2. **Use `context.watch()`** - For reactive updates
3. **Use `BlocProvider.value`** - Pass existing BLoC to child
4. **Use `BlocConsumer`** - When you need both listener and builder
5. **Add `BlocObserver`** - For debugging
6. **Test BLoCs in isolation** - Easy with BLoC pattern

---

**Keep this handy while coding!** 📝

Run your app:
```bash
flutter run
```

