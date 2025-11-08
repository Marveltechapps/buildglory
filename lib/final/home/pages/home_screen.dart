import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/final/home/bloc/home_bloc.dart';
import 'package:buildglory/final/home/bloc/home_event.dart';
import 'package:buildglory/final/home/bloc/home_state.dart';
import 'package:buildglory/final/home/widgets/property_home_screen.dart';
import 'package:buildglory/new/presentation/home/widgets/exchange_widget.dart';
import 'package:buildglory/new/presentation/home/widgets/sell_widget.dart';
import 'package:buildglory/new/presentation/notification/pages/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String selecteType = "Buy";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is SelectedTypeSuccessState) {
            selecteType = state.title;
            flowname = selecteType;
          }
        },
        builder: (context, state) {
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
                          "Hey Ababa !",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        subtitle: Text("Find, Flip, Flourish"),
                        trailing: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return NotificationScreen();
                                },
                              ),
                            );
                          },
                          child: Icon(Icons.notifications_none_rounded),
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
                                    context.read<HomeBloc>().add(
                                      OnSelectTypeEvent(title: "Sell"),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(4),
                                    decoration: selecteType == "Sell"
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
                                        Text("Sell"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    context.read<HomeBloc>().add(
                                      OnSelectTypeEvent(title: "Buy"),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(4),
                                    decoration: selecteType == "Buy"
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
                                        Text("Buy"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    context.read<HomeBloc>().add(
                                      OnSelectTypeEvent(title: "Exchange"),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(4),
                                    decoration: selecteType == "Exchange"
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
                                        Text("Exchange"),
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
                        child: selecteType == "Sell"
                            ? SellWidget()
                            : selecteType == "Buy"
                            ? PropertyHomeScreen()
                            : selecteType == "Exchange"
                            ? ExchangeWidget()
                            : null,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
