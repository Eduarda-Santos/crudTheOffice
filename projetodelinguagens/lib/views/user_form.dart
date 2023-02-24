import 'package:flutter/material.dart';
import 'package:projetodelinguagens/provider/users.dart';
import 'package:projetodelinguagens/models/user.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(User user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User;

    _loadFormData(user);

    return Scaffold(
      appBar: AppBar(title: Text('Formulário do Usuário'), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.save),
          onPressed: () {
            final isValid = _form.currentState!.validate();

            if (isValid) {
              _form.currentState?.save();
              //nao sera notificado
              Provider.of<Users>(context, listen: false).put(
                User(
                  id: _formData['id']!,
                  // id: _formData['id'],
                  name: _formData['name'] ?? 'teste',
                  email: _formData['email'] ?? 'teste',
                  avatarUrl: _formData['avatarUrl'] ?? 'teste',
                ),
              );
              Navigator.of(context).pop();
            }
          },
        ),
      ]),
      body: Padding(
          padding: EdgeInsets.all(15),
          child: Form(
            key: _form,
            child: Column(children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nome Inválido';
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: InputDecoration(labelText: 'E-mail'),
                onSaved: (value) => _formData['email'] = value!,
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: InputDecoration(labelText: 'URL do Avatar'),
                onSaved: (value) => _formData['avatarUrl'] = value!,
              ),
            ]),
          )),
    );
  }
}
