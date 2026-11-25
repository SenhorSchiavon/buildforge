# ⚒️ BuildForge

> Crie seu personagem de D&D 5e, leve a ficha pra mesa e acompanhe sua evolução ao longo da campanha.

O **BuildForge** é um app mobile em desenvolvimento para gerenciar fichas de D&D 5e. A proposta é acompanhar o personagem em três momentos: na criação, durante a sessão e entre uma aventura e outra.

## 🐉 Da criação à campanha

- **Antes da primeira sessão** — escolha a classe, a espécie e o antecedente do personagem, distribua os atributos e monte a ficha inicial.
- **Durante o jogo** — consulte perícias e modificadores, acompanhe pontos de vida e registre o uso de recursos como espaços de magia.
- **Entre sessões** — atualize o nível, organize o inventário e revise o equipamento e as magias do personagem.

## 🔨 Como estou construindo

Estou usando **Flutter** para criar a interface mobile, com telas voltadas tanto à criação guiada quanto à consulta rápida durante uma sessão.

As regras da ficha ficam em **Dart**. A ideia é centralizar cálculos como modificadores de atributo e bônus de proficiência para que diferentes telas usem a mesma regra.

Uso **Clean Architecture** como guia para separar as regras de D&D, o acesso às fichas salvas e a interface. Conforme os fluxos crescem, **BLoC** entra para gerenciar estados como carregamento da lista, edição da ficha e salvamento das alterações.

Os **testes automatizados** acompanham essa evolução. Testes unitários vão cobrir as regras e os cálculos da ficha, enquanto testes de widget verificam o comportamento das telas, como exibir as fichas depois do carregamento.

## 🧭 Em desenvolvimento

A base do app já tem a tela **Meus Heróis**, com personagens de exemplo, carregamento simulado e teste de widget. As próximas entregas levam essa lista até uma ficha completa, editável e pronta para consultar durante a campanha.