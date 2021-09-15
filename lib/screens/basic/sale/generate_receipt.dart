import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:zetian/models/sale/read/get_sale_response.dart';

Future<Uint8List> generateReceipt(SalesResult saleDetails) async {
  final pdf = Document(version: PdfVersion.pdf_1_5, compress: true);
  final formatCurrency = new NumberFormat("#,##0.00", "en_US");
  // final ImageProvider kippaLogo = await imageFromAssetBundle(
  //   'assets/images/raster/kippa_receipt_logo.png',
  // );
  // final font = await rootBundle.load("assets/fonts/PDF/OpenSans-Regular.ttf");
  // final ttf = Font.ttf(font);
  var img;
  var signatureImg;
  List<TableRow> tableListRows = getSaleTableRows(saleDetails);

  num totalMoneyIn = 0;
  num totalMoneyOut = 0;

  pdf.addPage(MultiPage(
      pageFormat: PdfPageFormat.a4,
      footer: (Context context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Image(
            //   kippaLogo,
            //   width: 65,
            //   height: 70,
            // ),
            Center(
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text(
                  'ZETIAN CAR WASH',
                  style: TextStyle(
                    color: PdfColors.grey600,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    // font: ttf,
                  ),
                ),
                Text(
                  'The best car wash for your car',
                  style: TextStyle(
                    color: PdfColors.grey600,
                    fontSize: 12,
                    // font: ttf,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ]),
            ),
          ],
        );
      },
      build: (Context context) {
        return [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (img != null)
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: PdfColors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Image(
                      img,
                      width: 65,
                      height: 75,
                    ),
                  ),
              ],
            ),
            SizedBox(height: 20),
            Text(saleDetails.sale.id,
                style: TextStyle(
                    // font: ttf,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(
                saleDetails.customer.firstName +
                    ' ' +
                    saleDetails.customer.lastName, //'Customer Name',
                style: TextStyle(
                    // font: ttf,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(saleDetails.car.carRegNo,
                style: TextStyle(
                    // font: ttf,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(saleDetails.customer.phoneNumber,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold
                    // font: ttf,
                    )),
            SizedBox(height: 4),
            Text(saleDetails.sale.date.toString(),
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold
                    // font: ttf,
                    )),
            SizedBox(height: 20),

            Divider(
              height: 20,
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ),

            SizedBox(height: 20),

            /// Second part
            Column(children: [
              Center(
                child: Table(
                  children: tableListRows,
                ),
              ),
            ]),
            Divider(
              height: 20,
              thickness: 2,
              indent: 10,
              endIndent: 10,
            ),
            SizedBox(height: 20),
            Container(
                color: PdfColor.fromHex('FAFAFC'),
                padding: EdgeInsets.only(
                  left: 12,
                  top: 12,
                ),
                child: Row(children: [
                  SizedBox(width: 8),
                  Container(
                      width: 150,
                      height: 50,
                      child: Text('',
                          style: TextStyle(
                              // font: ttf,
                              fontSize: 18))),
                  Container(
                      width: 180,
                      height: 50,
                      child: Text('TOTAL',
                          style: TextStyle(
                              // font: ttf,
                              fontSize: 22,
                              fontWeight: FontWeight.bold))),
                  Container(
                    // width: 10,
                    height: 50,
                  ),
                  Container(
                      width: 150,
                      height: 50,
                      child: Text(saleDetails.sale.totalAmount.toString(),
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold
                              // font: ttf,
                              ))),
                ])),
            SizedBox(height: 8),
          ])
        ];
      }));

  return pdf.save();
}

List<TableRow> getSaleTableRows(saleDetails) {
  List<TableRow> tempList = [];

  var row = TableRow(children: [
    Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Text(
        "S/N",
        textScaleFactor: 2.5,
      ),
    ),
    Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Text("Service", textScaleFactor: 2.5),
    ),
    Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Text("Amount", textScaleFactor: 2.5),
    ),
  ]);
  tempList.add(row);

  for (int i = 0; i < saleDetails.service.length; i++) {
    row = TableRow(children: [
      Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Text(
          (i + 1).toString(),
          textScaleFactor: 2,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Text(saleDetails.service[i].name, textScaleFactor: 2),
      ),
      Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child:
            Text(saleDetails.service[i].amount.toString(), textScaleFactor: 2),
      ),
    ]);

    tempList.add(row);
  }

  return tempList;
}
