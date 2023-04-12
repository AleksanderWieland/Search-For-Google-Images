import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_api_image_app/blocs/app_events.dart';
import 'package:google_api_image_app/network/network_helper.dart';

import '../blocs/app_blocs.dart';
import '../blocs/app_states.dart';
import '../network/query.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();

  late FocusNode myFocusNode;
  late UserBloc userBloc;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
    userBloc = UserBloc(NetworkHelper(
        url: "https://customsearch.googleapis.com/customsearch/v1"));
    myFocusNode.addListener(
      () {
        if (!myFocusNode.hasFocus) {
          userBloc.add(LoadUserEvent(_controller.text));
        }
      },
    );
  }

  @override
  void dispose() {
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>(
            create: (BuildContext context) => UserBloc(
              NetworkHelper(
                url: "https://customsearch.googleapis.com/customsearch/v1",
              ),
            ),
          ),
        ],
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text('Google Image Search'),
            centerTitle: true,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _controller.clear();
              myFocusNode.requestFocus();
            },
            child: const Icon(Icons.search),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Stack(
              children: [
                Positioned.fill(
                  top: 30,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: TextField(
                      focusNode: myFocusNode,
                      controller: _controller,
                      decoration: const InputDecoration(
                          label: Text('Your query'),
                          alignLabelWithHint: true,
                          floatingLabelAlignment:
                              FloatingLabelAlignment.center),
                    ),
                  ),
                ),
                BlocProvider(
                  create: (context) => userBloc..add(LoadInitalEvent()),
                  child: BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is UserInitialState) {
                        return Center(
                          child: Column(
                            children: [
                              Container(
                                height: 20.0,
                                decoration:
                                    const BoxDecoration(color: Colors.black),
                              ),
                            ],
                          ),
                        );
                      }
                      if (state is UserLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      List<Object?> imageUrl = state.props;
                      print(state.props.toString());
                      return Center(
                          child: Image.network(state.props[0].toString() ??
                              'https://cataas.com/cat'));
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
