import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';

typedef ClikeCallbackFun  = void Function(int id);        //id 0->image.size-1
typedef MoveCallbackFun   = void Function(int id);        //id 0->image.size-1

class FlutterImageViewpager extends StatefulWidget {
  final List    images;     //图片组
  final double  width;      //控件的宽度
  final double  height;     //控件的高度
  final Color   dotcolor_c; //当前图片对应圆点颜色
  final Color   dotcolor_n; //圆点默认颜色
  final ClikeCallbackFun  onClick;      //图片点击后回调
  final MoveCallbackFun   onMouseMove;  //图片切换回调


  FlutterImageViewpager(
      this.images,
      {Key key,
        this.width          = double.infinity,
        this.height         = double.infinity,
        this.onClick,
        this.onMouseMove,
        this.dotcolor_c     = Colors.redAccent,
        this.dotcolor_n     = Colors.grey})
      : assert(images != null),
        assert(width > 0.0),
        assert(height > 0.0);

  @override
  FlutterImageViewpagerState createState() =>
      FlutterImageViewpagerState(images, width, height, dotcolor_c, dotcolor_n, onClick, onMouseMove);
}

class FlutterImageViewpagerState extends State<FlutterImageViewpager>
    with SingleTickerProviderStateMixin {
  List    _images;
  double  _width;
  double  _height;
  Color   _dotcolor_c;
  Color   _dotcolor_n;
  Timer   _countdownTimer;
  int     _adid = 0;
  var     _pageController = PageController(initialPage: 0);

  ClikeCallbackFun _onClick;
  MoveCallbackFun  _onMouseMove;

  //动画控制器
  AnimationController controller;
  Animation<Offset> animation;

  FlutterImageViewpagerState(
      this._images,
      this._width,
      this._height,
      this._dotcolor_c,
      this._dotcolor_n,
      this._onClick,
      this._onMouseMove) {
    _images.add(_images[0]);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //轮播动画
    _countdownTimer = new Timer.periodic(new Duration(seconds: 2), (timer) {
      if (_adid >= _images.length) {
        _adid = 0;
        _pageController.jumpToPage(0);
        _pageController.animateToPage(_adid + 1,
            duration: new Duration(milliseconds: 1000), curve: Curves.ease);
      } else {
        _pageController.animateToPage(_adid,
            duration: new Duration(milliseconds: 1000), curve: Curves.ease);
      }

      _adid++;
    });

    _initAnimation();
  }

  void dispose() {
    _countdownTimer.cancel();
    _pageController.dispose();
    controller.dispose();
    super.dispose();
  }

  _initAnimation() {
    //AnimationController是一个特殊的Animation对象，在屏幕刷新的每一帧，就会生成一个新的值，
    // 默认情况下，AnimationController在给定的时间段内会线性的生成从0.0到1.0的数字
    //用来控制动画的开始与结束以及设置动画的监听
    //vsync参数，存在vsync时会防止屏幕外动画（动画的UI不在当前屏幕时）消耗不必要的资源
    //duration 动画的时长，这里设置的 seconds: 1 为1秒，当然也可以设置毫秒 milliseconds：2000.
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation =
        Tween(begin: Offset.zero, end: Offset(0.5, 0)).animate(controller);
    //动画开始、结束、向前移动或向后移动时会调用StatusListener
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画从 controller.reverse() 反向执行 结束时会回调此方法
        //print("status is completed");
        controller.reverse();
        // controller.reset(); 将动画重置到开始前的状态
        //开始执行
        //controller.forward();
      } else if (status == AnimationStatus.dismissed) {
        //动画从 controller.forward() 正向执行 结束时会回调此方法
        //print("status is dismissed");
        controller.forward();
      } else if (status == AnimationStatus.forward) {
        //print("status is forward");
        //执行 controller.forward() 会回调此状态
      } else if (status == AnimationStatus.reverse) {
        //执行 controller.reverse() 会回调此状态
        //print("status is reverse");
        //controller.forward();
      }
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> widgets = new List();
    for (int i = 0; i < _images.length - 1; ++i) {
      widgets.add(Icon(
        Icons.brightness_1,
        size: 8,
        color: _adid == i || (_adid == _images.length - 1 && i == 0)
            ? _dotcolor_c
            : _dotcolor_n,
      )); //
    }

    return Container(
        width: _width,
        height: _height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              height: _height,
              child: PageView.builder(
                  itemCount: _images.length,
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  onPageChanged: (set) {
                    setState(() {
                      if (_adid == 0 && set == 0)
                        return;

                      _adid = set;
                      //debugPrint("adid:$_adid set:$set");
                      if (null != _onMouseMove){
                        _onMouseMove(_adid==_images.length-1?0:_adid);
                      }
                    });
                  },
                  itemBuilder: ((context, index) {
                    return GestureDetector(child:Image.asset(
                      _images[index],
                      fit: BoxFit.fitWidth,
                    ), onTap: (){
                      _onClick(index==_images.length-1?0:index);
                    },);
                  })),
            ),
        Align(
          alignment: Alignment.bottomCenter,
          child:ScrollingPageIndicator(
              dotColor: Colors.grey,
              dotSelectedColor: Color(0xFF8D1616),
              dotSize: 6,
              dotSelectedSize: 8,
              dotSpacing: 12,
              controller: _pageController,
              itemCount: _images.length,
              orientation: Axis.horizontal,
            )),
          ],
        ));
  }
}