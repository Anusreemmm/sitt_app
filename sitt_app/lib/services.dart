import 'package:flutter/material.dart';
import 'package:sitt_app/book_service.dart';
import 'package:sitt_app/botnav.dart';
import 'package:sitt_app/home.dart';

class services extends StatefulWidget {
  const services({super.key});

  @override
  State<services> createState() => _servicesState();
}

class _servicesState extends State<services> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(250.0),
        child: Stack(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('asset/home_service.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 10,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(text: 'Daily Services'),
                Tab(text: 'Packages'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildGridView(),
                Center(child: Text('Packages Coming Soon')),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: botnav(),
    );
  }

  Widget _buildGridView() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => book(),
              ));
            },
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                      child: Image.asset('asset/featured.png', width: double.infinity, fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Home visit doctor, nursing assistant', style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('250', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 16)),
                            Text(' SAR', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
