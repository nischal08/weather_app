import 'package:flutter/material.dart';

class IconWithTextRow extends StatelessWidget {
  const IconWithTextRow({
    Key key,
    this.label,
    this.icon,
  }) : super(key: key);

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: Colors.white70,
              size: 30,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline5.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
            )
          ],
        )
      ],
    );
  }
}
