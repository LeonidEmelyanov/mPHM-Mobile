import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/base_bloc.dart';
import 'package:provider/provider.dart';

class LoadingWidget<B extends BaseBloc, T> extends StatelessWidget {
  final Widget Function(T item) tilesBuilder;

  const LoadingWidget({
    Key key,
    @required this.tilesBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer<B>(
        builder: (BuildContext _, B bloc, Widget __) => Stack(
              children: [
                AnimatedOpacity(
                  opacity: bloc.isLoading ?? false ? 0 : 1,
                  duration: Duration(milliseconds: 300),
                  child: RefreshIndicator(
                    onRefresh: () =>
                        bloc.loading(reload: true, showLoading: false),
                    child: ListView.builder(
                      itemCount: bloc.data?.length ?? 0,
                      itemBuilder: (_, index) => tilesBuilder(bloc.data[index]),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: bloc.isLoading ?? false ? 1 : 0,
                  duration: Duration(milliseconds: 300),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            ),
      );
}
