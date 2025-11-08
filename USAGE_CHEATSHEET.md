# 🚀 Usage Cheatsheet - Built Glory API with Riverpod

## ⚡ Quick Reference

---

## 🏁 Initial Setup (One Time)

```bash
# 1. Get dependencies
flutter pub get

# 2. Run the app
flutter run
```

```dart
// 3. Wrap your app (main.dart)
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}
```

---

## 🔐 Authentication

### Login with OTP

```dart
// Use the ready-made widget
OTPLoginWidget(
  onSuccess: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomeScreenRiverpod()),
    );
  },
)
```

### Manual Login

```dart
class MyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(authStateProvider.notifier);
    
    // Send OTP
    await notifier.sendOTP('9876543210');
    
    // Verify OTP
    final success = await notifier.verifyOTP(
      mobileNumber: '9876543210',
      otp: '123456',
    );
    
    // Logout
    await notifier.logout();
  }
}
```

### Check Auth Status

```dart
final authState = ref.watch(authStateProvider);

if (authState.isAuthenticated) {
  // User is logged in
  final user = authState.user;
}
```

---

## 🏠 Properties

### Display Property List

```dart
PropertyListWidget(
  filterType: 'Apartment',
  onPropertyTap: (property) {
    // Navigate to details
  },
)
```

### Get All Properties

```dart
final properties = ref.watch(allPropertiesProvider);

properties.when(
  data: (props) => ListView(...),
  loading: () => CircularProgressIndicator(),
  error: (err, _) => Text('Error: $err'),
);
```

### Get Property by ID

```dart
final property = ref.watch(propertyByIdProvider('property-id'));
```

### Search Properties

```dart
final notifier = ref.read(propertyStateProvider.notifier);

notifier.searchProperties(
  city: 'Bangalore',
  type: 'Apartment',
  bedrooms: 3,
  minPrice: 5000000,
  maxPrice: 10000000,
);
```

### Save Property

```dart
final notifier = ref.read(propertyStateProvider.notifier);
await notifier.saveProperty('property-id');
```

---

## 🏷️ Sell Listings

### Display Sell List

```dart
final sells = ref.watch(allSellsProvider);

sells.when(
  data: (sellList) => ListView.builder(
    itemCount: sellList.length,
    itemBuilder: (context, index) {
      return SellCardWidget(sell: sellList[index]);
    },
  ),
  loading: () => CircularProgressIndicator(),
  error: (err, _) => Text('Error: $err'),
);
```

---

## 🔔 Notifications

### Display Notifications

```dart
final notifications = ref.watch(userNotificationsProvider);

notifications.when(
  data: (notifs) => ListView(...),
  loading: () => CircularProgressIndicator(),
  error: (err, _) => Text('Error: $err'),
);
```

### Get Unread Count

```dart
final unreadCount = ref.watch(unreadNotificationsCountProvider);

unreadCount.when(
  data: (count) => Badge(label: Text('$count')),
  loading: () => SizedBox.shrink(),
  error: (_, __) => SizedBox.shrink(),
);
```

### Mark as Read

```dart
final service = ref.read(notificationServiceProvider);
await service.markAsRead('notification-id');

// Refresh
ref.invalidate(userNotificationsProvider);
```

---

## 🔄 Refresh Data

```dart
// Method 1: Refresh provider
ref.refresh(allPropertiesProvider);

// Method 2: Invalidate (forces reload)
ref.invalidate(allPropertiesProvider);

// Method 3: Pull-to-refresh
RefreshIndicator(
  onRefresh: () => ref.refresh(allPropertiesProvider.future),
  child: PropertyListWidget(),
);
```

---

## 💾 User History

```dart
final history = ref.watch(userHistoryProvider);

history.when(
  data: (h) => Column(
    children: [
      Text('Buy: ${h?.buyList.length ?? 0}'),
      Text('Sell: ${h?.sellList.length ?? 0}'),
      Text('Exchange: ${h?.exchangeList.length ?? 0}'),
    ],
  ),
  loading: () => CircularProgressIndicator(),
  error: (err, _) => Text('Error: $err'),
);
```

