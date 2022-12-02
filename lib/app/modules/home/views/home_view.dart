import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:flutter_dynamic_list_view/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Compras'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.nameTextEditingController,
              decoration: const InputDecoration(
                hintText: "",
                labelText: "Código EAN",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                isDense: true,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: controller.addressTextEditingController,
              decoration: const InputDecoration(
                hintText: "",
                labelText: "Precio",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                isDense: true,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                controller.addEmployee(
                    controller.nameTextEditingController.text,
                    controller.addressTextEditingController.text);
              },
              child: const Text("Guardar"),
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.itemCount.value,
                    itemBuilder: ((context, index) {
                      return ListTile(
                        title: Text(controller.employees.value[index].name!),
                        subtitle:
                            Text(controller.employees.value[index].address!),
                        trailing: GestureDetector(
                          child: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onTap: () {
                            controller.removeEmployee(index);
                          },
                        ),
                      );
                    }),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
