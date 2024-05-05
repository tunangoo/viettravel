import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viettravel/widgets/recommended_places_model.dart';

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
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image(
                        image: AssetImage(recommendedPlaces[index].image),
                        width: double.maxFinite,
                        fit: BoxFit.cover,
                        height: 263,
                      )
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          recommendedPlaces[index].name,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          recommendedPlaces[index].rating.toString(),
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Icon(
                            Icons.favorite,
                            color: Colors.pinkAccent.shade400,
                            size: 14,
                        ),
                      ],
                    ),
                    SizedBox(height: 1),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.lightBlueAccent,
                          size: 16,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          recommendedPlaces[index].location,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        )
                      ],
                    )
                  ],
                ),
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