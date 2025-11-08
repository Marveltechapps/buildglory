// ignore_for_file: avoid_print

/// Production Integration Example
/// 
/// This example shows how to integrate the API client into a Flutter app
/// with proper architecture, state management, and error handling.

import 'package:flutter/material.dart';
import 'api_exports.dart';

// ============================================================================
// STEP 1: Create a global API instance (use with Provider or GetIt)
// ============================================================================

class ApiProvider {
  static ApiClientFactory? _instance;

  static ApiClientFactory get instance {
    _instance ??= ApiClientFactory(
      baseUrl: const String.fromEnvironment(
        'API_BASE_URL',
        defaultValue: 'http://localhost:6000/api',
      ),
      authManager: SecureAuthManager(),
    );
    return _instance!;
  }

  static void dispose() {
    _instance?.dispose();
    _instance = null;
  }
}

// ============================================================================
// STEP 2: Create repository classes for clean architecture
// ============================================================================

class AuthRepository {
  final ApiClientFactory _api;

  AuthRepository(this._api);

  Future<Result<User>> login(String mobileNumber, String otp) async {
    try {
      final response = await _api.auth.verifyOTP(
        mobileNumber: mobileNumber,
        otp: otp,
      );

      return response.when(
        success: (authData) => Result.success(authData.user),
        failure: (error) => Result.error(error.message),
      );
    } catch (e) {
      return Result.error('Network error: $e');
    }
  }

  Future<Result<void>> sendOtp(String mobileNumber) async {
    try {
      final response = await _api.auth.sendOTP(mobileNumber);
      return response.when(
        success: (_) => Result.success(null),
        failure: (error) => Result.error(error.message),
      );
    } catch (e) {
      return Result.error('Network error: $e');
    }
  }

  Future<bool> isAuthenticated() async {
    return await _api.auth.isAuthenticated();
  }

  Future<void> logout() async {
    await _api.auth.logout();
  }
}

class PropertyRepository {
  final ApiClientFactory _api;

  PropertyRepository(this._api);

  Future<Result<List<Property>>> getProperties({
    String? type,
    String? city,
  }) async {
    try {
      final response = await _api.property.getAllProperties(
        type: type,
        city: city,
      );

      return response.when(
        success: (properties) => Result.success(properties),
        failure: (error) => Result.error(error.message),
      );
    } catch (e) {
      return Result.error('Network error: $e');
    }
  }

  Future<Result<List<Property>>> searchProperties({
    String? city,
    String? type,
    double? minPrice,
    double? maxPrice,
    int? bedrooms,
  }) async {
    try {
      final response = await _api.property.searchProperties(
        city: city,
        type: type,
        minPrice: minPrice,
        maxPrice: maxPrice,
        bedrooms: bedrooms,
      );

      return response.when(
        success: (properties) => Result.success(properties),
        failure: (error) => Result.error(error.message),
      );
    } catch (e) {
      return Result.error('Network error: $e');
    }
  }

  Future<Result<Property>> getPropertyDetails(String id) async {
    try {
      final response = await _api.property.getPropertyById(id);
      return response.when(
        success: (property) => Result.success(property),
        failure: (error) => Result.error(error.message),
      );
    } catch (e) {
      return Result.error('Network error: $e');
    }
  }

  Future<Result<void>> saveProperty(String propertyId) async {
    try {
      final response = await _api.savedProperty.saveProperty(propertyId);
      return response.when(
        success: (_) => Result.success(null),
        failure: (error) => Result.error(error.message),
      );
    } catch (e) {
      return Result.error('Network error: $e');
    }
  }
}

// ============================================================================
// STEP 3: Create a Result wrapper for better error handling
// ============================================================================

class Result<T> {
  final T? data;
  final String? error;
  final bool isSuccess;

  Result._({this.data, this.error, required this.isSuccess});

  factory Result.success(T? data) => Result._(data: data, isSuccess: true);
  factory Result.error(String error) => Result._(error: error, isSuccess: false);

  R when<R>({
    required R Function(T data) success,
    required R Function(String error) failure,
  }) {
    if (isSuccess && data != null) {
      return success(data as T);
    }
    return failure(error ?? 'Unknown error');
  }
}

