# 🚀 BLoC-Only Cheatsheet - Built Glory

## Quick Reference for BLoC Pattern (No Riverpod)

---

## 🏁 **Setup (main.dart)**

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'generated/bloc/bloc_provider_setup.dart';
import 'generated/screens_bloc/home_screen_bloc.dart';

void main() {
  Bloc.observer = AppBlocObserver(); // Debug
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProviderSetup(  // ← Wraps all 5 BLoCs
      child: MaterialApp(
        home: const HomeScreenBloc(),
      ),
    );
  }
}
```

---

## 🔐 **Authentication (AuthBloc)**

### **Send OTP**
```dart
context.read<AuthBloc>().add(SendOTPEvent('9876543210'));
```

### **Verify OTP**
```dart
context.read<AuthBloc>().add(
  VerifyOTPEvent(
    mobileNumber: '9876543210',
    otp: '123456',
  ),
);
```

### **Logout**
```dart
context.read<AuthBloc>().add(const LogoutEvent());
```

### **Update Profile**
```dart
context.read<AuthBloc>().add(
  UpdateProfileEvent(
    name: 'John Doe',
    email: 'john@example.com',
  ),
);
```

### **Listen to Auth State**
```dart
BlocListener<AuthBloc, AuthState>(
  listener: (context, state) {
    if (state is Authenticated) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreenBloc()),
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

### **Display Auth State**
```dart
BlocBuilder<AuthBloc, AuthState>(
  builder: (context, state) {
    if (state is AuthLoading) return CircularProgressIndicator();
    if (state is Authenticated) return Text('Welcome ${state.user.name}!');
    if (state is Unauthenticated) return LoginButton();
    return SizedBox.shrink();
  },
);
```

---

## 🏠 **Properties (PropertyBloc)**

### **Load Properties**
```dart
context.read<PropertyBloc>().add(
  const LoadHomepagePropertiesEvent(),
);
```

### **Load with Filter**
```dart
context.read<PropertyBloc>().add(
  LoadHomepagePropertiesEvent(type: 'Apartment'),
);
```

### **Search Properties**
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

### **Load Property Details**
```dart
context.read<PropertyBloc>().add(
  LoadPropertyDetailsEvent('property-id'),
);
```

### **Save to Wishlist**
```dart
context.read<PropertyBloc>().add(
  SavePropertyEvent('property-id'),
);
```

### **Display Properties**
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

### **Use PropertyListWidget**
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

## 🏷️ **Sell Listings (SellBloc)**

### **Load Sells**
```dart
context.read<SellBloc>().add(const LoadSellsEvent());
```

### **Create Sell**
```dart
final sell = Sell(
  advertisementType: AdvertisementType.sale,
  propertyType: SellPropertyType.apartment,
  bhkType: '3 BHK',
  builtUpArea: 1500,
  location: SellLocation(city: 'Mumbai', locality: 'Andheri'),
  price: 15000000,
);

context.read<SellBloc>().add(CreateSellEvent(sell: sell));
```

### **Display Sells**
```dart
BlocBuilder<SellBloc, SellState>(
  builder: (context, state) {
    if (state is SellsLoaded) {
      return ListView.builder(
        itemCount: state.sells.length,
        itemBuilder: (context, index) {
          return SellCard(state.sells[index]);
        },
      );
    }
    return CircularProgressIndicator();
  },
);
```

---

## 🔄 **Exchange (ExchangeBloc)**

### **Load Exchanges**
```dart
context.read<ExchangeBloc>().add(const LoadExchangesEvent());
```

### **Create Exchange**
```dart
context.read<ExchangeBloc>().add(
  CreateExchangeEvent(
    sellerProperty: 'sell-id',
    matchedProperties: ['prop1', 'prop2'],
    fallbackToBuy: true,
  ),
);
```

### **Display Exchanges**
```dart
BlocBuilder<ExchangeBloc, ExchangeState>(
  builder: (context, state) {
    if (state is ExchangesLoaded) {
      return ListView.builder(
        itemCount: state.exchanges.length,
        itemBuilder: (context, index) {
          return ExchangeCard(state.exchanges[index]);
        },
      );
    }
    return CircularProgressIndicator();
  },
);
```

---

## 🔔 **Notifications (NotificationBloc)**

### **Load Notifications**
```dart
context.read<NotificationBloc>().add(
  const LoadNotificationsEvent(),
);
```

### **Mark as Read**
```dart
context.read<NotificationBloc>().add(
  MarkNotificationAsReadEvent('notification-id'),
);
```

### **Display with Badge**
```dart
BlocBuilder<NotificationBloc, NotificationState>(
  builder: (context, state) {
    if (state is NotificationsLoaded) {
      return Stack(
        children: [
          Icon(Icons.notifications),
          if (state.unreadCount > 0)
            Badge(label: Text('${state.unreadCount}')),
        ],
      );
    }
    return Icon(Icons.notifications);
  },
);
```

---

## 🎯 **BLoC Patterns**

### **Pattern 1: BlocBuilder (Rebuild on State Change)**
```dart
BlocBuilder<PropertyBloc, PropertyState>(
  builder: (context, state) {
    // Build UI based on state
    return Widget();
  },
);
```

### **Pattern 2: BlocListener (React to State Change)**
```dart
BlocListener<AuthBloc, AuthState>(
  listener: (context, state) {
    // Perform action (navigation, show snackbar, etc.)
    if (state is Authenticated) {
      Navigator.push(...);
    }
  },
  child: Widget(),
);
```

### **Pattern 3: BlocConsumer (Both)**
```dart
BlocConsumer<PropertyBloc, PropertyState>(
  listener: (context, state) {
    if (state is PropertySaved) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Saved!')),
      );
    }
  },
  builder: (context, state) {
    return Widget();
  },
);
```

### **Pattern 4: Dispatch Events**
```dart
// Read BLoC and dispatch event
context.read<PropertyBloc>().add(LoadPropertiesEvent());

// Access current state
final state = context.read<PropertyBloc>().state;
```

---

## 🔧 **Common Tasks**

### **Initialize BLoC on Screen Load**
```dart
@override
void initState() {
  super.initState();
  context.read<PropertyBloc>().add(LoadPropertiesEvent());
}
```

### **Refresh Data**
```dart
RefreshIndicator(
  onRefresh: () async {
    context.read<PropertyBloc>().add(LoadPropertiesEvent());
  },
  child: PropertyList(),
);
```

### **Navigate with Result**
```dart
BlocListener<PropertyBloc, PropertyState>(
  listener: (context, state) {
    if (state is PropertyDetailsLoaded) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PropertyDetailsScreen(state.property),
        ),
      );
    }
  },
);
```

---

## 🐛 **Error Handling**

```dart
BlocBuilder<PropertyBloc, PropertyState>(
  builder: (context, state) {
    if (state is PropertyError) {
      return Column(
        children: [
          Icon(Icons.error, color: Colors.red),
          Text(state.message),
          ElevatedButton(
            onPressed: () {
              context.read<PropertyBloc>().add(
                LoadPropertiesEvent(),
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

## 📱 **Ready-to-Use Screens**

```dart
// Home Screen (Buy/Sell/Exchange tabs)
const HomeScreenBloc()

// Property Details
PropertyDetailsScreenBloc(propertyId: 'id')

// Notifications
const NotificationScreenBloc()

// Login (OTP)
OTPLoginBlocWidget(onSuccess: () { ... })
```

---

## 💡 **Pro Tips**

1. **Use context.read()** for one-time actions
2. **Use BlocBuilder** for reactive UI
3. **Use BlocListener** for side effects
4. **Use BlocConsumer** when you need both
5. **Add Bloc.observer** for debugging
6. **Test BLoCs in isolation**

---

## 🎊 **You're Ready!**

Everything is BLoC-only:
- ✅ No Riverpod
- ✅ Pure BLoC pattern
- ✅ All features working
- ✅ Complete integration
- ✅ Production ready

```bash
flutter run
```

**Happy Coding with BLoC! 🚀**

