// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:blocs/blocs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_samples/flutter_architecture_samples.dart';

class StatsCounter extends StatefulWidget {
  final StatsBloc Function() buildBloc;

  StatsCounter({Key key, @required this.buildBloc})
      : super(key: key ?? ArchSampleKeys.statsCounter);

  @override
  StatsCounterState createState() {
    return new StatsCounterState();
  }
}

class StatsCounterState extends State<StatsCounter> {
  StatsBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = widget.buildBloc();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Padding(
            padding: new EdgeInsets.only(bottom: 8.0),
            child: new Text(
              ArchSampleLocalizations.of(context).completedTodos,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          new Padding(
            padding: new EdgeInsets.only(bottom: 24.0),
            child: new StreamBuilder<int>(
              stream: bloc.numComplete,
              builder: (context, snapshot) => new Text(
                    '${snapshot.data ?? 0}',
                    key: ArchSampleKeys.statsNumCompleted,
                    style: Theme.of(context).textTheme.subhead,
                  ),
            ),
          ),
          new Padding(
            padding: new EdgeInsets.only(bottom: 8.0),
            child: new Text(
              ArchSampleLocalizations.of(context).activeTodos,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          new Padding(
            padding: new EdgeInsets.only(bottom: 24.0),
            child: new StreamBuilder<int>(
              stream: bloc.numActive,
              builder: (context, snapshot) {
                return new Text(
                  "${snapshot.data ?? 0}",
                  key: ArchSampleKeys.statsNumActive,
                  style: Theme.of(context).textTheme.subhead,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
