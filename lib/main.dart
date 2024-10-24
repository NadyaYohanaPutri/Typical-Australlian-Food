import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yummy Menu of the Day',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Typical Australian Food',
            style: TextStyle(
              color: Colors.black, // Solid black color for the text
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFFFFF8E1), // Solid background color
          elevation: 0, // Remove shadow
        ),
        drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFFFD54F),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://yt3.googleusercontent.com/ytc/AIdro_ks409etWwleA1ffBszRS-YPdABwr5AIWYoby14_ceA6ck=s900-c-k-c0x00ffffff-no-rj'), // Ganti dengan path gambar Anda
              ),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Menutup drawer
              },
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://www.shutterstock.com/image-vector/setting-icon-vector-gear-cog-260nw-1211635549.jpg'), // Ganti dengan path gambar Anda
              ),
              title: Text('Settings'),
              onTap: () {
                // Tambahkan logika untuk mengalihkan ke halaman pengaturan
                Navigator.pop(context); // Menutup drawer
              },
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhAf8WRjqW2PdlP759JsSkGqH-qKq6nUIdAf4CnbdlmAtLUAqJ9s3dZmayQ8kWhc33W-I&usqp=CAU'), // Ganti dengan path gambar Anda
              ),
              title: Text('About'),
              onTap: () {
                // Tambahkan logika untuk mengalihkan ke halaman tentang
                Navigator.pop(context); // Menutup drawer
              },
            ),
          ],
        ),
      ),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFFF3E0), // Cream light color
                  Color(0xFFFFD54F), // Cream yellow color
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: MenuGrid(),
          ),
        ),
      ),
    );
  }
}

class MenuGrid extends StatelessWidget {
  final List<Map<String, dynamic>> menus = [
    {
      'title': 'Pavlova',
      'rating': 5,
      'time': '20 mnt',
      'price': '50 rb',
      'sellerName': 'Yummy Official',
      'sellerImage': 'https://yt3.googleusercontent.com/ytc/AIdro_ks409etWwleA1ffBszRS-YPdABwr5AIWYoby14_ceA6ck=s900-c-k-c0x00ffffff-no-rj',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3wQA1H-hCXpg-4uBg7_MehX2spogEYxGOhA&s'
    },
    {
      'title': 'Anzac Biscuits',
      'rating': 4.9,
      'time': '15 mnt',
      'price': '45 rb',
      'sellerName': 'Yummy Official',
      'sellerImage': 'https://yt3.googleusercontent.com/ytc/AIdro_ks409etWwleA1ffBszRS-YPdABwr5AIWYoby14_ceA6ck=s900-c-k-c0x00ffffff-no-rj',
      'image': 'https://storage.googleapis.com/flip-prod-mktg-strapi/media-library/medium_makanan_khas_australia_3_a76ff5b037/medium_makanan_khas_australia_3_a76ff5b037.jpeg'
    },
    {
      'title': 'Meat Pie',
      'rating': 4.8,
      'time': '30 mnt',
      'price': '40 rb',
      'sellerName': 'Yummy Official',
      'sellerImage': 'https://yt3.googleusercontent.com/ytc/AIdro_ks409etWwleA1ffBszRS-YPdABwr5AIWYoby14_ceA6ck=s900-c-k-c0x00ffffff-no-rj',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUtXjrrolxYqX9IbmgfpBQ06Zzt9Ycx9zERw&s'
    },
    {
      'title': 'Barramundi',
      'rating': 5,
      'time': '40 mnt',
      'price': '60 rb',
      'sellerName': 'Yummy Official',
      'sellerImage': 'https://yt3.googleusercontent.com/ytc/AIdro_ks409etWwleA1ffBszRS-YPdABwr5AIWYoby14_ceA6ck=s900-c-k-c0x00ffffff-no-rj',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj_KCLRQ92kptsyNqqHXL1PqU66UqyN6KoTg&s'
    }
  ];

  Widget _buildRecipeCard({
    required String title,
    required double rating,
    required String time,
    required String price,
    required String sellerName,
    required String sellerImage,
    required bool isVerified,
    required Widget child,
  }) {
    return Card(
      elevation: 4.0,
      color: Color(0xFFFFF8E1), // Light cream color for the card
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(width: 4),
                CircleAvatar(
                  backgroundImage: NetworkImage(sellerImage),
                  radius: 15,
                ),
                SizedBox(width: 5),
                Text(
                  sellerName,
                  style: TextStyle(fontSize: 13.0),
                ),
                if (isVerified) ...[
                  SizedBox(width: 7),
                  Icon(Icons.verified, color: Colors.blue, size: 17), // Verified icon
                ],
              ],
            ),
          ),
          Center(
            child: SizedBox(
              width: 150, // Set image width
              height: 140, // Set image height
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0), // Set corner radius
                child: child,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0), // Increase font size
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 10), // Shift star icon to the right
                  Icon(Icons.star, color: Colors.orange, size: 20), // Rating icon
                  SizedBox(width: 4),
                  Text(rating.toString(), style: TextStyle(fontSize: 15.0)),
                  SizedBox(width: 15),
                  Icon(Icons.access_time_filled_rounded, color: Colors.grey, size: 19), // Time icon
                  SizedBox(width: 4),
                  Text(time, style: TextStyle(fontSize: 15.0)),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 10), // Shift eye icon to the right
                    Icon(Icons.visibility, color: Colors.grey, size: 20), // Eye icon
                    SizedBox(width: 4),
                    Text(price, style: TextStyle(fontSize: 15)), // Price
                    SizedBox(width: 70), 
                    Icon(Icons.bookmark_border, size: 20), // Bookmark icon
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.6,
      ),
      itemCount: menus.length,
      itemBuilder: (context, index) {
        final menu = menus[index];
        return _buildRecipeCard(
          title: menu['title'],
          rating: menu['rating'],
          time: menu['time'],
          price: menu['price'],
          sellerName: menu['sellerName'],
          sellerImage: menu['sellerImage'],
          isVerified: true,
          child: Image.network(
            menu['image'],
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey,
                child: Center(child: Text('Gambar Tidak Tersedia')),
              );
            },
          ),
        );
      },
    );
  }
}