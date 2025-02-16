import 'package:clean_architecture_example/domain/bloc/article_category_bloc/articles_category_bloc.dart';
import 'package:clean_architecture_example/domain/bloc/articles_bloc/articles_bloc.dart';
import 'package:clean_architecture_example/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'core/theme.dart';
import 'injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<ArticlesBloc>()),
        BlocProvider(create: (_) => di.locator<ArticlesByCategoryBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          primaryColor: kWhiteColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          colorScheme: kColorScheme.copyWith(secondary: kPrimaryColor),
        ),
        // ThemeData.light().copyWith(
        //   primaryColor: kWhiteColor,
        //   textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        //   colorScheme: kColorScheme.copyWith(secondary: kPrimaryColor),
        // ),
        home: const HomePage(),
      ),
    );
  }
}
