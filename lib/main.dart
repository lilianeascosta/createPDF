import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'mobile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Create PDF'),
          onPressed: _createPDF,
        ),
      ),
    );
  }

  Future<void> _createPDF() async {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();

    page.graphics.drawString('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum vel nunc eu nunc tempor venenatis eu in magna. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus egestas, mi non varius fringilla, nunc risus porta velit, at porttitor magna sem vitae tortor. Nunc at ex sed lorem iaculis interdum. Vestibulum ac ante maximus, iaculis libero non, feugiat erat. Nunc suscipit nisl et nulla accumsan, vitae aliquet ipsum molestie. Nulla facilisi. Etiam nibh elit, dictum ac nisl sed, viverra mattis est. Nullam sollicitudin, nisl eget tempus pharetra, quam enim egestas ipsum, ac sagittis nibh erat at eros. Mauris nec sollicitudin urna. Cras sed faucibus odio. Morbi porta tincidunt tortor vitae tincidunt. Interdum et malesuada fames ac ante ipsum primis in faucibus. Phasellus laoreet non mauris ut luctus. Vivamus ac imperdiet nunc. Curabitur non varius magna. Ut mi velit, tempus quis diam volutpat, imperdiet sodales arcu. Nunc mauris est, scelerisque quis maximus ac, mollis vel erat. Duis in fermentum dui. Integer aliquam aliquet sem, at euismod purus fermentum a. Maecenas eget justo nec nisi efficitur congue. Sed non massa consectetur, venenatis elit non, tristique lacus. Maecenas interdum nec enim sed elementum. Praesent nec dictum augue, ut ornare est. Nam metus purus, feugiat sed purus eu, sollicitudin mattis risus. Phasellus eu erat iaculis, tincidunt ipsum id, maximus risus. Phasellus ac imperdiet nulla. Quisque pellentesque, nunc ut maximus ultrices, elit est accumsan quam, id congue nisi augue et lectus. Sed ullamcorper ante ac condimentum malesuada. Vestibulum euismod justo sit amet varius varius. Nulla dapibus lectus vel lectus porttitor, a venenatis ex vestibulum. Duis sed nulla nec magna ultrices tristique id sit amet nulla. Fusce et est venenatis libero dapibus sagittis. Curabitur id augue vel dolor condimentum maximus eget eu tellus. Donec ultrices eu dolor quis vehicula. Curabitur molestie justo vitae elit commodo fringilla. Etiam aliquet leo vel accumsan semper. Aliquam scelerisque tellus varius, finibus turpis elementum, dapibus tellus. Fusce vehicula est a turpis varius fermentum. Curabitur ipsum risus, placerat sed imperdiet ac, tempor quis nisi. Sed eget dapibus sapien. Fusce nec tellus tristique, commodo ante et, lacinia est. Nullam id tellus tempus, tincidunt mauris vitae, maximus nulla. Pellentesque ac ornare urna, non varius magna. Vivamus nec iaculis lectus, sit amet volutpat orci. Pellentesque ullamcorper tellus eros, at bibendum magna dapibus eu. Nullam interdum, nisl ut volutpat sodales, tellus nunc ultricies lacus, at ultrices ex libero sit amet risus. Donec lobortis elit quis velit condimentum posuere. Duis at egestas augue, iaculis rhoncus tellus. Nam non porttitor purus. Vestibulum imperdiet erat erat, in elementum arcu volutpat non. Suspendisse non imperdiet massa. Vestibulum ut velit at magna tempor fermentum id vitae urna. Fusce vitae sagittis ligula. Etiam ultricies velit at lectus finibus lobortis. Curabitur a aliquet tortor.Nam at neque orci. Etiam molestie lacus ac placerat pellentesque. Duis viverra efficitur lacus, nec interdum lectus condimentum nec. Morbi vel nibh aliquet, laoreet nisi vitae, suscipit libero. Suspendisse pellentesque efficitur arcu, eu dignissim elit eleifend ut. Nullam pretium felis ut quam malesuada sollicitudin. Maecenas sem ipsum, rhoncus et laoreet ut, venenatis ut felis. Donec at cursus velit. Vestibulum non metus nibh. Suspendisse sodales sagittis nunc sed gravida. Nam vitae nisl lacinia, lobortis dui id, imperdiet turpis.',
        PdfStandardFont(PdfFontFamily.helvetica, 30));

    List<int> bytes = await document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'Output.pdf');
  }
}
