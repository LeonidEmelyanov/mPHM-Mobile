import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/base_bloc.dart';
import 'package:provider/provider.dart';

class LoadingWidget<T> extends StatelessWidget {
  final BaseBloc bloc;
  final Widget Function(T item) tilesBuilder;

  const LoadingWidget({
    Key key,
    this.bloc,
    this.tilesBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider.value(
        notifier: bloc,
        child: Stack(
          children: [
            AnimatedOpacity(
              opacity: bloc.isLoading ?? false ? 0 : 1,
              duration: Duration(milliseconds: 300),
              child: RefreshIndicator(
                onRefresh: () => bloc.loading(reload: true, showLoading: false),
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
