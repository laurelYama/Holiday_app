import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: PhotoGalleryPage(),
      ),
    );
  }
}

class PhotoGalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close), // Close icon
          onPressed: () {
            Navigator.pop(context); // Close the gallery
          },
        ),
        title: Text('Photo Gallery'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // Height of the tab bar
          child: Row(
            children: [
              Expanded(
                // Button "Official Photos"
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black, // Black background for official photos
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(0)), // Rounded corners
                  ),
                  child: Tab(
                    child: Text(
                      'Official Photos (14)',
                      style: TextStyle(color: Colors.white), // White text
                    ),
                  ),
                ),
              ),
              Expanded(
                // Button "Custom Photos"
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // White background for custom photos
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(10)), // Rounded corners
                  ),
                  child: Tab(
                    child: Text(
                      'Custom Photos (9617)',
                      style: TextStyle(color: Colors.black), // Black text
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        children: [
          PhotoGrid(photoType: 'official', isOfficial: true),
          PhotoGrid(photoType: 'custom', isOfficial: false),
        ],
      ),
    );
  }
}

class PhotoGrid extends StatelessWidget {
  final String photoType;
  final bool isOfficial;

  // Sample image URLs for official and custom photos
  final List<String> officialPhotos = [
    'https://th.bing.com/th/id/OIP.yj1iqhHtOV1R_IjSRh8OkwHaE7?w=626&h=417&rs=1&pid=ImgDetMain',
    'https://th.bing.com/th/id/OIP.Mjo3a-YmNbc0DyFlSo8rIwHaE7?rs=1&pid=ImgDetMain',
    'https://th.bing.com/th/id/OIP.uihM1HgOlSZs7y9XQ3-BnAHaJQ?rs=1&pid=ImgDetMain',
    'https://th.bing.com/th/id/OIP.1lTc7YrLU_08ieoPDuNpBwHaFj?pid=ImgDet&w=185&h=138&c=7&dpr=1.3',
    'https://th.bing.com/th/id/OIP.0xBwr74WxZZeI_nqBLopTgHaJQ?pid=ImgDet&w=185&h=231&c=7&dpr=1.3',
    'https://th.bing.com/th/id/OIP.7KtcJy6rSWq1TBW4EHvyswHaFW?w=239&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    'https://th.bing.com/th/id/OIP.cyS7ySJZZPmZaPJKUtUeKwHaE_?w=302&h=203&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    'https://th.bing.com/th/id/OIP.fNvUY6OpY8Lp1EXCdvxABAHaKD?w=138&h=187&c=7&r=0&o=5&dpr=1.3&pid=1.7',
  ];

  final List<String> customPhotos = [
    'https://via.placeholder.com/150/FF5733/FFFFFF?text=Custom+Photo+1',
    'https://via.placeholder.com/150/33FF57/FFFFFF?text=Custom+Photo+2',
    'https://via.placeholder.com/150/3357FF/FFFFFF?text=Custom+Photo+3',
    'https://via.placeholder.com/150/FF33A1/FFFFFF?text=Custom+Photo+4',
    'https://via.placeholder.com/150/A133FF/FFFFFF?text=Custom+Photo+5',
    'https://via.placeholder.com/150/33FFF5/FFFFFF?text=Custom+Photo+6',
    'https://via.placeholder.com/150/F5FF33/FFFFFF?text=Custom+Photo+7',
    'https://via.placeholder.com/150/FF3333/FFFFFF?text=Custom+Photo+8',
  ];

  PhotoGrid({required this.photoType, required this.isOfficial});

  @override
  Widget build(BuildContext context) {
    // Select the appropriate photo list based on the type
    List<String> photos = isOfficial ? officialPhotos : customPhotos;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemCount: photos.length, // Use the length of the selected photo list
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10), // Rounded corners for images
          child: GestureDetector(
            onTap: () {
              // Action when tapping on the image
              print(
                  'Tapped on ${photoType} photo $index'); // Replace this with the desired action
            },
            child: Image.network(
              photos[index], // Use the selected photo URL
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
