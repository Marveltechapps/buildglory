# 🏗️ Builder.io Semantic Mapping Guide

## Complete Guide to Map Backend Models to Builder.io Components

---

## 📋 Overview

This guide shows how to semantically map your backend API models to Builder.io components, creating a no-code CMS for your Built Glory app.

---

## 🎯 Core Mapping Concepts

### 1. **Model → Component Mapping**

Backend models become Builder.io custom components with typed inputs:

```
Backend Model (Property) → Builder.io Component (PropertyCard)
  ├─ property.title → input: "title" (text)
  ├─ property.price → input: "price" (number)
  ├─ property.image → input: "image" (file/url)
  └─ property.location → input: "location" (object)
```

### 2. **Service → Data Source Mapping**

API services become Builder.io data sources:

```
PropertyService.getAllProperties() → Builder.io Data Binding
  └─ Fetches data at build/runtime
  └─ Populates component inputs
```

---

## 🔗 Semantic Model Mappings

### Property Model → Builder.io Schema

```typescript
// Builder.io Component Registration
{
  name: 'PropertyCard',
  inputs: [
    {
      name: 'property',
      type: 'object',
      subFields: [
        { name: 'id', type: 'string', required: true },
        { name: 'title', type: 'string', required: true },
        { name: 'price', type: 'number', required: true },
        { name: 'image', type: 'file', required: false },
        { name: 'type', type: 'string', enum: ['Apartment', 'Villa', 'Commercial', 'Plot', 'OrganicHome'] },
        {
          name: 'location',
          type: 'object',
          subFields: [
            { name: 'city', type: 'string' },
            { name: 'locality', type: 'string' },
            { name: 'state', type: 'string' },
            { name: 'pincode', type: 'string' },
            { name: 'fullAddress', type: 'string' }
          ]
        },
        {
          name: 'layout',
          type: 'object',
          subFields: [
            { name: 'bedrooms', type: 'number' },
            { name: 'bathrooms', type: 'number' }
          ]
        },
        { name: 'sqft', type: 'number' },
        { name: 'amenities', type: 'list', subFields: [{ name: 'item', type: 'string' }] }
      ]
    }
  ]
}
```

### Sell Model → Builder.io Schema

```typescript
{
  name: 'SellCard',
  inputs: [
    {
      name: 'sell',
      type: 'object',
      subFields: [
        { name: 'id', type: 'string' },
        { name: 'listingId', type: 'string' },
        { name: 'advertisementType', type: 'string', enum: ['Sale', 'Rent/Lease'] },
        { name: 'propertyType', type: 'string', enum: ['Apartment', 'Independent House', 'Villa', 'Plot/Land'] },
        { name: 'bhkType', type: 'string' },
        { name: 'builtUpArea', type: 'number' },
        { name: 'carpetArea', type: 'number' },
        { name: 'price', type: 'number' },
        { name: 'isNegotiable', type: 'boolean' },
        {
          name: 'location',
          type: 'object',
          subFields: [
            { name: 'city', type: 'string' },
            { name: 'locality', type: 'string' },
            { name: 'projectName', type: 'string' }
          ]
        },
        { name: 'imageURLs', type: 'list', subFields: [{ name: 'url', type: 'file' }] },
        { name: 'description', type: 'longText' },
        { name: 'amenities', type: 'list', subFields: [{ name: 'item', type: 'string' }] }
      ]
    }
  ]
}
```

### User Model → Builder.io Schema

```typescript
{
  name: 'UserProfile',
  inputs: [
    {
      name: 'user',
      type: 'object',
      subFields: [
        { name: 'id', type: 'string' },
        { name: 'name', type: 'string' },
        { name: 'email', type: 'string' },
        { name: 'mobileNumber', type: 'string' },
        { name: 'profileImage', type: 'file' },
        { name: 'isVerified', type: 'boolean' }
      ]
    }
  ]
}
```

### Notification Model → Builder.io Schema

```typescript
{
  name: 'NotificationItem',
  inputs: [
    {
      name: 'notification',
      type: 'object',
      subFields: [
        { name: 'id', type: 'string' },
        { name: 'category', type: 'string', enum: ['Buy', 'Sell', 'Exchange', 'System'] },
        { name: 'eventCode', type: 'string' },
        { name: 'message', type: 'string' },
        { name: 'timestamp', type: 'date' },
        { name: 'isRead', type: 'boolean' },
        { name: 'propertyId', type: 'string' }
      ]
    }
  ]
}
```

---

## 🔌 Widget Integration with Builder.io

### Step 1: Register Custom Components

