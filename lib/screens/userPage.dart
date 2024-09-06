import 'package:flutter/material.dart';
import 'package:instagram/screens/userPage1.dart';
import 'package:instagram/screens/userPhoto.dart';
import 'package:instagram/screens/userReel.dart';

class Userpage extends StatefulWidget {
  const Userpage({super.key});

  @override
  State<Userpage> createState() => _UserpageState();
}

class _UserpageState extends State<Userpage> {
  int _selectedIndex = 0; // Index to keep track of selected icon

  // List of widgets to display based on the selected icon
  final List<Widget> _pages = [
   Userpage1(),
    Userreel(),
    Userphoto()
  ];

  void _onIconTap(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Icon(Icons.lock,color: Colors.white,),
        title: Row(
          children: [
            Text('rishma_youzaf',style: TextStyle(color: Colors.white),),
            IconButton(
              icon: const Icon(Icons.check, size: 30,color: Colors.white,),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return Container(
                      color: Colors.blueGrey,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage: AssetImage("assets/img_4.png"),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'reema',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.add_box_outlined, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body:
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage("assets/img_8.png"),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.black,
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.blue,
                              child: Icon(
                                Icons.add,
                                size: 12,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text("reema",style: TextStyle(color: Colors.white),)
                  ],
                ),
                Column(
                  children: [
                    Text("23", style: TextStyle(fontSize: 20,color: Colors.white)),
                    Text("posts",style: TextStyle(fontSize: 20,color: Colors.white))
                  ],
                ),
                Column(
                  children: [
                    Text("540", style: TextStyle(fontSize: 20,color: Colors.white),),
                    Text("followers",style: TextStyle(fontSize: 20,color: Colors.white))
                  ],
                ),
                Column(
                  children: [
                    Text("230", style: TextStyle(fontSize: 20,color: Colors.white)),
                    Text("following",style: TextStyle(fontSize: 20,color: Colors.white))
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black54,
                  ),
                  child: Center(child: Text("Edit profile",style: TextStyle(color: Colors.white),)),
                ),
                Container(
                  width: 130,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black54,
                  ),
                  child: Center(child: Text("Share profile",style: TextStyle(color: Colors.white),)),
                ),
                Container(
                  width: 50,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black54,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.person,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.grid_on, size: 30, color: Colors.white),
                onPressed: () => _onIconTap(0), // Set selected index to 0
              ),
              IconButton(
                icon: Icon(Icons.video_library, size: 30, color: Colors.white),
                onPressed: () => _onIconTap(1), // Set selected index to 1
              ),
              IconButton(
                icon: Icon(Icons.person, size: 30, color: Colors.white),
                onPressed: () => _onIconTap(2), // Set selected index to 2
              ),
            ],
          ),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex, // Switch content based on selected index
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }
}
