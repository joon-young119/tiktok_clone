import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

final tabs = [
  "인기",
  "동영상",
  "사용자",
  "사운드",
  "라이브",
  "장소",
  "해시태그",
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchEditingController =
      TextEditingController();

  void _stopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _searchEditingController.clear();
    });
  }

  @override
  void initState() {
    super.initState();

    _searchEditingController.addListener(() {
      setState(() {});
    });

    _tabController = TabController(
      length: tabs.length,
      vsync: this,
    );

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          _stopWriting();
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        resizeToAvoidBottomInset: false, //키보드 생성될 때 배경 화면 안바뀌게함
        appBar: AppBar(
            elevation: 1,
            // title: CupertinoSearchTextField(
            //   controller: _searchEditingController,
            //   onChanged: _onSearchChanged,
            //   onSubmitted: _onSearchSubmitted,
            // ),
            title: Stack(children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size32,
                ),
                child: SizedBox(
                  height: Sizes.size36,
                  child: TextField(
                    controller: _searchEditingController,
                    textInputAction: TextInputAction.newline,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      hintText: "검색",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Sizes.size12),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: Sizes.size10, horizontal: Sizes.size12),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: Sizes.size14),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          if (_searchEditingController.text.isNotEmpty)
                            GestureDetector(
                              onTap: _stopWriting,
                              child: FaIcon(
                                FontAwesomeIcons.solidCircleXmark,
                                color: Colors.grey.shade800,
                              ),
                            )
                        ]),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            bottom: TabBar(
              controller: _tabController,
              splashFactory: NoSplash.splashFactory,
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
              isScrollable: true,
              unselectedLabelColor: Colors.grey.shade500,
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              labelStyle: const TextStyle(
                  fontWeight: FontWeight.w600, fontSize: Sizes.size16),
              tabs: [
                for (var tab in tabs)
                  Tab(
                    text: tab,
                  )
              ],
            )),
        body: TabBarView(controller: _tabController, children: [
          GridView.builder(
              keyboardDismissBehavior:
                  ScrollViewKeyboardDismissBehavior.onDrag, // 배경 드래그 하면 키보드 사라짐
              padding: const EdgeInsets.all(Sizes.size6),
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: Sizes.size10,
                  mainAxisSpacing: Sizes.size10,
                  childAspectRatio: 9 / 22),
              itemBuilder: (context, index) => Column(children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: AspectRatio(
                        aspectRatio: 9 / 16,
                        child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholder: "assets/images/photo.jpg",
                          image:
                              "https://images.unsplash.com/photo-1425082661705-1834bfd09dca?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fCVFQiU4RiU5OSVFQiVBQyVCQ3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=1400&q=60",
                        ),
                      ),
                    ),
                    Gaps.v10,
                    const Text(
                      "안녕 나는 햄스터야. 자신있으면 나랑 한 따까리 해볼래? 쫄리면 뒤지시던가",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Sizes.size16,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Gaps.v5,
                    DefaultTextStyle(
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold),
                      child: Row(
                        children: [
                          const CircleAvatar(
                              // backgroundImage: NetworkImage(
                              //     "https://scontent-ssn1-1.xx.fbcdn.net/v/t39.30808-6/278504999_3199372880382359_8450734078474215150_n.jpg?_nc_cat=107&cb=99be929b-59f725be&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=jeQ0d_MDaIQAX-yEis9&_nc_ht=scontent-ssn1-1.xx&oh=00_AfAruRzeuBXA2o98njSFWDET4JAXTLb1LDDUGDSEYpRT-Q&oe=64A2C141"),
                              // radius: 12,
                              ),
                          Gaps.h4,
                          const Expanded(
                            child: Text(
                              "박준영박준영박준영박준영박준영",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Gaps.h4,
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: Sizes.size16,
                            color: Colors.grey.shade600,
                          ),
                          Gaps.h2,
                          const Text(
                            "2.5M",
                          )
                        ],
                      ),
                    ),
                  ])),
          for (var tab in tabs.skip(1))
            Center(
              child: Text(
                tab,
                style: const TextStyle(fontSize: Sizes.size28),
              ),
            )
        ]),
      ),
    );
  }
}
