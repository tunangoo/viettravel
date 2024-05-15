import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Map<String, String>> events = [
    {"image": 'assets/images/place1.jpg', "title": "Hồ Tây", "date": "8/5", "location": "Hà Nội", "description": "Mô tả"},
    {"image": 'assets/images/place1.jpg', "title": "Hồ Gươm", "date": "9/5", "location": "Hà Nội", "description": "Mô tả khác"},
    {"image": 'assets/images/place1.jpg', "title": "Hồ Tây", "date": "8/5", "location": "Hà Nội", "description": "Mô tả"},
    {"image": 'assets/images/place1.jpg', "title": "Hồ Gươm", "date": "9/5", "location": "Hà Nội", "description": "Mô tả khác"},
    {"image": 'assets/images/place1.jpg', "title": "Hồ Tây", "date": "8/5", "location": "Hà Nội", "description": "Mô tả"},
    {"image": 'assets/images/place1.jpg', "title": "Hồ Gươm", "date": "9/5", "location": "Hà Nội", "description": "Mô tả khác"},
    {"image": 'assets/images/place1.jpg', "title": "Hồ Tây", "date": "8/5", "location": "Hà Nội", "description": "Mô tả"},
    {"image": 'assets/images/place1.jpg', "title": "Hồ Gươm", "date": "9/5", "location": "Hà Nội", "description": "Mô tả khác"},
    {"image": 'assets/images/place1.jpg', "title": "Hồ Tây", "date": "8/5", "location": "Hà Nội", "description": "Mô tả"},
    {"image": 'assets/images/place1.jpg', "title": "Hồ Gươm", "date": "9/5", "location": "Hà Nội", "description": "Mô tả khác"},
    {"image": 'assets/images/place1.jpg', "title": "Hồ Tây", "date": "8/5", "location": "Hà Nội", "description": "Mô tả"},
    {"image": 'assets/images/place1.jpg', "title": "Hồ Gươm", "date": "9/5", "location": "Hà Nội", "description": "Mô tả khác"},{"image": 'assets/images/place1.jpg', "title": "Hồ Tây", "date": "8/5", "location": "Hà Nội", "description": "Mô tả"},
    {"image": 'assets/images/place1.jpg', "title": "Hồ Gươm", "date": "9/5", "location": "Hà Nội", "description": "Mô tả khác"},
    // Add more event entries here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Địa điểm yêu thích",style: Theme.of(context).textTheme.headlineMedium,)),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0, bottom: 16.0),
        child: Column(
            children: [

               Expanded(
                 child: SizedBox(
                   width: double.infinity,
                   height: 500,
                   child: ScrollConfiguration(
                       behavior: const ScrollBehavior(),
                       child: GridView(
                         scrollDirection: Axis.vertical,
                         gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                           crossAxisCount: 2,
                           mainAxisExtent: 280,
                           crossAxisSpacing: 10,
                           mainAxisSpacing: 10,
                           childAspectRatio: 1
                         ),
                         children: events.map(
                               (e) => Card(
                                 elevation: 3,
                                 margin: EdgeInsets.all(8),
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(16),
                                   side: BorderSide(color: Colors.lightGreen),
                                 ),// Khoảng cách giữa các khung
                                 child: Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Container(

                                         // height: MediaQuery.of(context).size.height,
                                         child: AspectRatio(
                                           aspectRatio: 1, // tỉ lệ khung hình vuông
                                           child: ClipRRect(
                                             borderRadius: BorderRadius.circular(16),
                                             child: Image.asset(
                                               e['image']!,
                                               width: 1000,
                                               fit: BoxFit.cover,
                                             ),
                                           ),
                                         ),
                                       ),
                                       SizedBox(height: 10),
                                       Text(
                                             e['title']!,
                                             style: TextStyle(
                                               fontSize: 15,
                                               fontWeight: FontWeight.bold,
                                             ),
                                           ),
                                       Row(
                                         children: [
                                           Icon(Icons.location_on_outlined, color: Colors.grey,),
                                           Text(
                                                 e['location']!,
                                                 style: TextStyle(
                                                   fontSize: 12,
                                                   color: Colors.grey,
                                                 ),
                                               ),
                                         ],
                                       ),
                                       Row(
                                         children: [
                                           Text(e['date']!),
                                           Icon(
                                             Icons.favorite,
                                             color: Colors.pinkAccent.shade400,
                                             size: 14,
                                           ),
                                         ],
                                       ),
                                       Text(e['description']!),
                                     ],
                                   ),
                                 ),
                               ),
                         ).toList(),
                       )
                   ),
                 ),
               )
            ],
          ),
      )
    );
  }
}