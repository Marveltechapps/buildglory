# Built Glory API Client - Implementation Guide

## 📦 What Was Generated

A complete, production-ready Dart API client has been generated from your OpenAPI specification with the following features:

### ✨ Core Features

- ✅ **HTTP Client** - Built on the `http` package
- ✅ **JWT Authentication** - Automatic token management and injection in headers
- ✅ **Error Handling** - Comprehensive typed error responses
- ✅ **Model Mapping** - Type-safe Dart models with JSON serialization
- ✅ **Type Safety** - Full Dart null safety support
- ✅ **Async/Await** - Modern asynchronous API
- ✅ **File Uploads** - Multipart form data support

## 📁 Generated Structure

```
lib/generated/
├── core/
│   ├── api_client.dart          # Base HTTP client with JWT auth
│   ├── api_error.dart           # Error model with status code helpers
│   ├── api_response.dart        # Generic response wrapper
│   └── auth_manager.dart        # JWT token management interface
│
├── models/
│   ├── user.dart                # User model
│   ├── property.dart            # Property model with enums
│   ├── sell.dart                # Sell listing model
│   ├── exchange.dart            # Exchange model
│   ├── notification.dart        # Notification model with enums
│   ├── feedback.dart            # Feedback model
│   ├── enquiry.dart             # Enquiry model
│   ├── history.dart             # History model
│   └── saved_property.dart      # Saved property model
│
├── services/
│   ├── auth_service.dart           # OTP authentication
│   ├── profile_service.dart        # User profile management
│   ├── property_service.dart       # Property CRUD + search
│   ├── sell_service.dart           # Sell listings + image upload
│   ├── exchange_service.dart       # Property exchanges
│   ├── saved_property_service.dart # Wishlist management
│   ├── history_service.dart        # Activity tracking
│   ├── enquiry_service.dart        # Property enquiries
│   ├── feedback_service.dart       # User feedback
│   └── notification_service.dart   # Push notifications
│
├── api_client_factory.dart      # Main factory class
├── api_exports.dart             # Convenience exports
├── example_usage.dart           # Complete usage examples
└── README.md                    # Detailed documentation
```

## 🚀 Quick Start

### 1. Add Dependencies

Add to your `pubspec.yaml`:

```yaml
dependencies:
  http: ^1.1.0
  # For production, also add:
  # shared_preferences: ^2.2.0  # For persistent token storage
```

### 2. Initialize API Client

```dart
import 'package:buildglory/generated/api_exports.dart';

// Create API client
final api = ApiClientFactory(
  baseUrl: 'http://localhost:6000/api',  // Development
  // baseUrl: 'https://api.builtglory.com/api',  // Production
);
```

### 3. Use Services

```dart
// Authentication
final authResponse = await api.auth.verifyOTP(
  mobileNumber: '9876543210',
  otp: '123456',
);

if (authResponse.isSuccess) {
  final authData = authResponse.data!;
  print('Logged in as: ${authData.user.name}');
}

// Get properties
final properties = await api.property.getAllProperties();

// Search properties
final searchResults = await api.property.searchProperties(
  city: 'Bangalore',
  type: 'Apartment',
  bedrooms: 3,
);

// Save property
await api.savedProperty.saveProperty('property123');

// Submit enquiry
await api.enquiry.submitEnquiry(
  propertyId: 'property123',
  type: EnquiryType.buy,
  message: 'Interested in this property',
);
```

## 🔐 Authentication Flow

The client automatically handles JWT token management:

```dart
// 1. Login (token is automatically saved)
final authResponse = await api.auth.verifyOTP(
  mobileNumber: '9876543210',
  otp: '123456',
);

// 2. Token is automatically included in all subsequent requests
// No need to manually add Authorization header

// 3. Check auth status
final isAuth = await api.auth.isAuthenticated();

// 4. Logout (clears token)
await api.auth.logout();
```

## 🎯 Error Handling

Three patterns for handling errors:

### Pattern 1: Using `when` callback

```dart
final response = await api.property.getPropertyById('123');

response.when(
  success: (property) {
    print('Property: ${property.title}');
  },
  failure: (error) {
    if (error.isUnauthorized) {
      // Redirect to login
    } else if (error.isNotFound) {
      // Show not found message
    } else {
      // Show generic error
      print('Error: ${error.message}');
    }
  },
);
```

