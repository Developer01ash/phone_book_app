import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'add_contact.dart';
import 'contact_model.dart';
import 'edit.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContact();
  }

  getContact() async {
    String jsonString = await rootBundle.loadString('assets/contact_data.json');

    final contact = contactFromJson(jsonString);

    setState(() {
      contactList.addAll(contact.contacts);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddContact()));
            if (result != null) setState(() {});
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
      body: contactList.isNotEmpty
          ? ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () async {
                    final result = await Navigator.push(context, MaterialPageRoute(builder: (context)=> EditaContact(index: index,)));
                    if(result!=null) setState(() {});
                  },
                  leading: contactList[index].avatar.isNotEmpty &&
                          contactList[index].avatar.contains('http')
                      ? CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                              NetworkImage(contactList[index].avatar),
                        )
                      : contactList[index].avatar.isNotEmpty
                          ? CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  FileImage(File(contactList[index].avatar)),
                            )
                          : CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Text(
                                contactList[index]
                                    .name
                                    .substring(0, 1)
                                    .toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                  title: Text(contactList[index].name),
                  subtitle: Text(contactList[index].phone),
                  trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          contactList.removeAt(index);
                        });
                      },
                      icon: const Icon(Icons.delete)),
                );
              },
              itemCount: contactList.length,
            )
          : const Center(
              child: Text("No Contact Found.", style: TextStyle(fontSize: 18)),
            ),
    );
  }
}
