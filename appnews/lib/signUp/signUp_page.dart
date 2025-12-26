import 'dart:convert';
import 'package:appnews/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController txtuser = TextEditingController();
  TextEditingController txtpassword = TextEditingController();
  final String urlsignup = 'http://10.71.71.204:3000/signup';

  Future<void> signup() async {
    if (txtuser.text.isEmpty || txtpassword.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('ກະລຸນາປ້ອນຂໍ້ມູນໃຫ້ຄົບ'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final url = Uri.parse(urlsignup);

    try {
      final res = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": txtuser.text,
          "password": txtpassword.text,
          "state": "active",
        }),
      );

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['msg']), backgroundColor: Colors.green),
        );

        // Navigate after a short delay so user sees message
        Future.delayed(Duration(seconds: 1), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        });
      } else {
        final data = jsonDecode(res.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(data['msg'] ?? 'Signup failed'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Server error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text('ຈັດການຂໍ້ມູນຜູ້ໃຊ້ງານ'),
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Card(
              color: Colors.grey.shade500,
              elevation: 10,
              shadowColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: txtuser,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.person_add_alt_sharp,
                          color: Colors.green,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'ອິເມວ ຫຼື ເບີໂທ',
                        labelStyle: TextStyle(color: Colors.green),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: txtpassword,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(Icons.lock, color: Colors.green),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'ລະຫັດຜ່ານ',
                        labelStyle: TextStyle(color: Colors.green),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          signup();
                        },
                        child: Text(
                          'ບັນທຶກ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
