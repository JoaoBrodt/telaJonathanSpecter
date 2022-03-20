import 'package:demeter_app/features/refund/presentation/dtos/refund_dto.dart';
import 'package:demeter_design_system/demeter_design_system.dart';
import 'package:demeter_design_system/export.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DashboardOptionItemWidget extends StatelessWidget {
  final RefundDto refund;
  const DashboardOptionItemWidget({Key? key, required this.refund})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxWidth: kIsWeb ? 300 : getProportionateScreenWidth(200),
          maxHeight: 149),
      child: Container(
        margin: const EdgeInsets.symmetric(
            vertical: AdaptativeTheme.mediumSpace,
            horizontal: AdaptativeTheme.smallSpace),
        child: Card(
          elevation: 10,
          shadowColor: Colors.black.withOpacity(0.8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  margin: const EdgeInsets.all(AdaptativeTheme.smallSpace),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: _TravelTitleDescriptionWidget(refund: refund),
                      ),
                      _ItemDescriptionWidget(refund: refund),
                      _RowTypeValueWidget(
                        refund: refund,
                      ),
                    ],
                  ),
                ),
              ),
              const _ContainerButtonWidget()
            ],
          ),
        ),
      ),
    );
  }
}

class _TravelTitleDescriptionWidget extends StatelessWidget {
  final RefundDto refund;
  const _TravelTitleDescriptionWidget({Key? key, required this.refund})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (refund.type == 'TRAVEL') {
      return Text(
        '${AppLocalizations.of(context)!.start} : ${refund.dateStartFormatted} ${AppLocalizations.of(context)!.finish} : ${refund.dateEndFormatted}',
        style: Theme.of(context).textTheme.bodySmall,
        overflow: TextOverflow.ellipsis,
      );
    } else {
      return Text(
        '${AppLocalizations.of(context)!.purchase} ${refund.dateFormatted}',
        style: Theme.of(context).textTheme.bodySmall,
        overflow: TextOverflow.ellipsis,
      );
    }
  }
}

class _ItemDescriptionWidget extends StatelessWidget {
  final RefundDto refund;
  const _ItemDescriptionWidget({Key? key, required this.refund})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: AdaptativeTheme.minimunExtraSpace),
          child: Icon(Icons.flight, size: 10),
        ),
        Flexible(
          child: Text(
            refund.description,
            style: Theme.of(context).brightness == Brightness.dark
                ? Theme.of(context).textTheme.labelMedium
                : Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 15,
                    ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _RowTypeValueWidget extends StatelessWidget {
  final RefundDto refund;
  const _RowTypeValueWidget({Key? key, required this.refund}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Row(
            children: [
              const Icon(Icons.wallet_travel, size: 12),
              Flexible(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: AdaptativeTheme.minimunSpace),
                  child: Text(
                    refund.type,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          'R\$ ${refund.value}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class _ContainerButtonWidget extends StatelessWidget {
  const _ContainerButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(AdaptativeTheme.minRounded),
            bottomRight: Radius.circular(AdaptativeTheme.minRounded)),
      ),
      child: OutlinedButton(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: AdaptativeTheme.minimunSpace),
              child: Icon(Icons.add_circle, color: Colors.white, size: 12),
            ),
            Text(
              AppLocalizations.of(context)!.seeMore,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}
