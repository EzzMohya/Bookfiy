import 'package:bookliy/Core/utils/app_constant.dart';
import 'package:bookliy/Core/utils/styles.dart';
import 'package:bookliy/Features/Home/presentation/views/widgets/best_seller_list.dart';
import 'package:bookliy/Features/Home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookliy/Features/Home/presentation/views/widgets/home_view_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: AppConstant.KPaddingHome,
                child: CustomAppBar(),
              ),
              FeatureHomeViewList(),
              SizedBox(
                height: 49,
              ),
              Padding(
                padding: AppConstant.KPaddingHome,
                child: Text(
                  'Newest',
                  style: Styles.styleSemiBold18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: AppConstant.KPaddingHome,
            child: NewestBooksList(),
          ),
        )
      ],
    );
  }
}
