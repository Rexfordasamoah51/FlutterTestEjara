import 'package:ejaratest/common/components/custom_app_bar.dart';
import 'package:ejaratest/common/components/widget_wrapper.dart';
import 'package:ejaratest/common/values/color.dart';
import 'package:ejaratest/home/home_models.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppWrapper(
      appBar: CustomAppBar(
        title: const Text('Coins'),
      ),
      child: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: _NewsListView(),
      ),
    );
  }
}

class _NewsListView extends StatelessWidget {
  const _NewsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => NewsList(
          imagePath: coinInformation[index].imagePath,
          description: coinInformation[index].description,
          title: coinInformation[index].title,
        ),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: coinInformation.length,
      ),
    );
  }
}

class NewsList extends StatelessWidget {
  const NewsList({
    Key? key,
    this.imagePath,
    this.description,
    this.title,
  }) : super(key: key);

  final String? title;
  final String? imagePath;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        title.toString().toLowerCase(),
        arguments: title,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description ?? "",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'View all transactions',
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: kPrimaryColor,
                      ),
                )
              ],
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath ?? ''),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            )
          ],
        ),
      ),
    );
  }
}
