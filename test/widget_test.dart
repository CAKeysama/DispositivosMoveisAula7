import 'package:dispositivos_moveis_aula7/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('altera e redefine a quantidade na TelaContador', (tester) async {
    await tester.pumpWidget(const MeuApp());

    expect(find.text('1'), findsOneWidget);

    // O contador não deve aceitar quantidade inferior a um.
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('3'), findsOneWidget);

    await tester.tap(find.text('Zerar Contador'));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('envia produto, quantidade e total para a TelaResumo', (
    tester,
  ) async {
    await tester.pumpWidget(const MeuApp());

    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    await tester.tap(find.text('Avançar para Resumo'));
    await tester.pumpAndSettle();

    expect(find.text('Resumo do Pedido'), findsOneWidget);
    expect(find.text('Item: Smartphone Galaxy S24'), findsOneWidget);
    expect(find.text('Quantidade Selecionada: 3'), findsOneWidget);
    expect(find.text(r'Valor Total: R$ 450,00'), findsOneWidget);

    await tester.tap(find.text('Voltar e Alterar'));
    await tester.pumpAndSettle();

    expect(find.text('Seleção de Itens'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
  });

  testWidgets('exibe confirmação ao concluir o pedido', (tester) async {
    await tester.pumpWidget(const MeuApp());

    await tester.tap(find.text('Avançar para Resumo'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Confirmar Pedido'));
    await tester.pumpAndSettle();

    expect(find.text('Seleção de Itens'), findsOneWidget);
    expect(find.text('Pedido Confirmado com Sucesso!'), findsOneWidget);
  });
}
