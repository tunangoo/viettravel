import 'package:flutter/material.dart';
import 'package:viettravel/models/place_summary_model.dart';
import 'package:viettravel/widgets/place_item_widget.dart';

class RecommendPlaceScreen extends StatelessWidget {
  final List<PlaceSummaryModel> recommendPlaces;

  const RecommendPlaceScreen({
    Key? key,
    required this.recommendPlaces,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Địa điểm gợi ý",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            // mainAxisExtent: 280,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.57
                        ),
                        children: recommendPlaces.map(
                                (place) => PlaceItemWidget(
                              place: place,
                            )
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