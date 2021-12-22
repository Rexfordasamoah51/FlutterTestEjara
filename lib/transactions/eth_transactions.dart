import 'package:ejaratest/common/components/components.dart';
import 'package:ejaratest/services/services.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'models/eth_model.dart';

/// Ethereum Provider that strems our api
final ethereumsProvider = FutureProvider<Ether>(
  (ref) async {
    Ether ether = Ether();
    ether = await EtherCAPI.getLatest() ;
    return ether;
  },
);

class Ethereum extends ConsumerWidget {
  const Ethereum({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments;
    var ether = ref.watch(ethereumsProvider);
    return AppWrapper(
      appBar: CustomAppBar(
        title: Text(args.toString()),
      ),
      child: ether.when(
        data: (ether) => ListView.builder(
          itemCount: 10,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) => ExpandableCardContainer(
            transactionHash: ether.transactions[index]['hash'],
            size: ether.transactions[index]['gas'].toString(),
            weight: ether.transactions[index]['value'],
          ),
        ),
        loading: () => const LoadingScreen(),
        error: (error, stack) => const ErrorScreen(),
      ),
    );
  }
}
