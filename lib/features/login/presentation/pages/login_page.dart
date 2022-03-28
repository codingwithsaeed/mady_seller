import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mady_seller/core/routes/app_routes.dart';
import 'package:mady_seller/core/utils/utils.dart';
import 'package:mady_seller/features/login/presentation/controller/login_controller.dart';
import 'package:mady_seller/responsive.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              title: const Text('مادی فروشنده'),
            )
          : null,
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    controller.addListener((() {
      if (controller.status.isSuccess) {
        Get.offNamed(AppRoutes.offers);
      }
      if (controller.status.isError) {
        Get.snackbar('خطا', controller.status.errorMessage!,
            backgroundColor: Colors.red.shade700,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
      }
    }));
    return Responsive(
        mobile: onMobile(context),
        tablet: onDesktop(context),
        desktop: onDesktop(context));
  }

  Widget onDesktop(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: Responsive.isTablet(context) ? 5 : 2,
          child: Container(
            color: Colors.yellow.shade800,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Spacer(
                  flex: 3,
                ),
                const Image(
                  image: AssetImage('assets/images/sale-white.png'),
                ),
                const Spacer(
                  flex: 1,
                ),
                Center(
                  child: Text(
                    'به مادی نسخه فروشنده خوش آمدید.\nشماره موبایل و گذرواژه خود را وارد کنید\nو از مادی استفاده کنید :)',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Responsive.isTablet(context) ? 23 : 40.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: onMobile(context),
          flex: Responsive.isTablet(context) ? 4 : 1,
        )
      ],
    );
  }

  Widget onMobile(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (!Responsive.isMobile(context)) Spacer(),
          if (Responsive.isMobile(context))
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
                  validator: (text) {
                    if (text == null || text.isEmpty)
                      return 'شماره موبایل را وارد کنید';
                    if (!text.isValidPhone) return 'شماره موبایل معتبر نیست';
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  onChange: (value) => controller.phone.value = value,
                ),
                MyTextField(
                  label: 'گذرواژه',
                  icon: Icons.password,
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true,
                  validator: (text) {
                    if (text == null || text.isEmpty)
                      return 'گذرواژه را وارد کنید';
                    if (text.isValidPassword) return 'گذرواژه معتبر نیست';
                    return null;
                  },
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

  Widget returnLoading() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: CircularProgressIndicator(color: Colors.yellow.shade800)),
      );

  Widget returnButton() {
    return MyButton(
      label: 'ورود به برنامه',
      onPressed: () {
        FocusManager.instance.primaryFocus!.unfocus();
        Get.find<LoginController>().doLogin();
      },
      color: Colors.yellow.shade800,
    );
  }
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
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool isPassword;

  const MyTextField({
    Key? key,
    required this.label,
    this.icon,
    this.onChange,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextFormField(
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: onChange,
        obscureText: isPassword,
        keyboardType: keyboardType,
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
