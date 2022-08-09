import 'package:daily_scrum/presentation/widgets/weves_effect_stack.dart';
import 'package:flutter/material.dart';

class ListOfDailysItemWidget extends StatelessWidget {
  final String todoYesterday;
  final String todoToday;
  final String thereAnyImpediment;
  final void Function()? onTap;
  const ListOfDailysItemWidget({
    Key? key,
    required this.todoYesterday,
    required this.todoToday,
    required this.thereAnyImpediment,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 250,
      width: MediaQuery.of(context).size.width * 0.96,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            color: Color(0x33000000),
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      child: WevesEffectsStack(
        onTap: () => onTap?.call(),
        splashColor: Colors.grey.withAlpha(100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            buildQuestion(
              context,
              title: 'O que foi feito ontem?',
              answer: todoYesterday,
            ),
            buildQuestion(
              context,
              title: 'O que será feito hoje?',
              answer: todoToday,
            ),
            buildQuestion(
              context,
              title: 'Algum Impedimentos?',
              answer: thereAnyImpediment,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildQuestion(
    BuildContext context, {
    required String title,
    required String answer,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Text.rich(
        TextSpan(
          text: '$title\n',
          children: <InlineSpan>[
            TextSpan(
              text: answer,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .merge(const TextStyle(height: 2)),
            ),
          ],
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
