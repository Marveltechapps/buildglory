// ignore_for_file: unused_local_variable, avoid_print

/// Example usage of the Built Glory API Client
/// 
/// This file demonstrates how to use all the API services
/// with proper error handling and type safety.

import 'api_exports.dart';

void main() async {
  // Initialize API client
  final api = ApiClientFactory(
    baseUrl: 'http://localhost:6000/api',
  );

  try {
    await exampleAuthFlow(api);
    await examplePropertyOperations(api);
    await exampleSellOperations(api);
    await exampleUserOperations(api);
  } finally {
    // Clean up
    api.dispose();
  }
}

/// Example: Complete authentication flow
Future<void> exampleAuthFlow(ApiClientFactory api) async {
  print('\n=== Authentication Flow ===\n');

  // Step 1: Send OTP
  final sendOtpResponse = await api.auth.sendOTP('9876543210');
  if (sendOtpResponse.isSuccess) {
    print('✓ OTP sent successfully');
  } else {
    print('✗ Failed to send OTP: ${sendOtpResponse.error!.message}');
    return;
  }

  // Step 2: Verify OTP
  final verifyResponse = await api.auth.verifyOTP(
    mobileNumber: '9876543210',
    otp: '123456',
  );

  verifyResponse.when(
    success: (authData) {
      print('✓ Login successful');
      print('  User: ${authData.user.name ?? "Guest"}');
      print('  Token: ${authData.token.substring(0, 20)}...');
    },
    failure: (error) {
      print('✗ Login failed: ${error.message}');
    },
  );

  // Step 3: Check authentication
  final isAuth = await api.auth.isAuthenticated();
  print('✓ Authentication status: $isAuth');
}

/// Example: Property operations
Future<void> examplePropertyOperations(ApiClientFactory api) async {
  print('\n=== Property Operations ===\n');

  // Get all properties
  final propertiesResponse = await api.property.getAllProperties();
  if (propertiesResponse.isSuccess) {
    final properties = propertiesResponse.data!;
    print('✓ Found ${properties.length} properties');
    
    for (var property in properties.take(3)) {
      print('  - ${property.title}: ₹${property.price}');
    }
  }

  // Search properties
  final searchResponse = await api.property.searchProperties(
    city: 'Bangalore',
    type: PropertyType.apartment.value,
    minPrice: 5000000,
    maxPrice: 10000000,
    bedrooms: 3,
  );

  if (searchResponse.isSuccess) {
    final results = searchResponse.data!;
    print('✓ Search found ${results.length} matching properties');
  }

  // Get property by ID (example)
  final propertyResponse = await api.property.getPropertyById('property123');
  propertyResponse.when(
    success: (property) {
      print('✓ Property details:');
      print('  Title: ${property.title}');
      print('  Location: ${property.location.city}, ${property.location.locality}');
      print('  Price: ₹${property.price}');
    },
    failure: (error) {
      print('✗ ${error.message}');
    },
  );

  // Create new property
  final newProperty = Property(
    title: 'Luxury Apartment in Koramangala',
    type: PropertyType.apartment,
    location: PropertyLocation(
      state: 'Karnataka',
      city: 'Bangalore',
      locality: 'Koramangala',
      pincode: '560034',
      fullAddress: '123 Main Street, Koramangala, Bangalore',
    ),
    price: 8500000,
    sqft: 1500,
    amenities: ['Swimming Pool', 'Gym', 'Parking'],
    layout: PropertyLayout(bedrooms: 3, bathrooms: 2),
  );

  final createResponse = await api.property.createProperty(newProperty);
  if (createResponse.isSuccess) {
    print('✓ Property created with ID: ${createResponse.data!.id}');
  }
}

/// Example: Sell listing operations
Future<void> exampleSellOperations(ApiClientFactory api) async {
  print('\n=== Sell Operations ===\n');

  // Get all sell listings
  final sellsResponse = await api.sell.getAllSells();
  if (sellsResponse.isSuccess) {
    final sells = sellsResponse.data!;
    print('✓ Found ${sells.length} sell listings');
    
    for (var sell in sells.take(3)) {
      print('  - ${sell.bhkType} ${sell.propertyType.value}: ₹${sell.price}');
    }
  }

  // Create sell listing
  final newSell = Sell(
    advertisementType: AdvertisementType.sale,
    propertyType: SellPropertyType.apartment,
    bhkType: '3 BHK',
    builtUpArea: 1500,
    carpetArea: 1200,
    location: SellLocation(
      city: 'Mumbai',
      locality: 'Andheri West',
      projectName: 'Sky Heights',
    ),
    price: 15000000,
    isNegotiable: true,
    furnishedStatus: 'Semi-Furnished',
    amenities: ['Gym', 'Swimming Pool', 'Security'],
    description: 'Beautiful 3BHK apartment with sea view',
  );

  final createSellResponse = await api.sell.createSell(newSell);
  if (createSellResponse.isSuccess) {
    print('✓ Sell listing created');
  }
}

