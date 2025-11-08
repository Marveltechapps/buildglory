

# 🎯 Riverpod Integration Guide - Built Glory API

## ✅ Setup Complete!

Your Flutter app now has complete Riverpod integration with the generated API services.

---

## 📦 What Was Created

### 1. **Providers** (`lib/generated/providers/`)

#### `api_providers.dart` - Core API Providers
- `apiClientProvider` - Singleton API client
- `authServiceProvider` - Auth service
- `propertyServiceProvider` - Property service
- `sellServiceProvider` - Sell service
- All other service providers
- `currentUserProvider` - Current logged-in user
- `allPropertiesProvider` - All properties list
- `propertyByIdProvider` - Single property details
- `savedPropertiesProvider` - User's saved properties
- `userNotificationsProvider` - User notifications
- `propertySearchProvider` - Property search

#### `auth_state_notifier.dart` - Auth State Management
- `AuthStateNotifier` - Manages authentication state
- `authStateProvider` - Auth state provider
- Methods: `sendOTP()`, `verifyOTP()`, `logout()`, `updateProfile()`

#### `property_state_notifier.dart` - Property State Management
- `PropertyStateNotifier` - Manages property state
- `propertyStateProvider` - Property state provider
- Methods: `loadProperties()`, `searchProperties()`, `saveProperty()`

### 2. **Widgets** (`lib/generated/widgets/`)

#### `async_value_widget.dart` - UI Helpers
- `AsyncValueWidget<T>` - Generic async state handler
- `ErrorDisplay` - Error message widget
- `LoadingOverlay` - Loading state overlay
- `EmptyState` - Empty state placeholder

#### `property_widgets.dart` - Property UI Components
- `PropertyListWidget` - Property list with refresh
- `PropertyCardWidget` - Property card (Builder.io mappable)
- `PropertyDetailsWidget` - Full property details

#### `auth_widgets.dart` - Authentication UI
- `OTPLoginWidget` - Complete OTP login flow
- `UserProfileWidget` - User profile display
- `AuthGuard` - Protected route wrapper

### 3. **Screens** (`lib/generated/screens/`)

#### `home_screen_riverpod.dart` - Complete Refactored Home
- `HomeScreenRiverpod` - Main home screen with Riverpod
- `BuyListWidget` - Buy properties list
- `SellListWidget` - Sell listings list
- `ExchangeListWidget` - Exchange requests list
- `NotificationScreenRiverpod` - Notifications screen

---

## 🚀 Quick Start

### Step 1: Wrap Your App with ProviderScope

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buildglory/generated/api_exports.dart';

void main() {
  runApp(
    const ProviderScope(  // ← Add this
      child: MyApp(),
    ),
  );
}
```

### Step 2: Use the Refactored HomeScreen

```dart
import 'package:buildglory/generated/screens/home_screen_riverpod.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreenRiverpod(),  // ← Use new screen
    );
  }
}
```

### Step 3: Run Your App

```bash
flutter pub get
flutter run
```

---

## 🎓 Usage Patterns

### Pattern 1: Using Providers Directly

```dart
class MyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch a provider
    final properties = ref.watch(allPropertiesProvider);

    return properties.when(
      data: (props) => ListView.builder(...),
      loading: () => CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
    );
  }
}
```

### Pattern 2: Using State Notifiers

```dart
class MyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch state
    final propertyState = ref.watch(propertyStateProvider);
    
    // Get notifier for actions
    final notifier = ref.read(propertyStateProvider.notifier);

    return Column(
      children: [
        if (propertyState.isLoading)
          CircularProgressIndicator(),
        
        if (propertyState.error != null)
          Text('Error: ${propertyState.error}'),
        
        ElevatedButton(
          onPressed: () => notifier.searchProperties(city: 'Bangalore'),
          child: Text('Search'),
        ),
      ],
    );
  }
}
```

### Pattern 3: Using Auth Guard

```dart
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthGuard(
      child: Scaffold(
        appBar: AppBar(title: Text('Profile')),
        body: UserProfileWidget(),
      ),
    );
  }
}
```

### Pattern 4: Refresh Data

```dart
// Refresh a single provider
ref.refresh(allPropertiesProvider);

