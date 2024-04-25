import 'package:flutter/material.dart';

class seemoreBtn extends StatelessWidget {
  const seemoreBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          // Handle 'see more' button press
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'See More',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}