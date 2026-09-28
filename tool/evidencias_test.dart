import 'dart:io';
import 'dart:typed_data';

import 'package:dispositivos_moveis_aula7/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

Future<ByteData> _lerFonte(String caminho) async {
  final bytes = await File(caminho).readAsBytes();
  return ByteData.sublistView(bytes);
}

Future<void> _carregarFontes() async {
  final roboto = FontLoader('Roboto')
    ..addFont(rootBundle.load('assets/fonts/Roboto.ttf'));
  final materialIcons = FontLoader('MaterialIcons')
    ..addFont(_lerFonte('tool/fonts/MaterialIcons-Regular.ttf'));

  await Future.wait([
    roboto.load(),
    materialIcons.load(),
  ]);
}

void main() {
  testWidgets('gera evidências da TelaContador e da TelaResumo', (tester) async {
    await _carregarFontes();
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
