import 'package:flutter/material.dart';

class PinInputs extends StatelessWidget {
  final Function removerLast;
  final Function(int val) onItemTap;

  const PinInputs(
      {super.key, required this.removerLast, required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.7 / 0.6,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 12,
      itemBuilder: (context, index) => index == 9
          ? TextButton(
              style: TextButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
              ),
              onPressed: () {},
              child: const Icon(
                Icons.fingerprint,
              ),
            )
          : TextButton(
              style: TextButton.styleFrom(
                splashFactory: NoSplash.splashFactory,
              ),
              onPressed:
                  index == 11 ? () => removerLast() : () => onItemTap(index),
              child: index == 11
                  ? Icon(
                      Icons.backspace,
                      color: Theme.of(context).iconTheme.color,
                    )
                  : Text(
                      index == 10 ? '0' : '${1 + index}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
            ),
    );
  }
}
