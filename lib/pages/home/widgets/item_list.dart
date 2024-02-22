import 'package:flutter/material.dart';
import 'package:tecnical_testmob_pragma/models/pets.dart';

class ItemList extends StatefulWidget {
  const ItemList({
    super.key,
    required this.data,
    this.petImg,
  });

  final Pet data;
  final String? petImg;

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.data.name!,
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          const SizedBox(
            height: 10,
          ),
          Hero(
            tag: widget.data.name!,
            transitionOnUserGestures: true,
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              child: const Image(
                image: AssetImage('assets/cat.png'),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.data.description!,
            maxLines: 3,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
