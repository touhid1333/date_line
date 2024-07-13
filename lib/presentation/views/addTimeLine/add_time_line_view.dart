import 'package:date_line/utils/common/widgets/app_status_bar.dart';
import 'package:date_line/utils/common/widgets/custom_app_bar.dart';
import 'package:date_line/utils/common/widgets/custom_button.dart';
import 'package:date_line/utils/extensions/build_context_extensions.dart';
import 'package:date_line/utils/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddTimeLineView extends StatefulWidget {
  const AddTimeLineView({super.key});

  @override
  State<AddTimeLineView> createState() => _AddTimeLineViewState();
}

class _AddTimeLineViewState extends State<AddTimeLineView> {
  GlobalKey<FormState> formKey = GlobalKey();
  List<String> categoryList = ["বাক্য", "অনুচ্ছেদ"];
  List<String> locationList = ["ঢাকা, বাংলাদেশ", "চট্টগ্রাম, বাংলাদেশ"];

  // -----------------------------------
  // Show Date Picker
  // -----------------------------------
  Future<void> _selectDate() async {
    final DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(DateTime.now().year + 1),
    );
  }

  // -----------------------------------
  // Show Success
  // -----------------------------------
  Future<void> _showSuccess() async {
    final theme = context.theme;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/icons/ic_success.png",
                height: 70,
                width: 70,
              ).padding(bottom: 20, top: 10),
              Text(
                "নতুন অনুচ্ছেদ সংরক্ষন",
                style: theme.textTheme.headlineMedium,
              ).padding(bottom: 8),
              Text(
                "আপনার সময়রেখাতে নতুন অনুচ্ছেদ সংরক্ষণ সম্পুর্ন হয়েছে",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.outline.withOpacity(0.6),
                ),
              ).padding(bottom: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: CustomButton(
                  text: "আরও যোগ করুন",
                  width: double.maxFinite,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        );
      },
    );
  }

  
  
  // -----------------------------------
  // Build Method
  // -----------------------------------
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return AppStatusBar(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: "নতুন যোগ করুন",
          showAppLogo: false,
          actions: [],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // -----------------------------------
                  // Title
                  // -----------------------------------
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "অনুচ্ছেদ",
                        style: theme.textTheme.headlineMedium,
                      ),
                      Text(
                        "৪৫ শব্দ",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.outline.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ).padding(bottom: 8),
                  TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(45),
                    ],
                    decoration: const InputDecoration(
                      hintText: "অনুচ্ছেদ লিখুন",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "অনুগ্রহ করে ক্ষেত্রটি পূরণ করুন!";
                      }
                      return null;
                    },
                  ).padding(bottom: 20),

                  // -----------------------------------
                  // Category
                  // -----------------------------------
                  Text(
                    "অনুচ্ছেদের বিভাগ",
                    style: theme.textTheme.headlineMedium,
                  ).padding(bottom: 8),
                  DropdownButtonFormField<String>(
                    hint: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "অনুচ্ছেদের বিভাগ নির্বাচন করুন",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.outline.withOpacity(0.6),
                        ),
                      ),
                    ),
                    isExpanded: true,
                    items: categoryList.map(
                      (e) {
                        return DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {},
                  ).padding(bottom: 20),

                  // -----------------------------------
                  // Date Time
                  // -----------------------------------
                  Text(
                    "তারিখ ও সময়",
                    style: theme.textTheme.headlineMedium,
                  ).padding(bottom: 8),

                  TextFormField(
                    readOnly: true,
                    onTap: () async {
                      await _selectDate();
                    },
                    decoration: InputDecoration(
                      hintText: "নির্বাচন করুন",
                      suffixIcon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 14,
                      ),
                      suffixIconColor: theme.colorScheme.outline.withOpacity(0.6),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "অনুগ্রহ করে ক্ষেত্রটি পূরণ করুন!";
                      }
                      return null;
                    },
                  ).padding(bottom: 20),

                  // -----------------------------------
                  // Location
                  // -----------------------------------
                  Text(
                    "স্থান",
                    style: theme.textTheme.headlineMedium,
                  ).padding(bottom: 8),
                  DropdownButtonFormField<String>(
                    hint: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 14,
                            color: theme.colorScheme.outline.withOpacity(0.6),
                          ).padding(right: 10),
                          Text(
                            "নির্বাচন করুন",
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.outline.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                    isExpanded: true,
                    items: locationList.map(
                      (e) {
                        return DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {},
                  ).padding(bottom: 20),

                  // -----------------------------------
                  // Description
                  // -----------------------------------
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "অনুচ্ছেদের বিবরণ",
                        style: theme.textTheme.headlineMedium,
                      ),
                      Text(
                        "১২০ শব্দ",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.outline.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ).padding(bottom: 8),
                  TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(120),
                    ],
                    decoration: const InputDecoration(
                      hintText: "কার্যক্রমের বিবরণ লিখুন",
                    ),
                    maxLines: 8,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "অনুগ্রহ করে ক্ষেত্রটি পূরণ করুন!";
                      }
                      return null;
                    },
                  ).padding(bottom: 20),

                  // -----------------------------------
                  // Submit
                  // -----------------------------------
                  CustomButton(
                    width: double.maxFinite,
                    text: "সংরক্ষন করুন",
                    onTap: () async {
                      await _showSuccess();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
