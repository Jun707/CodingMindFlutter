import 'package:flutter/material.dart';
import 'package:myapp/models/item_model.dart';
import 'package:myapp/services/item_store.dart';
import 'package:myapp/shared/styled_text.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key, required this.item});

  final ItemDetail item;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late TextEditingController _itemBodyController;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _itemBodyController = TextEditingController(text: widget.item.body);
  }

  @override
  void dispose() {
    _itemBodyController.dispose();
    super.dispose();
  }

  void _toggleEditing() {
    setState(() {
      if (_isEditing) {
        widget.item.body = _itemBodyController.text;
      }
      _isEditing = !_isEditing;
    });
    Provider.of<ItemStore>(context, listen: false).saveItem(widget.item);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleEditing,
      child: Scaffold(
        appBar: AppBar(title: StyledTitle(widget.item.title)),
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(16),
                child: _isEditing
                    ? TextField(
                        controller: _itemBodyController,
                        maxLines: null,
                      )
                    : StyledText(widget.item.body))),
      ),
    );
  }
}
