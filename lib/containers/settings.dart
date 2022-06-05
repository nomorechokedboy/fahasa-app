import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fahasa_app/components/button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingState();
}

class _SettingState extends State<Settings> {
  File? selectedAvatar;

  @override
  Widget build(BuildContext context) {
    const loading = true;

    final _avatar = Stack(
      alignment: Alignment.bottomRight,
      children: [
        selectedAvatar != null
            ? CircleAvatar(
                backgroundImage: FileImage(selectedAvatar!),
                radius: 75,
              )
            : CachedNetworkImage(
                fit: BoxFit.contain,
                imageBuilder: (context, imageProvider) => Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                    ),
                  ),
                ),
                imageUrl: 'https://pbs.twimg.com/media/FLLpy5dXsAI8nI9.jpg',
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
        Positioned(
          right: -8,
          child: TextButton(
            style: TextButton.styleFrom(
              elevation: 2,
              primary: Colors.black,
              backgroundColor: Colors.white.withOpacity(0.9),
              padding: const EdgeInsets.all(12),
              shape: const CircleBorder(),
            ),
            onPressed: () {
              selectAvatar();
            },
            child: const Icon(
              Icons.camera_alt,
              size: 20,
            ),
          ),
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account setting'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _avatar,
              const SizedBox(height: 16),
              const _Form(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> selectAvatar() async {
    final selectedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (selectedImage != null) {
      setState(() {
        selectedAvatar = File(selectedImage.path);
      });
    }
  }
}

class _Form extends StatefulWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FormState();
}

class _FormState extends State<_Form> {
  String birthdate = '25/06/2001';
  String? gender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          children: [
            _TextField(
              label: 'Fullname',
              text: 'Le Ho Hai Duong',
              onEditPressed: () {},
            ),
            const _TextField(
              label: 'Email',
              text: 'duongle@gmail.com',
            ),
            const _TextField(
              label: 'Phone number',
              text: '0123456789',
              keyboardStyle: TextInputType.number,
            ),
            const _TextField(
              label: 'Address',
              maxLines: 5,
              text: '1234, Nova, Gold, Platinum, Bosa, Little Saigon',
            ),
            _TextField(
              label: 'Birthdate',
              text: birthdate,
              onEditPressed: () {
                selectDate(context);
              },
            ),
            _TextField(
              label: 'Gender',
              text: gender!,
              keyboardStyle: TextInputType.text,
              onEditPressed: () {
                selectGender(context);
              },
            ),
            FaButton(
              onPressed: () {},
              width: MediaQuery.of(context).size.width,
              label: 'Save change',
            ),
            FaButton(
              onPressed: () {},
              label: 'Delete account',
              width: MediaQuery.of(context).size.width,
              outlined: true,
            )
          ],
        ),
      ),
    );
  }

  void selectGender(BuildContext context) {
    String? selectedGender = 'Male';

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Gender'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile(
                value: 'Male',
                groupValue: selectedGender,
                title: const Text('Male'),
                onChanged: (String? value) {
                  setDialogState(() => selectedGender = value);
                },
              ),
              RadioListTile(
                value: 'Female',
                groupValue: selectedGender,
                title: const Text('Female'),
                onChanged: (String? value) {
                  setDialogState(() => selectedGender = value);
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'Cancel');
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'OK');
                setState(() => gender = selectedGender);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final seletedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970, 8),
        lastDate: DateTime(2023));

    if (seletedDate != null) {
      setState(() {
        birthdate =
            '${seletedDate.day}/${seletedDate.month}/${seletedDate.year}';
      });
    }
  }
}

class _TextField extends StatelessWidget {
  final String text;
  final String? label;
  final int? maxLines;
  final TextInputType? keyboardStyle;
  final VoidCallback? onEditPressed;

  const _TextField({
    Key? key,
    this.label,
    this.onEditPressed,
    this.maxLines = 1,
    this.keyboardStyle,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Stack(
            alignment: Alignment.centerRight,
            children: [
              TextFormField(
                enabled: false,
                controller: TextEditingController(text: text),
                keyboardType: keyboardStyle,
                maxLines: maxLines,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(13),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
              ),
              TextButton(
                onPressed: onEditPressed,
                child: const Text(
                  'Change',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
