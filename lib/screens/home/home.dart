import 'package:flutter/material.dart';
import 'package:myapp/screens/create/create.dart';
import 'package:myapp/screens/home/todoItem.dart';
import 'package:myapp/services/auth_service.dart';
import 'package:myapp/services/item_store.dart';
import 'package:myapp/shared/styled_button.dart';
import 'package:myapp/shared/styled_text.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Provider.of<ItemStore>(context, listen: false).fetchItemsOnce();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To do List"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Consumer<ItemStore>(builder: (context, value, child) {
                return ListView.builder(
                  itemCount: value.items.length,
                  itemBuilder: (_, index) {
                    return Dismissible(
                        key: ValueKey(value.items[index].id),
                        onDismissed: (direction) {
                          Provider.of<ItemStore>(context, listen: false)
                              .deleteItem(value.items[index]);
                        },
                        child: TodoCard(value.items[index]));
                  },
                );
              }),
            ),
            StyledButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const CreateScreen()));
                },
                child: const StyledHeading("Add")),
            StyledButton(
              onPressed: (){ AuthService.signOut(); }, child: const StyledHeading("Log out"))
          ],
        ),
      ),
    );
  }
}
