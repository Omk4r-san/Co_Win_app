import 'package:co_win_app/screens/avilable_vaccination_screen.dart';
import 'package:co_win_app/shared/styles.dart';
import 'package:co_win_app/widgets/text_from_field_helper.dart';
import 'package:flutter/material.dart';

class VaccineScreen extends StatefulWidget {
  VaccineScreen({Key key}) : super(key: key);

  @override
  _VaccineScreenState createState() => _VaccineScreenState();
}

class _VaccineScreenState extends State<VaccineScreen> {
  String pincode;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _onSubmit() {
    print("working");
    FormState _formState = _formKey.currentState;
    if (_formState.validate()) {
      _formState.save();

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AvailableVaccinesScreens()));
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.teal,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Get yourself vaccinated",
                    style: titlelabelStyle.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Search for Vaccine Centers Near You",
                style: titlelabelStyle.copyWith(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.teal,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        "Search by pincode",
                        style: titlelabelStyle.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: TextFormFieldHelper(
                          hintText: "Enter your area pincode",
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Pincode is Required';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            setState(() {
                              pincode = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _elevatedButton()
          ],
        ),
      ),
    );
  }

  Widget _elevatedButton() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        child: ElevatedButton(
          onPressed: () => _onSubmit(),
          child: Text(
            "Search",
            style: subtitlelabelStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
