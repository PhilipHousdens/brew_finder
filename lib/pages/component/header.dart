import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Container(
          height: 150,
          width: 350,
          decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage('assets/images/headerImage.jpg'),
                fit: BoxFit.cover
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Find your favorite café',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                  ),
                  child:const Text(
                    'Visit',
                    style: TextStyle(
                        fontSize: 18
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}