import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mr_candy_cycle_8/features/main/data/models/product_model.dart';
import 'package:mr_candy_cycle_8/main.dart';

import '../../../../../core/utils/colors.dart';

class BestSellerWidget extends StatelessWidget {
  const BestSellerWidget({super.key, required this.productModel});

  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Container(
         decoration: const BoxDecoration(
             // #F2F5FC
           color: Color(0xffF2F5FC)
         ),
         padding: EdgeInsets.symmetric(
           vertical:16.h ,
           horizontal: 13.w
         ),
         child: Column(
           children: [
             Row(
               children: [
                 Container(

                   ///375  --> 28
                   width: 28.w,
                   height: 28.h,
                   decoration: BoxDecoration(
                       color: Colors.white
                   ),
                   child: Icon(Icons.favorite_border,
                     color: AppColors.mainColor,
                   ),
                 ),
                 15.horizontalSpace,
                 Container(
                   padding: EdgeInsets.symmetric(
                       horizontal: 8.w
                   ),
                   decoration: BoxDecoration(
                       color: AppColors.mainColor,
                       borderRadius: BorderRadius.circular(4.r)
                   ),
                   child:  Text("-${productModel.discount}",

                     style: const TextStyle(
                       color: Colors.white,
                     ),

                   ),
                 )
               ],
             ),
            const SizedBox(height: 2,),
           CachedNetworkImage(imageUrl: productModel.image,
           width: 100.w,
             height: 100.h,
           )



           ],
         ),
       ),
        Row(
          children: [
            Column(
              children: [
                Text(productModel.name,
                maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text("${productModel.price} جنية",
                maxLines: 1,
                ),
              ],
            ),
          Icon(Icons.add)
          ],
        )

      ],
    );
  }
}
