
import 'package:clean_architecture_example/presentation/widgets/home/articles_widget.dart';
import 'package:clean_architecture_example/presentation/widgets/home/category_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<ArticlesBloc>().add(FetchArticles()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HEY FLUTTER TIMES',
          style: TextStyle(fontFamily: 'EnglishTowne', fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, color: Colors.black),
        ),
      ),
      body: ListView(
        children: const [
          CategoryList(),
          ArticlesWidget(),
        ],
      ),
    );
  }
}
