import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:phone_book_app/contact_model.dart';
import 'package:phone_book_app/main.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<StatefulWidget> createState() {
    return AddContactState();
  }
}

class AddContactState extends State<AddContact> {
  final TextEditingController name = TextEditingController();
  final TextEditingController number = TextEditingController();

  String? userAvatar;
  File? _image;

  getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        userAvatar = _image?.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Contact"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              GestureDetector(
                child: userAvatar != null ? CircleAvatar(
                  radius: 40,
                  backgroundImage: FileImage(File(userAvatar!)),
                ) : const CircleAvatar(
                  radius: 40,
                  child:  Icon(Icons.add_a_photo),
                ),
                onTap: () {getImage();},
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(labelText: 'Name'),
                controller: name,
                onChanged: (value) {},
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(labelText: 'Phone Number'),
                controller: number,
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (name.text.trim().isNotEmpty &&
                          number.text.isNotEmpty) {
                        contactList.add(ContactElement(
                            id: '',
                            name: name.text.trim(),
                            phone: number.text.trim(),
                            avatar: userAvatar  ?? ''));
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Contact Saved'),
                        ));
                        Future.delayed(
                          const Duration(seconds: 1),
                          () {
                            Navigator.pop(context, "update");
                          },
                        );
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Please enter name & number'),
                        ));
                      }
                    },
                    child: const Text('Save'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
