import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram/screens/postPage_controller.dart';

class Postpage extends StatelessWidget {

  final PostController _controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () {

          },
        ),
        title: Text("New Post",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        actions: [
          TextButton(
            onPressed: () {
              // Handle the "Next" action
            },
            child: Text("Next", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: screenWidth,
            height: 300,
            child: Image.asset(
              "assets/img_5.png",
              fit: BoxFit.cover,  // Ensure the image covers the container while maintaining its aspect ratio
            ),
          ),
          SizedBox(height: 16), // Add some spacing between the top image and the grid
          Expanded(
            child: Obx(() => GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,  // Number of images per row
                crossAxisSpacing: 8.0,  // Spacing between columns
                mainAxisSpacing: 8.0,  // Spacing between rows
              ),
              itemCount: _controller.imagePaths.length,  // Number of images in the grid
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Image.asset(
                    _controller.imagePaths[index],
                    fit: BoxFit.cover,  // Ensure the image scales to cover the container
                  ),
                );
              },
            )),
          ),
        ],
      ),
    );
  }
}
