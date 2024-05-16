import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:viettravel/models/place_detail_model.dart';
import 'package:viettravel/services/api_handle.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PlaceDetailScreen extends StatefulWidget {
  final int placeId;

  const PlaceDetailScreen({
    Key? key,
    required this.placeId,
  }) : super(key: key);

  @override
  _PlaceDetailScreenState createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  late int _placeId;
  PlaceDetailModel? _placeDetailModel;
  bool _isLoading = true;
  // PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _placeId = widget.placeId;
    _fetchPlaceDetail();
  }

  Future<void> _fetchPlaceDetail() async {
    try {
      final response = await getPlaceDetail(_placeId);
      if (response.statusCode == 200) {
        setState(() {
          _placeDetailModel = PlaceDetailModel.fromJson(response.body);
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        // Handle error response
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          "Chi tiết",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Lưu',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : _placeDetailModel != null
            ? Stack(
          children: [
            Container(
              height: screenHeight * 0.4,
              width: screenWidth,
              child: Image.network(
                _placeDetailModel!.images.isNotEmpty
                    ? _placeDetailModel!.images[2]
                    : 'assets/images/place1.jpg',
                fit: BoxFit.cover,
              ),
            ),
            // PageView.builder(
            //   controller: _pageController,
            //   itemCount: _placeDetailModel!.images.length,
            //   itemBuilder: (context, index) {
            //     return Container(
            //       height: screenHeight * 0.4, // Sử dụng chiều cao cố định cho Container
            //       width: screenWidth * 0.4, // Sử dụng chiều rộng của màn hình cho Container
            //       child: Image.network(
            //         _placeDetailModel!.images[index],
            //         fit: BoxFit.cover, // Thiết lập fit cho Image
            //       ),
            //     );
            //   },
            // ),
            Container(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.41, left: 10, right: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                _placeDetailModel!.name,
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.location_on_outlined),
                                  SizedBox(width: 8), // thêm khoảng cách giữa icon và text
                                  Wrap(
                                    children: [
                                      Text(
                                        _placeDetailModel!.address,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  RatingBarIndicator(
                                    rating: _placeDetailModel!.rating, // Số sao bạn muốn hiển thị
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: 30.0, // Kích thước của mỗi ngôi sao
                                    direction: Axis.horizontal,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '   ${_placeDetailModel!.price}₫ / Vé', // Thêm giá vé
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.orange,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Giới thiệu điểm đến",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            _placeDetailModel!.description,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
            : Center(child: Text("Không thể tải địa điểm", style: TextStyle(fontSize: 30))),
      ),
    );
  }
}
