import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import '../providers/userprovider.dart';
import 'package:zhyldyz_flutter/models/user.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Second Page User',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: userProvider.users.isEmpty
          ? Center(child: CircularProgressIndicator()) 
          : ListView.builder(
              itemCount: userProvider.users.length,
              itemBuilder: (context, index) {
                final user = userProvider.users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[200],
                    child: CachedNetworkImage(
                    imageUrl: user.photo,
                    placeholder: (context, url) => CircularProgressIndicator(), 
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    imageBuilder: (context, imageProvider) => CircleAvatar(backgroundImage: imageProvider, 
                    radius: 30, ),

                  ),
                  ),
                );
              },
            ),
    );
  }
}