Create a `builder_io_registry.dart`:

```dart
import 'package:buildglory/generated/widgets/property_widgets.dart';
import 'package:buildglory/generated/widgets/auth_widgets.dart';
// Import Builder.io SDK

void registerBuilderComponents() {
  // Register PropertyCard
  Builder.registerComponent(
    PropertyCardWidget,
    name: 'PropertyCard',
    inputs: [
      {
        'name': 'property',
        'type': 'object',
        'defaultValue': {},
      }
    ],
  );

  // Register PropertyList
  Builder.registerComponent(
    PropertyListWidget,
    name: 'PropertyList',
    inputs: [
      {
        'name': 'filterType',
        'type': 'string',
        'enum': ['Apartment', 'Villa', 'Commercial', 'Plot', 'OrganicHome'],
      }
    ],
  );

  // Register UserProfile
  Builder.registerComponent(
    UserProfileWidget,
    name: 'UserProfile',
    inputs: [],
  );

  // Register OTPLogin
  Builder.registerComponent(
    OTPLoginWidget,
    name: 'OTPLogin',
    inputs: [],
  );
}
```

### Step 2: Create Data Binding Wrappers

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buildglory/generated/api_exports.dart';
import 'package:buildglory/generated/providers/api_providers.dart';

/// Builder.io compatible data fetcher for properties
class BuilderPropertyDataSource extends ConsumerWidget {
  final String? filterType;
  final Widget Function(List<Property>) builder;

  const BuilderPropertyDataSource({
    super.key,
    this.filterType,
    required this.builder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final propertiesAsync = filterType != null
        ? ref.watch(homepagePropertiesProvider(filterType))
        : ref.watch(allPropertiesProvider);

    return propertiesAsync.when(
      data: (properties) => builder(properties),
      loading: () => CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
    );
  }
}

/// Usage in Builder.io
Builder.registerComponent(
  BuilderPropertyDataSource,
  name: 'PropertyDataSource',
  inputs: [
    {
      'name': 'filterType',
      'type': 'string',
      'enum': ['Apartment', 'Villa', 'Commercial', 'Plot', 'OrganicHome'],
    }
  ],
  childrenDefinition: {
    'builder': {
      'type': 'uiBlocks',
      'defaultValue': [],
    }
  },
);
```

---

## 🎨 Component Templates for Builder.io

### PropertyCard Template

```dart
/// Builder.io configurable PropertyCard
class BuilderPropertyCard extends ConsumerWidget {
  final Property property;
  final bool showSaveButton;
  final Color? backgroundColor;
  final double? elevation;
  final VoidCallback? onTap;

  const BuilderPropertyCard({
    super.key,
    required this.property,
    this.showSaveButton = true,
    this.backgroundColor,
    this.elevation,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PropertyCardWidget(
      property: property,
      onTap: onTap,
      showSaveButton: showSaveButton,
    );
  }
}

// Register with Builder.io
Builder.registerComponent(
  BuilderPropertyCard,
  name: 'PropertyCard',
  inputs: [
    { 'name': 'property', 'type': 'object' },
    { 'name': 'showSaveButton', 'type': 'boolean', 'defaultValue': true },
    { 'name': 'backgroundColor', 'type': 'color' },
    { 'name': 'elevation', 'type': 'number', 'defaultValue': 2 },
  ],
);
```

### PropertyList Template

```dart
/// Builder.io configurable PropertyList
class BuilderPropertyList extends ConsumerWidget {
  final String? filterType;
  final String? filterCity;
  final int? itemsPerPage;
  final bool showLoadMore;

