import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:handle/page/vehicle_list_item.dart';
import 'package:handle/remote_api.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../model/vehicle.dart';

class VehicleListPage extends StatefulWidget {
  VehicleListPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _VehicleListPage createState() => _VehicleListPage();
}

class _VehicleListPage extends State<VehicleListPage> {
  static const _pageSize = 20;
  static const _page = 1;

  final PagingController<int, Vehicle> _pagingController =
      PagingController(firstPageKey: 0);

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
}
