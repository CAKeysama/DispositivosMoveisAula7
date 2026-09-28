# Evidências da atividade

As imagens desta pasta são geradas a partir da interface Flutter real pelo teste `tool/evidencias_test.dart`, no tamanho de tela 390 × 844 pixels.

## TelaContador

1. Abra o aplicativo; a quantidade inicial será `1`.
2. Toque duas vezes no botão `+`.
3. Confirme que a quantidade exibida mudou para `3`.
4. Capture a tela contendo o produto, a quantidade `3`, os controles `-` e `+`, o botão **Zerar Contador** e o botão **Avançar para Resumo**.

A evidência automatizada correspondente é `tela_contador.png`.

## TelaResumo

1. Com a quantidade em `3`, toque em **Avançar para Resumo**.
2. Confirme os seguintes dados:
   - `Item: Smartphone Galaxy S24`;
   - `Quantidade Selecionada: 3`;
   - `Valor Total: R$ 450,00`.
3. Capture a tela com os dados e os botões **Confirmar Pedido** e **Voltar e Alterar**.

A evidência automatizada correspondente é `tela_resumo.png`.

> Se as imagens PNG ainda não estiverem nesta pasta, elas estarão disponíveis no artefato `evidencias-telas` da execução mais recente do workflow **Flutter CI** no GitHub Actions.
