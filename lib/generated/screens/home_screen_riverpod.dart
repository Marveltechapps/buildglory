import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constant/constant.dart';
import '../api_exports.dart';
import '../providers/api_providers.dart';
import '../providers/property_state_notifier.dart';
import '../providers/auth_state_notifier.dart';
import '../widgets/property_widgets.dart';
import '../widgets/async_value_widget.dart';

/// =============================================================================
/// HOME SCREEN WITH RIVERPOD
/// =============================================================================

/// Refactored HomeScreen using Riverpod instead of Bloc
class HomeScreenRiverpod extends ConsumerStatefulWidget {
  const HomeScreenRiverpod({super.key});

  @override
  ConsumerState<HomeScreenRiverpod> createState() => _HomeScreenRiverpodState();
}

class _HomeScreenRiverpodState extends ConsumerState<HomeScreenRiverpod> {
  String selectedType = "Buy";

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateProvider);
    final propertyState = ref.watch(propertyStateProvider);
    final unreadCount = ref.watch(unreadNotificationsCountProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            ListTile(
              title: Text(
                authState.user?.name != null
                    ? "Hey ${authState.user!.name}!"
                    : "Hey there!",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: const Text("Find, Flip, Flourish"),
              trailing: Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.notifications_none_rounded),
                    onPressed: () {
                      // Navigate to notifications
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const NotificationScreenRiverpod(),
                        ),
                      );
                    },
                  ),
                  // Notification badge
                  unreadCount.when(
                    data: (count) {
                      if (count == 0) return const SizedBox.shrink();
                      return Positioned(
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
                            count > 9 ? '9+' : '$count',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                    loading: () => const SizedBox.shrink(),
                    error: (_, __) => const SizedBox.shrink(),
                  ),
                ],
              ),
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

  Widget _buildTypeButton(String type, String iconPath) {
    final isSelected = selectedType == type;

    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() => selectedType = type);
          flowname = type;

          // Load appropriate data based on type
          if (type == "Buy") {
            ref.read(propertyStateProvider.notifier).loadProperties();
          } else if (type == "Sell") {
            ref.refresh(allSellsProvider);
          } else if (type == "Exchange") {
            ref.refresh(allExchangesProvider);
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
        return const SellListWidget();
      case "Buy":
        return const BuyListWidget();
      case "Exchange":
        return const ExchangeListWidget();
      default:
        return const SizedBox.shrink();
    }
  }
}

/// =============================================================================
/// BUY LIST WIDGET
/// =============================================================================

class BuyListWidget extends ConsumerWidget {
  const BuyListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PropertyListWidget(
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
    );
  }
}

/// =============================================================================
/// SELL LIST WIDGET
/// =============================================================================

class SellListWidget extends ConsumerWidget {
  const SellListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sellsAsync = ref.watch(allSellsProvider);

    return AsyncValueWidget<List<Sell>>(
      value: sellsAsync,
      data: (sells) {
        if (sells.isEmpty) {
          return const EmptyState(
            message: 'No sell listings found',
            icon: Icons.sell_outlined,
          );
        }

        return RefreshIndicator(
          onRefresh: () => ref.refresh(allSellsProvider.future),
          child: ListView.builder(
            itemCount: sells.length,
            itemBuilder: (context, index) {
              final sell = sells[index];
              return SellCardWidget(sell: sell);
            },
          ),
        );
      },
    );
  }
}

/// =============================================================================
/// SELL CARD WIDGET
/// =============================================================================

class SellCardWidget extends StatelessWidget {
  final Sell sell;

