import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final List<Map<String, String>> membersNearYou = [
  {
    'firstName': 'Shadi',
    'lastName': 'Fallahr',
    'image': 'https://randomuser.me/api/portraits/women/2.jpg'
  },
  {
    'firstName': 'Miriam',
    'lastName': 'Adebibe',
    'image': 'https://randomuser.me/api/portraits/women/3.jpg'
  },
];

final List<Map<String, String>> topMembers = [
  {
    'firstName': 'Shadi',
    'lastName': 'Fallahr',
    'image': 'https://randomuser.me/api/portraits/women/2.jpg'
  },
  {
    'firstName': 'Miriam',
    'lastName': 'Adebibe',
    'image': 'https://randomuser.me/api/portraits/women/3.jpg'
  },
  {
    'firstName': 'Katarzyna',
    'lastName': 'Stabiak',
    'image': 'https://randomuser.me/api/portraits/women/4.jpg'
  },
  {
    'firstName': 'Kara',
    'lastName': 'Lekuse',
    'image': 'https://randomuser.me/api/portraits/women/5.jpg'
  },
  {
    'firstName': 'Jules',
    'lastName': 'Beaven',
    'image': 'https://randomuser.me/api/portraits/men/6.jpg'
  },
  {
    'firstName': 'Lucas',
    'lastName': 'Bennett',
    'image': 'https://randomuser.me/api/portraits/men/7.jpg'
  },
  {
    'firstName': 'Emma',
    'lastName': 'Johansson',
    'image': 'https://randomuser.me/api/portraits/women/8.jpg'
  },
];

class DiscoveryScreen extends StatelessWidget {
  const DiscoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25.h),
              const Text(
                'Welcome Checklist',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              Card(
                margin: EdgeInsets.only(right: 160.w, top: 10.h, bottom: 10.h),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                color: Colors.grey[900],
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 20,
                            backgroundColor: Color.fromARGB(255, 5, 35, 60),
                            child: Image(
                              image: AssetImage(
                                'assets/logos/app_logo.png',
                              ),
                              width: 70,
                              height: 70,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          const Text(
                            'Inviti',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h),
                      const Text(
                        'Fill out your Profile',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 50.h),
                    ],
                  ),
                ),
              ),
              const Text(
                'Top Spaces',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              Card(
                margin: EdgeInsets.only(right: 160.w, top: 10.h, bottom: 10.h),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                color: Colors.blueAccent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 14.h, right: 14.w, left: 14.w),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 26,
                            backgroundColor: Colors.white,
                            child: Image(
                              image: AssetImage(
                                'assets/logos/app_logo.png',
                              ),
                              width: 70,
                              height: 70,
                            ),
                          ),
                          Text(
                            'Welcome!',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50.h),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: Colors.blue[800],
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Colors.grey,
                              size: 20,
                            ),
                            Text(
                              '6d',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'Top Posts',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              Card(
                margin: EdgeInsets.only(right: 160.w, top: 10.h, bottom: 10.h),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                color: Colors.grey[900],
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                    child: Column(
                      children: [Text('h')],
                    )),
              ),
              const Text(
                'Members near you',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              SizedBox(
                height: 70.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: membersNearYou.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CircleAvatar(
                        radius: 26,
                        backgroundImage:
                            NetworkImage(membersNearYou[index]['image']!),
                      ),
                    );
                  },
                ),
              ),
              const Text(
                'Top Members',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              SizedBox(
                height: 70.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: topMembers.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CircleAvatar(
                        radius: 26,
                        backgroundImage:
                            NetworkImage(topMembers[index]['image']!),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 60.h),
            ],
          ),
        ),
      ),
    );
  }
}
