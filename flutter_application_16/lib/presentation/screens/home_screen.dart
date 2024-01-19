import 'package:flutter/material.dart';
import 'package:flutter_application_16/data/model/quiz_model.dart';
import 'package:flutter_application_16/presentation/bloc/quiz_bloc.dart';
import 'package:flutter_application_16/presentation/bloc/quiz_event.dart';
import 'package:flutter_application_16/presentation/bloc/quiz_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool isSelected = false;
bool isButtonVisible = true;
final PageController controller = PageController();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<QuizBloc>(context).add(RandomQuizEvent());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 191, 191, 191),
      body: BlocBuilder<QuizBloc, QuizState>(builder: ((context, state) {
        if (state is QuizLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is QuizSuccess) {
          return PageView.builder(
              controller: controller,
              itemCount: QuizModel().results?.length ?? 10,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                        visible: isSelected,
                        child: Text(
                          state.question.results?[index].question ?? "",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        )),
                    Visibility(
                      visible: isSelected,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 250,
                              width: 200,
                              child: ListView.builder(itemCount: state.answers.length, itemBuilder: (context, index){
                                return Column(
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          state.answers[index],
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600),
                                        )),
                                  ],
                                );
                              })
                            ),
                            Visibility(
                              visible: isSelected,
                              child: const Padding(
                                padding: EdgeInsets.only(left: 100),
                                child: Text(
                                  "1980",
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isButtonVisible,
                      child: ElevatedButton(
                          onPressed: () {
                            isButtonVisible = !isButtonVisible;
                            isSelected = !isSelected;
                            setState(() {});
                            print("работает");
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 189, 29, 18),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Начать викторину",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                          )),
                    )
                  ],
                );
              });
        } else if (state is QuizError) {
          return Center(child: Text(state.error));
        }
        return const SizedBox();
      })),
      floatingActionButton: Visibility(
        visible: isSelected,
        child: ElevatedButton(
            onPressed: () {
              isSelected = !isSelected;
              isButtonVisible = !isButtonVisible;
              setState(() {});
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            child: const Text(
              "Закончить",
              style: TextStyle(fontSize: 20),
            )),
      ),
    );
  }
}