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

class DodajProizvodScreen extends StatefulWidget {
  @override
  _DodajProizvodScreen createState() => _DodajProizvodScreen();
}

class _DodajProizvodScreen extends State<DodajProizvodScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _contr = TextEditingController();

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
      print(TortaService.torte.length);
      var tip = _passwordController.text;
      if (tip == "torta") {
        TortaService.addTorta(Torta(
            image_path: "assets/images/img_38d5902ce335fe0_3.png",
            name: _nameController.text,
            rating: "4.8",
            sastojci: _emailController.text,
            description: _phoneController.text,
            tip: tip,
            price: double.parse(_contr.text)));
      } else {
        TortaService.addKolac(Torta(
            image_path: "assets/images/img_38d5902ce335fe0_3.png",
            name: _nameController.text,
            rating: "4.8",
            sastojci: _emailController.text,
            description: _phoneController.text,
            tip: tip,
            price: double.parse(_contr.text)));
      }
    }
    print(TortaService.torte.length);
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
                          height: 65,
                          width: 400,
                          child: TextFormField(
                            controller: _nameController,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            decoration: InputDecoration(
                              labelStyle: TextStyle(fontSize: 12),
                              labelText: 'Naziv kolaca',
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
                      SizedBox(
                          height: 65,
                          width: 400,
                          child: TextFormField(
                            controller: _emailController,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            decoration: InputDecoration(
                              labelStyle: TextStyle(fontSize: 12),
                              labelText: 'Opis',
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
                      SizedBox(
                          height: 65,
                          width: 400,
                          child: TextFormField(
                            controller: _phoneController,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            decoration: InputDecoration(
                              labelStyle: TextStyle(fontSize: 12),
                              labelText: 'Sastojci',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.h)),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Molimo unesite ';
                              }
                              return null;
                            },
                          )),
                      SizedBox(height: 16),
                      SizedBox(
                          height: 65,
                          width: 400,
                          child: TextFormField(
                            controller: _passwordController,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            decoration: InputDecoration(
                              labelStyle: TextStyle(fontSize: 12),
                              labelText: 'Tip',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.h)),
                            ),
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  (value != 'torta' && value != 'kolac')) {
                                return 'Molimo unesite torta ili kolac';
                              }
                              return null;
                            },
                          )),
                      SizedBox(height: 24),
                      UploadPictureField(),
                      SizedBox(height: 24),
                      Container(
                          width: 400,
                          height: 60,
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.h, vertical: 5.v),
                          decoration: AppDecoration.outlineBlueGrayE.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder14),
                          child: Row(children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  if (quantity > 1) quantity--;
                                });
                              },
                            ),
                            CustomOutlinedButton(
                                width: 15.h,
                                text: '$quantity',
                                margin: EdgeInsets.only(left: 1.h, top: 1.v)),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(top: 8.v, bottom: 2.v),
                              child: SizedBox(
                                  height: 65,
                                  width: 200,
                                  child: TextFormField(
                                    controller: _contr,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                    decoration: InputDecoration(
                                      labelStyle: TextStyle(fontSize: 12),
                                      labelText: 'Cena',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.h)),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Molimo unesite email adresu';
                                      }
                                      return null;
                                    },
                                  )),
                            )
                          ])),
                      SizedBox(height: 24),
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
