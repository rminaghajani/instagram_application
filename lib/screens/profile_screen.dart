import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram/data/constants/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'images/item8.png',
                    fit: BoxFit.cover,
                  ),
                ),
                expandedHeight: 170,
                backgroundColor: mainColor,
                toolbarHeight: 80,
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 18, top: 18),
                    child: Icon(Icons.menu),
                  )
                ],
                bottom: PreferredSize(
                  child: Container(
                    height: 14,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                  ),
                  preferredSize: Size.fromHeight(10),
                ),
              ),
              SliverToBoxAdapter(
                child: _getHeaderProfile(context),
              ),
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: TabBarViewDelegate(
                  TabBar(
                    indicatorPadding: EdgeInsets.only(bottom: 4),
                    indicatorWeight: 2,
                    indicatorColor: pink,
                    tabs: [
                      Tab(
                        icon: Image.asset('images/icon_tab_posts.png'),
                      ),
                      Tab(
                        icon: Image.asset('images/icon_tab_bookmark.png'),
                      ),
                    ],
                  ),
                ),
              )
            ];
          },
          body: TabBarView(
            children: [
              CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(top: 20, left: 18, right: 18),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(((context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset('images/item$index.png'),
                            ),
                          ),
                        );
                      }), childCount: 10),
                      gridDelegate: SliverQuiltedGridDelegate(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          repeatPattern: QuiltedGridRepeatPattern.inverted,
                          pattern: [
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(2, 2),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                          ]),
                    ),
                  )
                ],
              ),
              CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(top: 20, left: 18, right: 18),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(((context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset('images/item$index.png'),
                            ),
                          ),
                        );
                      }), childCount: 10),
                      gridDelegate: SliverQuiltedGridDelegate(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          repeatPattern: QuiltedGridRepeatPattern.inverted,
                          pattern: [
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(2, 2),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                          ]),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getHeaderProfile(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: pink,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(13)),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset('images/profile.png'),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            height: 70,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'arminaghajani',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Front-end developer',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Image.asset('images/icon_profile_edit.png')
        ],
      ),
    );
  }
}

class TabBarViewDelegate extends SliverPersistentHeaderDelegate {
  TabBarViewDelegate(this._tabBar);
  final TabBar _tabBar;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: mainColor,
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
