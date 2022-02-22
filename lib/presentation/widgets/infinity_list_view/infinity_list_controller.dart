import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class InfinityListController extends GetxController {
  InfinityListController(this.maxItemsPage);

  final int maxItemsPage;

  final scrollController = ScrollController();

  final _loading = false.obs;
  final _currentPage = 0.obs;

  bool get loading => _loading.value;

  void changedLoading(bool value) => _loading.value = value;

  void resetValues() {
    _currentPage.value = 0;
    _loading.value = false;
  }

  void initialize(Future<void> Function() listener) async {
    scrollController.addListener(() async {
      final isPositionFinalOfList = scrollController.position.pixels ==
          scrollController.position.maxScrollExtent;

      if (isPositionFinalOfList) {
        await listener();
      }
    });
  }

  bool isAddLoadScroll(int itemScrollPosition, int lenght) {
    itemScrollPosition = itemScrollPosition + 1;
    final requestMoreData = itemScrollPosition == lenght;
    final pageToRequest = itemScrollPosition ~/ maxItemsPage;
    // log('${lenght - itemScrollPosition}');
    if (requestMoreData && pageToRequest > _currentPage.value) {
      _currentPage.value = pageToRequest;
      return true;
    }
    return false;
  }
}
