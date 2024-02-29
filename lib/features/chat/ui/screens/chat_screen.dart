import 'dart:developer';
import 'package:chat_gpt_groups/features/chat/data/models/user-message.dart';
import 'package:chat_gpt_groups/features/chat/logic/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/services.dart';
import '../../logic/chat_state.dart';
import '../widgets/chat_widget.dart';
import '../widgets/text_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // bool _isTyping = false;

  late TextEditingController textEditingController;
  late ScrollController _listScrollController;
  late FocusNode focusNode;
  @override
  void initState() {
    ChatCubit.get(context).emitChatModelsStates();
    _listScrollController = ScrollController();
    textEditingController = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _listScrollController.dispose();
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  // List<ChatModel> chatList = [];
  @override
  Widget build(BuildContext context) {
    // final modelsProvider = Provider.of<ModelsProvider>(context);
    // final context.read<ChatCubit>() = Provider.of<ChatProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetsManager.openaiLogo),
        ),
        title: const Text("ChatGPT"),
        actions: [
          IconButton(
            onPressed: () async {
              await Services.showModalSheet(context: context);
            },
            icon: const Icon(Icons.more_vert_rounded, color: Colors.white),
          ),
        ],
      ),
      body: BlocBuilder<ChatCubit, ChatState>(

        builder: (context, state) {
          var msg = ChatCubit.chatList;
          return SafeArea(
            child: Column(
              children: [
                Flexible(
                  child: ListView.builder(
                      controller: _listScrollController,
                      itemCount: msg.length, //chatList.length,
                      itemBuilder: (context, index) {

                        return Column(
                          children: [
                          ChatWidget(
                              msg: ChatCubit.chatList[index].message.content, // chatList[index].msg,
                              chatIndex: msg[index]
                                  .index, //chatList[index].chatIndex,
                              shouldAnimate:
                              msg.length - 1 == index,
                            ),
                            state is Loading && (index == msg.length-1) ? const SpinKitThreeBounce(
                              color: Colors.red,
                              size: 18,
                            ) : const SizedBox(),
                          ],
                        );
                      }),
                ),
                  /*state is Loading? const SpinKitThreeBounce(
                    color: Colors.red,
                    size: 18,
                  ) : const SizedBox(),
                */
                const SizedBox(
                  height: 15,
                ),
                Material(
                  color: cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            focusNode: focusNode,
                            style: const TextStyle(color: Colors.white),
                            controller: textEditingController,
                            onSubmitted: (value) async {
                              await sendMessageFCT();
                            },
                            decoration: const InputDecoration.collapsed(
                                hintText: "How can I help you",
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                        ),
                        IconButton(
                            onPressed: () async {
                              await sendMessageFCT();
                            },
                            icon: const Icon(
                              Icons.send,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }

  void scrollListToEND() {
    _listScrollController.animateTo(
        _listScrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 2),
        curve: Curves.easeOut);
  }

  Future<void> sendMessageFCT() async {
    /*if (_isTyping) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: TextWidget(
            label: "You cant send multiple messages at a time",
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }*/
    if (textEditingController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: TextWidget(
            label: "Please type a message",
          ),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    try {
      String msg = textEditingController.text;
      //setState(() {
        //_isTyping = true;
        // chatList.add(ChatModel(msg: textEditingController.text, chatIndex: 0));
        context.read<ChatCubit>().addUserMessage(msg: msg);
        textEditingController.clear();
        //focusNode.unfocus();
    //  });
      await context.read<ChatCubit>().emitSendMessageStates(
          UserMessage(message: [Message(content: msg)], model: 'gpt-3.5-turbo-0301'));
      scrollListToEND();
      setState(() {

      });
      // await context.read<ChatCubit>().sendMessageAndGetAnswers(
      //     msg: msg, chosenModelId: modelsProvider.getCurrentModel);
      // chatList.addAll(await ApiService.sendMessage(
      //   message: textEditingController.text,
      //   modelId: modelsProvider.getCurrentModel,
      // ));
      //setState(() {});
    } catch (error) {
      log("error $error");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: TextWidget(
          label: error.toString(),
        ),
        backgroundColor: Colors.red,
      ));
    } finally {
      setState(() {
        scrollListToEND();
        //_isTyping = false;
      });
    }
  }
}
