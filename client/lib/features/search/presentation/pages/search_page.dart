import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/presentation/widgets/app/app_bar_widget.dart';
import 'package:movie_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:movie_app/features/search/presentation/cubit/selectable_option_cubit.dart';
import 'package:movie_app/features/search/presentation/widgets/search_content_widget.dart';
import 'package:movie_app/features/search/presentation/widgets/search_field_widget.dart';
import 'package:movie_app/features/search/presentation/widgets/search_options_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: Text("Search")),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SelectableOptionCubit()),
          BlocProvider(create: (context) => SearchCubit()),
        ],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SearchFieldWidget(),
              const SizedBox(height: 16),
              SearchOptionsWidget(),
              const SizedBox(height: 16),
              SearchContentWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