  const BuilderPropertyList({
    super.key,
    this.filterType,
    this.filterCity,
    this.itemsPerPage,
    this.showLoadMore = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PropertyListWidget(
      filterType: filterType,
      onPropertyTap: (property) {
        // Navigate to details
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PropertyDetailsScreen(
              propertyId: property.id!,
            ),
          ),
        );
      },
    );
  }
}

// Register with Builder.io
Builder.registerComponent(
  BuilderPropertyList,
  name: 'PropertyList',
  inputs: [
    {
      'name': 'filterType',
      'type': 'string',
      'enum': ['Apartment', 'Villa', 'Commercial', 'Plot', 'OrganicHome'],
    },
    { 'name': 'filterCity', 'type': 'string' },
    { 'name': 'itemsPerPage', 'type': 'number', 'defaultValue': 10 },
    { 'name': 'showLoadMore', 'type': 'boolean', 'defaultValue': false },
  ],
);
```

---

## 🗂️ Data Source Configurations

### Properties Data Source

```javascript
// Builder.io Data Source Configuration
{
  "name": "Built Glory Properties",
  "id": "builtglory-properties",
  "dataType": "array",
  "endpoint": "http://localhost:6000/api/properties",
  "method": "GET",
  "headers": {
    "Authorization": "Bearer ${context.user.token}"
  },
  "transform": "response.data",
  "fields": [
    { "name": "id", "type": "string" },
    { "name": "title", "type": "string" },
    { "name": "price", "type": "number" },
    { "name": "type", "type": "string" },
    { "name": "location", "type": "object" },
    { "name": "image", "type": "string" }
  ]
}
```

### Property Search Data Source

```javascript
{
  "name": "Property Search",
  "id": "property-search",
  "dataType": "array",
  "endpoint": "http://localhost:6000/api/homepage/search",
  "method": "POST",
  "headers": {
    "Content-Type": "application/json",
    "Authorization": "Bearer ${context.user.token}"
  },
  "body": {
    "city": "${context.query.city}",
    "type": "${context.query.type}",
    "minPrice": "${context.query.minPrice}",
    "maxPrice": "${context.query.maxPrice}",
    "bedrooms": "${context.query.bedrooms}"
  },
  "transform": "response.data"
}
```

### User Notifications Data Source

```javascript
{
  "name": "User Notifications",
  "id": "user-notifications",
  "dataType": "array",
  "endpoint": "http://localhost:6000/api/notifications",
  "method": "GET",
  "headers": {
    "Authorization": "Bearer ${context.user.token}"
  },
  "transform": "response.data",
  "requiresAuth": true
}
```

---

## 🎭 Advanced Mappings

### Dynamic Property Type Selector

```dart
class BuilderPropertyTypeSelector extends ConsumerWidget {
  final Function(String) onTypeSelected;
  final String? selectedType;

  const BuilderPropertyTypeSelector({
    super.key,
    required this.onTypeSelected,
    this.selectedType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      spacing: 8,
      children: PropertyType.values.map((type) {
        final isSelected = type.value == selectedType;
        return ChoiceChip(
          label: Text(type.value),
          selected: isSelected,
          onSelected: (_) => onTypeSelected(type.value),
        );
      }).toList(),
    );
  }
}
```

### Builder.io Search Form

```dart
class BuilderSearchForm extends ConsumerStatefulWidget {
  final Function(PropertySearchParams) onSearch;

  const BuilderSearchForm({
    super.key,
    required this.onSearch,
  });

  @override
  ConsumerState<BuilderSearchForm> createState() => _BuilderSearchFormState();
}

class _BuilderSearchFormState extends ConsumerState<BuilderSearchForm> {
  String? city;
  String? type;
  double? minPrice;
  double? maxPrice;
  int? bedrooms;

  void _search() {
    widget.onSearch(PropertySearchParams(
      city: city,
      type: type,
      minPrice: minPrice,
      maxPrice: maxPrice,
      bedrooms: bedrooms,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'City'),
          onChanged: (value) => city = value,
        ),
        // Add more fields...
        ElevatedButton(
          onPressed: _search,
          child: Text('Search'),
        ),
      ],
    );
  }
}
```

---

## 📊 Semantic Mapping Table

| Backend Model | Builder.io Component | Data Binding | Actions |
|---------------|---------------------|--------------|---------|
| Property | PropertyCard | allPropertiesProvider | saveProperty() |
| Property | PropertyList | homepagePropertiesProvider | onPropertyTap |
| Property | PropertyDetails | propertyByIdProvider | submitEnquiry() |
| Sell | SellCard | allSellsProvider | - |
| Exchange | ExchangeCard | allExchangesProvider | - |
| User | UserProfile | currentUserProvider | updateProfile(), logout() |
| Notification | NotificationItem | userNotificationsProvider | markAsRead() |
| SavedProperty | WishlistWidget | savedPropertiesProvider | removeSavedProperty() |

---

## 🚀 Quick Setup Checklist

- [ ] Install Builder.io Flutter SDK
- [ ] Register all custom components
- [ ] Configure data sources with API endpoints
- [ ] Set up JWT auth in Builder.io context
- [ ] Map backend models to Builder.io schemas
- [ ] Create reusable component templates
- [ ] Test data binding with live API
- [ ] Deploy Builder.io content

---

## 🎉 Result

Now you can:
- ✅ Edit UI components in Builder.io visual editor
- ✅ Change layouts without code changes
- ✅ A/B test different designs
- ✅ Update content in real-time
- ✅ Maintain type safety with Dart models

**Your backend API is now fully integrated with Builder.io!** 🚀

