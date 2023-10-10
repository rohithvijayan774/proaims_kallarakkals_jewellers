import 'package:flutter/material.dart';
import 'package:proaims_test/const.dart';
import 'package:country_picker/country_picker.dart';
import 'package:proaims_test/screens/otp_screen.dart';
import 'package:proaims_test/widgets/gradient_button1.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  TextEditingController numberController = TextEditingController();

  //---------------For country Pick-------------------

  Country selectedCountry = Country(
      phoneCode: "91",
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "India",
      example: 'India',
      displayName: 'India',
      displayNameNoCountryCode: "IN",
      e164Key: "");

  showCountries(context) {
    showCountryPicker(
      context: context,
      countryListTheme: const CountryListThemeData(bottomSheetHeight: 600),
      onSelect: (value) {
        setState(() {
          selectedCountry = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brownColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                const Text(
                  "Enter your mobile number below.\nYou'll recieve an SMS with an one time PIN",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 70,
                ),
                const Text(
                  "Enter your Phonenumber",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Form(
                  key: formKey,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*this field is required';
                      }
                      return null;
                    },
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.phone,
                    controller: numberController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(59, 255, 255, 255),
                      hintStyle: const TextStyle(
                          color: Colors.grey, fontFamily: 'SofiaPro'),
                      hintText: 'Enter your phone number',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black26),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black26),
                      ),
                      prefixIcon: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            showCountries(context);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: brownColor,
        elevation: 0,
        child: GradientButton1(
          onpressed: () {
            if (formKey.currentState!.validate()) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const OTPScreen(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
