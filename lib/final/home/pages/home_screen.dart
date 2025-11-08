import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/generated/bloc/bloc_exports.dart';
import 'package:buildglory/final/home/widgets/property_home_screen.dart';
import 'package:buildglory/new/presentation/home/widgets/exchange_widget.dart';
import 'package:buildglory/new/presentation/home/widgets/sell_widget.dart';
import 'package:buildglory/new/presentation/notification/pages/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        final userName = authState is Authenticated
            ? (authState.user.name ?? "there")
            : "there";

        return BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, notificationState) {
            final unreadCount = notificationState is NotificationsLoaded
                ? notificationState.unreadCount
                : 0;

            return _buildHomeScreen(context, userName, unreadCount);
          },
        );
      },
    );
  }

  Widget _buildHomeScreen(BuildContext context, String userName, int unreadCount) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "Hey $userName!",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: const Text("Find, Flip, Flourish"),
                  trailing: Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const NotificationScreen();
                              },
                            ),
                          );
                        },
                        child: const Icon(Icons.notifications_none_rounded),
                      ),
                      if (unreadCount > 0)
                        Positioned(
                          right: 0,
                          top: 0,
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
                  ),
                ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20,
                          top: 15,
                          // bottom: 20,
                        ),
                        child: Container(
                          height: 56,
                          decoration: BoxDecoration(
                            color: Color(0xFFF3F4F6),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedType = "Sell";
                                      flowname = "Sell";
                                    });
                                    // Load sell listings
                                    context.read<SellBloc>().add(
                                          const LoadSellsEvent(),
                                        );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(4),
                                    decoration: selectedType == "Sell"
                                        ? BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.green.shade200,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                          )
                                        : null,
                                    child: Column(
                                      spacing: 5,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(sellIcon),
                                        const Text("Sell"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedType = "Buy";
                                      flowname = "Buy";
                                    });
                                    // Load properties
                                    context.read<PropertyBloc>().add(
                                          const LoadHomepagePropertiesEvent(),
                                        );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(4),
                                    decoration: selectedType == "Buy"
                                        ? BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.green.shade200,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                          )
                                        : null,
                                    child: Column(
                                      spacing: 5,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(buyIcon),
                                        const Text("Buy"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedType = "Exchange";
                                      flowname = "Exchange";
                                    });
                                    // Load exchanges
                                    context.read<ExchangeBloc>().add(
                                          const LoadExchangesEvent(),
                                        );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(4),
                                    decoration: selectedType == "Exchange"
                                        ? BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.green.shade200,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                          )
                                        : null,
                                    child: Column(
                                      spacing: 5,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(exchangeIcon),
                                        const Text("Exchange"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: selectedType == "Sell"
                            ? const SellWidget()
                            : selectedType == "Buy"
                                ? const PropertyHomeScreen()
                                : selectedType == "Exchange"
                                    ? const ExchangeWidget()
                                    : null,
                      ),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
