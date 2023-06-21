import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: SfDataGrid(
              allowFiltering: true,
              source: _articuloDataSource,
              columnWidthMode: ColumnWidthMode.fitByColumnName,
              columnWidthCalculationRange: ColumnWidthCalculationRange.allRows,
              columns: [
                GridColumn(
                  columnName: 'id',
                  allowFiltering: false,
                  label: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'ID',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                GridColumn(
                  columnName: 'stock',
                  label: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    alignment: Alignment.center,
                    child: const Text(
                      'Stock',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                GridColumn(
                  columnName: 'descripcion',
                  label: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    alignment: Alignment.center,
                    child: const Text(
                      'Descripción',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                GridColumn(
                  columnName: 'codBarras',
                  label: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    alignment: Alignment.center,
                    child: const Text(
                      'Cod. Barras',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                GridColumn(
                  columnName: 'familia',
                  label: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    alignment: Alignment.center,
                    child: const Text(
                      'Familia',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                GridColumn(
                  columnName: 'pvp',
                  label: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    alignment: Alignment.center,
                    child: const Text(
                      'Pvp',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                GridColumn(
                  columnName: 'imagen',
                  allowFiltering: false,
                  label: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    alignment: Alignment.center,
                    child: const Text(
                      'Imagen',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
          MaterialButton(
            child: Text('Add Filter'),
            onPressed: () {
              _articuloDataSource.addFilter(
                'pvp',
                FilterCondition(
                  type: FilterType.lessThan,
                  value: 100,
                ),
              );
            },
          ),
          MaterialButton(
            child: Text('Clear Filters'),
            onPressed: () {
              _articuloDataSource.clearFilters();
            },
          ),
        ],
      ),
    );
  }
}

List<Articulo> getArticuloData() {
  return [
    Articulo(1, 10, 'Paraguas', 'AD2342F', 'accesorios', 5, 'url_imagen'),
    Articulo(2, 5, 'Teclado', 'AD23Q42F', 'electrónica', 52, 'url_imagen'),
    Articulo(3, 1, 'Pantalla', 'GD2342F', 'electrónica', 134, 'url_imagen')
  ];
}

class ArticuloDataSource extends DataGridSource {
  ArticuloDataSource(List<Articulo> articulos) {
    dataGridRows = articulos
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: dataGridRow.id),
              DataGridCell<int>(columnName: 'stock', value: dataGridRow.stock),
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
      return Text(dataGridCell.value.toString());
    }).toList());
  }
}

class Articulo {
  Articulo(this.id, this.stock, this.descripcion, this.codBarras, this.familia,
      this.pvp, this.imagen);
  final int id;
  final int stock;
  final String descripcion;
  final String codBarras;
  final String familia;
  final int pvp;
  final String imagen;
}
