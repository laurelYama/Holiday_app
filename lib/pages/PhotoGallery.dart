import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('All Photo'),
        ),
        body: PhotoGalleryPage(),
      ),
    );
  }
}

class PhotoGalleryPage extends StatefulWidget {
  @override
  _PhotoGalleryPageState createState() => _PhotoGalleryPageState();
}

class _PhotoGalleryPageState extends State<PhotoGalleryPage> {
  bool showOfficialPhotos = true; // Boolean to switch between photo sets

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showOfficialPhotos = true; // Show official photos
                });
              },
              child: Text('Official Photos (14)'),
              style: ElevatedButton.styleFrom(
                backgroundColor: showOfficialPhotos
                    ? Colors.blue
                    : Colors.grey, // Use backgroundColor instead of primary
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showOfficialPhotos = false; // Show customer photos
                });
              },
              child: Text('Customer Photos (9617)'),
              style: ElevatedButton.styleFrom(
                backgroundColor: !showOfficialPhotos
                    ? Colors.blue
                    : Colors.grey, // Use backgroundColor instead of primary
              ),
            ),
          ],
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemCount: showOfficialPhotos ? 14 : 9617,
            itemBuilder: (context, index) {
              return Image.network(
                'https://th.bing.com/th/id/OIP.8Jp8Q8ICDfVSzWh98Q5u6gHaEO?rs=1&pid=ImgDetMain$index.jpg', // Replace with the actual image URLs
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      ],
    );
  }
}
