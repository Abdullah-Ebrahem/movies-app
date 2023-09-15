import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Input extends StatefulWidget {
  final String label;
  final String hint;
  final bool isLast;
  final bool isPassword;
  final TextInputType? keyBoardType;
  final TextEditingController? controller;
  final Function()? onTap;
  final String? Function(String?)? validator;
  const Input(
      {super.key,
      required this.label,
      required this.hint,
      this.isLast = false,
      this.keyBoardType,
      this.validator,
      this.controller,
      this.isPassword = false,
      this.onTap});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          bottom: widget.isLast ? 21 : 25, start: 45.w, end: 45.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label.toUpperCase(),
            style: TextStyle(
                fontSize: 12.sp,
                color: const Color(0xff5A5A5A),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8.h,
          ),
          TextFormField(
            onTap: widget.onTap,
            keyboardType: widget.keyBoardType,
            controller: widget.controller,
            textInputAction:
                widget.isLast ? TextInputAction.done : TextInputAction.next,
            validator: widget.validator,
            obscureText: widget.isPassword && isHidden,
            decoration: InputDecoration(
                suffixIcon: widget.isPassword
                    ? GestureDetector(
                        onTap: () {
                          isHidden = !isHidden;
                          setState(() {});
                        },
                        child: Icon(
                          isHidden
                              ? Icons.remove_red_eye
                              : Icons.remove_red_eye_outlined,
                          color: Colors.amber,
                        ))
                    : const SizedBox.shrink(),
                contentPadding: EdgeInsetsDirectional.only(
                    start: 20.w, top: 8.h, bottom: 12.h),
                hintText: widget.hint.toLowerCase(),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(9.r))),
          ),
        ],
      ),
    );
  }
}
