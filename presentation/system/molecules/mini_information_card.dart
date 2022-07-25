import 'package:admin/data/models/add_categoric_model.dart';
import 'package:admin/ui/themes/color_constants.dart';
import 'package:admin/data/models/daily_info_model.dart';
import 'package:admin/ui/widgets/atoms/app_button_widget.dart';
import 'package:flutter/material.dart';

class MiniInformationCard extends StatefulWidget {
  const MiniInformationCard({
    Key? key,
    required this.categoricData,
    required this.formCurrentDatas,
  }) : super(key: key);
  final AddCategoricModel categoricData;
  final Map<String, String> formCurrentDatas;

  @override
  _MiniInformationCardState createState() => _MiniInformationCardState();
}

class _MiniInformationCardState extends State<MiniInformationCard> {
  bool _visible = false;

  TextEditingController _controller = TextEditingController();

  void _toggle() {
    setState(() {
      _visible = !_visible;
    });
  }

  int charLength = 0;

  bool status = false;
  bool _closeIcon = true;

  _onChanged(String value) {
    setState(() {
      charLength = value.length;
    });

    if (charLength >= 1) {
      setState(() {
        _closeIcon = _closeIcon;
        status = true;
        widget.formCurrentDatas[widget.categoricData.specialKey!] =
            _controller.value.text;
      });
    } else {
      setState(() {
        _closeIcon = !_closeIcon;
        status = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width * 0.3,
      // height: MediaQuery.of(context).size.height * 0.2,
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // padding: EdgeInsets.all(defaultPadding * 0.75),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: widget.categoricData.color!.withOpacity(0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Icon(
                  widget.categoricData.icon,
                  color: widget.categoricData.color,
                  size: 18,
                ),
              ),
            ],
          ),
          // SizedBox(height: 8),
          GestureDetector(
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${widget.categoricData.title!}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Visibility(
                      visible: false,
                      child: Icon(Icons.create, size: 18),
                    )
                  ],
                ),
              ),
              onTap: () {
                _toggle();
              }),
          SizedBox(
            height: 2,
          ),
          Visibility(
            visible: true,
            child: new Container(
              height: 60,
              // padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
              child: new Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(8.0),
                child: ListTile(
                  title: TextField(
                    controller: _controller,
                    decoration: new InputDecoration(
                      hintText: '${widget.categoricData.title} gir...',
                      border: InputBorder.none,
                    ),
                    onChanged: _onChanged,
                  ),
                  trailing: charLength >= 1
                      ? IconButton(
                          icon: new Icon(Icons.delete_sweep),
                          onPressed: () {
                            _controller.clear();
                            _toggle();
                            status = false;
                          },
                        )
                      : null,
                ),
              ),
            ),
          ),
          Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible: false,
            child: Container(
              // padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0),
              // margin: EdgeInsets.only(top: 15),
              height: 40,
              child: Center(
                child: AppButton(
                  type: ButtonType.PRIMARY,
                  text: "Kaydet",
                  onPressed: () {
                    print('Button clicked..');
                    _showDialog(context);
                    _toggle();
                    status = false;
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }

  _showDialog(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Container(
            child: Row(
      children: [
        Icon(
          Icons.verified,
          color: bgColor,
        ),
        SizedBox(
          width: 25,
        ),
        Text('Değer kaydedildi..'),
      ],
    ))));
  }
}
