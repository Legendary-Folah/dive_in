import 'package:dive_in_app/logic/home_page_notifier.dart';
import 'package:dive_in_app/logic/theme_provider.dart';
import 'package:dive_in_app/models/page_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late HomePageNotifier _homePageNotifier;
  late HomePageData _homePageData;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: width,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.02,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [allPokemonList(context, ref)],
            ),
          ),
        ),
      ),
    );
  }

  Widget allPokemonList(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final darkMode = ref.watch(themeProvider);
    return SizedBox(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  ref.read(themeProvider.notifier).state = !darkMode;
                },
                icon: darkMode ? Icon(Icons.light_mode) : Icon(Icons.dark_mode),
              ),
            ],
          ),
          Text(
            'All Pokemons',
            style: TextStyle(fontSize: 20, letterSpacing: 2.0),
          ),
          SizedBox(
            height: height * 0.6,
            child: ListView.builder(
              itemCount: 0,
              itemBuilder: (context, index) {
                return ListTile();
              },
            ),
          ),
        ],
      ),
    );
  }
}
