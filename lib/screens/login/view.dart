import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/cache_helper.dart';
import 'package:movies/core/input.dart';
import 'package:movies/core/methods.dart';
import 'package:movies/core/my_button.dart';
import 'package:movies/screens/login/cubit.dart';
import 'package:movies/screens/master/view.dart';
import 'package:movies/screens/register/view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(builder: (context) {
        final cubit = LoginCubit.getObject(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/login_background.png',
                  height: 434.h,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                Form(
                  key: cubit.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 134.h,
                      ),
                      Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r)),
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: 20.w,
                              end: 20.w,
                              bottom: 10.h,
                              top: 19.3.h),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/images/login.png',
                                width: 68.58.w,
                                height: 91.76.h,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                height: 9.9.h,
                              ),
                              Text(
                                'PHOTOPLAY',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xffFFBB3B)),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 41.h,
                      ),
                      Input(
                        label: 'Email',
                        hint: 'email here',
                        controller: cubit.emailController,
                        keyBoardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'email is required';
                          } else if (!value.endsWith('@gmail.com')) {
                            return 'email must end with @gmail.com';
                          }
                          return null;
                        },
                      ),
                      Input(
                        label: 'password',
                        hint: 'password here',
                        isPassword: true,
                        keyBoardType: TextInputType.visiblePassword,
                        controller: cubit.passwordController,
                        isLast: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'password is required';
                          }
                          return null;
                        },
                      ),
                      BlocConsumer<LoginCubit, LoginStates>(
                        listener: (context, state) {
                          if (state is LoginFailedStates) {
                            showMsg(msg: state.msg);
                          } else if (state is LoginSuccessStates) {
                            navigateTo(
                                page: const MasterScreen(), withHistory: false);
                          }
                        },
                        builder: (context, state) {
                          if (state is LoginLoadingStates) {
                            return const CircularProgressIndicator(
                              color: Colors.amber,
                            );
                          }
                          return MyButton(
                              onPress: () {
                                cubit.login();
                                CacheHelper.saveNotFirstTime();
                              },
                              label: 'login');
                        },
                      ),
                      SizedBox(
                        height: 29.h,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 80.41.w,
                            height: 1.h,
                            color: const Color(0xff898989),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Text(
                            'Social Logins',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff5A5A5A)),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Container(
                            width: 80.41.w,
                            height: 1.h,
                            color: const Color(0xff898989),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 22.r,
                            backgroundColor: const Color(0xffFFBB3B),
                            child: Text(
                              'f',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          CircleAvatar(
                            radius: 22.r,
                            backgroundColor: const Color(0xffFFBB3B),
                            child: Text(
                              'G',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 42.h,
                      ),
                      Text(
                        'Don’t have an account?',
                        style: TextStyle(
                            color: Theme.of(context).hintColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      TextButton(
                          onPressed: () {
                            navigateTo(page: const RegisterScreen());
                          },
                          child: Text(
                            'register'.toUpperCase(),
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xff5A5A5A)),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
