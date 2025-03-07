import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:movie_app/features/search/presentation/cubit/selectable_option_cubit.dart';
import 'package:movie_app/features/search/presentation/widgets/selectable_option_widget.dart';

class SearchOptionsWidget extends StatelessWidget {
  const SearchOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectableOptionCubit, SearchType>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableOptionWidget(
              title: "Movies",
              isSelected:
                  context.read<SelectableOptionCubit>().state ==
                  SearchType.movie,
              onTap: () {
                context.read<SelectableOptionCubit>().selectMovie();
                context.read<SearchCubit>().search(
                  context.read<SearchCubit>().textEditingController.text,
                  context.read<SelectableOptionCubit>().state,
                );
              },
            ),
            const SizedBox(width: 16),
            SelectableOptionWidget(
              title: "TV Series",
              isSelected:
                  context.read<SelectableOptionCubit>().state ==
                  SearchType.televisionMovie,
              onTap: () {
                context.read<SelectableOptionCubit>().selectTelevisionMovie();
                
                context.read<SearchCubit>().search(
                  context.read<SearchCubit>().textEditingController.text,
                  context.read<SelectableOptionCubit>().state,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
