import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:payapp/modules/barcode_scanner/barcode_scanner_page.dart';
import 'package:payapp/shared/widgets/bottom_sheet/bottom_sheet_widget.dart';
import 'package:payapp/shared/widgets/set_label_buttons/set_label_buttons.dart';

main() {
  BarcodeScannerPage controller;

  setUp(() {
    controller = BarcodeScannerPage();
  });

  testWidgets("Barcode Scanner Page - Init, Title, FAB", (tester) async {
    await tester.pumpWidget(MaterialApp(home: BarcodeScannerPage()));

    expect(find.text("Escaneie o código de barras do boleto"), findsOneWidget);
    expect(find.byType(BackButton), findsOneWidget);
  });

  testWidgets("Barcode Scanner Page - Click FAB", (tester) async {
    await tester.pumpWidget(MaterialApp(home: BarcodeScannerPage()));
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle(Duration(seconds: 1));
    expect(find.widgetWithText(SetLabelButtons, "Inserir código do boleto"),
        findsNWidgets(1));
    expect(
        find.widgetWithText(SetLabelButtons, "Ler o número"), findsNWidgets(1));
  });
}
