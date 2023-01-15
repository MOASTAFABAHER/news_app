import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/bloc/cubit/cubit/cubit/search_cubit.dart';
import 'package:news_app/bloc/cubit/news_cubit.dart';
import 'package:news_app/models/app_colors.dart';

import '../components/Custom_diveder.dart';
import '../components/news_container.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = SearchCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'News App',
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    onChanged: (value) {
                      SearchCubit.get(context).getSearchData(value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: searchController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                              width: 3, color: AppColors.krorangeColor)),
                      labelText: 'search',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: state is! SearchGetNewsSuccsesState
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return NewsContainer(
                              title: cubit.requests!.articles?[index].title,
                              date:
                                  cubit.requests!.articles?[index].publishedAt,
                              imageUrl:
                                  cubit.requests!.articles?[index].urlToImage,
                              description:
                                  cubit.requests!.articles?[index].description,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return CustomDiveder();
                          },
                          itemCount: cubit.requests?.articles!.length == null
                              ? 0
                              : cubit.requests!.articles!.length),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
