import 'package:appnews/signUp/signUp_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool eye = true;

  void SignUpSHowPage() {
    showDialog(
      context: context,
      builder: (c) => AlertDialog(
        title: Text('ລົງທະບຽນ'),
        content: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'ຈັດການຂໍ້ມູນຜູ້ໃຊ້',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NotoSansLao-Regular',
                ),
              ),
              Divider(thickness: 2, color: Colors.cyan),
            ],
          ),
        ),
        actions: [],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 600,
          margin: EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.cyan, width: 2),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/Onboard2.png'),
                ),
              ),
              Divider(),
              Text(
                "ຮ້ານ BCSP7B Soutsaka",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 28,
                  fontFamily: 'LobsterTwo-Regular',
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  cursorColor: Colors.cyan,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Colors.cyan),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: 'ຊື່ຜູ້ໃຊ້ລະບົບ(UserName)',
                    fillColor: Colors.white,
                    filled: true,
                    labelStyle: TextStyle(color: Colors.cyan),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  obscureText: !eye,
                  style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  cursorColor: Colors.cyan,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Colors.cyan),
                    suffixIcon: IconButton(
                      icon: Icon(
                        eye ? Icons.visibility_off : Icons.visibility,
                        color: Colors.cyan,
                      ),
                      color: Colors.cyan,
                      onPressed: () {
                        setState(() {
                          eye = !eye;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: 'ລະຫັດຜ່ານ(Password)',
                    fillColor: Colors.white,
                    filled: true,
                    labelStyle: TextStyle(color: Colors.cyan),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.cyan, Colors.blue],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'ເຂົ້າສູ່ລະບົບ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ຍັງບໍ່ມີບັນຊີບໍ?',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        // SignUpSHowPage();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                      child: Text(
                        'ລົງທະບຽນ',
                        style: TextStyle(color: Colors.cyan, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
