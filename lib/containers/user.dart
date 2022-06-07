import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../constants/globals.dart';

class User extends StatelessWidget {
  const User({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              CachedNetworkImage(
                imageBuilder: (context, imageProvider) => Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                    ),
                  ),
                ),
                imageUrl: 'https://pbs.twimg.com/media/FLLpy5dXsAI8nI9.jpg',
                placeholder: (context, url) => const Icon(Icons.image_outlined),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Le Ho Hai Duong',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  _Role(name: 'User'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Column(
          children: const [
            _SettingTab(
              icon: Icons.person,
              name: 'Account settings',
              routeName: toUserSetting,
            ),
            _SettingTab(
              icon: Icons.person,
              name: 'Help center',
            )
          ],
        )
      ],
    );
  }
}

class _SettingTab extends StatelessWidget {
  const _SettingTab({
    Key? key,
    required this.name,
    required this.icon,
    this.routeName,
  }) : super(key: key);

  final String name;
  final IconData icon;
  final String? routeName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(),
        ),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.black,
        ),
        onPressed: () {
          if (routeName != null) {
            Navigator.pushNamed(context, routeName!);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Icon(
                icon,
                size: 28,
              ),
              const SizedBox(width: 16),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}

class _Role extends StatelessWidget {
  const _Role({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 25,
      child: Container(
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFEFEFEF),
          borderRadius: BorderRadius.circular(8),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
