# 🎯 BLoC Integration Guide - Built Glory API

## ✅ Complete BLoC Integration!

Your Flutter app now has **complete BLoC pattern integration** with JWT auth, error handling, and semantic mapping!

---

## 📦 What Was Created

### 1. **BLoC Classes** (`lib/generated/bloc/`)

#### Auth BLoC
```
bloc/auth/
├── auth_event.dart     # Auth events
├── auth_state.dart     # Auth states  
└── auth_bloc.dart      # Auth business logic
```

**Events:**
- `SendOTPEvent` - Send OTP to mobile
- `VerifyOTPEvent` - Verify OTP and login
- `ResendOTPEvent` - Resend OTP
- `LoadUserProfileEvent` - Load user profile
- `UpdateProfileEvent` - Update profile
- `LogoutEvent` - Logout user
- `CheckAuthStatusEvent` - Check auth status

**States:**
- `AuthInitial` - Initial state
- `AuthLoading` - Loading state
- `Authenticated` - User logged in
- `Unauthenticated` - User not logged in
- `OTPSent` - OTP sent successfully
- `OTPResent` - OTP resent
- `ProfileUpdated` - Profile updated
- `AuthError` - Error occurred

#### Property BLoC
```
bloc/property/
├── property_event.dart
├── property_state.dart
└── property_bloc.dart
```

**Events:**
- `LoadPropertiesEvent` - Load all properties
- `LoadHomepagePropertiesEvent` - Load homepage properties
- `LoadPropertyDetailsEvent` - Load property details
- `SearchPropertiesEvent` - Search properties
- `SavePropertyEvent` - Save to wishlist
- `RemovePropertyEvent` - Remove from wishlist

**States:**
- `PropertyInitial`
- `PropertyLoading`
- `PropertiesLoaded` - Properties loaded
- `PropertyDetailsLoaded` - Property details
- `PropertySaved` - Property saved
- `PropertyRemoved` - Property removed
- `PropertyError` - Error occurred
- `PropertiesEmpty` - No properties found

#### Notification BLoC
```
bloc/notification/
├── notification_event.dart
├── notification_state.dart
└── notification_bloc.dart
```

### 2. **BLoC Widgets** (`lib/generated/widgets_bloc/`)

- `PropertyListBlocWidget` - Property list with BLoC
- `PropertyCardBlocWidget` - Property card with BLoC
- `OTPLoginBlocWidget` - Complete OTP login
- `UserProfileBlocWidget` - User profile display

### 3. **BLoC Screens** (`lib/generated/screens_bloc/`)

- `HomeScreenBloc` - Complete home screen ⭐
- `NotificationScreenBloc` - Notifications
- `PropertyDetailsScreenBloc` - Property details

### 4. **Setup Files**

- `bloc_provider_setup.dart` - Global BLoC setup
- `bloc_exports.dart` - Convenient exports

---

## 🚀 Quick Start (3 Steps)

### Step 1: Install Dependencies

```bash
flutter pub get
```

✅ Already added:
- `flutter_bloc: ^9.1.1`
- `equatable: ^2.0.7`

### Step 2: Wrap Your App with BLoC Providers

```dart
// main.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:buildglory/generated/bloc/bloc_provider_setup.dart';

void main() {
  // Optional: Add BLoC observer for debugging
  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProviderSetup(  // ← Wrap with this!
      child: MaterialApp(
        home: const HomeScreenBloc(),
      ),
    );
  }
}
```

### Step 3: Use the New HomeScreen

```dart
import 'package:buildglory/generated/screens_bloc/home_screen_bloc.dart';

// Use HomeScreenBloc instead of your old HomeScreen
Navigator.push(
  context,
  MaterialPageRoute(builder: (_) => const HomeScreenBloc()),
);
```

---

## 🎓 Usage Patterns

### Pattern 1: BlocBuilder (Display State)

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyBloc, PropertyState>(
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
  }
}
```

### Pattern 2: BlocListener (React to State Changes)

```dart
BlocListener<AuthBloc, AuthState>(
  listener: (context, state) {
    if (state is Authenticated) {
      // Navigate to home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreenBloc()),
      );
    } else if (state is AuthError) {
      // Show error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message)),
      );
    }
  },
  child: YourWidget(),
);
```

### Pattern 3: BlocConsumer (Both Builder + Listener)

```dart
BlocConsumer<PropertyBloc, PropertyState>(
  listener: (context, state) {
    if (state is PropertySaved) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Property saved!')),
      );
    }
  },
  builder: (context, state) {
    if (state is PropertyLoading) {
      return CircularProgressIndicator();
    }
    return PropertyList(state);
  },
);
```

### Pattern 4: Dispatch Events

```dart
// Get BLoC and dispatch event
context.read<PropertyBloc>().add(
  LoadHomepagePropertiesEvent(type: 'Apartment'),
);

