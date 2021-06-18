import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:test_task/screens/detail/detail_screen.dart';
import 'package:test_task/widgets/widgets.dart';

import 'bloc/country_bloc.dart';

class CountryScreen extends StatefulWidget {
  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountryBloc, CountryState>(
      builder: (context, state) {
        return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
            
                appBar: _buildAppBarOptions(
                    state: state,
                    controller: _textController,
                    context: context),
                body: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                      numericCode:
                                          state.countries[index].numericCode,
                                      borders: state.countries[index].borders,
                                      latLngs: state.countries[index].latlng,
                                      currencies:
                                          state.countries[index].currencies,
                                    )),
                          );
                        },
                        child: Slidable(
                            direction: Axis.horizontal,
                            actionPane: SlidableDrawerActionPane(),
                            child: CountryCard(
                              name: state.countries[index].name,
                              subregion: state.countries[index].subregion.index
                                  .toString(),
                              alpha2code: state.countries[index].alpha2Code,
                              flagUrl: state.countries[index].flag,
                            ),
                            secondaryActions: [
                              IconSlideAction(
                                  caption: 'Delete',
                                  color: Colors.red,
                                  icon: Icons.delete,
                                  onTap: () => context.read<CountryBloc>()
                                    ..add(CountryDeletedItem(
                                        countries: state.countries,
                                        index: index))),
                            ]),
                      ),
                    );
                  },
                  itemCount: state.countries.length,
                )));
      },
    );
  }
}

Widget _buildAppBarOptions({
  @required CountryState state,
  @required TextEditingController controller,
  @required BuildContext context,
}) {
  switch (state.status) {
    case CountryStatus.loading:
      return AppBar(
        title: Center(
            child: CircularProgressIndicator(
          color: Colors.white,
        )),
      );
    case CountryStatus.error:
      return AppBar(
        title: Column(
          children: [
            Text("Error,try again"),
            FloatingActionButton(
              onPressed: () {
                context.read<CountryBloc>()..add(CountryMadeRequest());
              }, 
            )
          ],
        ),
      );
    default:
      return AppBar(
        
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: InputBorder.none,
              hintText: "Enter country name",
            ),
            textInputAction: TextInputAction.search,
            textAlignVertical: TextAlignVertical.center,
            onSubmitted: (value) {
              if (value.trim().length > 3) {
                context
                    .read<CountryBloc>()
                    .add(CountrySearchedCountry(countryName: value.trim()));
              }
            },
          ),
        ),
      );
  }
}
