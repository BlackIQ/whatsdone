import 'package:flutter/material.dart';

class ThemeSettings extends StatelessWidget {
  List<Map> items = [
    {
      'title': 'Default theme',
      'foreground-color': 'Deep Purple',
      'foreground-class': Colors.deepPurple,
      'background-color': 'White',
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
    return ListView.builder(
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
              Text('Theme name', style: TextStyle(fontWeight: FontWeight.bold, color: items[index]['foreground-class'])),
              Text(items[index]['title'], style: TextStyle(color: items[index]['foreground-class'])),
              SizedBox(height: 10),
              Text('Foreground Color', style: TextStyle(fontWeight: FontWeight.bold, color: items[index]['foreground-class'])),
              Text(items[index]['foreground-color'], style: TextStyle(color: items[index]['foreground-class'])),
              SizedBox(height: 10),
              Text('Background Color', style: TextStyle(fontWeight: FontWeight.bold, color: items[index]['foreground-class'])),
              Text(items[index]['background-color'], style: TextStyle(color: items[index]['foreground-class'])),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Theme Logo', style: TextStyle(fontWeight: FontWeight.bold, color: items[index]['foreground-class'])),
                  Text(items[index]['leading']),
                ],
              ),
              SizedBox(height: 15),
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
    );
  }
}
