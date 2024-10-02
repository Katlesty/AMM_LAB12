import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menú',
      theme: ThemeData(
        primaryColor: Colors.cyan, // Color celeste para la barra de menú
        scaffoldBackgroundColor: Colors.grey[50], // Fondo gris claro
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MenuScreen(),
    );
  }
}

class MenuItem {
  final String title;
  final String price;
  final String imageUrl;

  MenuItem({required this.title, required this.price, required this.imageUrl});
}

List<MenuItem> menuList = [
  MenuItem(
    title: 'Ceviche',
    price: 'S/ 25.00',
    imageUrl: 'https://imgmedia.larepublica.pe/640x371/larepublica/migration/images/BYR7OLNP6REB7GJDLMWTF2WAC4.webp',
  ),
  MenuItem(
    title: 'Lomo Saltado',
    price: 'S/ 15.00',
    imageUrl: 'https://trome.com/resizer/_hcB5Bvb3SQWXAQpXGzI-d8K59o=/1200x675/smart/filters:format(jpeg):quality(75)/cloudfront-us-east-1.images.arcpublishing.com/elcomercio/X4RTLRSFS5GX5CE26F4D25KUIU.jpg',
  ),
  MenuItem(
    title: 'Ají de Gallina',
    price: 'S/ 16.00',
    imageUrl: 'https://cclconectados.com/wp-content/uploads/2023/09/ajidegallina.jpg',
  ),
  MenuItem(
    title: '1/4 Pollo a la Brasa',
    price: 'S/ 20.00',
    imageUrl: 'https://buenazo.cronosmedia.glr.pe/original/2021/05/24/60ac32a1b8ecfe147c041613.jpg',
  ),
  MenuItem(
    title: 'Rocoto Relleno',
    price: 'S/ 12.00',
    imageUrl: 'https://mojo.generalmills.com/api/public/content/O-OFmxjsVUynqsFBv2xWWQ_gmi_hi_res_jpeg.jpeg?v=48a505e6&t=16e3ce250f244648bef28c5949fb99ff',
  ),
];

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menú', style: TextStyle(fontSize: 24, color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue, 
      ),
      body: ListView.builder(
        itemCount: menuList.length,
        itemBuilder: (context, index) {
          return MenuItemWidget(menuItem: menuList[index]);
        },
      ),
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  final MenuItem menuItem;

  MenuItemWidget({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.network(
              menuItem.imageUrl,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    menuItem.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    menuItem.price,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
