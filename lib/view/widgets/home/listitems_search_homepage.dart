import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../controller/home/homepage_controller.dart';
import '../../../data/model/itemsmodel.dart';
import '../../../linkapi.dart';


class ListItemsSearchHome extends GetView<HomePAgeControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearchHome({
    super.key,
    required this.listdatamodel,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listdatamodel.length,
        itemBuilder: (context, index) {
          return InkWell(
            // onTap: () {
            //   controller.goToPageProductItems(listdatamodel[index]);
            // },
            child: Card(
              elevation: 5,
              child: Container(
                height: 100,
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: Image.network(
                        "${AppLink.imageitems}/${listdatamodel[index].itemsImage}",
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(listdatamodel[index].itemsName!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          subtitle: Text(listdatamodel[index].categoriesName!),
                        )),
                  ],
                ),
              ),
            ),
          );
        });
  }
}