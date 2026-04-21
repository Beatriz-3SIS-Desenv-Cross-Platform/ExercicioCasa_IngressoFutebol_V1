
import 'package:flutter/material.dart';
import 'package:ingressos/models/tipo_ingresso.dart';
import 'package:ingressos/models/jogo.dart';

class ResumoScreen extends StatelessWidget {

    final String nomeTorcedor;
    final Jogo jogo;
    final TipoIngresso tipoIngresso;
    final int quantidade;
    final bool torcerCasa;
    final bool estacionamento;
    final bool lanche;
    final bool camisa;
    final bool lounge;

    const ResumoScreen({
      super.key,
      required this.nomeTorcedor,
      required this.jogo,
      required this.tipoIngresso,
      required this.quantidade,
      required this.torcerCasa,
      required this.estacionamento,
      required this.lanche,
      required this.camisa,
      required this.lounge,
    });


    double calcularTotal(){
      double total = tipoIngresso.preco * quantidade;
      if (estacionamento) total += 50;
      if (lanche) total += 20;
      if (camisa) total += 30;
      if (lounge) total += 90;
      return total;
    }

    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingressos para o Jogo'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Resumo da compra',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            

            //Nome e informações
            Text('Nome: $nomeTorcedor'),
            Text('Jogo: ${jogo.nome}'),
            Text('Ingresso: ${tipoIngresso.titulo}'),
            Text('Quantidade: $quantidade'),
            Text('Torcida: ${torcerCasa ? "Casa" : "Visitante"}'),
            Text('Serviços: ${[
              if (estacionamento) 'Estacionamento',
              if (lanche) 'Lanche',
              if (camisa) 'Camisa',
              if (lounge) 'Lounge',
              ].join(', ')}'),
            
            const SizedBox(height: 16),
            //TOTAL
            Text(
              'Total R\$ ${calcularTotal().toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            //Botão Voltar 
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(onPressed: (){
                Navigator.pop(context);
              }, 
              child: const Text('Voltar'),
              ),
            )

          ],
        ),
      ),
    );
  }
}