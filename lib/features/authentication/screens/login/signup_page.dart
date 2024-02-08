import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge_app/features/authentication/controllers/login_signup/login_signup_pages_controller.dart';
import 'package:solution_challenge_app/navigation_menu.dart';
import 'package:solution_challenge_app/utils/helpers/helper_function.dart';

class SignupPageContainer extends StatelessWidget {
  const SignupPageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme =
        (MediaQuery.of(context).platformBrightness) == Brightness.dark;
    final controller = Get.put(LoginSignupPageController());

    return Container(
      height: HelperFunctions.screenHeight() * 0.54,
      width: HelperFunctions.screenWidth() * 0.94,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: isDarkTheme ? const Color(0XFF1A1A1A) : const Color(0XFFFFFFFF),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            // ------- Star Icon & Back -------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Star(isDarkTheme: isDarkTheme),
                TextButton(
                  onPressed: () => controller.backPageController(),
                  child: Text(
                    'Back',
                    style: TextStyle(
                        color: isDarkTheme ? Colors.white : Colors.black,
                        fontFamily: 'Poppins',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
            //
            // ------- Lets Create Account -------
            Padding(
              padding: const EdgeInsets.only(top: 26),
              child: Text(
                "Let's Create your Account !",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                  color: isDarkTheme
                      ? const Color(0XFFFFFFFF)
                      : const Color(0XFF1A1A1A),
                ),
              ),
            ),
            //
            // -------- gap
            const SizedBox(height: 26),
            //
            // ------- Form -------
            Form(
              child: Column(
                children: [
                  //
                  // ------- First & last Name -------
                  const Row(
                    children: [
                      Expanded(
                          child: InputFields(
                              prefixicon: Iconsax.profile_circle,
                              text: 'First Name')),
                      SizedBox(width: 6),
                      Expanded(
                          child: InputFields(
                              prefixicon: Iconsax.profile_circle,
                              text: 'Last Name')),
                    ],
                  ),
                  //
                  //-------- gap --------
                  const SizedBox(height: 8),
                  //
                  //-------- phone number --------
                  const Row(
                    children: [
                      Expanded(
                          child: InputFields(
                              prefixicon: Iconsax.direct_right,
                              text: 'Email / Phone')),
                    ],
                  ),
                  //
                  //-------- gap --------
                  const SizedBox(height: 8),
                  //
                  //-------- otp --------
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: InputFields(
                            prefixicon: Iconsax.password_check, text: 'OTP'),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: LoginTextButton(
                            isDarkTheme: isDarkTheme,
                            text: 'OTP',
                            onpressfunction: 'otp',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            //
            // -----Create Account -------
            Row(
              children: [
                Expanded(
                  child: LoginTextButton(
                    isDarkTheme: isDarkTheme,
                    text: "Create Account",
                    onpressfunction: 'home',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//
// ----- all the widgets used below ------
//
// ----- input fields
class InputFields extends StatelessWidget {
  const InputFields({
    super.key,
    required this.prefixicon,
    required this.text,
  });

  final IconData prefixicon;
  final String text;

  @override
  Widget build(BuildContext context) {
    const Color labelTextIconColor = Color.fromARGB(255, 133, 132, 132);
    const Color otpContainerColor = Color.fromARGB(255, 241, 240, 240);
    return Container(
      decoration: BoxDecoration(
        color: otpContainerColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            prefixicon,
            color: labelTextIconColor,
          ),
          labelText: text,
          labelStyle: const TextStyle(color: labelTextIconColor),
        ),
      ),
    );
  }
}

//
// text button
class LoginTextButton extends StatelessWidget {
  const LoginTextButton({
    super.key,
    required this.isDarkTheme,
    required this.text,
    required this.onpressfunction,
  });

  final bool isDarkTheme;
  final String text;
  final String onpressfunction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () =>
                onpressfunction == 'home' ? Get.to(const NavigationMenu()) : {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              backgroundColor: const Color.fromARGB(255, 41, 41, 41),
              elevation: 0,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 17.4),
              child: Text(
                text,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Color(0XFFFFFFFF),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// container star
class Star extends StatelessWidget {
  const Star({super.key, required this.isDarkTheme});
  final bool isDarkTheme;

  @override
  Widget build(BuildContext context) {
    String starIcon = isDarkTheme
        ? 'assets/images/login_page/star_white.png'
        : 'assets/images/login_page/star_black.png';
    return Padding(
      padding: const EdgeInsets.only(top: 23),
      child: Container(
        width: 66,
        height: 66,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isDarkTheme
              ? const Color.fromARGB(255, 48, 48, 48)
              : const Color.fromARGB(255, 243, 242, 242),
        ),
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              starIcon,
              fit: BoxFit.contain,
            )),
      ),
    );
  }
}
