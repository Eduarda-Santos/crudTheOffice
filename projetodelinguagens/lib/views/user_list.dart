import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:projetodelinguagens/components/user_tile.dart';
import 'package:projetodelinguagens/routes/app_routes.dart';
import 'package:provider/provider.dart';

import '../provider/users.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
        itemCount: users.count,
      ),
    );
  }
}
