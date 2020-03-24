//import 'dart:io';
//
//import 'package:ads/ads.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_country_picker/flutter_country_picker.dart';
//import 'package:vpnlab/models/server.dart';
//import 'package:vpnlab/utils/utils.dart';
//import 'package:flutter_vpn/flutter_vpn.dart';
//import 'package:animator/animator.dart';
//import 'package:vpnlab/widgets/main_drawer.dart';
//import 'package:vpnlab/widgets/profile_tile.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:firebase_admob/firebase_admob.dart';
//
///// Made a high-level variable to be accessible to ads_test.dart
//Ads ads;
//
//final String appId =
//Platform.isAndroid ? 'ca-app-pub-3940256099942544~3347511713' : 'ca-app-pub-3940256099942544~1458002511';
//final String bannerUnitId =
//Platform.isAndroid ? 'ca-app-pub-2416770986772858/6575282257' : 'ca-app-pub-3940256099942544/2934735716';
//final String screenUnitId =
//Platform.isAndroid ? 'ca-app-pub-2416770986772858/5865121221' : 'ca-app-pub-3940256099942544/4411468910';
//final String videoUnitId =
//Platform.isAndroid ? 'ca-app-pub-2416770986772858/6192138877' : 'ca-app-pub-3940256099942544/1712485313';
//
//final String nativeAdId =
//Platform.isAndroid ? 'ca-app-pub-3940256099942544/2247696110' : 'ca-app-pub-3940256099942544/1712485313';
//
//
//class MainPage extends StatefulWidget {
//  MainPage({Key key}) : super(key: key);
//
//  _MainPageState createState() => _MainPageState();
//}
//
//class _MainPageState extends State<MainPage> {
//  final GlobalKey _menuKey = new GlobalKey();
//  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
//  final bgColorDisconnected = [Color(0xFF000000), Color(0x55DD473D)];
//  final bgColorConnected = [Color(0xFF000000), Color(0xFF37AC53)];
//  final bgColorConnecting = [Color(0xFF000000), Color(0x66CCAD00)];
//
//  var state = FlutterVpnState.disconnected;
//
//  final List<Server> _allServers = Server.allServers();
//
//
//  int _selectedIndex = 0;
//  int initOption = 1;
//  int _coins = 0;
//
//  Country _selected;
//
//  @override
//  void initState() {
//    super.initState();
//
//    adSetup();
//
//    FlutterVpn.prepare();
//    FlutterVpn.onStateChanged.listen((s) {
//      if (s == FlutterVpnState.connected) {
//        // Device Connected
//      }
//      if (s == FlutterVpnState.disconnected) {
//        // Device Disconnected
//      }
//      setState(() {
//        state = s;
//      });
//    });
//
//
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//  }
//
//  void connectVpn() {
//    ////Show full screen ad
//    ads.showFullScreenAd(state: this).then((x) {
//      if (state == FlutterVpnState.connected) {
//        FlutterVpn.disconnect();
//      } else {
//        FlutterVpn.simpleConnect(
//            "35.229.109.225.sslip.io", "tensai", "tensai321@");
//      }
//      print("connect");
//    });
//
//  }
//
//  void changeServer() {
//
//  }
//
//  void _showModalBottomSheet(BuildContext context) {
//
//  }
//
//  Widget serverConnection(context) {
//    return new GestureDetector(
//      onTap: () {
//        _showModalBottomSheet(context);
//      },
//      child: new Row(
//        children: <Widget>[
//          new Container(
//            width: screenAwareSize(30.0, context),
//            height: screenAwareSize(30.0, context),
//            decoration: new BoxDecoration(
//              // Circle shape
//              shape: BoxShape.circle,
//              color: Colors.white,
//              // The border you want
//              border: new Border.all(
//                width: screenAwareSize(2.0, context),
//                color: Colors.white,
//              ),
//              // The shadow you want
//            ),
//            child: DecoratedBox(
//              decoration: BoxDecoration(
//                image: DecorationImage(
//                  image: AssetImage('assets/performance.png'),
//                  // ...
//                ),
//                // ...
//              ),
//            ),
//          ),
//          SizedBox(width: screenAwareSize(10.0, context)),
//          Text(
//            "Fastest Server",
//            style: TextStyle(
//                color: Colors.white, fontFamily: "Montserrat-SemiBold"),
//          ),
//          SizedBox(width: screenAwareSize(5.0, context)),
//          Icon(Icons.arrow_drop_up, color: Colors.white)
//        ],
//      ),
//    );
//  }
//
//  Widget buildUi(BuildContext context) {
//    if (state == FlutterVpnState.connected) {
//      //bağlı
//      return Row(
//        mainAxisSize: MainAxisSize.max,
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          Center(
//              child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Text(
//                "TAP TO\nTURN OFF VPN",
//                textAlign: TextAlign.center,
//                style: TextStyle(
//                    color: Colors.white,
//                    fontFamily: "Montserrat-SemiBold",
//                    fontSize: 16.0),
//              ),
//              SizedBox(height: screenAwareSize(35.0, context)),
//              SizedBox(
//                width: screenAwareSize(190.0, context),
//                height: screenAwareSize(190.0, context),
//                child: FloatingActionButton(
//                  elevation: 0,
//                  backgroundColor: Colors.green,
//                  onPressed: connectVpn,
//                  child: new Icon(Icons.power_settings_new,
//                      size: screenAwareSize(150.0, context)),
//                ),
//              ),
//              SizedBox(height: screenAwareSize(50.0, context)),
////              serverConnection(context),
//              SizedBox(height: screenAwareSize(30.0, context)),
//
//
//              Text(
//                "YOUR INTERNET CONNECTION\nIS PROTECTED",
//                textAlign: TextAlign.center,
//                style: TextStyle(
//                    color: Colors.white,
//                    fontFamily: "Montserrat-SemiBold",
//                    fontSize: 12.0),
//              ),
//              SizedBox(height: screenAwareSize(40.0, context)),
//            ],
//          ))
//        ],
//      );
//    } else if (state == FlutterVpnState.connecting) {
//      // bağlanıyor
//      return Row(
//        mainAxisSize: MainAxisSize.max,
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          Center(
//              child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//
//              Animator(
//                duration: Duration(seconds: 2),
//                repeats: 0,
//                builder: (anim) => FadeTransition(
//                      opacity: anim,
//                      child: Text(
//                        "CONNECTING",
//                        textAlign: TextAlign.center,
//                        style: TextStyle(
//                            color: Colors.white,
//                            fontFamily: "Montserrat-SemiBold",
//                            fontSize: 20.0),
//                      ),
//                    ),
//              ),
//              SizedBox(height: screenAwareSize(35.0, context)),
//              SpinKitRipple(
//                color: Colors.white,
//                size: 190.0,
//              ),
//              SizedBox(height: screenAwareSize(50.0, context)),
////              serverConnection(context),
//              SizedBox(height: screenAwareSize(30.0, context)),
//              Text(
//                "CONNECTING VPN SERVER",
//                textAlign: TextAlign.center,
//                style: TextStyle(
//                    color: Colors.white,
//                    fontFamily: "Montserrat-SemiBold",
//                    fontSize: 12.0),
//              ),
//              SizedBox(height: screenAwareSize(40.0, context)),
//            ],
//          ))
//        ],
//      );
//    } else {
//      // bağlı değil
//      return Row(
//        mainAxisSize: MainAxisSize.max,
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          Center(
//              child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//
//
//
//              Text(
//                "TAP TO\nTURN ON VPN",
//                textAlign: TextAlign.center,
//                style: TextStyle(
//                    color: Colors.white,
//                    fontFamily: "Montserrat-SemiBold",
//                    fontSize: 16.0),
//              ),
//              SizedBox(height: screenAwareSize(35.0, context)),
//              SizedBox(
//                width: screenAwareSize(190.0, context),
//                height: screenAwareSize(190.0, context),
//                child: FloatingActionButton(
//                  elevation: 0,
//                  backgroundColor: Colors.white,
//                  onPressed: connectVpn,
//                  child: new Icon(Icons.power_settings_new,
//                      color: Colors.green,
//                      size: screenAwareSize(150.0, context)),
//                ),
//              ),
//              SizedBox(height: screenAwareSize(50.0, context)),
////              serverConnection(context),
//              SizedBox(height: screenAwareSize(30.0, context)),
//
//
//              Text(
//                "Change Server",
//                textAlign: TextAlign.center,
//                style: TextStyle(
//                    color: Colors.white,
//                    fontFamily: "Montserrat-SemiBold",
//                    fontSize: 22.0),
//              ),
//
//            CountryPicker(
//              dense: false,
//              showFlag: true,  //displays flag, true by default
//              showDialingCode: false, //displays dialing code, false by default
//              showName: true, //displays country name, true by default
//              showCurrency: false, //eg. 'British pound'
//              showCurrencyISO: false, //eg. 'GBP'
//
//              //////////// on country changed ////////////
//              onChanged: (Country country) {
//
//                ////Show full screen ad
//                ads.showFullScreenAd(state: this).then((x) {
//                  setState(() {
//                    _selected = country;
//                  });
//                });
//
//
//              },
//              selectedCountry: _selected,
//            ),
//              SizedBox(height: 22,),
//
//
//              Text(
//                "YOUR INTERNET CONNECTION\nISN'T PROTECTED",
//                textAlign: TextAlign.center,
//                style: TextStyle(
//                    color: Colors.white,
//                    fontFamily: "Montserrat-SemiBold",
//                    fontSize: 12.0),
//              ),
//              SizedBox(height: screenAwareSize(40.0, context)),
//            ],
//          ))
//        ],
//      );
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      width: double.infinity,
//      decoration: BoxDecoration(
//          image: new DecorationImage(
//            image: new AssetImage("assets/map-pattern.png"),
//            fit: BoxFit.contain,
//          ),
//          gradient: LinearGradient(
//              colors: state == FlutterVpnState.connected
//                  ? bgColorConnected
//                  : (state == FlutterVpnState.connecting
//                      ? bgColorConnecting
//                      : bgColorDisconnected),
//              begin: Alignment.topCenter,
//              end: Alignment.bottomCenter,
//              tileMode: TileMode.clamp)),
//      child: Scaffold(
//          key: _scaffoldKey,
//          backgroundColor: Colors.transparent,
////          drawer: MainDrawer(),
//          appBar: AppBar(
//            iconTheme: new IconThemeData(color: Colors.white),
//            backgroundColor: Colors.transparent,
//            elevation: 0.0,
//            title: Text("VPNLab",
//                style: TextStyle(
//                    color: Colors.white,
//                    fontSize: screenAwareSize(18.0, context),
//                    fontFamily: "Montserrat-Bold")),
//            centerTitle: true,
//          ),
//          body: buildUi(context)),
//    );
//  }
//
//  ////////////////////// Ads setup ////////////////////
//  void adSetup() {
//    switch (initOption) {
//      case 1:
//
//      /// Assign a listener.
//        var eventListener = (MobileAdEvent event) {
//          if (event == MobileAdEvent.clicked) {
//            print("The opened ad is clicked on.");
//          }
//        };
//
//        ads = Ads(
//          appId,
//          bannerUnitId: bannerUnitId,
//          screenUnitId: screenUnitId,
//          videoUnitId: videoUnitId,
//          keywords: <String>['downloader', 'videos'],
//          contentUrl: 'http://www.ibm.com',
//          childDirected: false,
//          testDevices: ['WAS LX2J'],
//          testing: false,
//          listener: eventListener,
//        );
//
//        break;
//
//      case 2:
//        ads = Ads(appId);
//
//        /// Assign the listener.
//        var eventListener = (MobileAdEvent event) {
//          if (event == MobileAdEvent.closed) {
//            print("User has opened and now closed the ad.");
//          }
//        };
//
//        /// You can set the Banner, Fullscreen and Video Ads separately.
//
//        ads.setBannerAd(
//          adUnitId: bannerUnitId,
//          size: AdSize.banner,
//          keywords: ['downloader', 'videos'],
//          contentUrl: 'http://www.andrioussolutions.com',
//          childDirected: false,
//          testDevices: [''],
//          listener: eventListener,
//        );
//
//        ads.setFullScreenAd(
//            adUnitId: screenUnitId,
//            keywords: ['downloader', 'videos'],
//            contentUrl: 'http://www.fluttertogo.com',
//            childDirected: false,
//            testDevices: [''],
//            listener: (MobileAdEvent event) {
//              if (event == MobileAdEvent.opened) {
//                print("An ad has opened up.");
//              }
//            });
//
//        var videoListener = (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
//          if (event == RewardedVideoAdEvent.rewarded) {
//            print("The video ad has been rewarded.");
//          }
//        };
//
//        ads.setVideoAd(
//          adUnitId: videoUnitId,
//          keywords: ['downloader', 'videos'],
//          contentUrl: 'http://www.publang.org',
//          childDirected: true,
//          testDevices: null,
//          listener: videoListener,
//        );
//
//        break;
//
//      case 3:
//        ads = Ads(appId);
//
//        /// Assign the listener.
//        var eventListener = (MobileAdEvent event) {
//          if (event == MobileAdEvent.closed) {
//            print("User has opened and now closed the ad.");
//          }
//        };
//
//        /// You just show the Banner, Fullscreen and Video Ads separately.
//
//        ads.showBannerAd(
//          adUnitId: bannerUnitId,
//          size: AdSize.banner,
//          keywords: ['downloader', 'videos'],
//          contentUrl: 'http://www.andrioussolutions.com',
//          childDirected: false,
//          testDevices: [''],
//          listener: eventListener,
//        );
//
//        ads.showFullScreenAd(
//            adUnitId: screenUnitId,
//            keywords: ['downloader', 'videos'],
//            contentUrl: 'http://www.fluttertogo.com',
//            childDirected: false,
//            testDevices: [''],
//            listener: (MobileAdEvent event) {
//              if (event == MobileAdEvent.opened) {
//                print("An ad has opened up.");
//              }
//            });
//
//        var videoListener = (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
//          if (event == RewardedVideoAdEvent.rewarded) {
//            print("The video ad has been rewarded.");
//          }
//        };
//
//        ads.showVideoAd(
//          adUnitId: videoUnitId,
//          keywords: ['downloader', 'videos'],
//          contentUrl: 'http://www.publang.org',
//          childDirected: true,
//          testDevices: null,
//          listener: videoListener,
//        );
//
//        break;
//
//      default:
//        ads = Ads(appId, testing: true);
//    }
//
//    ads.eventListener = (MobileAdEvent event) {
//      switch (event) {
//        case MobileAdEvent.loaded:
//          print("An ad has loaded successfully in memory.");
//          break;
//        case MobileAdEvent.failedToLoad:
//          print("The ad failed to load into memory.");
//          break;
//        case MobileAdEvent.clicked:
//          print("The opened ad was clicked on.");
//          break;
//        case MobileAdEvent.impression:
//          print("The user is still looking at the ad. A new ad came up.");
//          break;
//        case MobileAdEvent.opened:
//          print("The Ad is now open.");
//          break;
//        case MobileAdEvent.leftApplication:
//          print("You've left the app after clicking the Ad.");
//          break;
//        case MobileAdEvent.closed:
//          print("You've closed the Ad and returned to the app.");
//          break;
//        default:
//          print("There's a 'new' MobileAdEvent?!");
//      }
//    };
//
//    MobileAdListener eventHandler = (MobileAdEvent event) {
//      print("This is an event handler.");
//    };
//
//    ads.bannerListener = (MobileAdEvent event) {
//      switch (event) {
//        case MobileAdEvent.loaded:
//          print("An ad has loaded successfully in memory.");
//          break;
//        case MobileAdEvent.failedToLoad:
//          print("The ad failed to load into memory.");
//          break;
//        case MobileAdEvent.clicked:
//          print("The opened ad was clicked on.");
//          break;
//        case MobileAdEvent.impression:
//          print("The user is still looking at the ad. A new ad came up.");
//          break;
//        case MobileAdEvent.opened:
//          print("The Ad is now open.");
//          break;
//        case MobileAdEvent.leftApplication:
//          print("You've left the app after clicking the Ad.");
//          break;
//        case MobileAdEvent.closed:
//          print("You've closed the Ad and returned to the app.");
//          break;
//        default:
//          print("There's a 'new' MobileAdEvent?!");
//      }
//    };
//
//    ads.removeBanner(eventHandler);
//
//    ads.removeEvent(eventHandler);
//
//    ads.removeScreen(eventHandler);
//
//    ads.screenListener = (MobileAdEvent event) {
//      switch (event) {
//        case MobileAdEvent.loaded:
//          print("An ad has loaded successfully in memory.");
//          break;
//        case MobileAdEvent.failedToLoad:
//          print("The ad failed to load into memory.");
//          break;
//        case MobileAdEvent.clicked:
//          print("The opened ad was clicked on.");
//          break;
//        case MobileAdEvent.impression:
//          print("The user is still looking at the ad. A new ad came up.");
//          break;
//        case MobileAdEvent.opened:
//          print("The Ad is now open.");
//          break;
//        case MobileAdEvent.leftApplication:
//          print("You've left the app after clicking the Ad.");
//          break;
//        case MobileAdEvent.closed:
//          print("You've closed the Ad and returned to the app.");
//          break;
//        default:
//          print("There's a 'new' MobileAdEvent?!");
//      }
//    };
//
//    ads.videoListener = (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
//      switch (event) {
//        case RewardedVideoAdEvent.loaded:
//          print("An ad has loaded successfully in memory.");
//          break;
//        case RewardedVideoAdEvent.failedToLoad:
//          print("The ad failed to load into memory.");
//          break;
//        case RewardedVideoAdEvent.opened:
//          print("The ad is now open.");
//          break;
//        case RewardedVideoAdEvent.leftApplication:
//          print("You've left the app after clicking the Ad.");
//          break;
//        case RewardedVideoAdEvent.closed:
//          print("You've closed the Ad and returned to the app.");
//          break;
//        case RewardedVideoAdEvent.rewarded:
//          print("The ad has sent a reward amount.");
//          break;
//        case RewardedVideoAdEvent.started:
//          print("You've just started playing the Video ad.");
//          break;
//        case RewardedVideoAdEvent.completed:
//          print("You've just finished playing the Video ad.");
//          break;
//        default:
//          print("There's a 'new' RewardedVideoAdEvent?!");
//      }
//    };
//
//    VoidCallback handlerFunc = () {
//      print("The opened ad was clicked on.");
//    };
//
//    ads.banner.loadedListener = () {
//      print("An ad has loaded successfully in memory.");
//    };
//
//    ads.banner.removeLoaded(handlerFunc);
//
//    ads.banner.failedListener = () {
//      print("An ad failed to load into memory.");
//    };
//
//    ads.banner.removeFailed(handlerFunc);
//
//    ads.banner.clickedListener = () {
//      print("The opened ad is clicked on.");
//    };
//
//    ads.banner.removeClicked(handlerFunc);
//
//    ads.banner.impressionListener = () {
//      print("The user is still looking at the ad. A new ad came up.");
//    };
//
//    ads.banner.removeImpression(handlerFunc);
//
//    ads.banner.openedListener = () {
//      print("You've closed an ad and returned to your app.");
//    };
//
//    ads.banner.removeOpened(handlerFunc);
//
//    ads.banner.leftAppListener = () {
//      print("You left the app and gone to the ad's website.");
//    };
//
//    ads.banner.removeLeftApp(handlerFunc);
//
//    ads.banner.closedListener = () {
//      print("You've closed an ad and returned to your app.");
//    };
//
//    ads.banner.removeClosed(handlerFunc);
//
//    ads.screen.loadedListener = () {
//      print("An ad has loaded into memory.");
//    };
//
//    ads.screen.removeLoaded(handlerFunc);
//
//    ads.screen.failedListener = () {
//      print("An ad has failed to load in memory.");
//    };
//
//    ads.screen.removeFailed(handlerFunc);
//
//    ads.screen.clickedListener = () {
//      print("The opened ad was clicked on.");
//    };
//
//    ads.screen.removeClicked(handlerFunc);
//
//    ads.screen.impressionListener = () {
//      print("You've clicked on a link in the open ad.");
//    };
//
//    ads.screen.removeImpression(handlerFunc);
//
//    ads.screen.openedListener = () {
//      print("The ad has opened.");
//    };
//
//    ads.screen.removeOpened(handlerFunc);
//
//    ads.screen.leftAppListener = () {
//      print("The user has left the app and gone to the opened ad.");
//    };
//
//    ads.screen.leftAppListener = handlerFunc;
//
//    ads.screen.closedListener = () {
//      print("The ad has been closed. The user returns to the app.");
//    };
//
//    ads.screen.removeClosed(handlerFunc);
//
//    ads.video.loadedListener = () {
//      print("An ad has loaded in memory.");
//    };
//
//    ads.video.removeLoaded(handlerFunc);
//
//    ads.video.failedListener = () {
//      print("An ad has failed to load in memory.");
//    };
//
//    ads.video.removeFailed(handlerFunc);
//
//    ads.video.clickedListener = () {
//      print("An ad has been clicked on.");
//    };
//
//    ads.video.removeClicked(handlerFunc);
//
//    ads.video.openedListener = () {
//      print("An ad has been opened.");
//    };
//
//    ads.video.removeOpened(handlerFunc);
//
//    ads.video.leftAppListener = () {
//      print("You've left the app to view the video.");
//    };
//
//    ads.video.leftAppListener = handlerFunc;
//
//    ads.video.closedListener = () {
//      print("The video has been closed.");
//    };
//
//    ads.video.removeClosed(handlerFunc);
//
//    ads.video.rewardedListener = (String rewardType, int rewardAmount) {
//      print("The ad was sent a reward amount.");
//      setState(() {
//        _coins += rewardAmount;
//      });
//    };
//
//    RewardListener rewardHandler = (String rewardType, int rewardAmount) {
//      print("This is the Rewarded Video handler");
//    };
//
//    ads.video.removeRewarded(rewardHandler);
//
//    ads.video.startedListener = () {
//      print("You've just started playing the Video ad.");
//    };
//
//    ads.video.removeStarted(handlerFunc);
//
//    ads.video.completedListener = () {
//      print("You've just finished playing the Video ad.");
//    };
//
//    ads.video.removeCompleted(handlerFunc);
//
//    // Uncomment and run this example
////    List<String> one = ads.keywords;
////
////    String two = ads.contentUrl;
////
////    bool three = ads.childDirected;
////
////    List<String> four = ads.testDevices;
////
////    bool five = ads.initialized;
//
//    ads.showBannerAd(state: this, anchorOffset: null);
//  }
//}
