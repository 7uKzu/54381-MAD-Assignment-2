import 'package:flutter/material.dart';

void main() {
  runApp(TravelGuideApp());
}

class TravelGuideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Guide',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [HomeScreen(), ListScreen(), AboutScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Travel Guide')),
      body: SafeArea(child: _screens[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blueAccent,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Destinations',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final TextEditingController destinationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1507525428034-b723cf961d3e',
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.lightBlue[50],
            child: const Text(
              'Welcome to Travel Guide App! Discover the best destinations and experiences around the world.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 12),
          RichText(
            text: const TextSpan(
              style: TextStyle(fontSize: 22, color: Colors.black),
              children: [
                TextSpan(text: 'Explore the '),
                TextSpan(
                  text: 'World',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                TextSpan(
                  text: ' with Us!',
                  style: TextStyle(color: Colors.deepOrange),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: destinationController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Destination Name',
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final destination = destinationController.text.trim();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    destination.isEmpty
                        ? 'Please enter a destination first!'
                        : 'Searching for $destination...',
                  ),
                  backgroundColor: Colors.blueAccent,
                  duration: const Duration(seconds: 3),
                ),
              );
            },
            child: const Text('Search Destination'),
          ),
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('TextButton clicked! Welcome, traveler!'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: const Text('Click Me'),
          ),
        ],
      ),
    );
  }
}

class ListScreen extends StatelessWidget {
  final List<Map<String, String>> destinations = const [
    {'name': 'Paris', 'desc': 'The City of Lights and Love.'},
    {'name': 'Tokyo', 'desc': 'Blend of tradition and technology.'},
    {'name': 'New York', 'desc': 'The city that never sleeps.'},
    {'name': 'Rome', 'desc': 'Home of the ancient Roman Empire.'},
    {'name': 'Dubai', 'desc': 'Luxury, desert, and skyscrapers.'},
    {'name': 'Istanbul', 'desc': 'Where East meets West.'},
    {'name': 'Bali', 'desc': 'Tropical paradise island in Indonesia.'},
    {'name': 'London', 'desc': 'The capital of England and history.'},
    {'name': 'Cairo', 'desc': 'Gateway to the ancient pyramids.'},
    {'name': 'Sydney', 'desc': 'Iconic Opera House and beaches.'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: destinations.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.location_on, color: Colors.blue),
          title: Text(destinations[index]['name']!),
          subtitle: Text(destinations[index]['desc']!),
        );
      },
    );
  }
}

class AboutScreen extends StatelessWidget {
  final List<Map<String, String>> landmarks = const [
    {
      'image':
          'https://images.unsplash.com/photo-1570097703229-b195d6dd291f?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZWlmZmVsJTIwdG93ZXJ8ZW58MHx8MHx8fDA%3D&fm=jpg&q=60&w=3000',
      'name': 'Eiffel Tower',
    },
    {
      'image':
          'https://d3hne3c382ip58.cloudfront.net/files/uploads/bookmundi/resized/cmsfeatured/visiting-the-great-wall-of-china-featured-image-1560845062-785X440.jpg',
      'name': 'Great Wall of China',
    },
    {
      'image':
          'https://plus.unsplash.com/premium_photo-1661963952208-2db3512ef3de?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Y29sb3NzZXVtfGVufDB8fDB8fHww&fm=jpg&q=60&w=3000',
      'name': 'Colosseum',
    },
    {
      'image':
          'https://images.unsplash.com/photo-1572364769167-198dcb7b520c?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YnVyaiUyMGtoYWxpZmF8ZW58MHx8MHx8fDA%3D&fm=jpg&q=60&w=3000',
      'name': 'Burj Khalifa',
    },
    {
      'image':
          'https://res.cloudinary.com/aenetworks/image/upload/c_fill,ar_2,w_3840,h_1920,g_auto/dpr_auto/f_auto/q_auto:eco/v1/taj-mahal-gettyimages-463924915?_a=BAVAZGID0',
      'name': 'Taj Mahal',
    },
    {
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/New_York_City_%28New_York%2C_USA%29%2C_Statue_of_Liberty_--_2012_--_6819.jpg/1365px-New_York_City_%28New_York%2C_USA%29%2C_Statue_of_Liberty_--_2012_--_6819.jpg',
      'name': 'Statue of Liberty',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: landmarks.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Image.network(
                    landmarks[index]['image']!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  landmarks[index]['name']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
