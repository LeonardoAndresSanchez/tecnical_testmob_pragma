import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecnical_testmob_pragma/models/pets.dart';
import 'package:tecnical_testmob_pragma/providers/pet_provider_service.dart';

import 'widgets/itemList.dart';

enum TypeView { grid, list }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int _crossAxisCount = 2;
double _aspectRatio = 1.7;
TypeView _typeView = TypeView.grid;
List<Pet>? pets = [];
bool? isGrid;

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
          title: const Text('Frontend Engenier Test'),
          actions: const [],
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.grey[200]),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(_typeView == TypeView.list
                        ? Icons.view_list
                        : Icons.grid_on),
                    onPressed: () {
                      if (_typeView == TypeView.list) {
                        _crossAxisCount = 2;
                        _aspectRatio = 1.7;
                        _typeView = TypeView.grid;
                      } else {
                        _crossAxisCount = 1;
                        _aspectRatio = 3;
                        _typeView = TypeView.list;
                      }
                      setState(() {});
                    },
                  ),
                  Text(
                    _typeView == TypeView.list ? 'ListView' : 'Gridview',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const Spacer(),
                  Switch(
                      value: isGrid!,
                      onChanged: (value) {
                        isGrid = value;
                        if (_typeView == TypeView.list) {
                          _crossAxisCount = 2;
                          _aspectRatio = 1.7;
                          _typeView = TypeView.grid;

                          setState(() {});
                        } else {
                          _crossAxisCount = 1;
                          _aspectRatio = 3;
                          _typeView = TypeView.list;

                          setState(() {});
                        }
                      })
                ],
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: _crossAxisCount,
                  childAspectRatio: _aspectRatio,
                  children: pets!.map((u) {
                    return GestureDetector(
                      child: ItemGrid(
                        data: u,
                        typeView: _typeView,
                      ),
                      // onTap: () => Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => UniversityDetail(
                      //             u: u,
                      //           )),
                      // ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
