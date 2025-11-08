# Built Glory API Client

This directory contains auto-generated Dart service classes for the Built Glory API, based on the OpenAPI specification.

## Features

- ✅ **HTTP Client**: Built on `http` package
- ✅ **JWT Authentication**: Automatic token management and injection
- ✅ **Error Handling**: Comprehensive error handling with typed responses
- ✅ **Model Mapping**: Type-safe model classes with JSON serialization
- ✅ **Type Safety**: Full Dart type safety with nullable types
- ✅ **Async/Await**: Modern asynchronous API
- ✅ **File Uploads**: Support for multipart file uploads

## Installation

Add the `http` package to your `pubspec.yaml`:

```yaml
dependencies:
  http: ^1.1.0
```

## Quick Start

### 1. Initialize API Client

```dart
import 'package:buildglory/generated/api_exports.dart';

void main() {
  // Create API client factory
  final api = ApiClientFactory(
    baseUrl: 'http://3.6.250.39:6000/api',
  );
}
```

### 2. Authentication

```dart
// Send OTP
final sendResponse = await api.auth.sendOTP('9876543210');
if (sendResponse.isSuccess) {
  print('OTP sent successfully');
}

// Verify OTP and login
final verifyResponse = await api.auth.verifyOTP(
  mobileNumber: '9876543210',
  otp: '123456',
);

verifyResponse.when(
  success: (authData) {
    print('Logged in as: ${authData.user.name}');
    print('Token: ${authData.token}');
  },
  failure: (error) {
    print('Login failed: ${error.message}');
  },
);

// Check authentication status
final isAuth = await api.auth.isAuthenticated();
print('User authenticated: $isAuth');

// Logout
await api.auth.logout();
```

### 3. Property Operations

```dart
// Get all properties
final propertiesResponse = await api.property.getAllProperties();
if (propertiesResponse.isSuccess) {
  final properties = propertiesResponse.data!;
  for (var property in properties) {
    print('${property.title} - ₹${property.price}');
  }
}

// Search properties
final searchResponse = await api.property.searchProperties(
  city: 'Bangalore',
  type: 'Apartment',
  minPrice: 5000000,
  maxPrice: 10000000,
  bedrooms: 3,
);

// Get property by ID
final propertyResponse = await api.property.getPropertyById('property123');
if (propertyResponse.isSuccess) {
  final property = propertyResponse.data!;
  print('Property: ${property.title}');
  print('Location: ${property.location.city}');
}
```

### 4. Sell Listings

```dart
import 'package:http/http.dart' as http;
import 'dart:io';

// Create sell listing
final sell = Sell(
  advertisementType: AdvertisementType.sale,
  propertyType: SellPropertyType.apartment,
  bhkType: '3 BHK',
  builtUpArea: 1500,
  location: SellLocation(
    city: 'Mumbai',
    locality: 'Andheri West',
  ),
  price: 15000000,
  isNegotiable: true,
);

final sellResponse = await api.sell.createSell(sell);

// Create sell listing with images
final imageFile = File('/path/to/image.jpg');
final images = [
  await http.MultipartFile.fromPath('images', imageFile.path),
];

final sellWithImagesResponse = await api.sell.createSellWithImages(
  sell: sell,
  images: images,
);
```

### 5. Profile Management

```dart
// Get profile
final profileResponse = await api.profile.getProfile();
if (profileResponse.isSuccess) {
  final user = profileResponse.data!;
  print('Name: ${user.name}');
  print('Email: ${user.email}');
}

// Update profile
final updateResponse = await api.profile.updateProfile(
  name: 'John Doe',
  email: 'john@example.com',
);
```

### 6. Saved Properties

```dart
// Get saved properties
final savedResponse = await api.savedProperty.getSavedProperties();
if (savedResponse.isSuccess) {
  final saved = savedResponse.data!;
  print('Saved properties: ${saved.savedProperties.length}');
}

// Save a property
await api.savedProperty.saveProperty('property123');

// Remove saved property
await api.savedProperty.removeSavedProperty('property123');
```

### 7. Exchange

```dart
// Create exchange
final exchangeResponse = await api.exchange.createExchange(
  sellerProperty: 'sellListing123',
  matchedProperties: ['property1', 'property2'],
  fallbackToBuy: true,
);

// Get all exchanges
final exchangesResponse = await api.exchange.getAllExchanges();
```

### 8. History Tracking

