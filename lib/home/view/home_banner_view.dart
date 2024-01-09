import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../base/base_page_state.dart';

class HomeBannerView extends StatefulWidget {
  final List<String> items;
  final int? delay;
  final double? viewportFraction;

  HomeBannerView({
    super.key,
    required this.items,
    this.delay,
    this.viewportFraction,
  });

  @override
  State<StatefulWidget> createState() => _HomeBannerViewState();
}

class _HomeBannerViewState extends BasePageState<HomeBannerView>
    with WidgetsBindingObserver {
  Timer? _timer;
  bool _isTimeRunning = false;
  late PageController _controller;
  int _pagePosition = 0;

  int _getAutoScrollPositon() {
    return (_pagePosition == widget.items.length-1) ? 0: _pagePosition+1;
  }

  int _getMilliseconds(int position) {
    return position == 0 ? 1 : 500;
  }

  void _startTimer() {
    if (!_isTimeRunning) {
      _isTimeRunning = true;
      _timer = Timer.periodic(Duration(seconds: widget.delay ?? 5), (timer) {
        final position = _getAutoScrollPositon();
        _controller.animateToPage(position,
            duration: Duration(milliseconds: _getMilliseconds(position)),
            curve: Curves.easeInOut);
      });
    }
  }

  void _stopTimer() {
    if (_isTimeRunning) {
      _isTimeRunning = false;
      _timer?.cancel();
    }
  }

  void _onPageChanged(int index) {
    final pasition = index % widget.items.length;
    setState(() {
      _pagePosition = pasition;
    });
  }

  @override
  void initState() {
    _controller =
        PageController(viewportFraction: widget.viewportFraction ?? 1);
    _startTimer();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('didChangeAppLifecycleState:$state');
    if (state == AppLifecycleState.resumed) {
      print('startTimer');
      _startTimer();
    } else if (state == AppLifecycleState.paused) {
      _stopTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        pageSnapping: true,
        itemCount: widget.items.length,
        scrollDirection: Axis.horizontal,
        onPageChanged: _onPageChanged,
        controller: _controller,
        itemBuilder: (context, index) {
          var position = index % widget.items.length;
          return Container(
            color: Colors.grey,
            alignment: Alignment.center,
            child: Text(
              '${widget.items[position]}',
              style: TextStyle(color: Colors.red, fontSize: 50),
            ),
          );
        });
  }
}
