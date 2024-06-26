import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListPage(),
    );
  }
}

class Contato {
  final String nome;
  final String email;
  bool favorito;

  Contato(this.nome, this.email, this.favorito);
}

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Contato> contatos = [
    Contato('Victor Ventura', 'victor@gmail.com', false),
    Contato('Vanessa', 'vanessa@gmail.com', false),
    Contato('Amanda', 'amanda@gmail.com', false),
    Contato('Matheus', 'Mat@gmail.com', false),
    Contato('Pedro', 'ped@gmail.com', false),
  ];

  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos Favoritos $contador'),
      ),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(contatos[index].nome),
            subtitle: Text(contatos[index].email),
            trailing: IconButton(
              icon: Icon(
                contatos[index].favorito
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: contatos[index].favorito ? Colors.red : null,
              ),
              onPressed: () {
                setState(() {
                  contatos[index].favorito = !contatos[index].favorito;
                  
                  if (contatos[index].favorito) {
                    contador++;
                  } else {
                    contador--;
                  }
                });
              },
            ),
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage('https://i.pravatar.cc/150?img=$index'),
              radius: 30,
            ),
          );
        },
      ),
    );
  }
}
