import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleExample extends StatelessWidget {
  const SimpleExample({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController inputController = TextEditingController();
    // getX controller   // dependency injection
    InputTextController controller = Get.put(InputTextController());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Obx( () => Text(
              controller.inputText.value,
              style: TextStyle(fontSize: 22),),),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: inputController,
                decoration: InputDecoration(
                  hintText: "Enter text here",
                ),
              ),
            ),

            ElevatedButton(
                onPressed: (){
                  controller.inputText.value = inputController.text;
                  inputController.clear();
                  print(inputController.text);
                },
                child: Text("Done")
            ),
          ]

        ),
      ),
    );
  }
}


// controller class
class InputTextController extends GetxController{
  RxString inputText = "".obs;
}