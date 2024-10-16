import 'package:BabBBu/ui/widgets/text_field/search_text_field.dart';
import 'package:BabBBu/ui/widgets/text_field/text_field_height.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              SearchTextField(
                controller: TextEditingController(),
                height: TextFieldHeight.lg,
                onSearch: (query) {
                  print('Search query: $query');
                },
              ),
              Text('This is the Map Screen!'),
            ],
          ),
        ),
      ),
    );
  }
}
