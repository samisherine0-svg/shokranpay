import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pioneerspay/Provider/ProviderAccount.dart';
import 'package:pioneerspay/Utils/FontSizeFile.dart';
import 'package:pioneerspay/Utils/Language/translation_strings.dart';

import '../../../Model/Response/AuthorizationResponse/AddressResponse.dart';
import '../../../Utils/Colors/GeneralColor.dart';

class AddressSection extends StatefulWidget {
  Data data;

  AddressSection(this.data);

  @override
  State<AddressSection> createState() => _AddressSection(data);
}

class _AddressSection extends State<AddressSection> {
  Data data;

  _AddressSection(this.data);

  List<Governorates>? listGovernorates;
  Governorates? dataItemGov;
  Cities? dataItemCity;
  List<Cities>? listCities;
  List<Cities>? allCities;
  Villages? dataItemVillages;
  List<Villages>? listVillages;
  List<Villages>? allVillages;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listGovernorates = data.governorates!;
    allCities = data.cities!;
    allVillages=data.villages!;
    dataItemGov = listGovernorates!.elementAt(0);
    getCities(dataItemGov!.id);

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width,
          margin: const EdgeInsets.fromLTRB(2, 10, 2, 5),
          child: Text(
            Translations.of(context)!.gov,
            style: TextStyle(
              color: Colors.black,
              fontSize: FontSizeFile.s_size,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: GeneralColor.white,
            border: Border.all(width: 2, color: GeneralColor.appColor),
            borderRadius: BorderRadius.circular(15.0),
          ),
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: DropdownButton<Governorates>(
            icon: const Icon(Icons.keyboard_arrow_down_sharp,
                size: 20.0, color: Colors.black),
            items: listGovernorates!.map((item) {
              return DropdownMenuItem<Governorates>(
                value: item,
                child: Row(
                  children: [
                    Text(
                      item.name.toString(),
                      style: TextStyle(
                        color: GeneralColor.greyText,
                        fontSize: FontSizeFile.xs_size,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            isExpanded: true,
            underline: Container(),
            onChanged: (newVal) {
              setState(() {
                dataItemGov = newVal!;
                getCities(dataItemGov!.id);
              });
            },
            value: dataItemGov,
          ),
        ),
        Container(
          width: size.width,
          margin: const EdgeInsets.fromLTRB(2, 20, 2, 5),
          child: Text(
            Translations.of(context)!.city,
            style: TextStyle(
              color: Colors.black,
              fontSize: FontSizeFile.s_size,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: GeneralColor.white,
            border: Border.all(width: 2, color: GeneralColor.appColor),
            borderRadius: BorderRadius.circular(15.0),
          ),
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: DropdownButton<Cities>(
            icon: const Icon(Icons.keyboard_arrow_down_sharp,
                size: 20.0, color: Colors.black),
            items: listCities!.map((item) {
              return DropdownMenuItem<Cities>(
                value: item,
                child: Row(
                  children: [
                    Text(
                      item.name.toString(),
                      style: TextStyle(
                        color: GeneralColor.greyText,
                        fontSize: FontSizeFile.xs_size,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            isExpanded: true,
            underline: Container(),
            onChanged: (newVal) {
              setState(() {
                dataItemCity = newVal!;
                getVillages(dataItemCity!.id);
              });
            },
            value: dataItemCity,
          ),
        ),
        Container(
          width: size.width,
          margin: const EdgeInsets.fromLTRB(2, 20, 2, 5),
          child: Text(
            Translations.of(context)!.village,
            style: TextStyle(
              color: Colors.black,
              fontSize: FontSizeFile.s_size,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: GeneralColor.white,
            border: Border.all(width: 2, color: GeneralColor.appColor),
            borderRadius: BorderRadius.circular(15.0),
          ),
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: DropdownButton<Villages>(
            icon: const Icon(Icons.keyboard_arrow_down_sharp,
                size: 20.0, color: Colors.black),
            items: listVillages!.map((item) {
              return DropdownMenuItem<Villages>(
                value: item,
                child: Row(
                  children: [
                    Text(
                      item.name.toString(),
                      style: TextStyle(
                        color: GeneralColor.greyText,
                        fontSize: FontSizeFile.xs_size,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            isExpanded: true,
            underline: Container(),
            onChanged: (newVal) {
              setState(() {
                dataItemVillages = newVal!;
              });
            },
            value: dataItemVillages,
          ),
        ),
      ],
    );
  }

  getCities(govID) {
    List<Cities> newList = [];
    for (int i = 0; i < allCities!.length; i++) {
      if (allCities!.elementAt(i).governorateId == govID) {
        newList.add(allCities!.elementAt(i));
      }
    }
    setState(() {
      listCities = newList;
      dataItemCity = listCities!.elementAt(0);
      getVillages(dataItemCity!.id);
    });
  }

  getVillages(cityID) {
    List<Villages> newList = [];
    for (int i = 0; i < allVillages!.length; i++) {
      if (allVillages!.elementAt(i).cityId == cityID) {
        newList.add(allVillages!.elementAt(i));
      }
    }
    setState(() {
      listVillages = newList;
      dataItemVillages = listVillages!.elementAt(0);
      Provider.of<ProviderAccount>(context, listen: false)
          .setVillageID(dataItemVillages!.id!);
    });
  }
}
