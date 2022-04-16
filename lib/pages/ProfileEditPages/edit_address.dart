import 'package:flutter/material.dart';
import 'package:mero_futsal/models/api.services.dart';
import 'package:mero_futsal/widgets/appbar_widget.dart';
import 'package:string_validator/string_validator.dart';

// This class handles the Page to edit the Address Section of the User Profile.
class EditAddressFormPage extends StatefulWidget {
  const EditAddressFormPage({Key? key}) : super(key: key);

  @override
  EditAddressFormPageState createState() {
    return EditAddressFormPageState();
  }
}

class EditAddressFormPageState extends State<EditAddressFormPage> {
  final _formKey = GlobalKey<FormState>();
  final addressController = TextEditingController();
  var user = APIServices.myUser;

  @override
  void dispose() {
    addressController.dispose();
    super.dispose();
  }

  void updateUserValue(String address) {
    user.address = address;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                    width: 320,
                    child: Text(
                      "What's your address?",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    )),
                Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: SizedBox(
                        height: 100,
                        width: 320,
                        child: TextFormField(
                          // Handles Form Validation
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your address.';
                            } else if (!isAlpha(value)) {
                              return 'Only Letters Please';
                            }
                            return null;
                          },
                          decoration:
                              const InputDecoration(labelText: 'Your address'),
                          controller: addressController,
                        ))),
                Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: 320,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate() &&
                                  isAlpha(addressController.text)) {
                                updateUserValue(addressController.text);
                                Navigator.pop(context);
                              }
                            },
                            child: const Text(
                              'Update',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        )))
              ]),
        ));
  }
}
