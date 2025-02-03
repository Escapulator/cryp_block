import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_form.dart';
import '../../widgets/custom_password.dart';
import 'auth_viewmodel.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => AuthViewModel(),
      builder: (context, model, _) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(elevation: 0, backgroundColor: Colors.white),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Log in to your account',
                        style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        'Welcome back! Please enter your registered email address to continue',
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.only(left: 4.w),
                        child: Text(
                          'Email address',
                          style: TextStyle(
                            color: Color(0xFF5A5A5A),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      CustomForm(
                        controller: model.emailController,
                        keyboardType: TextInputType.emailAddress,
                        focus: model.emailFocus,
                        onChanged: (c) {
                          model.validator();
                        },
                        hint: 'Email address',
                        color: Color(0xFFEFEFEF),
                      ),
                      if (model.emailFocus.hasFocus && !model.validEmail)
                        Padding(
                          padding: EdgeInsets.only(top: 4.h),
                          child: Text(
                            'Invalid Email Provided',
                            style: GoogleFonts.inter(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.red),
                          ),
                        ),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          'Password',
                          style: TextStyle(
                            color: Color(0xFF5A5A5A),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      CustomPassword(
                        controller: model.passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        focus: model.passwordFocus,
                        onChanged: (c) {
                          model.validator();
                        },
                        hint: 'Enter password',
                        color: Color(0xFFEFEFEF),
                      ),
                      if (model.passwordFocus.hasFocus && !model.password)
                        Padding(
                          padding: EdgeInsets.only(top: 4.h),
                          child: Text(
                            'Invalid Password Provided',
                            style: GoogleFonts.inter(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.red),
                          ),
                        ),
                    ],
                  ),
                ),
                CustomButton(
                  height: 48.h,
                  width: double.infinity,
                  text: 'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  onPressed: () {
                    model.isValidated ? model.login(context) : null;
                  },
                  hasElevation: model.isValidated,
                  btnColor: model.isValidated
                      ? Color(0xFF12A633)
                      : Color(0xFF12A633).withOpacity(0.3),
                ),
                SizedBox(
                    height: MediaQuery.of(context).padding.bottom != 0.0
                        ? MediaQuery.of(context).padding.bottom
                        : 20.h)
              ],
            ),
          ),
        );
      },
    );
  }
}
