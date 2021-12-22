import 'package:flutter/material.dart';

class CoinInformation {
  final String title;
  final String imagePath;
  final String description;

  CoinInformation(this.title, this.description, this.imagePath);
}

List coinInformation = [
  CoinInformation(
      'Bitcoin',
      'Blockchain information for\nBitcoin (BTC) including the data\nfor the transactions.',
      'assets/btc.jpg'),
  CoinInformation(
      'Tezos',
      'Non-detail information about Tezos\nwith data on the latest block',
      'assets/Tezos.jpg'),
  CoinInformation(
      'Ethereum',
      'Blockchain information for Ethereum\nincluding the data for the\nlatest transactions.',
      'assets/eth.jpg'),
];