// ============================================================================
// STEP 4: Example Flutter screens using the repositories
// ============================================================================

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _authRepo = AuthRepository(ApiProvider.instance);
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  bool _isLoading = false;
  bool _otpSent = false;

  Future<void> _sendOtp() async {
    setState(() => _isLoading = true);

    final result = await _authRepo.sendOtp(_phoneController.text);

    if (mounted) {
      setState(() => _isLoading = false);

      result.when(
        success: (_) {
          setState(() => _otpSent = true);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('OTP sent successfully')),
          );
        },
        failure: (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $error')),
          );
        },
      );
    }
  }

  Future<void> _verifyOtp() async {
    setState(() => _isLoading = true);

    final result = await _authRepo.login(
      _phoneController.text,
      _otpController.text,
    );

    if (mounted) {
      setState(() => _isLoading = false);

      result.when(
        success: (user) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          );
        },
        failure: (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $error')),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Mobile Number',
                hintText: '9876543210',
              ),
              keyboardType: TextInputType.phone,
              enabled: !_otpSent,
            ),
            if (_otpSent) ...[
              const SizedBox(height: 16),
              TextField(
                controller: _otpController,
                decoration: const InputDecoration(
                  labelText: 'OTP',
                  hintText: 'Enter OTP',
                ),
                keyboardType: TextInputType.number,
              ),
            ],
            const SizedBox(height: 24),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _otpSent ? _verifyOtp : _sendOtp,
                    child: Text(_otpSent ? 'Verify OTP' : 'Send OTP'),
                  ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _propertyRepo = PropertyRepository(ApiProvider.instance);
  List<Property> _properties = [];
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadProperties();
  }

  Future<void> _loadProperties() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    final result = await _propertyRepo.getProperties();

    if (mounted) {
      result.when(
        success: (properties) {
          setState(() {
            _properties = properties;
            _isLoading = false;
          });
        },
        failure: (error) {
          setState(() {
            _error = error;
            _isLoading = false;
          });
        },
      );
    }
  }

  Future<void> _searchProperties(String city) async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    final result = await _propertyRepo.searchProperties(city: city);

    if (mounted) {
      result.when(
        success: (properties) {
          setState(() {
            _properties = properties;
            _isLoading = false;
          });
        },
        failure: (error) {
          setState(() {
            _error = error;
            _isLoading = false;
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Properties'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              final city = await showDialog<String>(
                context: context,
                builder: (context) => _SearchDialog(),
              );
              if (city != null && city.isNotEmpty) {
                _searchProperties(city);
              }
            },
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error: $_error'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadProperties,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_properties.isEmpty) {
      return const Center(child: Text('No properties found'));
    }

    return ListView.builder(
      itemCount: _properties.length,
      itemBuilder: (context, index) {
        final property = _properties[index];
        return ListTile(
          title: Text(property.title),
          subtitle: Text(
            '${property.location.city} - ₹${property.price}',
          ),
          trailing: IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () async {
              if (property.id != null) {
                final result = await _propertyRepo.saveProperty(property.id!);
                if (mounted) {
                  result.when(
                    success: (_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Property saved')),
                      );
                    },
                    failure: (error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: $error')),
                      );
                    },
                  );
                }
              }
            },
          ),
          onTap: () {
            // Navigate to property details
            if (property.id != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PropertyDetailsScreen(propertyId: property.id!),
                ),
              );
            }
          },
        );
      },
    );
  }
}

class _SearchDialog extends StatefulWidget {
  @override
  State<_SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends State<_SearchDialog> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Search Properties'),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(
          labelText: 'City',
          hintText: 'Enter city name',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, _controller.text),
          child: const Text('Search'),
        ),
      ],
    );
  }
}

class PropertyDetailsScreen extends StatefulWidget {
  final String propertyId;

  const PropertyDetailsScreen({super.key, required this.propertyId});

  @override
  State<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> {
  final _propertyRepo = PropertyRepository(ApiProvider.instance);
  Property? _property;
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadProperty();
  }

  Future<void> _loadProperty() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    final result = await _propertyRepo.getPropertyDetails(widget.propertyId);

    if (mounted) {
      result.when(
        success: (property) {
          setState(() {
            _property = property;
            _isLoading = false;
          });
        },
        failure: (error) {
          setState(() {
            _error = error;
            _isLoading = false;
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Property Details')),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(child: Text('Error: $_error'));
    }

    if (_property == null) {
      return const Center(child: Text('Property not found'));
    }

    final property = _property!;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            property.title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          Text('Price: ₹${property.price}'),
          Text('Type: ${property.type.value}'),
          Text('Location: ${property.location.city}, ${property.location.locality}'),
          if (property.layout != null) ...[
            const SizedBox(height: 16),
            Text('Bedrooms: ${property.layout!.bedrooms}'),
            Text('Bathrooms: ${property.layout!.bathrooms}'),
          ],
          if (property.amenities != null && property.amenities!.isNotEmpty) ...[
            const SizedBox(height: 16),
            const Text('Amenities:'),
            ...property.amenities!.map((a) => Text('• $a')),
          ],
          if (property.about != null) ...[
            const SizedBox(height: 16),
            Text(property.about!),
          ],
        ],
      ),
    );
  }
}

// ============================================================================
// STEP 5: Main app entry point
// ============================================================================

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Built Glory',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    final authRepo = AuthRepository(ApiProvider.instance);
    final isAuth = await authRepo.isAuthenticated();

    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => isAuth ? const HomeScreen() : const LoginScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

