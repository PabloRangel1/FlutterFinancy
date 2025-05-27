
import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.red),
      home: ContactsPage(),
    );
  }
}

class ContactsPage  extends StatefulWidget {
  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final contacts = [
    Contact(name: "John Doe", email: 'john_doeoe@gmail.com'),
    Contact(name: "Alice O. Austin", email: 'AliceOAustin@rhyta.com'),
    Contact(name: "Douglas R. Broadway", email: 'DouglasRBroadway@dayrep.com'),
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Contatos Favoritos ${contacts.where((element) => element.favorite).length}'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage('https://i.pravatar.cc/150?img=$index'),
            ),
            title: Text(contacts[index].name),
            subtitle: Text(contacts[index].email),
            trailing: IconButton(
              icon: contacts[index].favorite
                  ? Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : Icon(Icons.favorite_border),
              onPressed: () {
                setState(() {
                  contacts[index].favorite = !contacts[index].favorite;
                });
              },
            ),
          );
        },
      ),
    );
  }
}

class Contact {
  String name;
  String email;
  bool favorite = false;
 
  Contact({required this.name, required this.email});
}