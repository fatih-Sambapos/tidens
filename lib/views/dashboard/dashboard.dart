import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends GetView {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  DashboardTop(w: w, h: h),
                  DashboardBottom(h: h, w: w),
                ],
              ),
            ),
            DashboardAppbar(),
          ],
        ),
      ),
    );
  }
}

class DashboardAppbar extends StatelessWidget {
  const DashboardAppbar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        height: 65,
        child: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white.withOpacity(0.05),
          leading: Padding(
            padding: const EdgeInsets.all(15),
            child: Material(
                elevation: 7,
                color: Colors.transparent,
                child: Icon(Icons.notifications_active_outlined, size: 30)),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Material(
                elevation: 7,
                color: Colors.transparent,
                child: Icon(
                  Icons.menu_rounded,
                  size: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DashboardBottom extends StatelessWidget {
  const DashboardBottom({
    Key key,
    @required this.h,
    @required this.w,
  }) : super(key: key);

  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: h * 0.30),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        child: Container(
          width: w,
          height: h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 25),
                child: Text(
                  "Recent Transactions",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600]),
                ),
              ),
              DashboardBottomCard(
                imgUrl:
                    "https://cryptooapp.netlify.app/temp/img/content/coin1.png",
                coin: "Bitcoin",
                date: "08-24  8:04PM",
                profit: "+0.94853",
                balance: "\$2,748.94",
              ),
              DashboardBottomCard(
                imgUrl:
                    "https://cryptooapp.netlify.app/temp/img/content/coin2.png",
                coin: "Ethereum",
                date: "08-24  8:04PM",
                profit: "+0.94853",
                balance: "\$2,748.94",
              ),
              DashboardBottomCard(
                imgUrl:
                    "https://cryptooapp.netlify.app/temp/img/content/coin3.png",
                coin: "Dashcoin",
                date: "08-24  8:04PM",
                profit: "+0.94853",
                balance: "\$2,748.94",
              ),
              DashboardBottomCard(
                imgUrl:
                    "https://cryptooapp.netlify.app/temp/img/content/coin4.png",
                coin: "Ripple",
                date: "08-24  8:04PM",
                profit: "+0.94853",
                balance: "\$2,748.94",
              ),
              DashboardBottomCard(
                imgUrl:
                    "https://cryptooapp.netlify.app/temp/img/content/coin3.png",
                coin: "Dashcoin",
                date: "08-24  8:04PM",
                profit: "+0.94853",
                balance: "\$2,748.94",
              ),
              DashboardBottomCard(
                imgUrl:
                    "https://cryptooapp.netlify.app/temp/img/content/coin3.png",
                coin: "Dashcoin",
                date: "08-24  8:04PM",
                profit: "+0.94853",
                balance: "\$2,748.94",
              ),
              DashboardBottomCard(
                imgUrl:
                    "https://cryptooapp.netlify.app/temp/img/content/coin3.png",
                coin: "Dashcoin",
                date: "08-24  8:04PM",
                profit: "+0.94853",
                balance: "\$2,748.94",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardBottomCard extends StatelessWidget {
  final imgUrl;
  final coin;
  final date;
  final profit;
  final balance;
  const DashboardBottomCard({
    Key key,
    this.imgUrl,
    this.coin,
    this.date,
    this.profit,
    this.balance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:20.0,right: 20,top:20),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              Image(height: 70, image: NetworkImage(imgUrl)),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4, left: 8),
                          child: Text(
                            coin,
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey[700]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 8),
                          child: Text(
                            date,
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey[500]),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4, right: 8),
                          child: Text(
                            profit,
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                                color: Colors.green[700]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, right: 8),
                          child: Text(
                            balance,
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey[700]),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardTop extends StatelessWidget {
  const DashboardTop({
    Key key,
    @required this.w,
    @required this.h,
  }) : super(key: key);

  final double w;
  final double h;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h * 0.4,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color(0xFF3C6FDD),
          Color(0xFF023386),
          Color(0xFF000A91),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\$2,589.50",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Total Balance",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Container(),
              Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                          width: 50,
                          image: NetworkImage(
                              "https://thispersondoesnotexist.com/image?"))),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DashBoardImageButton(
                  imageUrl:
                      "https://cryptooapp.netlify.app/temp/img/content/icon1.png",
                  buttonName: "Send",
                ),
                DashBoardImageButton(
                  imageUrl:
                      "https://cryptooapp.netlify.app/temp/img/content/icon1.png",
                  buttonName: "Receive",
                ),
                DashBoardImageButton(
                  imageUrl:
                      "https://cryptooapp.netlify.app/temp/img/content/icon4.png",
                  buttonName: "Loan",
                ),
                DashBoardImageButton(
                  imageUrl:
                      "https://cryptooapp.netlify.app/temp/img/content/icon3.png",
                  buttonName: "Topup",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DashBoardImageButton extends StatelessWidget {
  final imageUrl;
  final buttonName;
  const DashBoardImageButton({
    Key key,
    this.imageUrl,
    this.buttonName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(width: 55, image: NetworkImage(imageUrl))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(buttonName,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 18)),
        )
      ],
    );
  }
}
