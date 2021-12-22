import 'package:ejaratest/common/components/components.dart';
import 'package:ejaratest/services/services.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'models/tazos_model.dart' as model;

/// Ethereum Provider that sync ethereums data
final tezosProvider = FutureProvider<model.Tazos>(
  (ref) async {
    model.Tazos tezos = model.Tazos();
    tezos = await TezosAPI.getLatest();
    return tezos;
  },
);

class Tezos extends ConsumerWidget {
  const Tezos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments;
    var tezos = ref.watch(tezosProvider);
    return AppWrapper(
      appBar: CustomAppBar(
        title: Text(args.toString()),
      ),
      child: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              'The Api fail to give us the detail\non latest block',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.normal,
                    fontSize: 17,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          tezos.when(
            data: (tezos) => ExpandableCardContainer(
              transactionHash: tezos.hash,
              size: tezos.level.toString(),
              weight: tezos.priority,
            ),
            loading: () => const LoadingScreen(),
            error: (error, stack) => const ErrorScreen(),
          )
        ],
      ),
    );
  }
}
