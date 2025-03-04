import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      //           colors: [Colors.deepPurple, Colors.purple]
      //         ),
      //       ),
      //     ),
      //     title: _appBar(),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    _hero(),
                    SizedBox(height: 65),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: _buildKaiPaySection(),
                )
              ],
            ),
            _buildServiceIcons(),
            _buildTripPlannerCard(),
            _buildAdditionalServices(),
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
                  fontSize: 10,
                  color: Colors.white,
                ),
                "Selamat Siang,"
              ),
              Text(
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
                "Mamank"
              )
            ],
          ),
        ),
        Row(
          spacing: 2,
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: Colors.white24,
              ),
              child: Center(
                child: Icon(
                  size: 15,
                  color: Colors.white,
                  Icons.shopping_cart,
                ),
              ),
            ),
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: Colors.white24,
              ),
              child: Center(
                child: Icon(
                  size: 15,
                  color: Colors.white,
                  Icons.shopping_cart,
                ),
              ),
            ),
            Container(
              height: 28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: Colors.white24
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Icon(
                        size: 13,
                        color: Colors.white,
                        Icons.shopping_cart,
                      ),
                      Text(
                        softWrap: false,
                        style: TextStyle(
                          fontSize: 10,
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
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.deepPurple, Colors.purpleAccent]
        )
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15, 35, 15, 15),
            child: _appBar(),
          ),
          Container(
            height: 140,
          )
        ],
      )
    );
  }

  Widget _buildKaiPaySection() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold
                          ),
                          "KAI PAY"
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(
                              color: Colors.deepPurpleAccent,
                              width: 1
                            ), 
                          ),
                          child: Text(
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.deepPurpleAccent
                            ),
                            "Aktivasi KAIPay"
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _kaiPayButtonIcon(Icons.qr_code_scanner, "Scan"),
                      _kaiPayButtonIcon(Icons.wallet, "Top Up"),
                      _kaiPayButtonIcon(Icons.history, "Riwayat"),
                    ],
                  )
                ],
              ),
              Divider(color: Colors.grey),
              Row(
                children: [
                  Image.asset(
                    'assets/icons/coin.png',
                    height: 20,
                    width: 20
                  )
                ],
              )
            ],
          )
        ),
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.all(16.0),
    //   child: Card(
    //     elevation: 4,
    //     child: Padding(
    //       padding: const EdgeInsets.all(16.0),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Text("KAI PAY", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    //               ElevatedButton(onPressed: () {}, child: Text("Aktivasi KAI Pay"))
    //             ],
    //           ),
    //           SizedBox(height: 10),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceAround,
    //             children: [
    //               _iconWithLabel(Icons.qr_code_scanner, "Scan"),
    //               _iconWithLabel(Icons.attach_money, "Top Up"),
    //               _iconWithLabel(Icons.history, "Riwayat"),
    //             ],
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  Widget _kaiPayButtonIcon(IconData icon, String text) {
  return IconButton(
    style: IconButton.styleFrom(
      foregroundColor: Colors.deepPurpleAccent,
      fixedSize: Size.fromWidth(60)
    ),
    onPressed: () {}, 
    icon: Column(
      children: [
        Icon(
          icon
        ),
        Text(
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurpleAccent
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
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            spacing: 20,
            children: services.map((service) => _iconWithLabel(service['icon'], service['label'])).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildTripPlannerCard() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.deepPurple, Colors.purpleAccent],
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("TRIP Planner Baru", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text("Buat perencanaan terbaik untuk perjalananmu.", style: TextStyle(color: Colors.white)),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(style: TextStyle(
                      color: Colors.black
                    ) , 
                    "BUAT"),
                    style: ElevatedButton.styleFrom(foregroundColor: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }

  Widget _buildAdditionalServices() {
    List<Map<String, dynamic>> services = [
      {"icon": Icons.fastfood, "label": "RailFood"},
      {"icon": Icons.local_taxi, "label": "Taksi"},
      {"icon": Icons.directions_bus, "label": "Bus"},
      {"icon": Icons.hotel, "label": "Hotel"},
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        spacing: 20,
        children: services.map((service) => _iconWithLabel(service['icon'], service['label'])).toList(),
      ),
    );
  }

  Widget _iconWithLabel(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.deepPurpleAccent.shade100,
          child: Icon(icon, color: Colors.deepPurpleAccent, size: 30),
        ),
        SizedBox(height: 8),
        Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 12))
      ],
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.deepPurpleAccent,
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  "Promo Terbaru"
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
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
      ),
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
