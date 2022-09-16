// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
/*
 * Criar uma função que recebe o salário por hora e as horas trabalhadas e devolve o valor
 * calculado normal e com horas extras, caso o funcionário tenha feito.
 * 
 * */

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculo Salarial'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _salarioHora = TextEditingController();
  final TextEditingController _horasTrabalhadas = TextEditingController();

  String? valor;

  String calculaSalario(double salarioHora, double horasTrabalhadas) {
    //Salário normal para 4 semanas (40horas/semana)

    var meuSalario = salarioHora * 160;

    if (horasTrabalhadas == 160) {
      return (meuSalario).toString();
    }else if (horasTrabalhadas < 160) {
      return (horasTrabalhadas * salarioHora).toString();
    } else {
      var horasExtras = (horasTrabalhadas - 160) * 1.5;

      var valorTotal = (horasExtras * salarioHora) + meuSalario;

      return valorTotal.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Digite o salário por hora',
              ),
              TextFormField(
                controller: _salarioHora,
              ),
              const Text(
                'Horas Trabalhadas',
              ),
              TextFormField(
                controller: _horasTrabalhadas,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    valor = calculaSalario(double.parse(_salarioHora.text),
                        double.parse(_horasTrabalhadas.text));
                  });
                },
                child: const Text('Calcular'),
              ),
              Text(
                valor ?? 'Resultado',
              ),
            ],
          ),
        ));
  }
}
