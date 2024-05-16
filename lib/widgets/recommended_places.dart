import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viettravel/models/recommended_places_model.dart';
import 'package:viettravel/screens/place_detail_screen.dart';

class RecommendedPlaces extends StatelessWidget {
  const RecommendedPlaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 335,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
        return SizedBox(
          width: 220,
          child: Card(
            elevation: 0.4,
            margin: EdgeInsets.all(8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Colors.lightGreen)
            ),
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
                          recommendedPlaces[index].imageUrl,
                          width: 1000,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    recommendedPlaces[index].name,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, color: Colors.grey,),
                      Text(
                        recommendedPlaces[index].imageUrl,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text( recommendedPlaces[index].imageUrl),
                      Icon(
                        Icons.favorite,
                        color: Colors.pinkAccent.shade400,
                        size: 14,
                      ),
                    ],
                  ),
                  Text( recommendedPlaces[index].imageUrl),
                ],
              ),
            ),
          ),
        );
      },
          separatorBuilder: (context, index) => const Padding(padding: EdgeInsets.only(right: 10),
          ),
          itemCount: recommendedPlaces.length),
    );
  }
}