import 'dart:ui';

import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),

        width: size.width * 0.8,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3), // Add shadow for the floating effect
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // Adjust the shadow offset as needed
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                print('Home');
              },
              icon: Icon(
                Icons.home_filled,
                color: Colors.white,
                size: 32,
              ),
            ),
            IconButton(
              onPressed: () {
                print('like');
              },
              icon: Icon(
                Icons.favorite_border_outlined,
                color: Colors.white,
                size: 32,
              ),
            ),
            IconButton(
              onPressed: () {
                print('Visited');
              },
              icon: Icon(
                Icons.place_outlined,
                color: Colors.white,
                size: 32,
              ),
            ),
            IconButton(
              onPressed: () {
                print('Profile');
              },
              icon: Icon(
                Icons.face_outlined,
                color: Colors.white,
                size: 32,
              ),
            )
          ],
        ),
      ),
    );
  }
}
