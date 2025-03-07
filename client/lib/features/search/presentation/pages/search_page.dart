import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/presentation/widgets/app/app_bar_widget.dart';
import 'package:movie_app/features/search/presentation/cubit/selectable_option_cubit.dart';
import 'package:movie_app/features/search/presentation/widgets/search_field_widget.dart';
import 'package:movie_app/features/search/presentation/widgets/selectable_option_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: Text("Search")),
      body: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => SelectableOptionCubit())],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SearchFieldWidget(),
              const SizedBox(height: 16),
              BlocBuilder<SelectableOptionCubit, SearchType>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SelectableOptionWidget(
                        title: "Movies",
                        isSelected:
                            context.read<SelectableOptionCubit>().state ==
                            SearchType.movie,
                        onTap:
                            () =>
                                context
                                    .read<SelectableOptionCubit>()
                                    .selectMovie(),
                      ),
                      const SizedBox(width: 16),
                      SelectableOptionWidget(
                        title: "TV Series",
                        isSelected:
                            context.read<SelectableOptionCubit>().state ==
                            SearchType.televisionMovie,
                        onTap:
                            () =>
                                context
                                    .read<SelectableOptionCubit>()
                                    .selectTelevisionMovie(),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
