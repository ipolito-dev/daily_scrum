import 'package:daily_scrum/core/common/theme/colors_theme.dart';
import 'package:daily_scrum/core/common/utils/snack_bars_util.dart';
import 'package:daily_scrum/domain/entities/daily_entity.dart';
import 'package:daily_scrum/presentation/list_of_dailys/list_of_dailys_bloc/list_of_dailys_controller_bloc.dart';
import 'package:daily_scrum/presentation/list_of_dailys/list_of_dailys_bloc/list_of_dailys_event.dart';
import 'package:daily_scrum/presentation/list_of_dailys/list_of_dailys_bloc/list_of_dailys_state.dart';
import 'package:daily_scrum/presentation/list_of_dailys/widgets/list_of_dailys_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class ListOfDailysPageBloc extends StatelessWidget {
  static const String routeName = '/list_of_dailys_page_bloc';
  final ListOfDailysControllerBloc controller;
  const ListOfDailysPageBloc({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      // onRefresh: () => controller.reloadList(),
      onRefresh: () async => controller..add(ListOfDailysFechtDailys()),
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: BlocBuilder<ListOfDailysControllerBloc, ListOfDailysState>(
              bloc: controller..add(ListOfDailysFechtDailys()),
              builder: (_, state) {
                if (state is ListOfDailyLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ListOfDailyLoadedState) {
                  return buildListView();
                } else if (state is ListOfDailyUpdateState) {
                  return buildListView();
                } else if (state is ListOfDailyErrorState) {
                  _showSnackBar(context, state.menssage);
                  return buildListView();
                }
                return const SizedBox.shrink();
              }),
        ),
      ),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: controller.dailys.length,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemBuilder: (context, index) {
        final DailyEntity daily = controller.dailys[index];
        return ListOfDailysItemWidget(
          todoYesterday: daily.todoYesterday,
          todoToday: daily.todoToday,
          thereAnyImpediment: daily.thereAnyImpediment,
          onTap: () => controller.openModallEdit(daily, context),
        );
      },
    );
  }

  void _showSnackBar(BuildContext context, String menssage) {
    final snackBar = SnackBar(
      content: Text(menssage),
      backgroundColor: ColorsTheme.backgroundColorDark,
      action: SnackBarAction(
        label: 'Sair',
        onPressed: () {},
      ),
    );
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
}
