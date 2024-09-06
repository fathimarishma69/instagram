import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'homepage_controller.dart';  // Import the controller

class Homepage extends StatelessWidget {
  Homepage({super.key});

  // Instantiate the controller
  final HomepageController controller = Get.put(HomepageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Instagram",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Insta',
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {
              // Add favorite functionality
            },
          ),
          IconButton(
            icon: const FaIcon(
              FontAwesomeIcons.facebookMessenger,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Horizontal scroll for profile images
            Obx(() => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // Add the new CircleAvatar at the beginning
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage("assets/img_8.png"),
                            ),
                            Positioned(
                              bottom: 0, // Position at the bottom of the avatar
                              right: 0,  // Position at the right side of the avatar
                              child: CircleAvatar(
                                radius: 10, // Adjust the radius as needed
                                backgroundColor: Colors.black, // Background color for the smaller circle
                                child: CircleAvatar(
                                  radius: 8, // Inner circle with a smaller radius
                                  backgroundColor: Colors.blue,
                                  child: Icon(
                                    Icons.add, // Adding the '+' icon inside the small circle
                                    size: 12,
                                    color: Colors.black, // Icon color
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Your story",
                          style: TextStyle(fontSize: 12,color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  // Generate the rest of the CircleAvatars
                  ...List.generate(
                    controller.profileImages.length,
                        (index) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: const AssetImage("assets/img_7.png"),
                            child: CircleAvatar(
                              radius: 32,
                              backgroundImage: AssetImage(controller.profileImages[index]),
                            ),
                          ),
                          Text(
                            controller.profileNames[index],
                            style: const TextStyle(fontSize: 12,color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
            // Post list
            Obx(() => Column(
              children: List.generate(
                controller.profileImages.length,
                    (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile image and name
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: const AssetImage("assets/img_7.png"),
                              child: CircleAvatar(
                                radius: 28,
                                backgroundImage: AssetImage(controller.profileImages[index]),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            controller.profileNames[index],
                            style: const TextStyle(fontSize: 16,color: Colors.white),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.more_vert, size: 30,color: Colors.white,),
                            onPressed: () {
                              // Add favorite functionality
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Post image
                      Container(
                        width: double.infinity,
                        child: Image.asset(controller.postImages[index]),
                      ),
                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.favorite_border, size: 30,color: Colors.white,),
                            onPressed: () {
                              // Add favorite functionality
                            },
                          ),
                          const SizedBox(width: 5),
                          Text("345",style: TextStyle(color: Colors.white),),
                          const SizedBox(width: 10),
                          IconButton(
                            icon: const FaIcon(FontAwesomeIcons.comment,color: Colors.white,),
                            onPressed: () {

                            },
                          ),
                          const SizedBox(width: 5),
                          Text("12",style: TextStyle(color: Colors.white),),
                          const SizedBox(width: 10),
                          IconButton(
                            icon: const FaIcon(FontAwesomeIcons.paperPlane,color: Colors.white,),
                            onPressed: () {
                              // Share functionality
                            },
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const FaIcon(FontAwesomeIcons.bookmark,color: Colors.white,),
                            onPressed: () {
                              // Save functionality
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          controller.postDescriptions[index],
                          style: const TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
