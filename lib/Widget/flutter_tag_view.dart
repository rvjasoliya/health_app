import 'package:flutter/material.dart';

typedef DeleteTag<T> = void Function(T index);

typedef TagTitle<String> = Widget Function(String tag);


class FlutterTagView extends StatefulWidget {

  FlutterTagView({
    this.tags,
    this.minTagViewHeight = 0,
    this.maxTagViewHeight = 150,
    this.tagBackgroundColor = Colors.black12,
    this.selectedTagBackgroundColor = Colors.lightBlue,
    this.deletableTag = true,
    this.onDeleteTag,
    this.tagTitle,
    this.onTap,
    this.onValueTap
  }) : assert(tags != null,
  'Tags can\'t be empty\nProvide the list of tags'
  );

  List<String> tags;
  Color tagBackgroundColor;
  Color selectedTagBackgroundColor;
  bool deletableTag;
  double maxTagViewHeight;
  double  minTagViewHeight;
  DeleteTag<int> onDeleteTag;
  TagTitle<String> tagTitle;
  VoidCallback onTap;
  Function(String) onValueTap;

  @override
  _FlutterTagViewState createState() => _FlutterTagViewState();
}

class _FlutterTagViewState extends State<FlutterTagView> {

  int selectedTagIndex = -1;

  @override
  Widget build(BuildContext context) {
    return getTagView();
  }

  Widget getTagView() {
    return ConstrainedBox(
        constraints:BoxConstraints(
          minHeight: widget.minTagViewHeight,
          maxHeight: widget.maxTagViewHeight,
        ),
        child: SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.start,
            spacing: 5.0,
            direction: Axis.horizontal,
            children: buildTags(),
          ),
        )
    );
  }

  List<Widget> buildTags() {
    List<Widget> tags = <Widget>[];
    for(int i = 0; i < widget.tags.length; i++) {
      tags.add(createTag(i, widget.tags[i]));
    }
    return tags;
  }

  Widget createTag(int index, String tagTitle) {
    return GestureDetector(
      onTap: (){
        widget.onValueTap(tagTitle);
      },
      child: Chip(
        backgroundColor: widget.tagBackgroundColor,
        label: widget.tagTitle == null ? Text(tagTitle) : widget.tagTitle(tagTitle),
        deleteIcon: Icon(Icons.cancel),
        onDeleted: widget.deletableTag ? () {
          if(widget.deletableTag)
            deleteTag(index);
        } : null,
      ),
    );
  }

  void deleteTag(int index) {
    if(widget.onDeleteTag != null)
      widget.onDeleteTag(index);
    else {
      setState(() {
        widget.tags.removeAt(index);
      });
    }
  }
}