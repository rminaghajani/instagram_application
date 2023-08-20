import 'package:flutter/material.dart';
import 'package:instagram/data/constants/constants.dart';

import '../data/model/enums/activity_status_enums.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with TickerProviderStateMixin {
  TabController? _tabcontroller;

  @override
  void initState() {
    super.initState();

    _tabcontroller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 60,
              child: TabBar(
                controller: _tabcontroller,
                labelStyle: Theme.of(context).textTheme.headlineMedium,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                indicatorWeight: 4,
                indicatorColor: pink,
                tabs: [
                  Tab(
                    text: 'Following',
                  ),
                  Tab(
                    text: 'You',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabcontroller,
                children: [
                  _getSampleList(),
                  _getSampleList(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getSampleList() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 20),
            child: Text(
              'New',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return _getRow(ActivityStatus.likes);
          }, childCount: 2),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 20),
            child: Text(
              'Today',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return _getRow(ActivityStatus.followBack);
          }, childCount: 5),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return _getRow(ActivityStatus.likes);
          }, childCount: 2),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 20),
            child: Text(
              'This Week',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return _getRow(ActivityStatus.following);
          }, childCount: 5),
        )
      ],
    );
  }

  Widget _getRow(ActivityStatus status) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 18),
      child: Row(
        children: [
          Container(
            height: 6,
            width: 6,
            decoration: BoxDecoration(
              color: pink,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(
            width: 7,
          ),
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('images/profile.png'),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'arminaghajani',
                    style: TextStyle(
                      fontFamily: 'GB',
                      fontSize: 12,
                      color: white,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Started Following',
                    style: TextStyle(
                      fontFamily: 'GM',
                      fontSize: 12,
                      color: gray,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    'you',
                    style: TextStyle(
                      fontFamily: 'GM',
                      fontSize: 12,
                      color: gray,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    '3min',
                    style: TextStyle(
                      fontFamily: 'GB',
                      fontSize: 12,
                      color: gray,
                    ),
                  )
                ],
              )
            ],
          ),
          Spacer(),
          _getActionActivityRow(status)
        ],
      ),
    );
  }

  Widget _getActionActivityRow(ActivityStatus status) {
    switch (status) {
      case ActivityStatus.followBack:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: pink,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            textStyle: TextStyle(
              color: white,
              fontFamily: 'GB',
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          onPressed: () {},
          child: Text('Follow'),
        );
      case ActivityStatus.likes:
        return SizedBox(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('images/item1.png'),
            ),
          ),
        );

      case ActivityStatus.following:
        return OutlinedButton(
          onPressed: () {},
          child: Text(
            'Message',
            style: TextStyle(
              fontFamily: 'GB',
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: gray,
            ),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: gray,
              width: 2,
            ),
          ),
        );
      default:
        return OutlinedButton(
          onPressed: () {},
          child: Text(
            'Message',
            style: TextStyle(
              fontFamily: 'GB',
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: gray,
            ),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: gray,
              width: 2,
            ),
          ),
        );
    }
  }
}
