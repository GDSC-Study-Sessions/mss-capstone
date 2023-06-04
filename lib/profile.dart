import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage('assets/images/image1.jpg'),
          ),
          SizedBox(height: 16),
          Text(
            'Abebe Kebede',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Software Engineer',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 16),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('gdsc@aastu.com'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('+1 123-456-7890'),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Addis Ababa, Ethiopia'),
          ),
        ],
      ),
    );
  }
}
