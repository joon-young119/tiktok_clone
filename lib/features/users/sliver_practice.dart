// customscroll view 와 sliver쓰는 법 연습

import 'package:flutter/material.dart';

class PracticeSliver extends StatelessWidget {
  const PracticeSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          floating: true,
          // stretch: true,
          // snap: true,
          pinned: true,
          backgroundColor: Colors.teal,
          collapsedHeight: 80,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text("Qwer"),
            background:
                Image.asset("assets/images/photo.jpg", fit: BoxFit.cover),
          ),
        ),
        SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              childCount: 50,
              (context, index) => Container(
                color: Colors.amber[100 * (index % 9)],
                child: Align(
                    alignment: Alignment.center, child: Text("QER $index")),
              ),
            ),
            itemExtent: 100),
        SliverPersistentHeader(
          delegate: CustomDelegate(),
          pinned: true,
          // floating: true,
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            childCount: 50,
            (context, index) => Container(
              color: Colors.blue[100 * (index % 9)],
              child:
                  Align(alignment: Alignment.center, child: Text("QER $index")),
            ),
          ),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 1),
        )
      ],
    );
  }
}

class CustomDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(Object context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.indigo,
      child: const FractionallySizedBox(
        heightFactor: 1,
        child: Center(child: Text("title!")),
      ),
    );
  }

  @override
  double get maxExtent => 150;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
