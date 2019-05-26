import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mphm_mobile/src/blocs/base_bloc.dart';
import 'package:provider/provider.dart';

class LoadingWidget<T> extends StatelessWidget {
  final String title;
  final BaseBloc bloc;
  final Widget Function(T item) getListTiles;

  const LoadingWidget({
    Key key,
    this.title,
    this.bloc,
    this.getListTiles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ChangeNotifierProvider.value(
        notifier: bloc,
        child: Stack(
          children: [
            AnimatedOpacity(
              opacity: bloc.isLoading ?? false ? 0 : 1,
              duration: Duration(milliseconds: 300),
              child: RefreshIndicator(
                onRefresh: () => bloc.loading(true),
                child: ListView.builder(
                  itemCount: bloc.data?.length ?? 0,
                  itemBuilder: (context, index) =>
                      getListTiles(bloc.data[index]),
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
      ),
    );
  }
}
