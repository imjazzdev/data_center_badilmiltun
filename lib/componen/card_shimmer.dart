import 'package:data_center_badilmiltun/utils/color_select.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardShimmer extends StatelessWidget {
  const CardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(20),
      height: 130,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade100,
        highlightColor: ColorSelect.blue.withOpacity(0.1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.shade200),
              child: Icon(
                Icons.person_2_rounded,
                color: Colors.blue.shade300,
                size: 60,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorSelect.amber,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorSelect.amber,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
