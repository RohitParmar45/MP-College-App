import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:pdfx/pdfx.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({super.key});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  //for zoom in out
  // late PdfControllerPinch pdfControllerPinch;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   pdfControllerPinch = PdfControllerPinch(
  //       document: PdfDocument.openAsset(
  //           'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf'));
  // }

  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();

  //   setState(() {
  //     pdfControllerPinch = PdfControllerPinch(
  //         document: PdfDocument.openAsset(
  //             'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf'));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfPdfViewer.network(
        'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
        canShowPaginationDialog: true,
        pageSpacing: 2.0,
      ),
      // body: ,
    );
  }

  // Widget buildUi() {
  //   return Column(
  //     children: [_pdfView()],
  //   );
  // }

  // Widget _pdfView() {
  //   return Expanded(
  //     child: PdfViewPinch(
  //       scrollDirection: Axis.vertical,
  //       controller: pdfControllerPinch,
  //     ),
  //   );
  // }
}
