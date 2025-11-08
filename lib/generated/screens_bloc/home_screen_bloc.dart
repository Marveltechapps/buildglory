import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constant/constant.dart';
import '../api_exports.dart';
import '../bloc/bloc_exports.dart';
import '../widgets_bloc/property_list_bloc_widget.dart';

/// HomeScreen using BLoC (Drop-in replacement for your existing HomeScreen)
class HomeScreenBloc extends StatefulWidget {
  const HomeScreenBloc({super.key});

  @override
  State<HomeScreenBloc> createState() => _HomeScreenBlocState();
}

class _HomeScreenBlocState extends State<HomeScreenBloc> {
  String selectedType = "Buy";

  @override
  void initState() {
    super.initState();
    // Load initial data
    context.read<PropertyBloc>().add(const LoadHomepagePropertiesEvent());
    context.read<NotificationBloc>().add(const LoadNotificationsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, authState) {
                final userName = authState is Authenticated
                    ? authState.user.name ?? 'there'
                    : 'there';

                return ListTile(
                  title: Text(
                    "Hey $userName!",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: const Text("Find, Flip, Flourish"),
                  trailing: _buildNotificationButton(),
                );
              },
            ),

            // Type Selector
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 15,
              ),
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildTypeButton("Sell", sellIcon),
                    _buildTypeButton("Buy", buyIcon),
                    _buildTypeButton("Exchange", exchangeIcon),
                  ],
                ),
              ),
            ),

            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: _buildContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationButton() {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        int unreadCount = 0;
        if (state is NotificationsLoaded) {
          unreadCount = state.unreadCount;
        }

        return Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_none_rounded),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const NotificationScreenBloc(),
                  ),
                );
              },
            ),
            if (unreadCount > 0)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    unreadCount > 9 ? '9+' : '$unreadCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildTypeButton(String type, String iconPath) {
    final isSelected = selectedType == type;

    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() => selectedType = type);
          flowname = type;

          // Load appropriate data
          if (type == "Buy") {
            context.read<PropertyBloc>().add(
                  const LoadHomepagePropertiesEvent(),
                );
          }
        },
        child: Container(
          margin: const EdgeInsets.all(4),
          decoration: isSelected
              ? BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.green.shade200),
                  borderRadius: BorderRadius.circular(16),
                )
              : null,
          child: Column(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(iconPath),
              Text(type),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    switch (selectedType) {
      case "Sell":
        return const SellListBlocWidget();
      case "Buy":
        return PropertyListBlocWidget(
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
      case "Exchange":
        return const ExchangeListBlocWidget();
      default:
        return const SizedBox.shrink();
    }
  }
}

/// Sell List Widget using BLoC
class SellListBlocWidget extends StatelessWidget {
  const SellListBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Sell listings coming soon...'),
    );
  }
}

/// Exchange List Widget using BLoC
class ExchangeListBlocWidget extends StatelessWidget {
  const ExchangeListBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Exchange listings coming soon...'),
    );
  }
}

/// Property Details Screen using BLoC
class PropertyDetailsScreenBloc extends StatelessWidget {
  final String propertyId;

  const PropertyDetailsScreenBloc({
    super.key,
    required this.propertyId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Property Details'),
      ),
      body: BlocProvider.value(
        value: context.read<PropertyBloc>()
          ..add(LoadPropertyDetailsEvent(propertyId)),
        child: BlocBuilder<PropertyBloc, PropertyState>(
          builder: (context, state) {
            if (state is PropertyLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is PropertyError) {
              return Center(child: Text('Error: ${state.message}'));
            }

            if (state is PropertyDetailsLoaded) {
              final property = state.property;
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      property.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '₹${property.price.toStringAsFixed(0)}',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade700,
                      ),
                    ),
                    // Add more details...
                  ],
                ),
              );
            }

            return const Center(child: Text('Property not found'));
          },
        ),
      ),
    );
  }
}

/// Notification Screen using BLoC
class NotificationScreenBloc extends StatelessWidget {
  const NotificationScreenBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
          if (state is NotificationLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is NotificationError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(state.message),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<NotificationBloc>().add(
                            const LoadNotificationsEvent(),
                          );
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state is NotificationsEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.notifications_none, size: 64, color: Colors.grey.shade400),
                  const SizedBox(height: 16),
                  Text(
                    'No notifications',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            );
          }

          if (state is NotificationsLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<NotificationBloc>().add(
                      const LoadNotificationsEvent(),
                    );
              },
              child: ListView.builder(
                itemCount: state.notifications.length,
                itemBuilder: (context, index) {
                  final notification = state.notifications[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: notification.isRead
                          ? Colors.grey.shade300
                          : Colors.blue.shade100,
                      child: Icon(
                        Icons.notifications,
                        color: notification.isRead ? Colors.grey : Colors.blue,
                      ),
                    ),
                    title: Text(
                      notification.message,
                      style: TextStyle(
                        fontWeight: notification.isRead
                            ? FontWeight.normal
                            : FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      _formatTime(notification.timestamp),
                      style: const TextStyle(fontSize: 12),
                    ),
                    onTap: () {
                      if (!notification.isRead && notification.id != null) {
                        context.read<NotificationBloc>().add(
                              MarkNotificationAsReadEvent(notification.id!),
                            );
                      }
                    },
                  );
                },
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}

