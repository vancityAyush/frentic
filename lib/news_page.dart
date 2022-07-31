import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import 'models/News.dart';

class Info extends StatefulWidget {
  News news;
  Info(this.news);
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  HtmlEditorController controller = HtmlEditorController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "News",
            style: TextStyle(
              color: Colors.green,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            // physics: BouncingScrollPhysics(),
            // padding: EdgeInsets.symmetric(horizontal: 10),
            children: [
              Text(
                widget.news.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: HtmlWidget(
                  widget.news.content,
                  renderMode: RenderMode.listView,
                  webView: true,
                ),
              ),
              // HtmlEditor(
              //   controller: controller,
              //   htmlEditorOptions: HtmlEditorOptions(
              //     initialText: widget.news.content,
              //     disabled: true,
              //     adjustHeightForKeyboard: false,
              //   ),
              //   otherOptions: OtherOptions(
              //     height: size.height - 160,
              //   ),
              //   htmlToolbarOptions: const HtmlToolbarOptions(
              //     toolbarPosition: ToolbarPosition.custom,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
