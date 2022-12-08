import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/cubit/cubit/cubit/sciece_cubit.dart';
import 'package:news_app/bloc/cubit/news_cubit.dart';

import 'package:news_app/components/Custom_diveder.dart';
import 'package:news_app/components/news_container.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScieceCubit()..getScienceData(),
      child: BlocConsumer<ScieceCubit, ScieceState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ScieceCubit.get(context);

          return cubit.requests?.articles!.length != null
              ? ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return NewsContainer(
                      title: cubit.requests!.articles?[index].title,
                      date: cubit.requests!.articles?[index].publishedAt,
                      imageUrl: cubit.requests!.articles?[index].urlToImage,
                      description: cubit.requests!.articles?[index].description,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return CustomDiveder();
                  },
                  itemCount: cubit.requests!.articles!.length)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
