import 'package:flutter/material.dart';
import 'package:mvvm_example/view_models/searchfood_model.dart';
import 'package:provider/provider.dart';

class SearchFood extends StatefulWidget {
  const SearchFood({super.key});

  @override
  State<SearchFood> createState() => _SearchFoodState();
}

class _SearchFoodState extends State<SearchFood> {
  @override
  Widget build(BuildContext context) {
    var searchFood = Provider.of<SearchFoodProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(children: [
            TextField(onSubmitted: ((value) {
              searchFood.search(value);
            })),
            searchFood.isLoading
                ? const LinearProgressIndicator()
                : const SizedBox(),
            Expanded(
              child: ListView.builder(
                itemCount: searchFood.getFoodResults.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 150,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Image.network(
                              searchFood.getFoodResults[index].imagrUrl ?? '',
                              width: 100,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                    searchFood.getFoodResults[index].name ?? '',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                    '${searchFood.getFoodResults[index].cal} kcal'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
