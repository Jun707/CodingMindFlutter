import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/models/item_model.dart';
import 'package:myapp/services/item_store.dart';
import 'package:myapp/shared/styled_button.dart';
import 'package:myapp/shared/styled_text.dart';
import 'package:myapp/theme.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _titleController = TextEditingController();
  final _detailController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _detailController.dispose();
    super.dispose();
  }

  void handleSubmit() {
    if (_titleController.text.trim().isEmpty ||
        _detailController.text.trim().isEmpty) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const StyledHeading("Missing field(s)"),
              actions: [
                StyledButton(
                    onPressed: () => Navigator.pop(ctx),
                    child: const StyledHeading('Close')),
              ],
              actionsAlignment: MainAxisAlignment.center,
            );
          });
      return;
    }

    Provider.of<ItemStore>(context, listen: false).addItem(ItemDetail(
        title: _titleController.text.trim(),
        body: _detailController.text.trim(),
        id: uuid.v6()));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const StyledTitle("New to do Item")),
        body: Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: _titleController,
                    cursorColor: AppColors.textColor,
                    decoration: const InputDecoration(
                        label: StyledText("Item title: (Max: 30 Character)")),
                    style: GoogleFonts.kanit(
                        textStyle: Theme.of(context).textTheme.bodyMedium),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: _detailController,
                    cursorColor: AppColors.textColor,
                    decoration: const InputDecoration(
                      label: StyledText("Item Detail: (Max: 256 Character)"),
                    ),
                    style: GoogleFonts.kanit(
                        textStyle: Theme.of(context).textTheme.bodyMedium),
                    minLines: 1, // The minimum number of lines
                    maxLines: null, // The TextField will expand vertically
                    keyboardType: TextInputType.multiline,
                  ),
                  const SizedBox(height: 30),
                  Center(
                      child: StyledButton(
                    onPressed: handleSubmit,
                    child: const StyledHeading('Add Item'),
                  ))
                ],
              ),
            )));
  }
}
