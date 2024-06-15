import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:howoldami/misc/locale.dart';
import 'package:howoldami/models/countryGraph.dart';

class CountrySelection extends ConsumerStatefulWidget {
  const CountrySelection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CountrySelectionState();
}

class _CountrySelectionState extends ConsumerState<CountrySelection> {
  bool _show = false;

  void _toggleVisibility() => setState(() {
        _show ^= true;
        if (!_show) {
          ref.read(selectedCountriesModelProvider.notifier).clearSelection();
        }
      });

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(selectedCountriesModelProvider);
    final model = ref.read(selectedCountriesModelProvider.notifier);
    final selectedCountries = state.selection;
    final suggestions = state.suggestions;
    // final nonSuggestedSelectableCountries = state.possible.where(
    //     (c) => !selectedCountries.contains(c) && !suggestions.contains(c));
    final _s = lstr(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_show) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              onChanged: model.search,
              decoration: InputDecoration(
                hintText: _s.countrySelection_search,
                prefixIcon: const Icon(Icons.search),
                // suffixIcon: IconButton(
                //   icon: const Icon(Icons.cancel),
                //   onPressed: model.clearSearch,
                // ),
                //no borders
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          countryList(selectedCountries, model, selectedCountries),
          countryList(
              suggestions.isEmpty ? state.possible : suggestions
              // ...nonSuggestedSelectableCountries
              ,
              model,
              selectedCountries),
        ],
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: _toggleVisibility,
            child: Row(
              children: [
                Icon(_show
                    ? Icons.cancel_outlined
                    : Icons.add_circle_outline_rounded),
                const SizedBox(width: 10),
                Text(_show
                    ? _s.countrySelection_collapse
                    : _s.countrySelection_expand),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget countryList(
    Iterable<Country> countries,
    SelectedCountriesModel model,
    Iterable<Country> selection,
  ) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          ...countries.map((c) {
            final isSelected = selection.contains(c);
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) =>
                      isSelected
                          ? Theme.of(context)
                              .colorScheme
                              .primaryContainer
                              .withOpacity(0.5)
                          : Theme.of(context).cardColor),
                  side: MaterialStateProperty.resolveWith(
                    (states) => isSelected
                        ? null
                        : BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.1),
                            width: 1,
                          ),
                  ),
                ),
                onPressed: () => model.toggle(c),
                child: Row(
                  children: [
                    c.icon,
                    const SizedBox(width: 5),
                    Text(c.name,
                        style: Theme.of(context).textTheme.labelMedium),
                  ],
                ),
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}
