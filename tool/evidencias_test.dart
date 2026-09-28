import 'package:dispositivos_moveis_aula7/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('gera evidências da TelaContador e da TelaResumo', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    const evidenciaKey = Key('evidencia-visual');

    await tester.pumpWidget(
      const RepaintBoundary(
        key: evidenciaKey,
        child: MeuApp(),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    await expectLater(
      find.byKey(evidenciaKey),
      matchesGoldenFile('../docs/evidencias/tela_contador.png'),
    );

    await tester.tap(find.text('Avançar para Resumo'));
    await tester.pumpAndSettle();

    await expectLater(
      find.byKey(evidenciaKey),
      matchesGoldenFile('../docs/evidencias/tela_resumo.png'),
    );
  });
}
