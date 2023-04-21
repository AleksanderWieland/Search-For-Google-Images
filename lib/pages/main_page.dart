import 'package:easy_image_viewer/easy_image_viewer.dart';
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
  late PageController _pageController;
  late UserBloc userBloc;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
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
    int activePage = 1;
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
                        return const Center();
                      }
                      if (state is UserLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is UserLoadedState) {
                        return Center(
                          child: SizedBox(
                            height: 500,
                            width: MediaQuery.of(context).size.width,
                            child: PageView.builder(
                                itemCount: state.urls.length,
                                pageSnapping: true,
                                controller: _pageController,
                                onPageChanged: (page) {
                                  setState(() {
                                    activePage = page;
                                  });
                                },
                                itemBuilder: (context, pagePosition) {
                                  return GestureDetector(
                                    onTap: () {
                                      showImageViewer(
                                          context,
                                          Image.network(
                                            state.urls[pagePosition],
                                          ).image, onViewerDismissed: () {
                                        print("dismissed");
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(10),
                                      child: Image.network(
                                        state.urls[pagePosition],
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        );
                      }
                      if (state is UserErrorState) {
                        print(state.error);
                      }
                      return const Center(
                        child:
                            Text("Can't find any images. Try something else!"),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
