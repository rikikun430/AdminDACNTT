import 'package:adminui/utils/app_constants.dart';
import 'package:adminui/utils/dimensions.dart';
import 'package:flutter/material.dart';

class TOrderListItem extends StatelessWidget {
  const TOrderListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row 1
        Row(
          children: [
            // 1- icon
            Icon(Icons.nat_rounded),
            SizedBox(width: 15),

            ///2 - status and date
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Processing',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .apply(color: Colors.grey, fontWeightDelta: 1),
                  ),
                  Text('07 Nov 2024',
                      style: Theme.of(context).textTheme.headlineSmall),
                ],
              ),
            ),
            //3 Icon button
            Column(
              children: [
                IconButton(
                    onPressed: null,
                    icon: const Icon(Icons.arrow_right, size: 15)),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),

        //Row 2
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  // 1- icon
                  Icon(Icons.nat_rounded),
                  SizedBox(width: 15),

                  ///2 - status and date
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .apply(color: Colors.grey, fontWeightDelta: 1),
                        ),
                        Text('[#0001]',
                            style: Theme.of(context).textTheme.headlineSmall),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Row 2 Shipping date
            Expanded(
              child: Row(
                children: [
                  // 1- icon
                  Icon(Icons.calendar_view_day_rounded),
                  SizedBox(width: 15),

                  ///2 - status and date
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shipping date',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .apply(color: Colors.grey, fontWeightDelta: 1),
                        ),
                        Text('07 Nov 2024',
                            style: Theme.of(context).textTheme.headlineSmall),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