```dart
// Get user history
final historyResponse = await api.history.getHistory();
if (historyResponse.isSuccess) {
  final history = historyResponse.data!;
  print('Buy list: ${history.buyList.length}');
  print('Exchange list: ${history.exchangeList.length}');
  print('Sell list: ${history.sellList.length}');
}

// Add to buy list
await api.history.addToBuyList('property123');

// Add to exchange list
await api.history.addToExchangeList('exchange123');
```

### 9. Enquiries

```dart
// Submit enquiry
final enquiryResponse = await api.enquiry.submitEnquiry(
  propertyId: 'property123',
  type: EnquiryType.buy,
  message: 'I am interested in this property',
);
```

### 10. Feedback

```dart
// Submit feedback
final feedbackResponse = await api.feedback.submitFeedback(
  fullName: 'John Doe',
  email: 'john@example.com',
  subject: 'Great App!',
  message: 'Love the user experience',
);

// Get all feedback
final allFeedbackResponse = await api.feedback.getUserFeedback();
```

### 11. Notifications

```dart
// Get notifications
final notificationsResponse = await api.notification.getUserNotifications();
if (notificationsResponse.isSuccess) {
  final notifications = notificationsResponse.data!;
  for (var notification in notifications) {
    print('${notification.message} - Read: ${notification.isRead}');
  }
}

// Mark as read
await api.notification.markAsRead('notification123');

// Delete notification
await api.notification.deleteNotification('notification123');
```

## Error Handling

### Using `when` callback

```dart
final response = await api.property.getPropertyById('123');

response.when(
  success: (property) {
    print('Got property: ${property.title}');
  },
  failure: (error) {
    if (error.isUnauthorized) {
      print('Please login first');
    } else if (error.isNotFound) {
      print('Property not found');
    } else {
      print('Error: ${error.message}');
    }
  },
);
```

### Using `isSuccess` check

```dart
final response = await api.property.getAllProperties();

if (response.isSuccess) {
  final properties = response.data!;
  // Use properties
} else {
  final error = response.error!;
  print('Error ${error.statusCode}: ${error.message}');
}
```

### Try-catch with `dataOrThrow`

```dart
try {
  final property = (await api.property.getPropertyById('123')).dataOrThrow;
  print('Property: ${property.title}');
} catch (e) {
  if (e is ApiError) {
    print('API Error: ${e.message}');
  }
}
```

## Custom Auth Manager

By default, tokens are stored in memory. For production, implement a custom `AuthManager` with secure storage:

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

// Use custom auth manager
final api = ApiClientFactory(
  baseUrl: 'http://localhost:6000/api',
  authManager: SecureAuthManager(),
);
```

## Models

All models include:
- Type-safe properties with nullable types
- `fromJson` factory constructor
- `toJson` method for serialization
- `copyWith` method for immutable updates
- Enums for fixed value sets

Example:

```dart
final property = Property(
  title: 'Luxury Apartment',
  type: PropertyType.apartment,
  location: PropertyLocation(
    state: 'Karnataka',
    city: 'Bangalore',
    locality: 'Koramangala',
    pincode: '560034',
    fullAddress: '123 Main St, Koramangala, Bangalore',
  ),
  price: 8500000,
  layout: PropertyLayout(bedrooms: 3, bathrooms: 2),
);

// Create modified copy
final updatedProperty = property.copyWith(price: 9000000);
```

## Configuration

### Base URL

For different environments:

```dart
// Development
final devApi = ApiClientFactory(baseUrl: 'http://localhost:6000/api');

// Production
final prodApi = ApiClientFactory(baseUrl: 'https://api.builtglory.com/api');
```

## Cleanup

Remember to dispose the API client when done:

```dart
@override
void dispose() {
  api.dispose();
  super.dispose();
}
```

## Architecture

```
lib/generated/
├── core/                    # Core HTTP client and utilities
│   ├── api_client.dart      # Base HTTP client with JWT auth
│   ├── api_error.dart       # Error model
│   ├── api_response.dart    # Generic response wrapper
│   └── auth_manager.dart    # JWT token management
├── models/                  # Data models
│   ├── user.dart
│   ├── property.dart
│   ├── sell.dart
│   └── ...
├── services/                # API services
│   ├── auth_service.dart
│   ├── property_service.dart
│   ├── sell_service.dart
│   └── ...
├── api_client_factory.dart  # Main factory class
├── api_exports.dart         # Convenience exports
└── README.md               # This file
```

## API Documentation

Full API documentation is available in the OpenAPI specification:
- `builtglory_v1_backend/openapi.yaml`

## License

Copyright © 2024 Built Glory. All rights reserved.

