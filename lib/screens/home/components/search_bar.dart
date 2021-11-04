import 'dart:math';

import 'package:e_commerce_shop_app/models/product.dart';
import 'package:e_commerce_shop_app/models/search_model.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildSearchBar(context);
  }
}

Widget buildSearchBar(BuildContext context) {
  final controller = FloatingSearchBarController();
  final actions = [
    FloatingSearchBarAction(
      showIfOpened: false,
      child: CircularButton(
        icon: const Icon(Icons.search),
        onPressed: () {},
      ),
    ),
    FloatingSearchBarAction.searchToClear(
      showIfClosed: false,
    ),
  ];

  final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

  return FloatingSearchBar(
    automaticallyImplyBackButton: false,
    controller: controller,
    clearQueryOnClose: true,
    borderRadius: const BorderRadius.all(Radius.circular(30)),
    hint: 'Search your favorite product',
    iconColor: Colors.grey,
    transitionDuration: const Duration(milliseconds: 800),
    transitionCurve: Curves.easeInOutCubic,
    physics: const BouncingScrollPhysics(),
    axisAlignment: isPortrait ? 0.0 : -1.0,
    openAxisAlignment: 0.0,
    actions: actions,
    //progress:"",
    debounceDelay: const Duration(milliseconds: 500),
    // onQueryChanged: ,
    scrollPadding: EdgeInsets.zero,
    transition: CircularFloatingSearchBarTransition(spacing: 16),
    isScrollControlled: true,
    builder: (context, _) => Container(),
    body: Container(),
  );
}

// Widget buildExpandableBody() {
//   return ListView.builder(
//     itemCount: 200,
//     itemBuilder: (context, index) {
//       print('build $index');
//
//       return Container(
//         color: Colors.white,
//         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//         child: Text(
//           '$index',
//         ),
//       );
//     },
//   );
// }
//
// Widget buildItem(BuildContext context, Products products) {
//   final theme = Theme.of(context);
//   final textTheme = theme.textTheme;
//
//   final model = new List();
//
//   return Column(
//     mainAxisSize: MainAxisSize.min,
//     children: [
//       InkWell(
//         onTap: () {
//           FloatingSearchBar.of(context).close();
//           Future.delayed(
//             const Duration(milliseconds: 500),
//             () => model.clear(),
//           );
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Row(
//             children: [
//               SizedBox(
//                 width: 36,
//                 child: AnimatedSwitcher(
//                   duration: const Duration(milliseconds: 500),
//                   child: model == history
//                       ? const Icon(Icons.history, key: Key('history'))
//                       : const Icon(Icons.place, key: Key('place')),
//                 ),
//               ),
//               const SizedBox(width: 16),
//               Expanded(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       products.name,
//                       style: textTheme.subtitle1,
//                     ),
//                     const SizedBox(height: 2),
//                     Text(
//                       products.name,
//                       style: textTheme.bodyText2
//                           .copyWith(color: Colors.grey.shade600),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ],
//   );
// }
