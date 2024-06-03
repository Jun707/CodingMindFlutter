import 'package:flutter/material.dart';
import 'package:myapp/models/item_model.dart';
import 'package:myapp/profile/profile.dart';
import 'package:myapp/theme.dart';

class TodoCard extends StatelessWidget {
  const TodoCard(this.item, {super.key});

  final ItemDetail item;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(children: [
        Text(item.title),
        const Expanded(child: SizedBox()),
        IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => Profile(item: item)));
          },
          icon: Icon(Icons.arrow_forward, color: AppColors.textColor),
        )
      ]),
    ));
  }
}
