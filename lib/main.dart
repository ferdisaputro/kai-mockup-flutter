import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mockup_ki/primary_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     flexibleSpace: Container(
      //       decoration: BoxDecoration(
      //         gradient: LinearGradient(
      //           begin: Alignment.centerLeft,
      //           end: Alignment.centerRight,
      //           colors: [PrimaryColors.purple, Colors.purplePrimaryColors.lightPurple         ),
      //       ),
      //     ),
      //     title: _appBar(),
      // ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    _hero(),
                    SizedBox(height: 60),
                  ],
                ),
                Positioned(
                  bottom: 5,
                  left: 16,
                  right: 16,
                  child: _buildKaiPaySection(),
                )
              ],
            ),
            _buildServiceIcons(),
            _buildAdditionalServices(),
            _buildTripPlannerCard(),
            _newestDiscountBanner(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _appBar() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
                "Selamat Siang,"
              ),
              Text(
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
                "Mamank"
              )
            ],
          ),
        ),
        Row(
          spacing: 5,
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: Colors.white12,
              ),
              child: Center(
                child: Icon(
                  size: 16,
                  color: Colors.white,
                  Icons.shopping_cart,
                ),
              ),
            ),
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: Colors.white12,
              ),
              child: Center(
                child: Icon(
                  size: 16,
                  color: Colors.white,
                  Icons.email_rounded,
                ),
              ),
            ),
            Container(
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: Colors.white12
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    spacing: 5,
                    children: [
                      Icon(
                        size: 13,
                        color: Colors.white,
                        Icons.headset_mic_outlined,
                      ),
                      Text(
                        softWrap: false,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white
                        ),
                        "Bantuan"
                      ),
                    ],
                  ),
                )
              ),
            ),
          ]
        )
      ],
    );
  }

  Widget _hero() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              stops: [0, 0.2, 1],
              colors: [PrimaryColors.purple, PrimaryColors.purple, PrimaryColors.lightPurple]
            )
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 45, 15, 15),
                child: _appBar(),
              ),
              Container(
                height: 130,
              )
            ],
          )
        ),
        Positioned(
          top: -20,
          left: 0,
          right: 0,
          bottom: 0,
          child: Opacity(
            opacity: 0.1,
            child: Image.asset(
              'assets/images/city.png',
              width: double.infinity,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildKaiPaySection() {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        spacing: 5,
                        children: [
                          Image.asset(
                            'assets/icons/planner.webp',
                            height: 23,
                            width: 23
                          ),
                          Text(
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),
                            "KAI PAY"
                          ),
                        ],
                      ),
                      _outlinedButton("Aktivasi KAIPay")
                    ],
                  ),
                  VerticalDivider(
                    width: 3,
                    color: Colors.grey.shade400,
                    thickness: 1,
                  ),
                  SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _kaiPayButtonIcon(Icons.qr_code_scanner, "Scan"),
                        _kaiPayButtonIcon(Icons.wallet, "Top Up"),
                        _kaiPayButtonIcon(Icons.history, "Riwayat", disabled: true),  
                      ],
                    ),
                  )
                ],
              ),
            )
          ),
          Divider(
            height: 1,
            color: Colors.grey.shade400
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    spacing: 4,
                    children: [
                      Image.asset(
                        'assets/icons/coin.png',
                        height: 23,
                        width: 23
                      ),
                      Row(
                        spacing: 2,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.red 
                            ),
                            "0"
                          ),
                          Text(
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            "RailPoin"
                          ),
                        ]
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 33,
                  child: IconButton(
                    onPressed: () {},
                    style: IconButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 13),
                      backgroundColor: PrimaryColors.blue.withValues(alpha: 0.1),
                    ),
                    icon: Row(
                      spacing: 4,
                      children: [
                        Icon(
                          size: 25,
                          Icons.stars_outlined,
                          color: PrimaryColors.blue,
                        ), 
                        Text(
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: PrimaryColors.blue
                          ),
                          "Basic"
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: PrimaryColors.blue,
                            borderRadius: BorderRadius.circular(999)
                          ),
                          child: Icon(
                            size: 18,
                            color: Colors.white,
                            Icons.keyboard_arrow_right_rounded
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }

  Widget _outlinedButton(String text) {
    return SizedBox(
      height: 30,
      child: OutlinedButton(
        onPressed: () {}, 
        style: ElevatedButton.styleFrom(
          side: BorderSide(
            color: PrimaryColors.blue,
            width: 1,
          ), 
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap
        ),
        child: Text(
          softWrap: false,
          style: TextStyle(
            fontSize: 13,
            color: PrimaryColors.blue,
            fontWeight: FontWeight.bold
          ),
          text
        ),
      ),
    );
  }

  Widget _kaiPayButtonIcon(IconData icon, String text, {bool disabled = false}) {
    return IconButton(
      style: IconButton.styleFrom(
        foregroundColor: disabled? Colors.grey : PrimaryColors.blue,
        fixedSize: Size.fromWidth(50),
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () {}, 
      icon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            size: 25,
            icon
          ),
          Text(
            softWrap: false,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: disabled? Colors.grey : PrimaryColors.blue
            ),
            text
          ),
        ]
      )
    );
  }

  Widget _buildServiceIcons() {
    List<Map<String, dynamic>> services = [
      {"icon": Icons.train, "label": "Antar Kota"},
      {"icon": Icons.directions_subway, "label": "Lokal"},
      {"icon": Icons.tram, "label": "Commuter Line"},
      {"icon": Icons.directions_railway, "label": "LRT"},
      {"icon": Icons.flight, "label": "Bandara"},
      {"icon": Icons.double_arrow_rounded, "label": "Whoosh"},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            spacing: 20,
            children: services.map((service) => _iconWithLabel(service['icon'], service['label'])).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildAdditionalServices() {
    List<Map<String, dynamic>> services = [
      {"icon": Icons.apartment_rounded, "label": "Hotel"},
      {"icon": Icons.emoji_transportation_rounded, "label": "Kartu Multi Trip"},
      {"icon": Icons.cases_rounded, "label": "KAI Logistik"},
      {"icon": Icons.more_horiz_rounded, "label": "Show More"},
    ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: services.map((service) => _iconWithLabel(service['icon'], service['label'])).toList(),
      ),
    );
  }

  Widget _iconWithLabel(IconData icon, String label) {
    return IconButton(
      onPressed: () {},
      constraints: BoxConstraints(
        maxWidth: 65
      ),
      style: IconButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: PrimaryColors.blue.withValues(alpha: .1),
            child: Icon(icon, color: PrimaryColors.blue, size: 30),
          ),
          SizedBox(height: 8),
          Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 12))
        ],
      ),
    );
  }

  Widget _buildTripPlannerCard() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/card_background.png"), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              spacing: 10,
              children: [
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage("assets/icons/portuma.webp"),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        "TRIP Planner"
                      ),
                      Text(
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                        "Buat perencanaan terbaik untuk perjalananmu"
                      ),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () {}, 
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: BorderSide(
                      color: Colors.white
                    )
                  ),
                  child: Text(
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    "BUAT"
                  ),
                )
              ],
            ),
          )
        ),
      ),
    );

    // return Padding(
    //   padding: const EdgeInsets.all(16.0),
    //   child: Card(
    //     clipBehavior: Clip.antiAlias,
    //     child: Container(
    //       decoration: BoxDecoration(
    //         gradient: LinearGradient(
    //           begin: Alignment.centerLeft,
    //           end: Alignment.centerRight,
    //           colors: [PrimaryColors.purple, PrimaryColors.lightPurple]
    //         )
    //       ),
    //       child: Padding(
    //         padding: const EdgeInsets.all(16.0),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text("TRIP Planner Baru", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
    //             SizedBox(height: 5),
    //             Text("Buat perencanaan terbaik untuk perjalananmu.", style: TextStyle(color: Colors.white)),
    //             Align(
    //               alignment: Alignment.centerRight,
    //               child: ElevatedButton(
    //                 onPressed: () {},
    //                 child: Text(style: TextStyle(
    //                   color: Colors.black
    //                 ) , 
    //                 "BUAT"),
    //                 style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     )
    //   ),
    // );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      selectedItemColor: PrimaryColors.blue,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
        BottomNavigationBarItem(icon: Icon(Icons.train), label: "Kereta"),
        BottomNavigationBarItem(icon: Icon(Icons.airplane_ticket), label: "Tiket Saya"),
        BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: "Promo"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Akun"),
      ],
    );
  }

  Widget _newestDiscountBanner() {
    return Column(
      spacing: 10,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                "Promo Terbaru"
              ),
              _outlinedButton("Lihat Semua")
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 10,
              children: [
                ...List.generate(
                  8,
                  (index) => _bannerWithText("https://asset-2.tstatic.net/tribunnews/foto/bank/images/promo-kai-bulan-oktober.jpg", "Promo Akhir Tahun")
                )
              ],
            ),
          )
        )
      ]
    );
  }


  Widget _bannerWithText(String image_url, String title) {
    return Container(
      constraints: BoxConstraints(maxWidth: 250, minWidth: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: AspectRatio(
            aspectRatio: 16/10,
            child: Image.network(
              image_url,
              ),
            ),
          ),
          Text(
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500
            ),
            title
          )
        ],
      )
    );
  }
}
