import 'package:flutter/material.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<String> _imagePaths = [
    'assets/img_1.png',
    'assets/img_2.png',
    'assets/img_3.png',
    'assets/img_4.png',
    'assets/img_5.png',
    'assets/img_1.png',
    'assets/img_2.png',
    'assets/img_1.png',
    'assets/img_3.png',
    'assets/img_1.png',
    'assets/img_2.png',
    'assets/img_3.png',
    'assets/img_1.png',
    'assets/img_3.png',
    'assets/img_1.png',
    'assets/img_2.png',
    'assets/img_1.png',
    'assets/img_1.png',
    // Add more image paths as needed
  ];

  Container _buildContainer(String text) {
    return Container(
      width: 100,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black,
      ),
      child: Center(child: Text(text, style: TextStyle(color: Colors.white))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(
        title: Container(
          height: 40,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            controller: _searchController,
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Search...',
              filled: true,
              fillColor: Colors.white12,
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [

          SliverToBoxAdapter(
            child: Container(
              height: 50,
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildContainer("Drawing"),
                    SizedBox(width: 10,),
                    _buildContainer("Dogs"),
                    SizedBox(width: 10,),
                    _buildContainer("Dance"),
                    SizedBox(width: 10,),
                    _buildContainer("Drawing"),
                    SizedBox(width: 10,),
                    _buildContainer("Drawing"),
                  ],
                ),
              ),
            ),
          ),

          SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {

                final imagePath = _imagePaths[index % _imagePaths.length];
                return Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                );
              },
              childCount: _imagePaths.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
          ),

          if (_searchQuery.isNotEmpty) SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return ListTile(
                  leading: Icon(Icons.search),
                  title: Text('Result $index'),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