/// Example: User operations (profile, saved properties, history)
Future<void> exampleUserOperations(ApiClientFactory api) async {
  print('\n=== User Operations ===\n');

  // Get profile
  final profileResponse = await api.profile.getProfile();
  if (profileResponse.isSuccess) {
    final user = profileResponse.data!;
    print('✓ Profile loaded');
    print('  Name: ${user.name}');
    print('  Email: ${user.email}');
    print('  Verified: ${user.isVerified}');
  }

  // Update profile
  final updateResponse = await api.profile.updateProfile(
    name: 'John Doe',
    email: 'john@example.com',
  );
  if (updateResponse.isSuccess) {
    print('✓ Profile updated');
  }

  // Saved properties
  final savedResponse = await api.savedProperty.getSavedProperties();
  if (savedResponse.isSuccess) {
    final saved = savedResponse.data!;
    print('✓ Saved properties: ${saved.savedProperties.length}');
  }

  // Save a property
  await api.savedProperty.saveProperty('property123');
  print('✓ Property saved');

  // Get history
  final historyResponse = await api.history.getHistory();
  if (historyResponse.isSuccess) {
    final history = historyResponse.data!;
    print('✓ History loaded');
    print('  Buy list: ${history.buyList.length}');
    print('  Exchange list: ${history.exchangeList.length}');
    print('  Sell list: ${history.sellList.length}');
  }

  // Add to buy list
  await api.history.addToBuyList('property456');
  print('✓ Added to buy list');

  // Submit enquiry
  final enquiryResponse = await api.enquiry.submitEnquiry(
    propertyId: 'property789',
    type: EnquiryType.buy,
    message: 'I am interested in this property',
  );
  if (enquiryResponse.isSuccess) {
    print('✓ Enquiry submitted');
  }

  // Submit feedback
  final feedbackResponse = await api.feedback.submitFeedback(
    fullName: 'John Doe',
    email: 'john@example.com',
    subject: 'Great App!',
    message: 'Love the user experience and features',
  );
  if (feedbackResponse.isSuccess) {
    print('✓ Feedback submitted');
  }

  // Get notifications
  final notificationsResponse = await api.notification.getUserNotifications();
  if (notificationsResponse.isSuccess) {
    final notifications = notificationsResponse.data!;
    print('✓ Notifications: ${notifications.length}');
    
    for (var notification in notifications.take(3)) {
      print('  - ${notification.message} (${notification.isRead ? "Read" : "Unread"})');
    }
  }

  // Create exchange
  final exchangeResponse = await api.exchange.createExchange(
    sellerProperty: 'sell123',
    matchedProperties: ['property1', 'property2'],
    fallbackToBuy: true,
  );
  if (exchangeResponse.isSuccess) {
    print('✓ Exchange created');
  }
}

/// Example: Error handling patterns
Future<void> exampleErrorHandling(ApiClientFactory api) async {
  print('\n=== Error Handling Examples ===\n');

  // Pattern 1: Using when callback
  final response1 = await api.property.getPropertyById('invalid-id');
  response1.when(
    success: (property) {
      print('Got property: ${property.title}');
    },
    failure: (error) {
      if (error.isUnauthorized) {
        print('Please login first');
      } else if (error.isNotFound) {
        print('Property not found');
      } else if (error.isServerError) {
        print('Server error occurred');
      } else {
        print('Error: ${error.message}');
      }
    },
  );

  // Pattern 2: Using isSuccess check
  final response2 = await api.property.getAllProperties();
  if (response2.isSuccess) {
    final properties = response2.data!;
    print('Found ${properties.length} properties');
  } else {
    final error = response2.error!;
    print('Error ${error.statusCode}: ${error.message}');
  }

  // Pattern 3: Try-catch with dataOrThrow
  try {
    final property = (await api.property.getPropertyById('123')).dataOrThrow;
    print('Property: ${property.title}');
  } on ApiError catch (e) {
    print('API Error: ${e.message}');
  } catch (e) {
    print('Unexpected error: $e');
  }

  // Pattern 4: Map response data
  final response3 = await api.property.getAllProperties();
  final titles = response3.map((properties) {
    return properties.map((p) => p.title).toList();
  });

  if (titles.isSuccess) {
    print('Property titles: ${titles.data}');
  }
}

