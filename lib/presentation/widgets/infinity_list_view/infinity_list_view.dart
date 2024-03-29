import 'package:daily_scrum/presentation/widgets/infinity_list_view/infinity_list_controller.dart';
import 'package:flutter/material.dart';

class InfinityListView extends StatelessWidget {
  final InfinityListController controller;
  final int itemCount;
  final String emptyText;
  final Widget Function(int) itemBuilder;
  final Future<void> Function()? onRefresh;
  final Axis scrollDirection;
  final double itemHeight;
  final double? itemWidth;

  const InfinityListView({
    Key? key,
    required this.controller,
    required this.itemBuilder,
    required this.itemHeight,
    this.itemCount = 0,
    this.emptyText = 'Nenhum resultado encontrado.',
    this.scrollDirection = Axis.vertical,
    this.onRefresh,
    this.itemWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return onRefresh == null
        ? buildInfinityList(context)
        : RefreshIndicator(
            onRefresh: () async => await onRefresh?.call(),
            child: buildInfinityList(context),
          );
  }

  Container buildInfinityList(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 0),
      height: (itemCount == 1 ? itemCount : itemCount - 1) * itemHeight + 200,
      width: scrollDirection == Axis.horizontal
          ? (itemCount == 1 ? itemCount : itemCount - 1) * (itemWidth ?? 0) +
              100
          : null,
      child: controller.loading
          ? const Center(child: CircularProgressIndicator())
          : itemCount == 0
              ? Center(
                  child: Text(
                    emptyText,
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                )
              : ListView.builder(
                  scrollDirection: scrollDirection,
                  controller: controller.scrollController,
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    if (controller.isAddLoadScroll(index, itemCount)) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 70,
                          vertical: 70.0,
                        ),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      );
                    }

                    return itemBuilder(index);
                  },
                  physics: const BouncingScrollPhysics(),
                ),
    );
  }
}