  const SellCardWidget({super.key, required this.sell});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Price and Type
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₹${_formatPrice(sell.price)}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade700,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    sell.advertisementType.value,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blue.shade700,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // BHK Type
            Text(
              '${sell.bhkType} ${sell.propertyType.value}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 8),

            // Location
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    '${sell.location.locality}, ${sell.location.city}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Details
            Row(
              children: [
                _buildDetail(Icons.square_foot, '${sell.builtUpArea.toInt()} sqft'),
                const SizedBox(width: 16),
                if (sell.isNegotiable)
                  _buildDetail(Icons.handshake, 'Negotiable'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetail(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: Colors.grey),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }

  String _formatPrice(double price) {
    if (price >= 10000000) {
      return '${(price / 10000000).toStringAsFixed(2)} Cr';
    } else if (price >= 100000) {
      return '${(price / 100000).toStringAsFixed(2)} Lac';
    } else {
      return price.toStringAsFixed(0);
    }
  }
}

/// =============================================================================
/// EXCHANGE LIST WIDGET
/// =============================================================================

class ExchangeListWidget extends ConsumerWidget {
  const ExchangeListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exchangesAsync = ref.watch(allExchangesProvider);

    return AsyncValueWidget<List<Exchange>>(
      value: exchangesAsync,
      data: (exchanges) {
        if (exchanges.isEmpty) {
          return const EmptyState(
            message: 'No exchange requests found',
            icon: Icons.swap_horiz,
          );
        }

        return RefreshIndicator(
          onRefresh: () => ref.refresh(allExchangesProvider.future),
          child: ListView.builder(
            itemCount: exchanges.length,
            itemBuilder: (context, index) {
              final exchange = exchanges[index];
              return ExchangeCardWidget(exchange: exchange);
            },
          ),
        );
      },
    );
  }
}

/// =============================================================================
/// EXCHANGE CARD WIDGET
/// =============================================================================

class ExchangeCardWidget extends StatelessWidget {
  final Exchange exchange;

  const ExchangeCardWidget({super.key, required this.exchange});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.swap_horiz, color: Colors.orange),
                const SizedBox(width: 8),
                const Text(
                  'Exchange Request',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text('Matched Properties: ${exchange.matchedProperties.length}'),
            if (exchange.fallbackToBuy) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'Open to Buy',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// =============================================================================
/// PROPERTY DETAILS SCREEN
/// =============================================================================

class PropertyDetailsScreen extends StatelessWidget {
  final String propertyId;

  const PropertyDetailsScreen({
    super.key,
    required this.propertyId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Property Details'),
      ),
      body: PropertyDetailsWidget(propertyId: propertyId),
    );
  }
}

/// =============================================================================
/// NOTIFICATION SCREEN
/// =============================================================================

class NotificationScreenRiverpod extends ConsumerWidget {
  const NotificationScreenRiverpod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationsAsync = ref.watch(userNotificationsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: AsyncValueWidget<List<AppNotification>>(
        value: notificationsAsync,
        data: (notifications) {
          if (notifications.isEmpty) {
            return const EmptyState(
              message: 'No notifications',
              icon: Icons.notifications_none,
            );
          }

          return RefreshIndicator(
            onRefresh: () => ref.refresh(userNotificationsProvider.future),
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return NotificationTile(notification: notification);
              },
            ),
          );
        },
      ),
    );
  }
}

class NotificationTile extends ConsumerWidget {
  final AppNotification notification;

  const NotificationTile({super.key, required this.notification});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: notification.isRead
            ? Colors.grey.shade300
            : Colors.blue.shade100,
        child: Icon(
          _getIcon(notification.category),
          color: notification.isRead ? Colors.grey : Colors.blue,
        ),
      ),
      title: Text(
        notification.message,
        style: TextStyle(
          fontWeight: notification.isRead ? FontWeight.normal : FontWeight.bold,
        ),
      ),
      subtitle: Text(
        _formatTime(notification.timestamp),
        style: const TextStyle(fontSize: 12),
      ),
      onTap: () async {
        if (!notification.isRead && notification.id != null) {
          final notificationService = ref.read(notificationServiceProvider);
          await notificationService.markAsRead(notification.id!);
          ref.invalidate(userNotificationsProvider);
        }
      },
    );
  }

  IconData _getIcon(NotificationCategory category) {
    switch (category) {
      case NotificationCategory.buy:
        return Icons.shopping_bag;
      case NotificationCategory.sell:
        return Icons.sell;
      case NotificationCategory.exchange:
        return Icons.swap_horiz;
      case NotificationCategory.system:
        return Icons.info;
    }
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

