import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/bloc/cubit/cubit/business_cubit.dart';
import 'package:news_app/bloc/cubit/news_cubit.dart';
import 'package:news_app/components/Custom_diveder.dart';
import 'package:news_app/components/news_container.dart';
import 'package:news_app/models/app_colors.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BusinessCubit()..getBusinessData(),
      child: BlocConsumer<BusinessCubit, BusinessState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BusinessCubit.get(context);
          return state is! BusinessGetNewsSucssesState
              ? Center(child: CircularProgressIndicator())
              : ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (Context, index) {
                    return NewsContainer(
                      description: cubit.requests!.articles?[index].description,
                      title: cubit.requests!.articles?[index].title,
                      date: cubit.requests!.articles?[index].publishedAt,
                      imageUrl: cubit.requests!.articles?[index].urlToImage,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return CustomDiveder();
                  },
                  itemCount: cubit.requests!.articles!.length);
        },
      ),
    );
  }
}
