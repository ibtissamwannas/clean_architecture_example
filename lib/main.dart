import 'package:clean_architecture_example/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'core/theme.dart';
import 'injection.dart' as di;

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<ArticlesBloc>()),
        BlocProvider(create: (_) => di.locator<ArticleCategoryBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          primaryColor: kWhiteColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          colorScheme: kColorScheme.copyWith(secondary: kPrimaryColor),
        ),
        home: const HomePage(),
      ),
    );
  }
}
