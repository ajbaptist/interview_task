import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_task/bloc/home_bloc/home_bloc.dart';
import 'package:interview_task/utiles/extension.dart';
import 'package:interview_task/view/component/item_division.dart';

import '../bloc/home_bloc/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(GetHomeEvent()),
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.status.isError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message ?? 'Something went wrong!')));
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return DefaultTabController(
              length: 5,
              child: Scaffold(
                  body: Container(
                margin: EdgeInsets.symmetric(horizontal: 3.2.wp),
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.only(top: 6.hp, bottom: 2.hp),
                    height: 6.hp,
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.8),
                        ),
                        contentPadding: EdgeInsets.only(top: 2.hp, left: 4.wp),
                        suffixIcon: Icon(
                          Icons.search_sharp,
                          size: 8.wp,
                        ),
                        border: const OutlineInputBorder(),
                        hintText: 'Search Keywords...',
                      ),
                    ),
                  ),
                  const TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabAlignment: TabAlignment.center,
                    isScrollable: true,
                    indicatorWeight: 2,
                    labelColor: Colors.black,
                    tabs: [
                      Tab(text: "All"),
                      Tab(
                        text: "Animals",
                      ),
                      Tab(text: "Birds"),
                      Tab(text: "Flowers"),
                      Tab(text: "Mountains"),
                    ],
                  ),
                  state.status.isLoading
                      ? Container(
                          margin: EdgeInsets.only(top: 6.hp),
                          child: const CircularProgressIndicator(),
                        )
                      : state.status.isSucess && state.data.length >= 5
                          ? SizedBox(
                              height: 80.hp,
                              child: TabBarView(
                                children: [
                                  ItemDivision(data: state.data[0].subData),
                                  ItemDivision(data: state.data[1].subData),
                                  ItemDivision(data: state.data[2].subData),
                                  ItemDivision(data: state.data[3].subData),
                                  ItemDivision(data: state.data[4].subData),
                                ],
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.only(top: 6.hp),
                              child: Text(
                                  state.message ?? 'Something went wrong!'),
                            ),
                ]),
              )),
            );
          },
        ),
      ),
    );
  }
}
