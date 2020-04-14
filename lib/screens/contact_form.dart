import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key key}) : super(key: key);

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController(); 
      

  ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Full name'),
                  style: TextStyle(fontSize: 24),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: TextField(
                    controller: _accountNumberController,
                    decoration: InputDecoration(labelText: 'Account number'),
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 24),
                    onSubmitted: (text) {
                      _accountNumberController.clear();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: RaisedButton(
                      child: Text('Create'),
                      onPressed: () {
                        final String name = _nameController.text;
                        final int accountNumber =
                            int.tryParse(_accountNumberController.text);
                        final Contact newContact =
                            Contact(0, name, accountNumber);
                        _dao.save(newContact).then((id) => Navigator.pop(context));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