### Pattern 2: Using `isSuccess` check

```dart
final response = await api.property.getAllProperties();

if (response.isSuccess) {
  final properties = response.data!;
  // Use properties
} else {
  final error = response.error!;
  showError(error.message);
}
```

### Pattern 3: Try-catch with `dataOrThrow`

```dart
try {
  final property = (await api.property.getPropertyById('123')).dataOrThrow;
  print('Property: ${property.title}');
} on ApiError catch (e) {
  if (e.isUnauthorized) {
    // Redirect to login
  } else {
    showError(e.message);
  }
}
```

## 📱 Complete Feature Coverage

### Authentication Service
- ✅ Send OTP
- ✅ Verify OTP
- ✅ Resend OTP
- ✅ Get user by phone
- ✅ Delete user
- ✅ Logout

### Property Service
- ✅ Get all properties (with filters)
- ✅ Get property by ID
- ✅ Create property
- ✅ Update property
- ✅ Delete property
- ✅ Homepage properties
- ✅ Search properties
- ✅ Explore/filter properties

### Sell Service
- ✅ Get all sell listings
- ✅ Get sell by ID
- ✅ Create sell listing
- ✅ Create with image upload
- ✅ Update sell listing
- ✅ Delete sell listing

### Exchange Service
- ✅ Get all exchanges
- ✅ Get exchange by ID
- ✅ Create exchange
- ✅ Update exchange
- ✅ Delete exchange

### Profile Service
- ✅ Get profile
- ✅ Update profile
- ✅ Delete profile

### Saved Property Service
- ✅ Get saved properties
- ✅ Save property
- ✅ Remove saved property

### History Service
- ✅ Get history
- ✅ Add to buy list
- ✅ Remove from buy list
- ✅ Add to exchange list
- ✅ Remove from exchange list

### Enquiry Service
- ✅ Submit enquiry

### Feedback Service
- ✅ Get user feedback
- ✅ Submit feedback
- ✅ Update feedback
- ✅ Delete feedback

### Notification Service
- ✅ Get notifications
- ✅ Create notification
- ✅ Mark as read
- ✅ Delete notification

## 🏗️ Models

All models include:
- ✅ Type-safe properties
- ✅ Null safety support
- ✅ `fromJson` constructor
- ✅ `toJson` method
- ✅ `copyWith` for immutable updates
- ✅ Enums for fixed values

### Available Models

1. **User** - User account information
2. **Property** - Property listings with location, layout, amenities
3. **Sell** - Sell listings with detailed property info
4. **Exchange** - Property exchange requests
5. **Notification** - User notifications with categories
6. **Feedback** - User feedback submissions
7. **Enquiry** - Property enquiries
8. **History** - User activity history
9. **SavedProperty** - User's saved properties

### Enums

- `PropertyType`: Apartment, Villa, Commercial, Plot, OrganicHome
- `PropertySubtype`: Retail, Mixed-Use, Office, Land, Residential, etc.
- `AdvertisementType`: Sale, Rent/Lease
- `SellPropertyType`: Apartment, Independent House, Villa, Plot/Land
- `EnquiryType`: Buy, Exchange
- `NotificationCategory`: Buy, Sell, Exchange, System
- `NotificationEventCode`: 14 different event types

## 🔧 Advanced Configuration

### Custom Auth Manager (Production)

For production, implement persistent token storage:

```dart
import 'package:shared_preferences/shared_preferences.dart';

class SecureAuthManager implements AuthManager {
  static const _tokenKey = 'jwt_token';

  @override
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  @override
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  @override
  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  @override
  Future<bool> isAuthenticated() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
}

// Use it
final api = ApiClientFactory(
  baseUrl: 'http://localhost:6000/api',
  authManager: SecureAuthManager(),
);
```

### Environment Configuration

```dart
class ApiConfig {
  static const String devBaseUrl = 'http://localhost:6000/api';
  static const String prodBaseUrl = 'https://api.builtglory.com/api';
  
  static String get baseUrl {
    return const bool.fromEnvironment('dart.vm.product')
        ? prodBaseUrl
        : devBaseUrl;
  }
}

final api = ApiClientFactory(baseUrl: ApiConfig.baseUrl);
```

