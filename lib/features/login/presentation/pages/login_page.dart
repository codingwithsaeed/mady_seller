import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:mady_seller/features/login/presentation/controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  static const id = '/LoginPage';
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اپ فروشندگان'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Flexible(
            flex: 1,
            child: Image(
              image: AssetImage('assets/images/sale-yellow.png'),
            ),
          ),
          Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        label: const Text(
                          'نام کاربری',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        floatingLabelStyle: const TextStyle(fontSize: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.password),
                        label: const Text(
                          'گذر واژه',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        floatingLabelStyle: const TextStyle(fontSize: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: MaterialButton(
                      padding: const EdgeInsets.all(12.0),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.yellow.shade800,
                      child: const Text(
                        'ورود به برنامه',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
