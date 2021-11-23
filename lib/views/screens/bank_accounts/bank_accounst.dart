import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tidens_coin/views/components/home_screen_drawer.dart';
import '../../../core/core_shelf.dart';

class BankAccounts extends StatefulWidget {
  const BankAccounts({Key? key}) : super(key: key);

  @override
  _BankAccountsState createState() => _BankAccountsState();
}

class _BankAccountsState extends State<BankAccounts> {
  bool visible = false;
  bool triedExit = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await Utils.instance.setOrientation(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return getScaffold();
  }

  Widget getScaffold() {
    return Scaffold(
      backgroundColor: Color(0xF9FAFB),
      appBar: appbar(),
      drawer: HomeScreenDrawer(),
      body: scrollContent(),
    );
  }

  AppBar appbar() {
    return AppBar(
      iconTheme: IconThemeData(color: context.secondaryDarkBlue),
      backgroundColor: context.accentColor,
      centerTitle: true,
      title: Text("stake".translate.toUpperCase(), style: context.headline6),
      actions: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Icon(
            Icons.notifications_active_outlined,
          ),
        ),
      ],
    );
  }

  Widget scrollContent() {
    return SingleChildScrollView(
      physics: context.viewBottomPad > 0
          ? const NeverScrollableScrollPhysics()
          : const BouncingScrollPhysics(),
      child: getColumn(),
    );
  }

  Widget getColumn() {
    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            sized(),
            body(),
            divider(),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: context.width, horizontal: context.width * 3),
              child: Row(
                children: [
                  customText(
                      'stake_history'.translate,
                      context.headline6
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 20)),
                ],
              ),
            ),
            Column(
              children: stakeHistory.map((e) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: context.width),
                  child: Container(
                    width: context.width * 95,
                    decoration: BoxDecoration(
                        borderRadius: context.lowCircular,
                        color: context.accentColor,
                        boxShadow: [
                          BoxShadow(
                            color: context.highlightColor,
                            blurRadius: 5,
                            spreadRadius: 0.01,
                          )
                        ]),
                    child: Padding(
                      padding: context.lowEdgeInsets,
                      child: Column(children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Colors.lime.shade200,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(1.0),
                                child: AutoSizeText('${e['id']}'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5.0),
                              child: AutoSizeText('${e['coin']}',
                                  style: context.headline6.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                AutoSizeText('total'.translate + ": ",
                                    style: context.headline6.copyWith(
                                      fontWeight: FontWeight.bold,
                                    )),
                                AutoSizeText('${e['toplam']}',
                                    style: context.headline6),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AutoSizeText('total'.translate + ": ",
                                style: context.headline6.copyWith(
                                  fontWeight: FontWeight.bold,
                                )),
                            AutoSizeText('${e['toplam']}',
                                style: context.headline6),
                            Spacer(),
                            AutoSizeText('start' + ": ",
                                style: context.headline6.copyWith(
                                  fontWeight: FontWeight.bold,
                                )),
                            AutoSizeText('${e['baslangıc']}',
                                style: context.headline6),
                            Spacer(),
                            AutoSizeText('end' + ": ",
                                style: context.headline6.copyWith(
                                  fontWeight: FontWeight.bold,
                                )),
                            AutoSizeText('${e['bitis']}',
                                style: context.headline6),
                          ],
                        ),
                      ]),
                    ),
                  ),
                );
              }).toList(),
            ),
            sized(),
          ],
        ),
      ),
    );
  }

  List<Map<String, dynamic>> stakeHistory = [
    {
      "id": "132",
      "coin": "AKRO",
      "birim_fiyat": "0.059",
      "toplam": "1.58462",
      "baslangıc": "01.01.2021",
      "bitis": "01.01.2022"
    },
    {
      "id": "132",
      "coin": "AKRO",
      "birim_fiyat": "0.059",
      "toplam": "1.58462",
      "baslangıc": "01.01.2021",
      "bitis": "01.01.2022"
    },
    {
      "id": "132",
      "coin": "AKRO",
      "birim_fiyat": "0.059",
      "toplam": "1.58462",
      "baslangıc": "01.01.2021",
      "bitis": "01.01.2022"
    },
    {
      "id": "132",
      "coin": "AKRO",
      "birim_fiyat": "0.059",
      "toplam": "1.58462",
      "baslangıc": "01.01.2021",
      "bitis": "01.01.2022"
    },
    {
      "id": "132",
      "coin": "AKRO",
      "birim_fiyat": "0.059",
      "toplam": "1.58462",
      "baslangıc": "01.01.2021",
      "bitis": "01.01.2022"
    },
    {
      "id": "132",
      "coin": "AKRO",
      "birim_fiyat": "0.059",
      "toplam": "1.58462",
      "baslangıc": "01.01.2021",
      "bitis": "01.01.2022"
    },
    {
      "id": "132",
      "coin": "AKRO",
      "birim_fiyat": "0.059",
      "toplam": "1.58462",
      "baslangıc": "01.01.2021",
      "bitis": "01.01.2022"
    },
    {
      "id": "132",
      "coin": "AKRO",
      "birim_fiyat": "0.059",
      "toplam": "1.58462",
      "baslangıc": "01.01.2021",
      "bitis": "01.01.2022"
    },
  ];

  Widget body() {
    return Container(
      width: context.width * 95,
      // height: context.height * 60,
      decoration: BoxDecoration(
          borderRadius: context.mediumCircular,
          color: context.accentColor,
          boxShadow: [
            BoxShadow(
              color: context.highlightColor,
              blurRadius: 5,
              spreadRadius: 0.01,
            )
          ]),
      child: Padding(
        padding: context.mediumEdgeInsets,
        child: Column(
          children: [
            header('add_bank_account'.translate),
            subHeader('select_bank'.translate),
            CustomDropDown(
              itemList: bankList,
            ),
            subHeader('currency'.translate),
            CustomDropDown(
              itemList: currencyList,
            ),
            subHeader('IBAN'),
            stakeTextFormField(
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      "TR",
                      style: context.headline3.copyWith(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
                true,
                "IBAN"),
            subHeader('swift'),
            stakeTextFormField(
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock_rounded,
                      color: Colors.grey.shade700,
                    )
                  ],
                ),
                true,
                "swift"),
            sized(),
            saveButton(),
          ],
        ),
      ),
    );
  }

  Widget bankSelectDropdown() {
    return CustomDropDown(
      itemList: bankList,
    );
  }

  Widget currencySelectDropdown() {
    return CustomDropDown(
      itemList: currencyList,
    );
  }

  Padding subHeader(String text) {
    return Padding(
      padding: context.verticalLow,
      child: Row(
        children: [
          customText(
            text,
            context.headline6.copyWith(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Padding header(String text) {
    return Padding(
      padding: context.verticalLow,
      child: Row(
        children: [
          customText(
            text,
            context.headline6.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  RoundedTextButton stakeTextFormField(
      Widget prefixIcon, bool enabled, String hint) {
    return RoundedTextButton(
      hintTextKey: hint,
      onChanged: (string) {},
      prefixIcon: prefixIcon,
      enabled: enabled,
    );
  }

  RoundedButton saveButton() {
    return RoundedButton(
      buttonTextKey: 'save',
      textStyle:
          context.headline6.copyWith(color: context.accentColor, fontSize: 20),
      borderRadius: context.mediumCircular,
      action: () {},
      borderColor: Colors.transparent,
      backgroundColor: Colors.grey.shade800,
    );
  }

  Widget customText(String data, TextStyle style) {
    return AutoSizeText(
      data,
      style: style,
    );
  }

  Row divider() {
    return Row(
      children: [
        Expanded(
            child: Divider(
          height: 40,
          color: context.highlightColor,
        )),
      ],
    );
  }

  SizedBox sized() {
    return SizedBox(
      height: context.height * 1.5,
    );
  }
}

List<String> get bankList => ["Kuveyt", "Ziraat", "Enpara", "Qnb"];
List<String> get currencyList => ["TRY", "USD", "EUR"];

class CustomDropDown extends StatefulWidget {
  final itemList;
  const CustomDropDown({
    Key? key,
    required this.itemList,
  }) : super(key: key);
  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

var val;

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: context.lowCircular,
        border: Border.all(color: context.darkGreyColor),
      ),
      child: FutureBuilder(
        future: Provider.of<LanguageProvider>(context).getlang(),
        builder: (context, snapshot) {
          return ButtonTheme(
            alignedDropdown: true,
            child: Material(
              color: Colors.transparent,
              borderRadius: context.lowCircular,
              child: DropdownButton<String>(
                isExpanded: true,
                underline: SizedBox(),
                borderRadius: context.lowCircular,
                dropdownColor: context.accentColor,
                style: context.headline6.copyWith(fontSize: 20),
                items: widget.itemList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(value,
                            textAlign: TextAlign.right,
                            minFontSize: 15,
                            style: context.headline6.copyWith(fontSize: 20)),
                        Spacer(),
                      ],
                    ),
                  );
                }).toList(),
                hint: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      val == null ? widget.itemList[0] : val,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: context.highlightColor, fontSize: 20),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
                onChanged: (value) {
                  setState(() {
                    val = value;
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