## 📤 File Upload Example

```dart
import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> uploadPropertyImages() async {
  // Create sell listing
  final sell = Sell(
    advertisementType: AdvertisementType.sale,
    propertyType: SellPropertyType.apartment,
    bhkType: '3 BHK',
    builtUpArea: 1500,
    location: SellLocation(city: 'Mumbai', locality: 'Andheri'),
    price: 15000000,
  );

  // Prepare images
  final imageFiles = [
    File('/path/to/image1.jpg'),
    File('/path/to/image2.jpg'),
  ];

  final multipartFiles = await Future.wait(
    imageFiles.map((file) => http.MultipartFile.fromPath('images', file.path)),
  );

  // Upload
  final response = await api.sell.createSellWithImages(
    sell: sell,
    images: multipartFiles,
  );

  if (response.isSuccess) {
    print('Uploaded with images!');
  }
}
```

## 🧪 Testing

The example file includes complete test scenarios:

```dart
// Run the examples
flutter run lib/generated/example_usage.dart
```

## 📚 Documentation

- **API Documentation**: See `lib/generated/README.md`
- **OpenAPI Spec**: See `builtglory_v1_backend/openapi.yaml`
- **Usage Examples**: See `lib/generated/example_usage.dart`

## ⚡ Performance Tips

1. **Reuse API Client**: Create once, use throughout app
2. **Dispose Properly**: Call `api.dispose()` when done
3. **Handle Errors**: Always check `response.isSuccess`
4. **Use Stream for Auth**: Listen to token changes if needed

```dart
// In a StatefulWidget or provider
late final ApiClientFactory api;

@override
void initState() {
  super.initState();
  api = ApiClientFactory(baseUrl: 'http://localhost:6000/api');
}

@override
void dispose() {
  api.dispose();
  super.dispose();
}
```

## 🐛 Common Issues

### Issue: "Unauthorized" errors
**Solution**: Ensure you've called `verifyOTP` successfully before making authenticated requests.

### Issue: Network errors
**Solution**: Check base URL and ensure backend is running.

### Issue: JSON parsing errors
**Solution**: Ensure backend response matches OpenAPI spec.

## 📞 Support

For issues or questions:
- Check `lib/generated/README.md` for detailed documentation
- Review `lib/generated/example_usage.dart` for examples
- Refer to OpenAPI spec: `builtglory_v1_backend/openapi.yaml`

## ✅ Summary

You now have:
- ✅ Complete OpenAPI specification (`builtglory_v1_backend/openapi.yaml`)
- ✅ Production-ready Dart API client with JWT auth
- ✅ Type-safe models with JSON serialization
- ✅ 10 service classes covering all endpoints
- ✅ Comprehensive error handling
- ✅ File upload support
- ✅ Complete documentation and examples

**Next Steps:**
1. ✅ **Run `flutter pub get`** - Install all dependencies
2. ✅ **Choose Your State Management:**
   - **BLoC (Recommended)**: See `BLOC_COMPLETE_SUMMARY.md`
   - **Riverpod (Alternative)**: See `RIVERPOD_UI_BINDING_COMPLETE.md`
3. ✅ **Wrap Your App** with BLoC/Riverpod providers
4. ✅ **Use `HomeScreenBloc`** or `HomeScreenRiverpod` (drop-in replacement)
5. ✅ **Test with Backend** - Ensure backend is running on `http://localhost:6000`
6. ✅ **Customize Widgets** as needed for your design
7. ✅ **Review Documentation:**
   - `BLOC_INTEGRATION_GUIDE.md` - Complete BLoC guide
   - `BLOC_CHEATSHEET.md` - Quick reference
   - `BUILDERIO_MAPPING_GUIDE.md` - Visual CMS setup

**You're All Set! 🎉**

Your app now has:
- ✅ Complete API integration with JWT auth
- ✅ BLoC pattern implementation (production-ready)
- ✅ Riverpod implementation (alternative)
- ✅ Reusable UI widgets
- ✅ Error handling
- ✅ Refactored HomeScreen
- ✅ Builder.io semantic mapping
- ✅ Comprehensive documentation

**Run your fully integrated app:**
```bash
flutter run
```

Happy coding! 🚀

