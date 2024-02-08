import 'package:flutter/material.dart';
import 'package:slatkizalogaj/core/app_export.dart';
import 'package:slatkizalogaj/core/utils/image_constant.dart';
import 'package:slatkizalogaj/model/user.dart';
import 'package:slatkizalogaj/services/user_service.dart';
import 'package:slatkizalogaj/widgets/custom_image_view.dart';

class ProfilScreen extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchDataFromUserService();
  }

  var user = User(
      username: "",
      email: "",
      password: "",
      phoneNumber: "",
      firstName: "",
      lastName: "",
      isCustomer: false);

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void fetchDataFromUserService() {
    final userData = UserService.currentUser;
    this.user = userData;
    _nameController.text = userData.firstName + ' ' + userData.lastName;
    _emailController.text = userData.email;
    _phoneController.text = userData.phoneNumber;
    _passwordController.text = userData.password;
  }

  void _submitData() {
    if (_formKey.currentState!.validate()) {
      print('Ime i prezime: ${_nameController.text}');
      print('Email adresa: ${_emailController.text}');
      print('Broj telefona: ${_phoneController.text}');
      print('Lozinka: ${_passwordController.text}');
      UserService.currentUser.email = _emailController.text;
      UserService.currentUser.firstName = _nameController.text.split(" ")[0];
      UserService.currentUser.lastName = _nameController.text.split(" ")[1];
      UserService.currentUser.phoneNumber = _phoneController.text;
      UserService.currentUser.password = _passwordController.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            UserService.logout();
            Navigator.pushNamed(context, AppRoutes.loginScreen);
          },
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              CustomImageView(
                  imagePath: ImageConstant.imgImage,
                  height: 150.v,
                  width: 146.h,
                  radius: BorderRadius.circular(20.h),
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 110.h)),
              SizedBox(height: 50),
              Text(this.user.username, style: theme.textTheme.displayMedium),
              TextFormField(
                controller: _nameController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Ime i prezime',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.h)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Molimo unesite ime i prezime';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Email adresa',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.h)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Molimo unesite email adresu';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Broj telefona',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.h)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Molimo unesite broj telefona';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Lozinka',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.h)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Molimo unesite lozinku';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitData,
                child: Text('Ažuriraj podatke', style: theme.textTheme.button),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity,
                      70), // double.infinity is the width and 30 is the height
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
