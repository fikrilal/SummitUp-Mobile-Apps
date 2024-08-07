import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/appbar/appbar_component.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/buttons/button_component.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/texts/component_text.dart';
import 'package:summitup_mobile_apps/profile/_core/presentation/components/profile_image_component.dart';
import 'package:summitup_mobile_apps/profile/edit_profile/presentation/components/edit_profile_button.dart';
import 'package:summitup_mobile_apps/profile/edit_profile/presentation/components/edit_profile_textfield.dart';
import 'package:summitup_mobile_apps/profile/edit_profile/presentation/components/gender_radio_button.dart';

import '../../../../_core/providers/user_providers.dart';
import '../../data/data_sources/upload_image_api_service.dart';
import '../providers/update_profile_providers.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String _selectedGender = "Laki-laki";
  bool _dataLoaded = false;
  File? _selectedImage;

  Future<void> _pickImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      setState(() {
        if (pickedFile != null) {
          _selectedImage = File(pickedFile.path);
        } else {
          print('No image selected.');
        }
      });
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<void> _uploadImage(int userId) async {
    if (_selectedImage != null) {
      await uploadImage(_selectedImage!, userId);
    } else {
      print('No image to upload.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final userAsyncValue = ref.watch(userProvider);
    final updateProfileNotifier = ref.watch(updateProfileProvider.notifier);
    final isLoading = ref.watch(updateProfileProvider);

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
                userAsyncValue.when(
                  data: (user) {
                    if (!_dataLoaded) {
                      _nameController.text = user.fullname;
                      _numberController.text = user.phoneNumber;
                      _emailController.text = user.email;
                      _dataLoaded = true;
                    }
                    return Center(
                      child: Column(
                        children: [
                          ProfileImageComponent(
                            imageUrl: user.profileImageUrl,
                          ),
                          SizedBox(height: 16.h),
                          EditProfileButton(
                            onPressed: () async {
                              await _pickImage();
                              if (_selectedImage != null) {
                                await _uploadImage(user.id);
                              }
                            },
                            text: "Ganti",
                            iconPath: 'assets/icons/edit_icon.svg',
                          ),
                        ],
                      ),
                    );
                  },
                  loading: () => Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16.h),
                        EditProfileButton(
                          onPressed: () {},
                          text: "Ganti",
                          iconPath: 'assets/icons/edit_icon.svg',
                        ),
                      ],
                    ),
                  ),
                  error: (error, _) => Center(
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
                ),
                SizedBox(height: 32.h),
                userAsyncValue.when(
                  data: (user) => Column(
                    children: [
                      EditProfileTextField(
                        label: "Nama",
                        hintText: "Masukkan nama Anda",
                        initialValue: _nameController.text,
                        controller: _nameController,
                      ),
                      SizedBox(height: 16.h),
                      EditProfileTextField(
                        label: "No. Telp",
                        hintText: "Masukkan no. telp. Anda",
                        initialValue: _numberController.text,
                        controller: _numberController,
                      ),
                      SizedBox(height: 16.h),
                      EditProfileTextField(
                        label: "Email",
                        hintText: "Masukkan email Anda",
                        initialValue: _emailController.text,
                        controller: _emailController,
                      ),
                    ],
                  ),
                  loading: () => Column(
                    children: [
                      EditProfileTextField(
                        label: "Nama",
                        hintText: "Masukkan nama Anda",
                        initialValue: "",
                        controller: _nameController,
                      ),
                      SizedBox(height: 16.h),
                      EditProfileTextField(
                        label: "No. Telp",
                        hintText: "Masukkan no. telp. Anda",
                        initialValue: "",
                        controller: _numberController,
                      ),
                      SizedBox(height: 16.h),
                      EditProfileTextField(
                        label: "Email",
                        hintText: "Masukkan email Anda",
                        initialValue: "",
                        controller: _emailController,
                      ),
                    ],
                  ),
                  error: (error, _) => Column(
                    children: [
                      EditProfileTextField(
                        label: "Nama",
                        hintText: "Masukkan nama Anda",
                        initialValue: "Error",
                        controller: _nameController,
                      ),
                      SizedBox(height: 16.h),
                      EditProfileTextField(
                        label: "No. Telp",
                        hintText: "Masukkan no. telp. Anda",
                        initialValue: "Error",
                        controller: _numberController,
                      ),
                      SizedBox(height: 16.h),
                      EditProfileTextField(
                        label: "Email",
                        hintText: "Masukkan email Anda",
                        initialValue: "Error",
                        controller: _emailController,
                      ),
                    ],
                  ),
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
                  text: isLoading ? "Loading..." : "Simpan",
                  onPressed: isLoading
                      ? () {}
                      : () {
                    final data = {
                      'fullname': _nameController.text,
                      'phone_number': _numberController.text,
                      'email': _emailController.text,
                      'gender': _selectedGender,
                      'user_id': userAsyncValue.value?.id.toString() ?? '',
                    };
                    print("Button pressed with data: $data"); // Print data when button is pressed
                    updateProfileNotifier.updateProfile(data, context);
                  },
                ),

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
    _numberController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}