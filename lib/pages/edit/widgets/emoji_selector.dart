import 'package:chnqoo_diary_mobile/constants/config.dart';
import 'package:chnqoo_diary_mobile/constants/x.dart';
import 'package:chnqoo_diary_mobile/widgets/my_card.dart';
import 'package:chnqoo_diary_mobile/widgets/my_icon_button.dart';
import 'package:flutter/material.dart';

class EmojiSelector extends StatefulWidget {
  final String emoji;
  final onPress;

  const EmojiSelector({
    super.key,
    required this.emoji,
    required this.onPress,
  });

  @override
  State<StatefulWidget> createState() => EmojiSelectorState();
}

class EmojiSelectorState extends State<EmojiSelector> {
  bool isPanelOpen = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    int emojiContainerSize =
        ((MediaQuery.of(context).size.width - 24 - 24) / 8).toInt();

    return MyCard(
        child: Container(
            child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.network('${Config.CDN}/wechat/${widget.emoji}',
                    height: 24, width: 24),
                SizedBox(
                  width: 4,
                ),
                Text(
                  '心情',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            MyIconButton(
              onPress: () {
                setState(() {
                  isPanelOpen = !isPanelOpen;
                });
              },
              icon: Icon(
                isPanelOpen
                    ? Icons.expand_less_outlined
                    : Icons.expand_more_outlined,
                color: Colors.black54,
                size: 16,
              ),
              reverse: true,
              text: Text(
                '更多表情',
                style: TextStyle(color: Colors.black54, fontSize: 14),
              ),
            )
          ],
        ),
        Container(
            child: isPanelOpen
                ? Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Wrap(
                      runAlignment: WrapAlignment.spaceBetween,
                      children: [
                        ...x.useWechatEmojis().map(
                              (e) => GestureDetector(
                                onTap: () {
                                  widget.onPress(e);
                                  setState(() {
                                    isPanelOpen = !isPanelOpen;
                                  });
                                },
                                child: Container(
                                  // margin: EdgeInsets.symmetric(vertical: 1),
                                  // padding: EdgeInsets.symmetric(horizontal: 2),
                                  height: emojiContainerSize * 1.0,
                                  width: emojiContainerSize * 1.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          emojiContainerSize / 2),
                                      border: Border.all(
                                          width: 1,
                                          color: e == widget.emoji
                                              ? Theme.of(context).primaryColor
                                              : Colors.transparent)),
                                  child: Center(
                                    child: Image.network(
                                        '${Config.CDN}/wechat/${e}',
                                        height: emojiContainerSize - 12,
                                        width: emojiContainerSize - 12),
                                  ),
                                ),
                              ),
                            )
                      ],
                    ),
                  )
                : Container())
      ],
    )));
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant EmojiSelector oldWidget) {
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
