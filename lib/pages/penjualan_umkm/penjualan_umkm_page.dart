import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:goumkm/utils/fetch_penjualan_umkm.dart';
import 'package:goumkm/models/penjualan_model.dart';
import 'package:goumkm/pages/penjualan_umkm/penjualan_umkm_form.dart';

class InsertDataTable extends StatelessWidget {
  const InsertDataTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text("GoUMKM - Laporan Penjualan UMKM",
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
      body: ListView(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: FutureBuilder(
                future: fetchPenjualan(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Container(
                      padding: const EdgeInsets.all(5),
                      child: DataClass(
                          datalist: snapshot.data as List<SellingModel>),
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButton: const PenjualanUMKMForm(),
    );
  }
}

class DataClass extends StatelessWidget {
  const DataClass({Key? key, required this.datalist}) : super(key: key);
  final List<SellingModel> datalist;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FittedBox(
          child: DataTable(
            border: TableBorder.all(width: 1.0),
            columns: const [
              DataColumn(label: Text("Nama UMKM")),
              DataColumn(label: Text("Tanggal")),
              DataColumn(label: Text("Jumlah Terjual")),
              DataColumn(label: Text("Revenue")),
            ],
            rows: datalist
                .map(
                    //maping each rows with datalist data
                    (data) => DataRow(cells: [
                          DataCell(
                            Text(
                              data.fields.toString(),
                              // style: const TextStyle(
                              //     fontSize: 25, fontWeight: FontWeight.w500)
                            ),
                          ),
                          DataCell(
                            Text(
                              data.fields.toString(),
                              // style: const TextStyle(
                              //     fontSize: 26, fontWeight: FontWeight.w500)
                            ),
                          ),
                          DataCell(
                            Text(
                              data.fields.toString(),
                              // style: const TextStyle(
                              //     fontSize: 26, fontWeight: FontWeight.w500)
                            ),
                          ),
                          DataCell(
                            Text(
                              data.fields.toString(),
                              // style: const TextStyle(
                              //     fontSize: 26, fontWeight: FontWeight.w500)
                            ),
                          ),
                        ]))
                .toList(), // converting at last into list.
          ),
        ));
  }
}
