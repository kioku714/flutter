import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:handle/page/vehicle_list_item.dart';
import 'package:handle/remote_api.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../model/vehicle.dart';

_VehicleListPage _vehicleListPage = _VehicleListPage();

class VehicleListPage extends StatefulWidget {
  VehicleListPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _VehicleListPage createState() => _vehicleListPage;

  void scrollToTop() {
    _vehicleListPage._scrollToTop();
  }
}

class _VehicleListPage extends State<VehicleListPage> {
  static const _pageSize = 20;
  static var _page = 1;

  final PagingController<int, Vehicle> _pagingController =
      PagingController(firstPageKey: 0);
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await RemoteApi.getVehicles(_page);

      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
      _page++;
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) => RefreshIndicator(
        onRefresh: () => Future.sync(
          () => _pagingController.refresh(),
        ),
        child: PagedListView<int, Vehicle>.separated(
          pagingController: _pagingController,
          scrollController: _scrollController,
          builderDelegate: PagedChildBuilderDelegate<Vehicle>(
            itemBuilder: (context, item, index) => VehicleListItem(
              vehicle: item,
              index: index,
            ),
          ),
          separatorBuilder: (context, index) => const Divider(),
        ),
      );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(_scrollController.position.minScrollExtent,
        duration: Duration(microseconds: 1000), curve: Curves.fastOutSlowIn);
  }
}
