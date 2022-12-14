import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:projetodelinguagens/components/user_tile.dart';
import 'package:projetodelinguagens/data/dummy_users.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final users = {...DUMMY_USERS};
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) => UserTile(users.values.elementAt(i)),
        itemCount: users.length,
      ),
    );
  }
}
