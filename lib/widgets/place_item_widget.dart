import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:viettravel/models/place_summary_model.dart';

class PlaceItemWidget extends StatelessWidget {
  final PlaceSummaryModel place;
  final VoidCallback onPressed;

  const PlaceItemWidget({
    Key? key,
    required this.place,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onPressed,
      child: Card(
        elevation: 3,
        margin: EdgeInsets.all(8),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(16),
        //   side: BorderSide(color: Colors.lightGreen),
        // ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: AspectRatio(
                  aspectRatio: 1, // tỉ lệ khung hình vuông
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      place.imageUrl,
                      width: 1000,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.broken_image,
                          size: 50,
                          color: Colors.grey,
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                place.name,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.location_on_outlined, color: Colors.grey,),
                  Expanded(
                    child: Text(
                      place.address,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  RatingBarIndicator(
                    rating: 5.0, // Số sao bạn muốn hiển thị
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 20.0, // Kích thước của mỗi ngôi sao
                    direction: Axis.horizontal,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      ' 5.0', // Thêm giá vé
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5,),
              Text(
                  '${place.price}₫ / Vé', // Thêm giá vé
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
