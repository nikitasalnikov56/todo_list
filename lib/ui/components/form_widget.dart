import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/domain/provider/todo_provider.dart';
import 'package:todo_list/ui/style/app_colors.dart';
import 'package:todo_list/ui/style/app_style.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    super.key,
    required this.btnName,
    required this.func,
  });

  final String btnName;
  final Function func;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<TodoProvider>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 43),
      child: Column(
        children: [
          TextFieldWidget(
            controller: model.titleController,
            hintText: 'Title',
          ),
          const SizedBox(height: 43),
          TextFieldWidget(
            controller: model.textController,
            hintText: 'Detail',
          ),
          const SizedBox(height: 54),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.purple,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              onPressed: () {
                func();
              },
              child: Text(
                btnName,
                style: AppStyle.fontStyle.copyWith(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
  });

  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
        ),
        hintText: hintText,
        hintStyle: AppStyle.fontStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.grey,
        ),
      ),
    );
  }
}
