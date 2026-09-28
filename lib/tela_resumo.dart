import 'package:flutter/material.dart';

class TelaResumo extends StatelessWidget {
  final String item;
  final int quantidade;
  final double valorTotal;

  const TelaResumo({
    super.key,
    required this.item,
    required this.quantidade,
    required this.valorTotal,
  });

  String _formatarMoeda(double valor) {
    return 'R\$ ${valor.toStringAsFixed(2).replaceAll('.', ',')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumo do Pedido'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline,
                size: 80,
                color: Colors.green,
              ),
              const SizedBox(height: 16),
              Text(
                'Item: $item',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Quantidade Selecionada: $quantidade',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              Text(
                'Valor Total: ${_formatarMoeda(valorTotal)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {
                  // Retorna a confirmação para a TelaContador.
                  Navigator.pop(context, true);
                },
                icon: const Icon(Icons.check),
                label: const Text('Confirmar Pedido'),
              ),
              const SizedBox(height: 12),
              TextButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Voltar e Alterar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