// Or use BlocProvider
BlocProvider.of<AuthBloc>(context).add(
  SendOTPEvent('9876543210'),
);
```

---

## 🔐 Authentication Flow

### Complete Login Flow

```dart
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OTPLoginBlocWidget(
        onSuccess: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => HomeScreenBloc()),
          );
        },
      ),
    );
  }
}
```

### Check Auth Status

```dart
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => HomeScreenBloc()),
          );
        } else if (state is Unauthenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => LoginScreen()),
          );
        }
      },
      child: Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
```

### Logout

```dart
ElevatedButton(
  onPressed: () {
    context.read<AuthBloc>().add(const LogoutEvent());
  },
  child: Text('Logout'),
);
```

---

## 📱 Property Operations

### Load Properties

```dart
@override
void initState() {
  super.initState();
  // Load properties when screen opens
  context.read<PropertyBloc>().add(
    const LoadHomepagePropertiesEvent(),
  );
}
```

### Search Properties

```dart
ElevatedButton(
  onPressed: () {
    context.read<PropertyBloc>().add(
      SearchPropertiesEvent(
        city: 'Bangalore',
        type: 'Apartment',
        bedrooms: 3,
        minPrice: 5000000,
        maxPrice: 10000000,
      ),
    );
  },
  child: Text('Search'),
);
```

### Save Property

```dart
IconButton(
  icon: Icon(Icons.favorite_border),
  onPressed: () {
    context.read<PropertyBloc>().add(
      SavePropertyEvent(propertyId),
    );
  },
);
```

### Display Property List

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
@override
void initState() {
  super.initState();
  context.read<NotificationBloc>().add(
    const LoadNotificationsEvent(),
  );
}
```

### Display Notification Badge

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

### Mark as Read

```dart
onTap: () {
  if (notification.id != null) {
    context.read<NotificationBloc>().add(
      MarkNotificationAsReadEvent(notification.id!),
    );
  }
}
```

---

## 🎨 Builder.io Semantic Mapping

### Register BLoC Widgets with Builder.io

```dart
// Register PropertyCardBlocWidget
Builder.registerComponent(
  PropertyCardBlocWidget,
  name: 'PropertyCard',
  inputs: [
    {
      'name': 'property',
      'type': 'object',
      'defaultValue': {},
    },
    {
      'name': 'showSaveButton',
      'type': 'boolean',
      'defaultValue': true,
    },
  ],
);

// Register PropertyListBlocWidget
Builder.registerComponent(
  PropertyListBlocWidget,
  name: 'PropertyList',
  inputs: [
    {
      'name': 'filterType',
      'type': 'string',
      'enum': ['Apartment', 'Villa', 'Commercial', 'Plot', 'OrganicHome'],
    },
  ],
);
```

### Semantic Mappings

| Backend Model | BLoC | UI Widget | Builder.io Component |
|---------------|------|-----------|---------------------|
| Property | PropertyBloc | PropertyCardBlocWidget | PropertyCard |
| User | AuthBloc | UserProfileBlocWidget | UserProfile |
| Notification | NotificationBloc | NotificationTile | NotificationItem |

---

## 🐛 Error Handling

### Handle Errors in UI

```dart
BlocBuilder<PropertyBloc, PropertyState>(
  builder: (context, state) {
    if (state is PropertyError) {
      return Column(
        children: [
          Text('Error: ${state.message}'),
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

### Global Error Handling

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProviderSetup(
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: MaterialApp(
          home: HomeScreenBloc(),
        ),
      ),
    );
  }
}
```

---

## 🧪 Testing BLoCs

```dart
void main() {
  group('AuthBloc', () {
    late AuthBloc authBloc;
    late MockAuthService mockAuthService;

    setUp(() {
      mockAuthService = MockAuthService();
      authBloc = AuthBloc(
        authService: mockAuthService,
        profileService: mockProfileService,
      );
    });

    test('emits OTPSent when SendOTPEvent is added', () async {
      when(() => mockAuthService.sendOTP('9876543210'))
          .thenAnswer((_) async => ApiResponse.success({}));

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

## 📊 Architecture

```
UI Layer (Widgets)
     ↓
BLoC Layer (Business Logic)
     ↓
Service Layer (API Calls)
     ↓
API Client (HTTP + JWT)
     ↓
Backend API
```

---

## 🎉 You're Ready!

Your app now has:
- ✅ Complete BLoC integration
- ✅ JWT authentication
- ✅ Property management
- ✅ Notifications
- ✅ Error handling
- ✅ Refactored HomeScreen
- ✅ Builder.io compatible

**Start using BLoC in your app!** 🚀

