import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mady_seller/core/routes/app_routes.dart';
import 'package:mady_seller/features/login/presentation/controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اپ فروشندگان'),
        centerTitle: true,
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    controller.addListener((() {
      if (controller.status.isSuccess) {
        Get.offNamed(AppRoutes.home);
      }
      if (controller.status.isError) {
        Get.snackbar('خطا', controller.status.errorMessage!,
            backgroundColor: Colors.red.shade700,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
      }
    }));
    return Column(
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
              MyTextField(
                label: 'شماره موبایل',
                icon: Icons.person,
                onChange: (value) => controller.phone.value = value,
              ),
              MyTextField(
                label: 'گذرواژه',
                icon: Icons.password,
                isPassword: true,
                onChange: (value) => controller.password.value = value,
              ),
              controller.obx(((state) => returnButton()),
                  onError: (error) => returnButton(),
                  onLoading: returnLoading(),
                  onEmpty: returnButton()),
            ],
          ),
        ),
      ],
    );
  }
}

Widget returnLoading() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: CircularProgressIndicator(color: Colors.yellow.shade800)),
    );

Widget returnButton() {
  return MyButton(
    label: 'ورود به برنامه',
    onPressed: () => Get.find<LoginController>().doLogin(),
    color: Colors.yellow.shade800,
  );
}

class MyButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;
  const MyButton(
      {Key? key,
      required this.label,
      required this.onPressed,
      this.color = Colors.yellow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: MaterialButton(
        padding: const EdgeInsets.all(16.0),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: color,
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Function(String)? onChange;
  final bool isPassword;

  const MyTextField({
    Key? key,
    required this.label,
    this.icon,
    this.onChange,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextFormField(
        onChanged: onChange,
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          label: Text(
            label,
            style: const TextStyle(fontSize: 18.0),
          ),
          floatingLabelStyle: const TextStyle(fontSize: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
