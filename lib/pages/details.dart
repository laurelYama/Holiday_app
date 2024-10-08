import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // Suppression de l'AppBar pour mettre l'image directement en haut
        body: DestinationCard(),
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Image en haut sans marge ni espace
          Image.network(
            'https://res.klook.com/images/fl_lossy.progressive,q_65/c_fill,w_1295,h_862/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/riwuojas4vdmpyr2biqu/TheSanctuaryofTruthTicketinPattaya.jpg',
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover, // L'image couvre tout l'espace disponible
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'The Sanctuary Of Truth',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Explore Thailand\'s Impressive Wooden Religious Shrine And Monument',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange),
                    SizedBox(width: 5),
                    Text('4.5 (4,625 Reviews)', style: TextStyle(fontSize: 14)),
                    SizedBox(width: 5),
                    Text('60K+ Booked',
                        style: TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
                SizedBox(height: 10),
                // Section avec les icônes noires
                DetailRow(
                    icon: Icons.today,
                    text: 'Available Today',
                    iconColor: Colors.black),
                DetailRow(
                    icon: Icons.flash_on,
                    text: 'Instant Confirmation',
                    iconColor: Colors.black),
                DetailRow(
                    icon: Icons.cancel,
                    text: 'No Cancellation/Free Cancellation - 24 Hours Notice',
                    iconColor: Colors.black),
                DetailRow(
                    icon: Icons.phone_android,
                    text: 'Show Mobile Or Printed Voucher',
                    iconColor: Colors.black),
                DetailRow(
                    icon: Icons.date_range,
                    text: 'Open Date Ticket/Fixed Date Ticket',
                    iconColor: Colors.black),
                DetailRow(
                    icon: Icons.store,
                    text: 'Collect Physical Ticket',
                    iconColor: Colors.black),
                DetailRow(
                    icon: Icons.location_on,
                    text: 'Meet Up At Location',
                    iconColor: Colors.black),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      '₹ 942',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '₹ 1,223',
                      style: TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '23% OFF',
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('ADD TO CART'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(vertical: 15),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('BOOK NOW'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.symmetric(vertical: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  DetailRow(
      {required this.icon, required this.text, this.iconColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 20),
          SizedBox(width: 10),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
