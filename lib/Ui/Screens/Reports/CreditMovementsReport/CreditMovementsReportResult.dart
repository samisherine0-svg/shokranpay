import 'package:flutter/material.dart';
import 'package:pioneerspay/Model/Response/ReportsResponse/CreditMovementsReportResponse.dart';
import 'package:pioneerspay/Ui/Screens/Reports/CreditMovementsReport/CreditMovementsReport.dart';
import 'package:pioneerspay/Ui/Widgets/Reports/CreditMovementsReportsTile.dart';
import 'package:pioneerspay/Ui/Utils/AppBarCustom.dart';
import 'package:pioneerspay/Utils/Colors/GeneralColor.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import 'CreditMovmentReportDetails.dart';

class CreditMovementsReportResult extends StatefulWidget {
  List<Data> data;

  CreditMovementsReportResult(this.data);

  @override
  _CreditMovementsReportResult createState() =>
      _CreditMovementsReportResult(data);
}

class _CreditMovementsReportResult extends State<CreditMovementsReportResult> {
  List<Data> data;

  _CreditMovementsReportResult(this.data);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double marginTop = mediaQuery.padding.top;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: GeneralColor.wGrey,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, marginTop, 0, 10),
            child: AppBarCustom(
              Translations.of(context)!.transactionsReports,
              () {
                Navigator.pop(context);
              },
            ),
          ),
          Expanded(
              child: data.isEmpty
                  ? SizedBox()
                  : MyHomePage(
                      data: data,
                      userCode: '',
                    ))

          // Expanded(
          //   child: SingleChildScrollView(
          //     physics: const ClampingScrollPhysics(),
          //     child: Container(
          //       margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          //       child: MediaQuery.removePadding(
          //         context: context,
          //         removeTop: true,
          //         child: ListView.builder(
          //           physics: const NeverScrollableScrollPhysics(),
          //           shrinkWrap: true,
          //           reverse: true,
          //           itemCount: data.length,
          //           itemBuilder: (context, index) =>
          //               CreditMovementsReportsTile(data[index],widget.userCode),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Expanded(child: child),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  List<Data> data;
  String userCode;

  MyHomePage({Key? key, required this.data, required this.userCode})
      : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  late EmployeeDataSource _employeeDataSource;

  @override
  void initState() {
    super.initState();
    _employeeDataSource = EmployeeDataSource(
        employees: widget.data, context: context, userCode: widget.userCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              SizedBox(
                  height: constraints.maxHeight - 60,
                  width: constraints.maxWidth,
                  child: SfDataGridTheme(
                    data: SfDataGridThemeData(
                        gridLineColor: Colors.black, gridLineStrokeWidth: 2),
                    child: SfDataGrid(
                        rowHeight: 56,
                        gridLinesVisibility: GridLinesVisibility.both,
                        headerGridLinesVisibility: GridLinesVisibility.both,
                        rowsPerPage: 10,
                        source: _employeeDataSource,
                        columnWidthMode: ColumnWidthMode.fill,
                        columns: getColumns),
                  )),
              SizedBox(
                height: 60,
                width: constraints.maxWidth,
                child: SfDataPager(
                  pageCount: (widget.data.length / 10).ceilToDouble(),
                  delegate: _employeeDataSource,
                  direction: Axis.horizontal,
                ),
              )
            ],
          );
        },
      ),
    );
  }

  List<GridColumn> get getColumns {
    return <GridColumn>[
      GridColumn(
          columnName: 'data',
          width: 180,
          label: Container(
              color: GeneralColor.appColor,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              alignment: Alignment.center,
              child: const Text(
                'البيانات',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ))),
      GridColumn(
          columnName: 'date',
          label: Container(
              color: GeneralColor.appColor,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              alignment: Alignment.center,
              child: const Text(
                'التاريخ',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ))),
      GridColumn(
          columnName: 'value',
          label: Container(
              color: GeneralColor.appColor,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              alignment: Alignment.center,
              child: const Text(
                'القيمة',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ))),
      GridColumn(
          columnName: 'status',
          label: Container(
              color: GeneralColor.appColor,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              alignment: Alignment.center,
              child: const Text(
                'الحالة',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ))),
    ];
  }
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource(
      {required List<Data> employees,
      required BuildContext context,
      required String userCode}) {
    buildDataGridRows(employees, context, userCode);
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  void buildDataGridRows(List<Data> employees, context, userCode) {
    _employeeData = employees
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell(
                  columnName: 'data',
                  value: InkWell(
                    onTap: () {
                      _getDetails(
                          e.transactionId, context, e.netAfter, e.netBefore, e);
                    },
                    child: Column(
                      children: [
                        e.printServiceDetailes!.isEmpty
                            ? Text("-")
                            : e.transactionStatus == "مرفوضه" ||
                                    e.transactionStatus == "مسترجعه" ||
                                    e.printServiceDetailes![0].value!
                                        .contains("عملية استرجاع رصيد")
                                ? Text("${e.printServiceDetailes![0].value}",
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.red))
                                : Row(
                                    children: [
                                      Expanded(
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            e.printServiceDetailes![0].value ??
                                                "-",
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                        e.printServiceDetailes!.isEmpty
                            ? SizedBox()
                            : e.transactionStatus == "مرفوضه" ||
                                    e.transactionStatus == "مسترجعه" ||
                                    e.printServiceDetailes![0].value!
                                        .contains("عملية استرجاع رصيد")
                                ? Text(
                                    "${e.printServiceDetailes!.length == 1 ? e.printServiceDetailes![0].value : e.printServiceDetailes![2].value}",
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.red))
                                : e.transactionStatus == "معلقه"
                                    ? Text(
                                        "${e.printServiceDetailes!.length == 1 ? e.printServiceDetailes![0].value : e.printServiceDetailes![2].value}",
                                      )
                                    : e.printServiceDetailes!.isEmpty ||
                                            e.printServiceDetailes![0].value ==
                                                "عملية تحويل رصيد" ||
                                            e.printServiceDetailes![0].value ==
                                                "عملية ايداع رصيد" ||
                                            e.printServiceDetailes![0].value ==
                                                "عملية تخفيض رصيد"
                                        ? SizedBox()
                                        : Row(
                                            children: [
                                              Expanded(
                                                child: FittedBox(
                                                  fit: BoxFit.scaleDown,
                                                  child: Text(
                                                      "${e.printServiceDetailes!.length == 1 ? "-" : e.printServiceDetailes![2].value}"),
                                                ),
                                              ),
                                            ],
                                          ),
                      ],
                    ),
                  )),
              DataGridCell(
                  columnName: 'date',
                  value: InkWell(
                    onTap: () {
                      _getDetails(
                          e.transactionId, context, e.netAfter, e.netBefore, e);
                    },
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FittedBox(
                            fit: BoxFit.scaleDown, child: Text(e.date ?? "-")),
                        FittedBox(
                            fit: BoxFit.scaleDown, child: Text(e.time ?? "-")),
                      ],
                    )),
                  )),
              DataGridCell(
                  columnName: 'value',
                  value: InkWell(
                    onTap: () {
                      _getDetails(
                          e.transactionId, context, e.netAfter, e.netBefore, e);
                    },
                    child: Column(
                      children: [
                        Center(
                            child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                    "${(e.amountInServiceProvider! + e.serviceCost!).toStringAsFixed(2)}"))),
                        SizedBox(
                          height: 3,
                        ),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5, top: 3, bottom: 3),
                              child: Text(
                                "${e.commission}",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              DataGridCell(
                  columnName: 'status',
                  value: InkWell(
                    onTap: () {
                      _getDetails(
                          e.transactionId, context, e.netAfter, e.netBefore, e);
                    },
                    child: Image.asset(
                      e.printServiceDetailes!.isEmpty
                          ? "assets/images/correct.png"
                          : e.transactionStatus == "مرفوضه" ||
                                  e.transactionStatus == "مسترجعه" ||
                                  e.printServiceDetailes![0].value!
                                      .contains("عملية استرجاع رصيد")
                              ? "assets/images/wrong.png"
                              : e.transactionStatus == "معلقه" ||
                                      e.transactionStatus == "قيدالفحص"
                                  ? "assets/images/wait.png"
                                  : "assets/images/correct.png",
                      width: 30,
                      height: 30,
                    ),
                  )),
            ]))
        .toList();
  }

  _getDetails(transactionId, context, netAfter, netBefore, Data data) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CreditMovementsReportDetails(
                data, netAfter.toString(), netBefore.toString())));
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: e.value,
      );
    }).toList());
  }
}
