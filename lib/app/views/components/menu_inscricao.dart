import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  final List<MenuItem> menuItem;
  const Menu({super.key, required this.menuItem});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      color: Colors.white,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: widget.menuItem),
    );
  }
}

class MenuItem extends StatefulWidget {
  final bool selecionado;
  final String texto;
  final IconData icon;

  const MenuItem(
      {super.key,
      required this.selecionado,
      required this.texto,
      required this.icon});

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    if (widget.selecionado) {
      return Container(
        height: 30,
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black, width: 1))),
        child: Row(
          children: [
            Icon(
              widget.icon,
              color: Colors.black,
            ),
            Text(widget.texto,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                )),
          ],
        ),
      );
    }
    return Row(
      children: [
        Icon(
          widget.icon,
          color: Colors.black,
        ),
        Text(
          widget.texto,
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
      ],
    );
  }
}
