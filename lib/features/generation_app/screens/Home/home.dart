import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:AQGM/utils/constants/sizes.dart';
import 'package:AQGM/features/generation_app/screens/Home/widgets/create_button.dart';
import 'package:AQGM/features/generation_app/screens/Home/widgets/drop_down_menu.dart';
import 'package:AQGM/features/generation_app/screens/Home/widgets/home_appbar.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CreateButtonController controller = Get.put(CreateButtonController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AQGMPrimaryHeaderContainer(
              child: Column(
                children: <Widget>[
                  AQGMHomeAppBar(),
                  SizedBox(height: AQGMSizes.spaceBtwSections),
                  SizedBox(height: AQGMSizes.spaceBtwSections),
                ],
              ),
            ),
            const SizedBox(width: 300, child: DropdownMenuWidget()),
            const SizedBox(height: AQGMSizes.spaceBtwSections),
            const SizedBox(height: AQGMSizes.spaceBtwSections),
            GenerateButton(),
            SizedBox(height: 20),
            Obx(() {
              if (controller.isLoading.value) {
                return CircularProgressIndicator();
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.questions.length,
                  itemBuilder: (context, index) {
                    final question = controller.questions[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Q: ${question['question']}",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            if (question.containsKey('choices'))
                              ...((question['choices'] as List<dynamic>).map((choice) => Text(choice)).toList()),
                            Text(
                              "A: ${question['answer']}",
                              style: TextStyle(fontSize: 16),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: IconButton(
                                icon: Icon(Icons.star),
                                onPressed: () => controller.toggleSaveQuestion(question),
                                color: controller.isSavedQuestion(question) ? Colors.yellow : Colors.grey,
                                iconSize: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}