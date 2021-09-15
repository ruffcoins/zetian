import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:zetian/models/sale/read/get_sale_response.dart';

import 'generate_receipt.dart';

class Preview extends StatefulWidget {
  SalesResult saleDetails;

  Preview({Key? key, required this.saleDetails}) : super(key: key);

  @override
  _PreviewState createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  @override
  void initState() {
    print('help');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
        build: (format) {
          return generateReceipt(widget.saleDetails);
        },
      ),
    );
  }
}
