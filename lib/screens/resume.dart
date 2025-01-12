import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:Portfolio/components/CustomAppBar.dart';
import 'package:Portfolio/globals.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';
import 'dart:html' as html;


class ResumeSection extends StatelessWidget {
  const ResumeSection({Key? key}) : super(key: key);

  Future<void> _downloadPDF(BuildContext context) async {
    if (kIsWeb) {
      // Web download
      final anchor = html.AnchorElement(
          href: "assets/images/LucasSantana.b31ae6e47c416108289d.pdf")
        ..setAttribute("download", "LucasSantana.pdf")
        ..click();
    } else {
      // Mobile download (you may need to implement a proper file saving mechanism)
      final data = await rootBundle
          .load("assets/images/LucasSantana.b31ae6e47c416108289d.pdf");
      final bytes = data.buffer.asUint8List();
      // Implement file saving for mobile here
    }

  }

  @override
  Widget build(BuildContext context) {
    final appBarHeight = AppBar().preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final availableHeight = MediaQuery.of(context).size.height - appBarHeight - statusBarHeight;

    return Scaffold(
      appBar: CustomAppBar("", context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.width * 0.1,
                horizontal:  isMobile? MediaQuery.of(context).size.width *.1  :  MediaQuery.of(context).size.width * 0.2,
              ),
              child: Container(
                height: isMobile? MediaQuery.of(context).size.width *1.5  : availableHeight + MediaQuery.of(context).size.width * 0.4, // Adjusted to leave space for the button
                child: SfPdfViewer.asset(
                  "assets/images/LucasSantana.b31ae6e47c416108289d.pdf",
                  enableDoubleTapZooming: true,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _downloadPDF(context),
              child: Text('Download PDF'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}