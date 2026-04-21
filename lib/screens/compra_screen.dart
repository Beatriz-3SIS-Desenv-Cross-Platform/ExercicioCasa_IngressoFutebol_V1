import 'package:flutter/material.dart';
import 'package:ingressos/models/jogo.dart';
import 'package:ingressos/models/tipo_ingresso.dart';
import 'package:ingressos/screens/resumo_screen.dart';

class CompraScreen extends StatefulWidget {
  const CompraScreen({super.key});

  @override
  State<CompraScreen> createState() => _CompraScreenState();
}

class _CompraScreenState extends State<CompraScreen> {
  //Lista de Jogos Disponiveis
  final List<Jogo> jogos = [
    Jogo(nome: 'Palmeiras vs Corinthians', timeCasa: 'Palmeiras', timeVisitante:'Corinthians'),
    Jogo(nome: 'São Paulo vs Santos', timeCasa: 'São Paulo', timeVisitante:'Santos'),
    Jogo(nome: "Flamengo vs Vasco", timeCasa: 'Flamengo', timeVisitante: 'Vasco'),
  ];

  //Variaveis de estado
  Jogo? jogoSelecionado;
  final TextEditingController nomeController = TextEditingController();
  TipoIngresso tipoSelecionado = TipoIngresso.arquibancada;
  bool estacionamento = false;
  bool lanche = false;
  bool camisa = false;
  bool lounge = false;
  bool torcerCasa = false;
  int quantidade = 1;

  @override
  void dispose(){
    nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text ('Ingressos para o Jogo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Jogo'),
            DropdownButtonFormField<Jogo>(
              value: jogoSelecionado,
              hint: const Text('Selecione um jogo'),
              isExpanded: true,
              items: jogos.map((jogo){
                  return DropdownMenuItem(
                    value: jogo,
                    child: Text(jogo.nome),
                  );
              }).toList(),
              onChanged: (value){
                setState(() {
                  jogoSelecionado = value;
                });
              },
            ),
            const SizedBox(height: 16),

            //Campo nome do torcedor
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome do torcedor',
              ),
            ),

            const SizedBox(height: 16,),

            //Radio de tipo do ingresso
            const Text('Tipo do ingresso'),
            ...TipoIngresso.values.map((tipo){
              return RadioListTile<TipoIngresso>(
                value: tipo,
                groupValue: tipoSelecionado,
                title: Text(tipo.titulo),
                onChanged: (value){
                  setState(() {
                    tipoSelecionado = value!;
                  });
                },
                );
            }).toList(),

            const SizedBox(height: 16),

            //CHECKBOX DE SERVIÇOS ADICIONAIS
            const Text ('Serviços adicionais'),
            CheckboxListTile(
              title: const Text('Estacionamento'),
              value: estacionamento,
              onChanged: (value){
                setState(() {
                  estacionamento = value ?? false;
                });
              },
            ),

            CheckboxListTile(
              title: const Text('Lanche Incluso'),
              value: lanche,
              onChanged: (value){
                setState(() {
                  lanche = value ?? false;
                });
              },
            ),

            CheckboxListTile(
              title: const Text('Camisa do Time'),
              value: camisa,
              onChanged: (value){
                setState(() {
                  camisa = value ?? false;
                });
              },
            ),

            CheckboxListTile(
              title: const Text('Acesso ao Lounge'),
              value: lounge,
              onChanged: (value){
                setState(() {
                  lounge = value ?? false;
                });
              },
            ),

            //Switch torcer para o time da casa
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Torcer para o time da casa'),
                Switch(
                  value: torcerCasa,
                  onChanged: (value){
                    setState(() {
                      torcerCasa = value;
                    });
                  }
                )
              ],
            ),
            const SizedBox(height: 16),

            //Slider de quantidade
            Text('Quantidade: $quantidade'),
            Slider(
              value: quantidade.toDouble(),
              min: 1,
              max: 10,
              divisions: 9,
              label: '$quantidade',
              onChanged: (value){
                setState(() {
                  quantidade = value.toInt();
                });
              }
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  if (jogoSelecionado == null || nomeController.text.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Preencha todos os campos!')),
                    );
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) 
                    => ResumoScreen(
                    nomeTorcedor: nomeController.text, 
                    jogo: jogoSelecionado!, 
                    tipoIngresso: tipoSelecionado!, 
                    quantidade: quantidade, 
                    torcerCasa: torcerCasa, 
                    estacionamento: estacionamento, 
                    lanche: lanche, 
                    camisa: camisa, 
                    lounge: lounge,
                    ),
                    ),
                  );

                },
                child: const Text('Comprar ingressos'),
              ),
            ),

          ],
        ),
      ),
    );
  }
  }