---

## 🎨 Error Handling

### Using AsyncValueWidget

```dart
AsyncValueWidget<List<Property>>(
  value: ref.watch(allPropertiesProvider),
  data: (properties) => ListView(...),
  error: (err, stack) => ErrorDisplay(error: err.toString()),
  loading: () => CircularProgressIndicator(),
);
```

### Manual Error Handling

```dart
final state = ref.watch(propertyStateProvider);

if (state.error != null) {
  ErrorDisplay(
    error: state.error,
    onRetry: () => ref.read(propertyStateProvider.notifier).loadProperties(),
  );
}
```

---

## 📱 Widget Reference

| Widget | Import | Usage |
|--------|--------|-------|
| `OTPLoginWidget` | `generated/widgets/auth_widgets.dart` | Login screen |
| `PropertyListWidget` | `generated/widgets/property_widgets.dart` | Property list |
| `PropertyCardWidget` | `generated/widgets/property_widgets.dart` | Property card |
| `PropertyDetailsWidget` | `generated/widgets/property_widgets.dart` | Property details |
| `AsyncValueWidget` | `generated/widgets/async_value_widget.dart` | Handle async |
| `ErrorDisplay` | `generated/widgets/async_value_widget.dart` | Show errors |
| `EmptyState` | `generated/widgets/async_value_widget.dart` | Empty state |

---

## 🔧 Provider Reference

| Provider | Type | Returns |
|----------|------|---------|
| `authStateProvider` | StateNotifier | AuthState |
| `propertyStateProvider` | StateNotifier | PropertyState |
| `allPropertiesProvider` | FutureProvider | List<Property> |
| `propertyByIdProvider(id)` | FutureProvider | Property? |
| `allSellsProvider` | FutureProvider | List<Sell> |
| `allExchangesProvider` | FutureProvider | List<Exchange> |
| `savedPropertiesProvider` | FutureProvider | SavedProperty? |
| `userNotificationsProvider` | FutureProvider | List<Notification> |
| `unreadNotificationsCountProvider` | FutureProvider | int |
| `currentUserProvider` | FutureProvider | User? |

---

## 🎯 Common Patterns

### Pattern 1: ConsumerWidget

```dart
class MyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(someProvider);
    return Text('$data');
  }
}
```

### Pattern 2: ConsumerStatefulWidget

```dart
class MyWidget extends ConsumerStatefulWidget {
  @override
  ConsumerState<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<MyWidget> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(someProvider);
    return Text('$data');
  }
}
```

### Pattern 3: Read vs Watch

```dart
// Watch - rebuilds when value changes
final data = ref.watch(someProvider);

// Read - one-time read, no rebuild
final service = ref.read(someServiceProvider);
await service.doSomething();

// Listen - react to changes
ref.listen<AuthState>(authStateProvider, (previous, next) {
  if (next.isAuthenticated) {
    // Navigate to home
  }
});
```

---

## 📚 Full Docs

- `RIVERPOD_INTEGRATION_GUIDE.md` - Complete guide
- `BUILDERIO_MAPPING_GUIDE.md` - Builder.io setup
- `API_CLIENT_GUIDE.md` - API reference
- `QUICK_START.md` - Quick start

---

## 🚀 Ready-to-Use Screens

```dart
import 'package:buildglory/generated/screens/home_screen_riverpod.dart';

// Drop-in replacement for HomeScreen
Navigator.push(
  context,
  MaterialPageRoute(builder: (_) => HomeScreenRiverpod()),
);
```

---

## 💡 Pro Tips

1. **Use `ref.watch()` in build method**
2. **Use `ref.read()` for one-time actions**
3. **Use `ref.listen()` for side effects**
4. **Invalidate to force refresh**
5. **Use `.family` for parameterized providers**
6. **Use `.select()` to optimize rebuilds**

---

**Keep this handy while coding!** 📝

