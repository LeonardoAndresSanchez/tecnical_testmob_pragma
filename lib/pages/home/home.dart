import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tecnical_testmob_pragma/pages/detail_pet.dart';

import 'package:tecnical_testmob_pragma/providers/pet_provider_service.dart';

import 'widgets/item_list.dart';

enum TypeView { grid, list }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

TextEditingController _textEditingController = TextEditingController();
String urlImg = '';

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PetProvider>(builder: (_, PetProvider model, __) {
      if (model.getPets == [] && model.getPetsImg == []) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          title: const Text(
            'Pragma test',
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          surfaceTintColor: const Color(0xff42ca7e),
          centerTitle: true,
          actions: const [],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  context.read<PetProvider>().filterSearchResults(value);
                },
                controller: _textEditingController,
                decoration: const InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                itemCount: model.getPets!.length,
                itemBuilder: (BuildContext context, int i) {
                  return GestureDetector(
                    child: ItemList(
                      data: model.getPets![i],
                      petImg: urlImg,
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          pet: model.getPets![i],
                          petImg: urlImg,
                        ),
                      ),
                    ),
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

class SearchInput extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final Function(String) onChanged;
  const SearchInput(
      {required this.textController,
      required this.hintText,
      Key? key,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(.1)),
      ]),
      child: TextField(
        controller: textController,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xff4338CA),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
        ),
      ),
    );
  }
}
