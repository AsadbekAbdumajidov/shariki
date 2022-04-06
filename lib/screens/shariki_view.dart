import 'dart:math';
import 'package:cubit_shariki/bloc/shariki_cubit.dart';
import 'package:cubit_shariki/bloc/shariki_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SharikiView extends StatefulWidget {
  const SharikiView({Key? key}) : super(key: key);

  @override
  State<SharikiView> createState() => _SharikiViewState();
}

class _SharikiViewState extends State<SharikiView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return scaffold(context);
        },
      ),
    );
  }

  Scaffold scaffold(BuildContext context) {
    List<Color> data = context.watch<HomeBloc>().colors;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Tog'ri javob: ${context.watch<HomeBloc>().natija}"),
        backgroundColor: Colors.green.withOpacity(0.7),
        // actions: [
          // Text(context.watch<HomeBloc>().timeCount.toString()),
        // ],
      ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          
          Column(
            children: [
              const SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: Colors.black),
                ),
                width: double.infinity,
                height: 40,
                child: Center(
                  child: Text(
                    "${context.watch<HomeBloc>().names[context.watch<HomeBloc>().random]}ni Bosing",
                    style: TextStyle(
                      fontSize: 25,
                      color:
                          context.watch<HomeBloc>().colors[Random().nextInt(5)],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    for (var i = 0;
                        i < context.watch<HomeBloc>().colors.length;
                        i++)
                      Padding(
                        padding: EdgeInsets.only(
                          left: Random().nextInt(300).toDouble(),
                          top: Random().nextInt(700).toDouble(),
                        ),
                        child: GestureDetector(
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: data[i],
                          ),
                          onTap: context.watch<HomeBloc>().start == true
                              ? null
                              : () {
                                  context.read<HomeBloc>().rangTanla(i);
                                },
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            child: Visibility(
              visible: context.watch<HomeBloc>().start,
              child: Container(
                height: 200,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  color: Colors.green.withOpacity(0.7),
                ),
                child: context.watch<HomeBloc>().natija != 0
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Tog'ri javob: ${context.watch<HomeBloc>().natija}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                          const Text(
                            "O'yin tugadi !!!",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 25,
                            ),
                          ),
                          ElevatedButton(
                            style: OutlinedButton.styleFrom(
                              fixedSize: const Size(180, 30),
                              backgroundColor: Colors.cyan,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                            onPressed: () {
                              context.read<HomeBloc>().startGame();
                            },
                            child: const Text("Boshlash"),
                          )
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "O'yin Boshlash",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                            ),
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              fixedSize: const Size(180, 30),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                            ),
                            onPressed: () {
                              context.read<HomeBloc>().startGame();
                            },
                            child: const Text(
                              "Boshlash",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}