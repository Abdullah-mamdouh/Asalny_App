
import 'package:chat_gpt_groups/features/chat/logic/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants.dart';
import '../../data/models/models_model.dart';
import 'text_widget.dart';

class ModelsDrowDownWidget extends StatefulWidget {
  const ModelsDrowDownWidget({super.key});

  @override
  State<ModelsDrowDownWidget> createState() => _ModelsDrowDownWidgetState();
}

class _ModelsDrowDownWidgetState extends State<ModelsDrowDownWidget> {
  String? currentModel;

  bool isFirstLoading = true;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ModelsModel>>(
        future: context.read<ChatCubit>().emitChatModelsStates(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              isFirstLoading == true) {
            isFirstLoading = false;
            return const FittedBox(
              child: SpinKitFadingCircle(
                color: Colors.lightBlue,
                size: 30,
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: TextWidget(label: snapshot.error.toString()),
            );
          }
          return snapshot.data == null || snapshot.data!.isEmpty
              ? const SizedBox.shrink()
              : FittedBox(
                  child: DropdownButton(
                    dropdownColor: scaffoldBackgroundColor,
                    iconEnabledColor: Colors.white,
                    items: List<DropdownMenuItem<String>>.generate(
                        snapshot.data!.length,
                        (index) => DropdownMenuItem(
                            value: snapshot.data![index].id,
                            child: TextWidget(
                              label: snapshot.data![index].id,
                              fontSize: 15,
                            ))),
                    value: currentModel,
                    onChanged: (value) {
                      setState(() {
                        currentModel = value.toString();
                      });
                      // modelsProvider.setCurrentModel(
                      //   value.toString(),
                      // );
                    },
                  ),
                );
        });
  }
}
