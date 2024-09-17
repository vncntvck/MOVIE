import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Text(
          'MOVIE',
          style: TextStyle(
            fontSize: 25,
            color: Colors.red,
          ),
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer(); 
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: InkWell(
            onTap: () {
              print("Pencarian ditekan");
              // Tambahkan navigasi ke halaman pencarian di sini
            },
            child: const Icon(Icons.search_rounded),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}