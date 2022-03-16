import 'package:daily_scrum/presentation/widgets/weves_effect_stack.dart';
import 'package:flutter/material.dart';

class InitialListItemWidget extends StatelessWidget {
  final String todoYesterday;
  final String todoToday;
  final String thereAnyImpediment;
  final void Function()? onTap;
  const InitialListItemWidget({
    Key? key,
    required this.todoYesterday,
    required this.todoToday,
    required this.thereAnyImpediment,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.96,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x33000000),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(16),
        ),
        child: WevesEffectsStack(
          onTap: () {
            onTap?.call();
          },
          splashColor: Colors.grey.withAlpha(100),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'O que foi feito ontem?\n $todoToday',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                            'O que será feito hoje? $todoYesterday. \n\nImpedimentos: $thereAnyImpediment. ',
                            style: Theme.of(context).textTheme.bodyText2,
                            overflow: TextOverflow.fade,
                            maxLines: 4),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
