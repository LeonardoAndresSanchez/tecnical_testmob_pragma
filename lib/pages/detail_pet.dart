import 'package:flutter/material.dart';

import 'package:tecnical_testmob_pragma/models/pets.dart';
import 'package:tecnical_testmob_pragma/pages/home/widgets/rating_bar.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, this.pet, this.petImg});
  final Pet? pet;
  final String? petImg;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.pet!.name!),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 12.0,
          ),
          child: Column(
            children: [
              Hero(
                tag: widget.pet!.name!,
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "https://cdn2.thecatapi.com/images/${widget.pet!.referenceImageId}.jpg",
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(height: 10),
                    _detailData(widget.pet),
                    const SizedBox(height: 20),
                    _ratingData(widget.pet!),
                    const SizedBox(height: 20),
                    _source(widget.pet),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailData(Pet? pet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.pet!.name!,
          maxLines: 1,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        if (widget.pet!.altNames! != '') ...[
          Text(
            widget.pet!.altNames!,
            maxLines: 1,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
          ),
        ],
        const SizedBox(
          height: 10,
        ),
        Text(
          widget.pet!.description!,
          softWrap: true,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        RichText(
          text: TextSpan(
            text: 'Country: \n',
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: Colors.black87),
            children: <TextSpan>[
              TextSpan(
                text: '${widget.pet!.origin!} - ${widget.pet!.countryCode!}',
                style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        RichText(
          text: TextSpan(
            text: 'Temperament: \n',
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: Colors.black87),
            children: <TextSpan>[
              TextSpan(
                text: widget.pet!.temperament!,
                style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        RichText(
          text: TextSpan(
            text: 'Life Span: \n',
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: Colors.black87),
            children: <TextSpan>[
              TextSpan(
                text: '${widget.pet!.lifeSpan!} years',
                style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        RichText(
          text: TextSpan(
            text: 'Weight: \n',
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: Colors.black87),
            children: <TextSpan>[
              TextSpan(
                text: '${widget.pet!.weight!.metric.toString()} Kg',
                style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _ratingData(Pet pet) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 50, left: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey[200]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RatingItem(
            label: 'Child Friendly:',
            initialRating: widget.pet!.childFriendly!.toDouble(),
          ),
          RatingItem(
            label: 'Dog Friendly:',
            initialRating: widget.pet!.dogFriendly!.toDouble(),
          ),
          RatingItem(
            label: 'Intelligence:',
            initialRating: widget.pet!.intelligence!.toDouble(),
          ),
          RatingItem(
            label: 'Adaptability:',
            initialRating: widget.pet!.adaptability!.toDouble(),
          ),
        ],
      ),
    );
  }

  Widget _source(Pet? pet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Cfa: \n',
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: Colors.black87),
            children: <TextSpan>[
              TextSpan(
                text: widget.pet!.cfaUrl ?? 'No link',
                style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        RichText(
          text: TextSpan(
            text: 'Vetstreet: \n',
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: Colors.black87),
            children: <TextSpan>[
              TextSpan(
                text: widget.pet!.vetstreetUrl ?? 'No link',
                style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        RichText(
          text: TextSpan(
            text: 'wikipedia: \n',
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: Colors.black87),
            children: <TextSpan>[
              TextSpan(
                text: widget.pet!.wikipediaUrl ?? 'No link',
                style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ],
    );
  }
}
