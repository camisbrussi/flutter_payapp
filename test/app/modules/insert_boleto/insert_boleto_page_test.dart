import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payapp/modules/insert_boleto/insert_boleto_controller.dart';
import 'package:payapp/modules/insert_boleto/insert_boleto_page.dart';
import 'package:payapp/shared/widgets/input_text/input_text_widget.dart';
import 'package:payapp/shared/widgets/set_label_buttons/set_label_buttons.dart';

main() {
  InsertBoletoController controller;
  setUp(() {
    controller = InsertBoletoController();
  });

  group("Insert Boleto Page Test", () {
    testWidgets("Insert Boleto Page - Init, Title, FAB", (tester) async {
      await tester.pumpWidget(MaterialApp(home: InsertBoletoPage()));

      expect(find.text("Preencha os dados do boleto"), findsOneWidget);
      expect(find.byType(SetLabelButtons), findsOneWidget);
      expect(find.text("Cancelar"), findsOneWidget);
      expect(find.text("Cadastrar"), findsOneWidget);
    });

    testWidgets("Insert Boleto Page - Click FAB", (tester) async {
      await tester.pumpWidget(MaterialApp(home: InsertBoletoPage()));
      await tester.pumpAndSettle(Duration(seconds: 1));
      expect(find.byType(InputTextWidget), findsNWidgets(4));
      expect(find.widgetWithText(InputTextWidget, "Nome do boleto"),
          findsNWidgets(1));
      expect(
          find.widgetWithText(InputTextWidget, "Vencimento"), findsNWidgets(1));
      expect(find.widgetWithText(InputTextWidget, "Valor"), findsNWidgets(1));
      expect(find.widgetWithText(InputTextWidget, "Código"), findsNWidgets(1));
    });
  });
}
