import 'package:flutter/material.dart';

class NearbyCafe extends StatelessWidget {
  const NearbyCafe({
    super.key,
    required this.size, required this.cafeName, required this.place, required this.image,
  });

  final Size size;
  final String image, cafeName, place;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.4,
      height: size.height * 0.25,
      child: Column(
        children: [
          Container(
            height: 130,
            width: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover, // Adjust the fit property here
                ),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))
            ),
          ),
          Container(
            width: 150,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 5,
                      color: Colors.black.withOpacity(0.20)
                  )
                ],
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24))
            ),
            child: Column(
              children: [
                Text(
                  cafeName.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.place,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(height: 10,),
                    Flexible(
                      child: Text(
                          place,
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400
                          ),
                          overflow: TextOverflow.ellipsis
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
