import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterhole_again/bloc/whitelist/whitelist_bloc.dart';
import 'package:flutterhole_again/bloc/whitelist/whitelist_state.dart';
import 'package:flutterhole_again/service/globals.dart';
import 'package:flutterhole_again/service/routes.dart';

class WhitelistFloatingActionButton extends StatefulWidget {
  @override
  _WhitelistFloatingActionButtonState createState() =>
      _WhitelistFloatingActionButtonState();
}

class _WhitelistFloatingActionButtonState
    extends State<WhitelistFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    final WhitelistBloc whitelistBloc = BlocProvider.of<WhitelistBloc>(context);
    return BlocBuilder(
      bloc: whitelistBloc,
      builder: (context, state) {
        if (state is WhitelistStateSuccess) {
          return FloatingActionButton(
              tooltip: 'Add to whitelist',
              onPressed: () async {
                final domain =
                    await Globals.router.navigateTo(context, whitelistAddPath);
                if (domain != null)
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Added $domain to whitelist')));
              },
              child: Icon(Icons.add));
        }

        return Container();
      },
    );
  }
}