

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../Features/home/data/data_source/home_local_data_source.dart';
import '../../../Features/home/data/data_source/home_remote_data_source.dart';
import '../../../Features/home/data/repos/home_repo_impl.dart';
import '../api_service.dart';

final locate = GetIt.instance;

void setupServiceLocator() {
  locate.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  locate.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
        homeLocalDateSource:HomeLocalDateSourceImpl(),
        homeRemoteDataSource: HomeRemoteDataSourceImpl(
          locate.get<ApiService>(),
      ),
    ),
  );
}
