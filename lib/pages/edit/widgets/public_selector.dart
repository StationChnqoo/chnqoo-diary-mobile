import 'package:chnqoo_diary_mobile/widgets/my_card.dart';
import 'package:chnqoo_diary_mobile/widgets/my_switcher.dart';
import 'package:flutter/material.dart';

class PublicSelector extends StatefulWidget {
  final isPublic;
  final onPublicChanged;
  const PublicSelector(
      {super.key, required this.isPublic, required this.onPublicChanged});

  @override
  State<StatefulWidget> createState() => PublicSelectorState();
}

class PublicSelectorState extends State<PublicSelector> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MyCard(
        child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.router_outlined,
                color: Theme.of(context).primaryColor,
                size: 18,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                '同步到社区',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          MySwitcher(
              value: widget.isPublic,
              onChanged: (value) {
                widget.onPublicChanged(value);
              })
        ],
      ),
    ));
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant PublicSelector oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }
}
