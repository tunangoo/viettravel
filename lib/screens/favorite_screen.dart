import 'package:flutter/material.dart';


class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Special Events"),
            backgroundColor: Colors.grey[200], 
          ),
          body: ListView.builder(
            padding: EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0, bottom: 16.0),
            itemCount: events.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  
            
                },
                child: Card(
                  elevation: 3,
                  margin: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: Colors.lightGreen),
                  ),// Khoảng cách giữa các khung
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.33,
                          // height: MediaQuery.of(context).size.height,
                          child: AspectRatio(
                            aspectRatio: 1, // tỉ lệ khung hình vuông
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                'assets/images/place1.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "hồ tây",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(Icons.event),
                                  SizedBox(width: 4),
                                  Text("8/5"),
                                ],
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(Icons.location_on),
                                  SizedBox(width: 4),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "hà nội",
                                          maxLines: 2, // Giới hạn số dòng của mô tả
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                "mô tả",
                                maxLines: 2, // Giới hạn số dòng của mô tả
                                overflow: TextOverflow.ellipsis, // Hiển thị dấu ... khi văn bản bị cắt ngắn
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
    );
  }
}
