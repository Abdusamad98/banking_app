import 'package:banking_app/data/models/user_card.dart';
import 'package:banking_app/utils/colors.dart';
import 'package:banking_app/utils/icons.dart';
import 'package:banking_app/utils/styles.dart';
import 'package:banking_app/view_models/cards_view_model.dart';
import 'package:banking_app/widgets/card_text.dart';
import 'package:banking_app/widgets/rectangle_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<UserCard> userCards = context.watch<CardsViewModel>().getUserCards;
    print("USER CARDS LENGTH:${userCards.length}");
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 48,
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).cardColor,
                      ),
                      child: Center(child: SvgPicture.asset(MyIcons.settings)),
                    ),
                    SizedBox(
                        width: 48,
                        height: 48,
                        child: Image.asset(MyIcons.girlProfile)),
                    Container(
                      width: 48,
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Theme.of(context).cardColor,
                      ),
                      child: Center(child: SvgPicture.asset(MyIcons.notif)),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 220,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total balance",
                            style: MyTextStyle.regular16
                                .copyWith(color: MyColors.gray1),
                          ),
                          const SizedBox(height: 8),
                          const CardText(
                            t1: "£ 23,970",
                            t2: ".30",
                            fontSize: 32,
                          ),
                          const SizedBox(height: 30),
                          Text(
                            "This month",
                            style: MyTextStyle.regular16
                                .copyWith(color: MyColors.gray1),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              SvgPicture.asset(MyIcons.income),
                              const SizedBox(width: 15),
                              const CardText(
                                t1: "£ 5,235",
                                t2: ".25",
                                fontSize: 20,
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              SvgPicture.asset(MyIcons.expense),
                              const SizedBox(width: 15),
                              const CardText(
                                t1: "£ 3,710",
                                t2: ".80",
                                fontSize: 20,
                              )
                            ],
                          ),
                        ],
                      ),
                      Container(
                        color: Colors.green,
                        width: 300,
                        height: 200,
                        child: Stack(
                          children: [
                            // Positioned(
                            //   right: -170,
                            //   top: 90,
                            //   child: Stack(
                            //     clipBehavior: Clip.none,
                            //     children: [
                            //       Positioned(
                            //         top: 20,
                            //         left: 30,
                            //         child: Container(
                            //           width: 311,
                            //           height: 214,
                            //           decoration: BoxDecoration(
                            //             color: MyColors.indigo,
                            //             borderRadius: BorderRadius.circular(16),
                            //           ),
                            //         ),
                            //       ),
                            //       Positioned(
                            //         top: 10,
                            //         left: 15,
                            //         child: Container(
                            //           width: 311,
                            //           height: 214,
                            //           decoration: BoxDecoration(
                            //             color: MyColors.orange,
                            //             borderRadius: BorderRadius.circular(16),
                            //           ),
                            //         ),
                            //       ),
                            //       Container(
                            //         width: 311,
                            //         height: 214,
                            //         decoration: BoxDecoration(
                            //           gradient: const RadialGradient(
                            //             colors: MyColors.yellowGreen,
                            //             center: Alignment.topLeft,
                            //             tileMode: TileMode.mirror,
                            //           ),
                            //           borderRadius: BorderRadius.circular(16),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 33),
                const RectangleRow(
                    t1: "Transfer",
                    t2: "Exchange",
                    t3: "Payments",
                    ch1: MyIcons.arrows,
                    ch2: MyIcons.currency,
                    ch3: MyIcons.wallet),
                const SizedBox(height: 24),
                const RectangleRow(
                    t1: "Credits",
                    t2: "Deposits",
                    t3: "Cashback",
                    ch1: MyIcons.purchase,
                    ch2: MyIcons.percent,
                    ch3: MyIcons.gift),
                const SizedBox(height: 24),
                const RectangleRow(
                    t1: "ATM",
                    t2: "Security",
                    t3: "More",
                    ch1: MyIcons.money,
                    ch2: MyIcons.security,
                    ch3: MyIcons.grid),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
