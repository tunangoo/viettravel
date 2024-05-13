import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlaceDetailsScreen extends StatefulWidget {

  const PlaceDetailsScreen{Key? key}) : super(key: key);

  @override
  _DetailPageStage createState() => _DetailPageStage();
}

class _DetailPageStage extends State<PlaceDetailsScreen> {
  Icon favoriteIcon1 = Icon(Icons.favorite_border, color: Colors.white);
  bool isFavorite1 = false;
  void tapFavorite1() {
    setState(() {
      isFavorite1 = isFavorite1 == true ? false : true;
      if (isFavorite1) {
        favoriteIcon1 = Icon(Icons.favorite, color: Colors.red.shade300);
      } else {
        favoriteIcon1 = Icon(Icons.favorite_border, color: Colors.white);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final destination = widget.destination;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      height: screenHeight*0.4,
                      child:  Container(
                              child: Image(image: AssetImage("assets/images/place1.jpg"), fit: BoxFit.cover,)
                          )
                    ),
                  
                    Container(
                      padding: EdgeInsets.only(top: screenHeight*0.41, left: 10, right: 10),
                      child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 70,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          destination.name,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 32,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.location_on_outlined),
                                            Text(
                                              destination.location,
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 16,
                                                  color: Colors.black87
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Row(
                                      children: [
                                        Icon(Icons.star_border_rounded, size: 35),
                                        Text(destination.star, style: GoogleFonts.montserrat(
                                          fontSize: 30, fontWeight: FontWeight.bold
                                        ))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
        
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image(
                                      image: AssetImage('assets/images/place1.jpg',),
                                      height: 50,
                                      width: 50,
                                      fit:BoxFit.cover,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image(
                                      image: AssetImage('assets/images/place1.jpg',),
                                      height: 50,
                                      width: 50,
                                      fit:BoxFit.cover,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image(
                                      image: AssetImage('assets/images/place1.jpg',),
                                      height: 50,
                                      width: 50,
                                      fit:BoxFit.cover,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image(
                                      image: AssetImage('assets/images/place1.jpg',),
                                      height: 50,
                                      width: 50,
                                      fit:BoxFit.cover,
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image(
                                      image: AssetImage('assets/images/place1.jpg',),
                                      height: 50,
                                      width: 50,
                                      fit:BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Container(
                                child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text("About Destination", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))),
                              ),
                              SizedBox(height: 10),
                              Container(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          "Hồ Tây là một trong những thắng cảnh đẹp nổi tiếng ở thủ đô Hà Nội, nơi có nhiều di tích lịch"
                                              " sử văn hóa gắn liền với lịch sử hình thành, phát triển của Kinh thành Thăng Long xưa và Hà "
                                              "Nội ngày nay. Vẻ đẹp của hồ Tây là một nét chấm phá lãng mạn, thi vị trong bức tranh đầy màu "
                                              "sắc của Hà Nội, nơi gặp gỡ, ghi dấu kỷ niệm của biết bao người Hà Nội, nơi níu chân du khách mỗi lần đếm thăm thủ đô. sắc của Hà Nội, nơi gặp gỡ, ghi dấu kỷ niệm của biết bao người Hà Nội, nơi níu chân du khách mỗi lần đếm thăm thủ đô.sắc của Hà Nội, nơi gặp gỡ, ghi dấu kỷ niệm của biết bao người Hà Nội, nơi níu chân du khách mỗi lần đếm thăm thủ đô.sắc của Hà Nội, nơi gặp gỡ, ghi dấu kỷ niệm của biết bao người Hà Nội, nơi níu chân du khách mỗi lần đếm thăm thủ đô.sắc của Hà Nội, nơi gặp gỡ, ghi dấu kỷ niệm của biết bao người Hà Nội, nơi níu chân du khách mỗi lần đếm thăm thủ đô.sắc của Hà Nội, nơi gặp gỡ, ghi dấu kỷ niệm của biết bao người Hà Nội, nơi níu chân du khách mỗi lần đếm thăm thủ đô. ",
                                          style: TextStyle(fontSize: 15)
                                      )
                                  ),
                                ),
                              ),
                            ],
                          )
                      ),
                    ),
        
                  ],
                ),
              ),
            ),
            // Positioned(
            //   bottom: 10,
            //   left: 10,
            //   child: Container(
            //     child: Center(
            //       child: InkWell(
            //           onTap: (){},
            //           child: Container(
            //             width: screenWidth*0.95,
            //             height: 60,
            //             padding: EdgeInsets.symmetric(horizontal: 20),
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10),
            //                 color: Colors.blue
            //             ),
            //             child: Center(
            //               child: Text(
            //                 "Book Now",
            //                 style: TextStyle(
            //                     color: Colors.white,
            //                     fontSize: 24
            //                 ),
            //               ),
            //             ),
            //           )
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}