import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/appbar/appbar_component.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/buttons/button_component.dart';
import '../../../../_core/presentation/components/texts/component_text.dart';
import '../components/edit_profile_button.dart';
import '../components/edit_profile_textfield.dart';
import '../../../_core/presentation/components/profile_image_component.dart';
import '../components/gender_radio_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String _selectedGender = "Laki-laki";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Edit Profile",
        showBottomBorder: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      ProfileImageComponent(
                          imageUrl: 'https://picsum.photos/1000'),
                      SizedBox(height: 16.h),
                      EditProfileButton(
                        onPressed: () {},
                        text: "Ganti",
                        iconPath: 'assets/icons/edit_icon.svg',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32.h),
                EditProfileTextField(
                  label: "Nama",
                  hintText: "Masukkan nama Anda",
                  initialValue: "Alexander Kahfi Smith",
                  controller: _nameController,
                ),
                SizedBox(height: 16.h),
                EditProfileTextField(
                  label: "No. Telp",
                  hintText: "Masukkan no. telp. Anda",
                  initialValue: "086162837244",
                  controller: _numberController,
                ),
                SizedBox(height: 16.h),
                EditProfileTextField(
                  label: "Email",
                  hintText: "Masukkan email Anda",
                  initialValue: "kahfismith@gmail.com",
                  controller: _emailController,
                ),
                SizedBox(height: 16.h),
                TextComponent.bodySmall("Gender"),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Expanded(
                      child: GenderRadioButton<String>(
                        value: "Laki-laki",
                        groupValue: _selectedGender,
                        label: "Laki-laki",
                        onChanged: () {
                          setState(() {
                            _selectedGender = "Laki-laki";
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: GenderRadioButton<String>(
                        value: "Perempuan",
                        groupValue: _selectedGender,
                        label: "Perempuan",
                        onChanged: () {
                          setState(() {
                            _selectedGender = "Perempuan";
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.w),
                ButtonComponent(
                  text: "Simpan",
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