// Invalidate to force reload
ref.invalidate(userNotificationsProvider);

// Programmatic refresh in pull-to-refresh
RefreshIndicator(
  onRefresh: () => ref.refresh(allPropertiesProvider.future),
  child: PropertyListWidget(),
);
```

---

## 🔐 Authentication Flow

### Complete Login Flow

```dart
class LoginScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  Future<void> login() async {
    final notifier = ref.read(authStateProvider.notifier);
    
    // Send OTP
    final otpSent = await notifier.sendOTP('9876543210');
    if (!otpSent) return;
    
    // Verify OTP
    final success = await notifier.verifyOTP(
      mobileNumber: '9876543210',
      otp: '123456',
    );
    
    if (success && mounted) {
      // Navigate to home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreenRiverpod()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OTPLoginWidget(
        onSuccess: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => HomeScreenRiverpod()),
          );
        },
      ),
    );
  }
}
```

### Check Auth Status

```dart
class SplashScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    if (authState.isLoading) {
      return CircularProgressIndicator();
    }

    if (authState.isAuthenticated) {
      return HomeScreenRiverpod();
    }

    return LoginScreen();
  }
}
```

---

## 📱 Property Operations

### Load and Display Properties

```dart
class PropertiesScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Properties')),
      body: PropertyListWidget(
        filterType: 'Apartment',
        onPropertyTap: (property) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PropertyDetailsScreen(
                propertyId: property.id!,
              ),
            ),
          );
        },
      ),
    );
  }
}
```

### Search Properties

```dart
class SearchScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final propertyState = ref.watch(propertyStateProvider);
    final notifier = ref.read(propertyStateProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text('Search')),
      body: Column(
        children: [
          // Search controls
          ElevatedButton(
            onPressed: () {
              notifier.searchProperties(
                city: 'Bangalore',
                type: 'Apartment',
                bedrooms: 3,
                minPrice: 5000000,
                maxPrice: 10000000,
              );
            },
            child: Text('Search'),
          ),

          // Results
          Expanded(
            child: propertyState.isLoading
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemCount: propertyState.properties.length,
                    itemBuilder: (context, index) {
                      final property = propertyState.properties[index];
                      return PropertyCardWidget(property: property);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
```

### Save Property to Wishlist

```dart
class PropertyCard extends ConsumerWidget {
  final Property property;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Column(
        children: [
          // Property details...
          
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () async {
              final notifier = ref.read(propertyStateProvider.notifier);
              final success = await notifier.saveProperty(property.id!);
              
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      success ? 'Saved!' : 'Failed to save',
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
```

---

## 🔔 Notifications

### Display Notifications

```dart
class NotificationsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationsAsync = ref.watch(userNotificationsProvider);
    final unreadCount = ref.watch(unreadNotificationsCountProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        actions: [
          // Unread badge
          unreadCount.when(
            data: (count) => Badge(
              label: Text('$count'),
              child: Icon(Icons.notifications),
            ),
            loading: () => SizedBox.shrink(),
            error: (_, __) => SizedBox.shrink(),
          ),
        ],
      ),
      body: AsyncValueWidget(
        value: notificationsAsync,
        data: (notifications) => ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return NotificationTile(notification: notification);
          },
        ),
      ),
    );
  }
}
```

### Mark Notification as Read

```dart
class NotificationTile extends ConsumerWidget {
  final AppNotification notification;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(notification.message),
      tileColor: notification.isRead ? null : Colors.blue.shade50,
      onTap: () async {
        if (!notification.isRead && notification.id != null) {
          final service = ref.read(notificationServiceProvider);
          await service.markAsRead(notification.id!);
          
          // Refresh notifications
          ref.invalidate(userNotificationsProvider);
        }
      },
    );
  }
}
```

---

## 🎨 Custom Providers

### Create Your Own Providers

```dart
// In your own file
final filteredPropertiesProvider = Provider.family<List<Property>, String>(
  (ref, city) {
    final allProperties = ref.watch(allPropertiesProvider).value ?? [];
    return allProperties.where((p) => p.location.city == city).toList();
  },
);

// Use it
final bangaloreProperties = ref.watch(filteredPropertiesProvider('Bangalore'));
```

### Create Custom State Notifier

```dart
class WishlistNotifier extends StateNotifier<List<String>> {
  final SavedPropertyService _service;

  WishlistNotifier(this._service) : super([]) {
    _loadWishlist();
  }

  Future<void> _loadWishlist() async {
    final response = await _service.getSavedProperties();
    response.when(
      success: (saved) => state = saved?.savedProperties ?? [],
      failure: (_) => state = [],
    );
  }

  Future<void> addProperty(String propertyId) async {
    final response = await _service.saveProperty(propertyId);
    if (response.isSuccess) {
      state = [...state, propertyId];
    }
  }

  Future<void> removeProperty(String propertyId) async {
    final response = await _service.removeSavedProperty(propertyId);
    if (response.isSuccess) {
      state = state.where((id) => id != propertyId).toList();
    }
  }
}

final wishlistProvider = StateNotifierProvider<WishlistNotifier, List<String>>(
  (ref) {
    final service = ref.watch(savedPropertyServiceProvider);
    return WishlistNotifier(service);
  },
);
```

---

## 🐛 Error Handling

### Global Error Handler

```dart
class ErrorNotifier extends StateNotifier<String?> {
  ErrorNotifier() : super(null);

  void showError(String error) {
    state = error;
    Future.delayed(Duration(seconds: 3), () => state = null);
  }

  void clearError() => state = null;
}

final errorProvider = StateNotifierProvider<ErrorNotifier, String?>((ref) {
  return ErrorNotifier();
});

// Show errors globally
ref.read(errorProvider.notifier).showError('Something went wrong');

// Listen to errors in UI
class App extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<String?>(errorProvider, (previous, next) {
      if (next != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next)),
        );
      }
    });

    return MaterialApp(...);
  }
}
```

---

## 🎭 Testing

### Test Providers

```dart
void main() {
  test('Auth state changes on login', () async {
    final container = ProviderContainer(
      overrides: [
        authServiceProvider.overrideWithValue(MockAuthService()),
      ],
    );

    final notifier = container.read(authStateProvider.notifier);
    await notifier.verifyOTP(
      mobileNumber: '9876543210',
      otp: '123456',
    );

    expect(container.read(authStateProvider).isAuthenticated, true);
  });
}
```

---

## 📊 Performance Tips

1. **Use `.select()` for Specific Fields**
   ```dart
   final userName = ref.watch(
     authStateProvider.select((state) => state.user?.name),
   );
   ```

2. **Use `.family` for Parameterized Providers**
   ```dart
   final propertyProvider = FutureProvider.family<Property, String>(
     (ref, id) => ref.watch(propertyServiceProvider).getPropertyById(id),
   );
   ```

3. **Use `ref.read()` for One-Time Reads**
   ```dart
   // Don't rebuild when value changes
   final service = ref.read(propertyServiceProvider);
   ```

4. **Invalidate Instead of Refresh for Better Performance**
   ```dart
   // Forces provider to rebuild
   ref.invalidate(allPropertiesProvider);
   ```

---

## 🎉 You're Ready!

Your app now has:
- ✅ Complete Riverpod integration
- ✅ JWT authentication
- ✅ Property management
- ✅ Notifications
- ✅ Error handling
- ✅ Refactored HomeScreen
- ✅ Reusable widgets

**Start using the new providers in your existing screens!** 🚀

