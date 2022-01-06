import 'package:flutter/material.dart';

class ThemeSettings extends StatelessWidget {
  List<Map> items = [
    {
      'title': 'Default theme',
      'details': 'Deep-purple text + White background',
      'leading': '💎',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        elevation: 0,
        title: Text('Theme settings'),
      ),
      body: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              // scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(20),
              itemCount: items.length,
              itemBuilder: (context, index) => Card(
                margin: EdgeInsets.all(15),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Ho'),
                      SizedBox(height: 20),
                      Container(
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Activate ${items[index]['leading']}'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
