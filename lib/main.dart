import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Articulo> _articulos;
  late ArticuloDataSource _articuloDataSource;

  @override
  void initState() {
    _articulos = getArticuloData();
    _articuloDataSource = ArticuloDataSource(_articulos);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SfDataGrid(
        source: _articuloDataSource,
        columns: [
          GridColumn(
              columnName: 'id',
              label: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerRight,
                  child: const Text(
                    'ID',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'stock',
              label: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Stock',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'descripcion',
              label: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Descripción',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'codigo de barras',
              label: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Cod. Barras',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'pvp',
              label: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Pvp',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'imagen',
              label: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Imagen',
                    overflow: TextOverflow.ellipsis,
                  ))),
        ],
      ),
    ));
  }

  List<Articulo> getArticuloData() {
    return [
      Articulo(1, '10', 'Paraguas', 'AD2342F', 'accesorios', 5, 'url_imagen'),
      Articulo(2, '5', 'Teclado', 'AD23Q42F', 'electrónica', 52, 'url_imagen'),
      Articulo(3, '1', 'Pantalla', 'GD2342F', 'electrónica', 134, 'url_imagen')
    ];
  }
}

class ArticuloDataSource extends DataGridSource {
  ArticuloDataSource(List<Articulo> articulos) {
    dataGridRows = articulos
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: dataGridRow.id),
              DataGridCell<String>(
                  columnName: 'stock', value: dataGridRow.stock),
              DataGridCell<String>(
                  columnName: 'descripcion', value: dataGridRow.descripcion),
              DataGridCell<String>(
                  columnName: 'codBarras', value: dataGridRow.codBarras),
              DataGridCell<String>(
                  columnName: 'familia', value: dataGridRow.familia),
              DataGridCell<int>(columnName: 'pvp', value: dataGridRow.pvp),
              DataGridCell<String>(
                  columnName: 'imagen', value: dataGridRow.imagen)
            ]))
        .toList();
  }

  late List<DataGridRow> dataGridRows;
  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        child: Text(dataGridCell.value.toString()),
      );
    }).toList());
  }
}

class Articulo {
  Articulo(this.id, this.stock, this.descripcion, this.codBarras, this.familia,
      this.pvp, this.imagen);
  final int id;
  final String stock;
  final String descripcion;
  final String codBarras;
  final String familia;
  final int pvp;
  final String imagen;
}
