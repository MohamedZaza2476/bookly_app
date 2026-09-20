import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: CustomSearchTextField(),
        ),
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text('Search Result', style: Styles.textStyle18),
        ),
        SizedBox(height: 16),
        Expanded(child: SearchResultList()),
      ],
    );
  }
}

class SearchResultList extends StatelessWidget {
  const SearchResultList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 30),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: BookListViewItem(),
        );
      },
    );
  }
}
