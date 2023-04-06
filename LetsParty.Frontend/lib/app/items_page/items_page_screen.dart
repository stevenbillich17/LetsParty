import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lets_party_frontend/assets/app_dimens.dart';
import 'package:lets_party_frontend/assets/app_styles.dart';
import 'package:lets_party_frontend/app/components/category_widget.dart';
import 'package:lets_party_frontend/app/items_page/items_page_bloc.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemsPageBloc(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'what is needed',
              style: AppStyles.appBarStyle,
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            leading: TextButton(
              child: const Text('Back'),
              onPressed: () {},
            ),
          ),
          body: Consumer<ItemsPageBloc>(
            builder: (context, bloc, child) {
              if (!bloc.loadingDone) {
                return const Center(child: CircularProgressIndicator());
              }
              return Padding(
                padding: const EdgeInsets.all(AppDimens.padding_2x),
                child: ListView.builder(
                  itemCount: bloc.listOfCategories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryWidget(category: bloc.listOfCategories[index], enableItemSelect: false,);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}