import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_19/core/consts/app_colors.dart';
import 'package:flutter_application_19/core/consts/app_fonts.dart';
import 'package:flutter_application_19/data/model/currency.dart';
import 'package:flutter_application_19/data/model/ws_model.dart';
import 'package:flutter_application_19/presentation/widgets/custom_btn.dart';
import 'package:flutter_application_19/presentation/widgets/graphic.dart';
import 'package:flutter_application_19/presentation/widgets/list_currency.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late WebSocketChannel _channel;

  @override
  void initState() {
    super.initState();
    _channel = WebSocketChannel.connect(
      Uri.parse("wss://stream.binance.com:9443/ws/etheur@trade"),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _channel.sink.close();
  }

  List<FlSpot> myData = [];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
        child: StreamBuilder<dynamic>(
            stream: _channel.stream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              if (snapshot.connectionState == ConnectionState.active) {
                final Map<String, dynamic> data = json.decode(snapshot.data);
                final CryptoGraphic crypto = CryptoGraphic.fromJson(data);
                currentIndex++;
                myData.add(FlSpot(double.parse(currentIndex.toString()),
                    double.tryParse(crypto.priceOfDeal ?? '') ?? 0,));
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 43,
                          height: 40,
                          decoration: BoxDecoration(
                              color: AppColors.leadingBgColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColors.leadingColor,
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/imgs/eth.png",
                              width: 30,
                            ),
                            Text(
                              "${crypto.name}",
                              style: AppFonts.s18w400
                                  .copyWith(color: AppColors.leadingColor),
                            ),
                          ],
                        ),
                        Container(
                            width: 43,
                            height: 40,
                            decoration: BoxDecoration(
                                color: AppColors.leadingBgColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: Image.asset("assets/imgs/Chart.png")),
                      ],
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 6,
                          height: 60,
                          decoration: BoxDecoration(
                              color: AppColors.green,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              crypto.priceOfDeal.toString(),
                              style: AppFonts.s32w500
                                  .copyWith(color: Colors.white),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/imgs/arrow-up.png",
                                  width: 16,
                                ),
                                Text(
                                  "${crypto.numberOfAssets} (% ${(double.tryParse(crypto.numberOfAssets ?? "")! * 1000) / 100})",
                                  style: AppFonts.s10w400
                                      .copyWith(color: AppColors.green),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    LineChartSample2(
                      data: myData,
                      // tradeTimeX: double.parse(crypto.tradeTime.toString()),
                      // priceY: double.parse(crypto.priceOfDeal ?? ""),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomBtn(
                          onPressed: () {},
                          color: AppColors.green,
                          title: "Buy",
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        CustomBtn(
                          onPressed: () {},
                          color: AppColors.red,
                          title: "Sell",
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Quick watch",
                            style: AppFonts.s14w400
                                .copyWith(color: AppColors.dartGrey)),
                        Text("See all",
                            style: AppFonts.s14w400
                                .copyWith(color: AppColors.dartGrey)),
                      ],
                    ),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return ListCurrency(
                                img: CurrencyModelList.models[index].img,
                                color: CurrencyModelList.models[index].color,
                                name: CurrencyModelList.models[index].name,
                                shortName:
                                    CurrencyModelList.models[index].shortName,
                                price: CurrencyModelList.models[index].price,
                                percent:
                                    CurrencyModelList.models[index].percent);
                          },
                          separatorBuilder: (context, index) {
                            return const Divider(
                              color: AppColors.dartGrey,
                            );
                          },
                          itemCount: CurrencyModelList.models.length),
                    )
                  ],
                );
              }
              if (snapshot.hasError) {
                return Text(
                  snapshot.error.toString(),
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                );
              }

              return const SizedBox.shrink();
            }),
      ),
    ));
  }
}
