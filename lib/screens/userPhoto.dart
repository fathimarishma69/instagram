import 'package:flutter/material.dart';

class Userphoto extends StatefulWidget {
  const Userphoto({super.key});

  @override
  State<Userphoto> createState() => _UserphotoState();
}

class _UserphotoState extends State<Userphoto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text title
              Center(
                child: Text(
                  "Photo and \n    videoes of you",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10), // Space between title and description
              // Description
              Center(
                child: Text(
                  'When people tag you in phone and \n videos,they appear here',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 10), // Space
              Text(
                "Complete your profile",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                "3 of 4 complete",
                style: TextStyle(color: Colors.green),
              ),
              SizedBox(height: 20), // Space between description and containers

              // Horizontally Scrollable containers
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(10, (index) {
                    return Container(
                      width: 200, // Fixed width for each container
                      margin: EdgeInsets.only(right: 20),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey, width: 2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Container(
                            padding: EdgeInsets.all(2), // Border width
                            decoration: BoxDecoration(
                              color: Colors.grey, // Border color
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: CircleAvatar(
                                radius: 28,
                                backgroundColor: Colors.black,
                                // Add image or icon here
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Center(
                            child: Text(
                              'Add bio',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Tell your followers a little bit \n about yourself",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white70,
                            ),
                          ),
                          Center(
                            child: Container(height: 20,
                              width: 50,
                              decoration: BoxDecoration(color: Colors.blue,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(child: Text("bio",style: TextStyle(color: Colors.white),)),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
