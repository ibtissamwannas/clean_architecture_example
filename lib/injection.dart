import 'package:clean_architecture_example/data/datasource/article_remote_datasource.dart';
import 'package:clean_architecture_example/data/repositories/article_repo_impl.dart';
import 'package:clean_architecture_example/domain/bloc/article_category_bloc/articles_category_bloc.dart';
import 'package:clean_architecture_example/domain/bloc/articles_bloc/articles_bloc.dart';
import 'package:clean_architecture_example/domain/repositories/article_repo.dart';
import 'package:clean_architecture_example/domain/usecases/article_usercases.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> init() async {
  locator.registerLazySingleton(
    () => ArticlesBloc(
      getArticleListUseCase: locator(),
    ),
  );
  locator.registerLazySingleton(
    () => ArticlesByCategoryBloc(
      getArticleListByCategoryUseCase: locator(),
    ),
  );
  locator.registerLazySingleton(
    () => GetArticleListUseCase(locator()),
  );
  locator.registerLazySingleton(
    () => GetArticleListByCategoryUseCase(locator()),
  );
  locator.registerLazySingleton<ArticleRepository>(
    () => ArticleRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<ArticleRemoteDataSource>(
    () => ArticleRemoteDataSourceImpl(
      client: locator(),
    ),
  );
  locator.registerLazySingleton(() => http.Client());
}
