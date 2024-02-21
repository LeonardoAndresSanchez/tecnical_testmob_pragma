import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tecnical_testmob_pragma/models/pets.dart';
import 'package:tecnical_testmob_pragma/pages/home/widgets/search_bar.dart';
import 'package:tecnical_testmob_pragma/providers/pet_provider_service.dart';

import 'widgets/item_list.dart';

enum TypeView { grid, list }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

TypeView _typeView = TypeView.grid;
List<Pet>? pets = [];
bool? isGrid;
TextEditingController _textEditingController = TextEditingController();

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    isGrid = true;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<PetProvider>().getCollege();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PetProvider>(builder: (_, PetProvider model, __) {
      pets = model.getPets;
      if (pets == []) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return Scaffold(
        appBar: AppBar(
          title: const Text('Pragma test'),
          centerTitle: true,
          actions: const [],
        ),
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: SearchInput(
                textController: _textEditingController,
                hintText: 'Search...',
              ),
            ),
            Expanded(
              child: ListView.builder(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                itemCount: pets!.length,
                itemBuilder: (BuildContext context, int i) {
                  return ItemList(
                    data: pets![i],
                    typeView: _typeView,
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
