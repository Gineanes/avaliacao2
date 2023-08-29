import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? _nome, _cpf, _endereco, _numero, _complemento;
  bool _eletrotecnica = false;
  bool _automacao = false;
  bool _ds = false;

  String _opcaoSelecionad = 'Selecione';
List<String> _opcoe = ['Selecione','Recife', 'Jaboatão', 'Olinda'];


  String _opcaoSelecionada = 'Selecione';
  List<String> _opcoes = ['5', '10', '15'];
  String? _selecioneCurso;

  DateTime dataSelecionada = DateTime.now();

  Future<void> _escolherData(BuildContext context) async {
    final picked = await showDatePicker(
    context: context,
    initialDate: dataSelecionada,
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
    );
    if (picked != null && picked != dataSelecionada)
    setState(() {
    dataSelecionada = picked;
    });
    }
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Text("Formulário de Cadastro", style: TextStyle(color: Colors.blue, fontSize: 30, fontWeight: FontWeight.w800),),
                SizedBox(height: 10,),
                
                Expanded(child:
                  TextFormField(
                    onChanged: (value) => _nome = value,
                    decoration: InputDecoration(
                      label: Text("Nome Completo"),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.abc)
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  
                  children:[ SizedBox(width: 200,                        
                      child:TextFormField(
                        onChanged: (value) => _cpf = value,
                        decoration: InputDecoration(
                        label: Text("CPF"),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.person)
                    ),
                  ),
                ),
                  
                SizedBox(width: 10
                ,),               
                Text("${dataSelecionada.toLocal()}".split(' ')[0],),
                ElevatedButton(
                onPressed: () => _escolherData(context),
                child: Text('Escolher data'),                
                ),
                ],
                ),
                
                                              
                CheckboxListTile(
                    title: Text('Eletrotécnica'),
                    value: _eletrotecnica,
                    onChanged: (bool? value) {
                    setState(() {
                    _eletrotecnica = value!;
                    });
                    },
                    ),
                
                    CheckboxListTile(
                    title: Text('Automação'),
                    value: _automacao,
                    onChanged: (bool? value) {
                    setState(() {
                    _automacao = value!;
                    });
                    },
                    ),
                    CheckboxListTile(
                    title: Text('Desenvolvimento de Sistemas'),
                    value: _ds,
                    onChanged: (bool? value) {
                    setState(() {
                    _ds = value!;
                    });
                    },
                    ),

                  Column(
                  children: _opcoes.map((cursos) {
                  return RadioListTile(
                  title: Text(cursos),
                  value: cursos,
                  groupValue: _selecioneCurso,
                  onChanged: (value) {
                  setState(() {
                  _selecioneCurso = value.toString();
                  });
                  },
                  );
                  }).toList(),
                  ),
              
                Expanded(child:
                  TextFormField(
                    onChanged: (value) => _endereco = value,
                    decoration: InputDecoration(
                      label: Text("Endereço"),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.location_on)
                    ),
                  ),
                ),
                SizedBox(height: 15,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  
                  children:[ SizedBox(width: 100,
                 
                  child: TextFormField(
                
                    decoration: InputDecoration(
                      label: Text("Nº"),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.map)
                    ),
                  ),
                  ),
                  
              ],
            ),
                  DropdownButtonFormField<String>(
                      value: _opcaoSelecionad,
                      onChanged: (nova) {
                      setState(() {
                    
                      });
                      },
                      items: _opcoe.map((opcao) {
                      return DropdownMenuItem<String>(
                      value: opcao,
                      child: Text(opcao),
                      );
                      }).toList(),
                      decoration: InputDecoration(
                      labelText: 'Opções',
                      ),
                      ),
                Expanded(
                    child:
                  TextFormField(                  
                    onChanged: (value) => _complemento = value,
                    decoration: InputDecoration(
                      label: Text("Complemento"),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.more)
                      
                    ),
                  ),
                ),
                
                SizedBox(height: 5,),
                
                ElevatedButton.icon(
                      onPressed: (){},
                      label: const Text("Cadastrar"),
                      icon: const Icon(Icons.save),
                  
                    ),
                SizedBox(height: 5,),
              ]
            ),
          ),
        ),
    );
  }
}

