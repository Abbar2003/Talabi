import 'package:flutter/material.dart';
import 'package:flutter_maps/constants/my_app_colors_constant.dart';
import 'package:flutter_maps/models/place_suggestion_model.dart';

class PlaceItem extends StatelessWidget {
  const PlaceItem({super.key, required this.feature});
  final Features feature;

  @override
  Widget build(BuildContext context) {
    // نحصل على قيمة country مباشرة من الـ properties
    String country = feature.properties?.country ?? 'Country not found';
    String name = feature.properties?.name??"name not found";
    String city = feature.properties?.city??"";
    String state = feature.properties?.state??"";
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Colors.lightBlue),
          child: Icon(
            Icons.place,
            color: MyAppColors.blue,
          ),
        ),
        title:RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "$city,",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: '${name.split(',')[0]}\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  TextSpan(
                    text: '${country.split(',')[0]} , ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                     // fontWeight: FontWeight.bold
                    ),
                  ),
                  TextSpan(
                    text: '${state.split(',')[0]}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                     // fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
      ),),
    );
  }
}
