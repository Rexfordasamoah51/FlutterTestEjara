import 'package:flutter/material.dart';

class ExpandableCardContainer extends StatefulWidget {
  const ExpandableCardContainer({
    Key? key,
    this.transactionHash,
    this.isSpent = false,
    this.size,
    this.weight,
  }) : super(key: key);

  final String? transactionHash;
  final bool isSpent;
  final int? weight;
  final String? size;

  @override
  State<ExpandableCardContainer> createState() =>
      _ExpandableCardContainerState();
}

class _ExpandableCardContainerState extends State<ExpandableCardContainer> {
  final int index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionPanelList(
        animationDuration: const Duration(milliseconds: 1000),
        dividerColor: Colors.red,
        elevation: 1,
        children: [
          ExpansionPanel(
            body: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _Description(
                    title: 'Size',
                    value: widget.size,
                  ),
                  _Description(
                    title: 'Weight',
                    value: widget.weight.toString(),
                  ),
                ],
              ),
            ),
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  widget.transactionHash ?? '',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: widget.isSpent ? Colors.red : Colors.black,
                      ),
                ),
              );
            },
            isExpanded: itemData[index].expanded!,
          )
        ],
        expansionCallback: (int item, bool status) {
          setState(() {
            itemData[index].expanded = !itemData[index].expanded!;
          });
        },
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({
    Key? key,
    this.title,
    this.value,
  }) : super(key: key);

  final String? title;
  final String? value;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Text(
        title ?? '',
        style: TextStyle(
          color: Colors.grey[700],
          fontSize: 15,
          letterSpacing: 0.3,
          height: 1.3,
        ),
      ),
      trailing: Text(
        value ?? '',
        style: TextStyle(
          color: Colors.grey[700],
          fontSize: 15,
          letterSpacing: 0.3,
          height: 1.3,
        ),
      ),
    );
  }
}

List<ItemModel> itemData = <ItemModel>[
  ItemModel(
      headerItem: 'Android',
      discription: "${0.00000001 + 0.6000}",
      colorsItem: Colors.green,
      img: 'assets/btc.jpg'),
];

class ItemModel {
  bool? expanded;
  String? headerItem;
  String? discription;
  Color? colorsItem;
  String? img;

  ItemModel(
      {this.expanded = false,
      this.headerItem,
      this.discription,
      this.colorsItem,
      this.img});
}
