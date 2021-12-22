import 'package:ejaratest/common/components/components.dart';
import 'package:ejaratest/services/services.dart';
import 'package:ejaratest/transactions/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Ethereum Provider that strems our api
final bitcoinProvider = FutureProvider<BTC>(
  (ref) async {
    LatestResponseModel assetsModel = LatestResponseModel();
    BTC transactions = BTC();
    assetsModel = await HashAPI.getLatest();
    transactions = await BTCAPI.getLatest(hashcode: assetsModel.hash!);
    return transactions;
  },
);

class Transaction extends ConsumerWidget {
  const Transaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //router agurments
    final args = ModalRoute.of(context)!.settings.arguments;
    var bitcoin = ref.watch(bitcoinProvider);
    return AppWrapper(
      appBar: CustomAppBar(
        title: Text(args.toString()),
      ),
      child: bitcoin.when(
        data: (bitcoin) => ListView.builder(
          itemCount: 10,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) => ExpandableCardContainer(
            transactionHash: bitcoin.tx[index]['hash'],
            isSpent: bitcoin.tx[index]['out'].first['spent'],
            size: bitcoin.tx[index]['size'].toString(),
            weight: bitcoin.tx[index]['weight'],
          ),
        ),
        loading: () => const LoadingScreen(),
        error: (error, stack) => const ErrorScreen(),
      ),
    );
  }
}
