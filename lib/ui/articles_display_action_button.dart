import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nayax_assignment/blocs/article_bloc.dart';

class ArticlesDisplayActionButton extends StatelessWidget {
  const ArticlesDisplayActionButton(
      {Key? key,
      required this.context,
      required this.text,
      required this.event})
      : super(key: key);

  final BuildContext context;
  final ArticleEvent event;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => BlocProvider.of<ArticleBloc>(context).add(event),
      child: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(primary: Colors.grey),
    );
  }
}
