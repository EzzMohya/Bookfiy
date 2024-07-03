import 'package:bookliy/Core/utils/app_images.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BestSellerItemImage extends StatelessWidget {
  const BestSellerItemImage({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .18,
      child: AspectRatio(
        aspectRatio: 2.3 / 3.9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(fit: BoxFit.fill, imageUrl: imageUrl),
        ),
      ),
    );
  }
}
