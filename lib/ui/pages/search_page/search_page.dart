import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/domain/provider/search_provider.dart';
import 'package:todo_list/ui/components/card_widget.dart';
import 'package:todo_list/ui/style/app_colors.dart';
import 'package:todo_list/ui/style/app_style.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchProvider(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.purple,
          title: Text(
            'Search page',
            style: AppStyle.fontStyle,
          ),
          centerTitle: true,
        ),
        body: const SearchBody(),
      ),
    );
  }
}

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SearchProvider>();
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            TextField(
              controller: model.searchController,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, i) {
                  return CardWidget(
                    title: '${model.filteredNotes[i].title}',
                    subTitle: model.filteredNotes[i].text.toString(),
                    index: i,
                  );
                },
                separatorBuilder: (context, i) => const SizedBox(height: 21),
                itemCount: model.filteredNotes.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
