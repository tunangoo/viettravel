import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ri.dart';
import 'package:provider/provider.dart';
import 'package:viettravel/helpers/number_format.dart';
import 'package:viettravel/models/place_detail_model.dart';
import 'package:viettravel/providers/favorite_place_provider.dart';
import 'package:viettravel/providers/ticket_provider.dart';
import 'package:viettravel/providers/user_provider.dart';
import 'package:viettravel/services/api_handle.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:viettravel/widgets/custom_noti.dart';

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
  late int placeId;
  PlaceDetailModel? place;
  bool _isLoading = true;
  bool isFavorite = false;
  int _currentValue = 1;
  int _totalPrice = 0;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    placeId = widget.placeId;
    _fetchPlaceDetail();
  }

  Future<void> _fetchPlaceDetail() async {
    try {
      final response = await getPlaceDetail(placeId);
      if (response.statusCode == 200) {
        setState(() {
          place = PlaceDetailModel.fromJson(response.body);
          if (place != null) {
            isFavorite = place!.favorite;
            _totalPrice = place!.price * _currentValue; // Initialize total price
          }
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

  void _toogleFavorite() {
    if (!isFavorite) {
      _fetchAddFavoritePlace();
    } else {
      _fetchDeleteFavoritePlace();
    }
  }

  Future<void> _fetchAddFavoritePlace() async {
    try {
      final response = await addFavoritePlace(placeId);
      if (response.statusCode == 200) {
        setState(() {
          isFavorite = true;
        });
        customNotiSuccess(context, "Đã thêm vào yêu thích");
        Provider.of<FavoritePlaceProvider>(context, listen: false).fetchGetFavoritePlaces();
      } else {
        customNotiError(context, "Có lỗi xảy ra");
      }
    } catch (error) {
      customNotiError(context, "Có lỗi xảy ra");
    }
  }

  Future<void> _fetchDeleteFavoritePlace() async {
    try {
      final response = await deleteFavoritePlace(placeId);
      if (response.statusCode == 200) {
        setState(() {
          isFavorite = false;
        });
        customNotiSuccess(context, "Đã xóa khỏi yêu thích");
        Provider.of<FavoritePlaceProvider>(context, listen: false).fetchGetFavoritePlaces();
      } else {
        customNotiError(context, "Có lỗi xảy ra");
      }
    } catch (error) {
      customNotiError(context, "Có lỗi xảy ra");
    }
  }

  Future<void> _fetchCreateTicket() async {
    try {
      final response = await createTicket(placeId, _selectedDate, _currentValue, _totalPrice);
      if (response.statusCode == 200) {
        customNotiSuccess(context, 'Đặt vé thành công');
        Provider.of<UserProvider>(context, listen: false).fetchUserInfo();
        Provider.of<TicketProvider>(context, listen: false).fetchGetTickets();
      } else {
        customNotiError(context, "Có lỗi xảy ra");
      }
    } catch (error) {
      customNotiError(context, "Có lỗi xảy ra");
    }
  }

  Future<void> _selectDate(BuildContext context, StateSetter setState) async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (newDate != null) {
      setState(() {
        _selectedDate = newDate;
      });
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
          "Chi tiết địa điểm",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
            icon: isFavorite
                ? Iconify(Ri.heart_fill, color: Colors.red)
                : Iconify(Ri.heart_line, color: Colors.grey),
            onPressed: _toogleFavorite,
          ),
        ],
      ),
      body: SafeArea(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : place != null
            ? Stack(
          children: [
            Container(
              height: screenHeight * 0.3,
              width: screenWidth,
              child: PageView.builder(
                itemCount: place!.images.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    place!.images[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.31, left: 10, right: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  place!.name,
                                  style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.location_on_outlined,
                                        color: Colors.grey),
                                    Text(
                                      place!.address,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    RatingBarIndicator(
                                      rating: place!.rating,
                                      itemBuilder: (context, index) =>
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                      itemCount: 5,
                                      itemSize: 25,
                                      direction: Axis.horizontal,
                                    ),
                                    Text(
                                      place!.rating
                                          .toStringAsFixed(1),
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                      Alignment.centerRight,
                                      child: Text(
                                        '   ${convertToVND(place!.price)}₫/Vé',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ]),
                    SizedBox(height: 10),
                    Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Giới thiệu điểm đến",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
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
                            place!.description,
                            style: TextStyle(fontSize: 15),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ],
        )
            : Center(
            child: Text("Không thể tải địa điểm",
                style: TextStyle(fontSize: 30))),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 0), // Adjust the bottom padding as needed
        child: SizedBox(
          width: screenWidth * 0.8,
          height: 50,
          child: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                // backgroundColor: Colors.grey[400],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                context: context,
                builder: (BuildContext context) {
                  return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return Container(
                        width: double.infinity,
                        height: 240,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Ngày thăm quan',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}  ',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    ElevatedButton(
                                      // style: ButtonStyle(
                                      //   backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                                      //         (Set<MaterialState> states) {
                                      //       return Colors.white;
                                      //     },
                                      //   ),
                                      //   fixedSize: MaterialStateProperty.all<Size>(
                                      //     Size(0, 0),
                                      //   ),
                                      // ),
                                      onPressed: () => _selectDate(context, setState),
                                      child: Icon(
                                        Icons.calendar_month_outlined,
                                        color: Colors.blue,
                                        size: 25,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  ' Số lượng vé',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove),
                                      onPressed: () {
                                        setState(() {
                                          if (_currentValue > 1) {
                                            _currentValue--;
                                            _totalPrice = place!.price * _currentValue;
                                          }
                                        });
                                      },
                                    ),
                                    Text(
                                      '$_currentValue',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        setState(() {
                                          _currentValue++;
                                          _totalPrice = place!.price * _currentValue;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Tổng tiền',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${convertToVND(_totalPrice)}₫',
                                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                    return Colors.blue;
                                  },
                                ),
                                fixedSize: MaterialStateProperty.all<Size>(
                                  Size(200, 50),
                                ),
                              ),
                              onPressed: () {
                                int? balance = Provider.of<UserProvider>(context, listen: false).user.balance;
                                if(balance != null) {
                                  if(balance < _totalPrice) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Số dư trong ví không đủ'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context); // Đóng dialog
                                              },
                                              child: Text('Xác nhận'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Bạn có chắc chắn muốn đặt vé không?'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Hủy'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                _fetchCreateTicket();
                                              },
                                              child: Text('Xác nhận'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                }
                              },
                              child: Text(
                                'Thanh toán',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            },
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "Đặt vé ngay",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
