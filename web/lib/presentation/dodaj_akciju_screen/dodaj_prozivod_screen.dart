import 'package:slatkizalogaj/model/torta.dart';
import 'package:slatkizalogaj/presentation/dodaj_proizvod_screen/widgets/promocijacard_item_widget.dart';
import 'package:slatkizalogaj/services/torta_service.dart';
import 'package:slatkizalogaj/widgets/app_bar/custom_app_bar_zaposleni.dart';
import 'package:slatkizalogaj/widgets/custom_outlined_button.dart';
import 'package:slatkizalogaj/widgets/drawer/drawer.dart';

import '../promocije_screen/widgets/promocijacard_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:slatkizalogaj/core/app_export.dart';
import 'package:slatkizalogaj/widgets/app_bar/custom_app_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DodajAkcijuScreen extends StatefulWidget {
  @override
  _DodajProizvodScreen createState() => _DodajProizvodScreen();
}

class _DodajProizvodScreen extends State<DodajAkcijuScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _contr = TextEditingController();

  String? _selectedItem;

  List<Torta> _dropdownItems = TortaService.kolaci + TortaService.torte;

  @override
  void initState() {
    super.initState();
  }

  var torta = Torta(
      image_path: "assets/images/img_38d5902ce335fe0_3.png",
      name: "Kolac3",
      rating: "4.8",
      sastojci: "Krema, brasno, secer, jaja",
      description: "Nemam inspiraciju",
      tip: "KOLAC",
      price: 500.44);

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _contr.dispose();
    super.dispose();
  }

  int quantity = 0;

  void _submitData() {
    if (_formKey.currentState!.validate()) {
      Torta torta = TortaService.torte
          .firstWhere((element) => element.name == _selectedItem);
      torta.price = double.parse(_emailController.text);
      print('Cena: ${_emailController.text}');
      print('Torta: ${_selectedItem}');
      torta.promocija = true;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Dodana promocija za $_selectedItem'),
        backgroundColor: Color(0xFFF187B3),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: CustomAppBarZaposleni(),
            endDrawer: CustomDrawer(),
            body: Container(
              height: 700,
              width: double.maxFinite,
              margin: EdgeInsets.fromLTRB(50, 100, 50, 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0x22F68472),
              ),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 50),
                      SizedBox(
                        height: 90,
                        width: 400,
                        child: DropdownButtonFormField<String>(
                          value: _selectedItem,
                          items: _dropdownItems.map((Torta value) {
                            return DropdownMenuItem<String>(
                              value: value.name,
                              child: Text(
                                value.name,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedItem = newValue;
                            });
                          },
                          decoration: InputDecoration(
                            labelStyle: TextStyle(fontSize: 12),
                            labelText: 'Kolac',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Molimo odaberite opciju';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                          height: 65,
                          width: 400,
                          child: TextFormField(
                            controller: _emailController,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            decoration: InputDecoration(
                              labelStyle: TextStyle(fontSize: 12),
                              labelText: 'Nova cena',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.h)),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Molimo unesite';
                              }
                              return null;
                            },
                          )),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _submitData,
                        child: Text('Dodaj kolac',
                            style: theme.textTheme.labelLarge),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(400,
                              70), // double.infinity is the width and 30 is the height
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )));
  }
}
