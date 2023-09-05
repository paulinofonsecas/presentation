// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:presentation/app/models/programador.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
    required this.item,
    required this.onTrailingTap,
    this.onTap,
  }) : super(key: key);

  final Programador item;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onTrailingTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Text(
        item.id.toString(),
        style: TextStyle(
          fontSize: 32,
        ),
      ),
      trailing: IconButton(
        onPressed: onTrailingTap,
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
      title: Text(
        item.nome,
        style: TextStyle(
          fontSize: 42,
        ),
      ),
      subtitle: Text(
        item.especialidade,
        style: TextStyle(
          fontSize: 32,
        ),
      ),
    );
  }
}
