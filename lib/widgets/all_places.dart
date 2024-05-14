import 'package:flutter/material.dart';
import 'package:viettravel/models/all_places_model.dart';
import 'package:viettravel/screens/place_detail_screen.dart';
class AllPlaces extends StatelessWidget {
  const AllPlaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(allPlaces.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
            child: SizedBox(
              height: 135,
              width: double.maxFinite,
              child: Card(
                elevation: 0.4,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   // MaterialPageRoute(builder: (context) => PlaceDetailsScreen(image:allPlaces[index].image)),
                    // );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              allPlaces[index].image,
                              height: double.maxFinite,
                              width: 130,
                              fit: BoxFit.cover,
                            ),
                        ),
                        const SizedBox(
                          width: 10
                        ),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tên địa điểm",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Colors.lightBlueAccent,
                                      size: 16,
                                    ),
                                    const Text("Địa chỉ")
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    const Text(
                                      "999",
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.pinkAccent,
                                      size: 14,
                                    ),
                                    const Spacer(),
                                    RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.lightBlue,
                                            ),
                                          text: "999đ",
                                          children: const [
                                            TextSpan(
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black54,
                                              ),
                                              text: "/vé"
                                            )
                                          ]
                                        )
                                    )
                                  ],
                                )
                              ],
                            )
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
        );
      }),
    );
  }
}