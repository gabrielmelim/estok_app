import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin<HomePage> {

  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TesteHome'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'TODOS',),
            Tab(text: 'Em estoque',),
            Tab(text: 'Em aviso',),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(color: Colors.grey),
          Container(color: Colors.red),
          Container(color: Colors.amber),
        ],
      ),
    );
  }
}
