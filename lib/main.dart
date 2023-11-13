import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:async';
import 'dart:math';
import 'KnowledgePage.dart';
import 'TodayPage.dart';
import 'PiecePage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // 모바일 광고 SDK 초기화
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showSplashPage = true;

  @override
  void initState() {
    super.initState();

    // 앱이 시작하고 2초 후에 스플래시 화면을 숨김
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _showSplashPage = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: _showSplashPage ? SplashPage() : MainPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  List<String> splashTexts = [
    '"성공의 비밀은 좋은 계획, 열심히 노력, 그리고 결코 포기하지 않는 것이다."\n - 나스',
    '"인생은 무엇이 일어나느냐보다는 어떻게 반응하느냐에 달려있다."\n - 찰스 R. 수완',
    '"일을 선택하면 사람은 자신을 선택한다."\n - 스콧 페크',
    '"목표를 세우고 그것을 향해 끈질기게 나아가라."\n - 롤로 메이',
    '"평범한 일에 열정을 두면 놀라운 결과를 얻을 수 있다."\n - 존 C. 맥스웰',
    '"오늘을 힘차게 살면 내일은 자연스럽게 밝아진다."\n - 에스더 왓킨스 아모스',
    '"좋은 생각이 정답을 찾고, 큰 꿈이 현실을 만든다."\n - 로버트 슐러',
    '"어떤 상황에서도 자신을 믿으라."\n - 마이클 조던',
    '"실패는 새로운 시도의 시작일 뿐이다."\n - 토마스 에디슨',
    '"지나간 일에 집착하지 말고 미래에 집중하라."\n - 안드레 와일드',
    '"인생의 비밀은 기회를 보는 눈에 달려 있다."\n - 앨버트 E. 허버드',
    '"먼저 시작하지 않으면 결코 끝나지 않는다."\n - 요한 볼프강 폰 괴테',
    '"오늘 한 일을 5년 동안 계속해서 하면, 5년 후에는 어디에 있을까?"\n - 봐트 마이어',
    '"생활에서 얻는 것은 어떻게 살아가는지에 달려 있다."\n - 길버트 K. 체스터턴',
    '"성공의 가장 큰 비밀은 어떤 일을 시작하는 것이다."\n - 마크 트웨인',
    '"희망과 꿈을 가진 사람은 어떤 어려움에도 스스로를 극복할 수 있다."\n - 힐러리 클린턴',
    '"불행함이 없이는 행복도 없다."\n - 칼라일 지브란',
    '"더 나은 미래를 찾고 싶다면 현재를 바꿔라."\n - 니달 게일',
    '"자신을 믿고 당당하게 꿈을 따르라."\n - 월트 디즈니',
    '"꿈은 꿀텅 꿔라. 그리고 당신은 어떻게 달성할지 찾아낼 것이다."\n - 윌리엄 파트슨',
    '"시작이 가장 어려운 일이다."\n - 솔론',
    '"훌륭한 일은 친절하게 시작되지만 훌륭하게 마무리된다."\n - 조세프 조베르',
    '"당신이 무엇을 믿느냐에 따라 당신은 가능한 모든 것을 달성할 수 있다."\n - 마리아 로빈슨',
    '"꿈을 향해 나아가는 길은 항상 존재한다."\n - 하버트 버트랜드',
    '"단순함은 권능이 아니라 성숙함의 결과이다."\n - 프랭클린 리치',
    '"문제 속에는 기회가 숨어 있다."\n - 앨버트 아인슈타인',
    '"매일 작은 스텝을 나아가면 큰 성취를 얻을 수 있다."\n - 카렌 슬릿맨',
    '"목표는 꿈을 현실로 만들기 위한 로드맵이다."\n - 로이 T. 베넷트',
    '"성공의 비밀은 좋은 계획, 열심히 노력, 그리고 결코 포기하지 않는 것이다."\n - 콜린 파월',
    '"내일에 대한 가장 큰 선물은 오늘에 대한 최선을 다하느냐에 달려 있다."\n - 에릭 진검',
    '"성공의 지름길은 노력하고, 노력하고, 또 노력하는 것이다."\n - 사무엘 골드윈',
    '"당신이 행복을 찾는 것이 아니라 만드는 것이다."\n - 로이 T. 베넷트',
    '"훌륭한 목표를 향해 열정적으로 나아가라."\n - 그렉 S. 레비네스',
    '"자신의 가치를 아는 사람은 다른 사람의 가치를 더 잘 이해한다."\n - 아놀드 토인비',
    '"고난을 극복하는 것은 당신을 더욱 강하게 만든다."\n - 조던 B. 피터슨',
    '"역경은 우리가 무엇을 원하는지를 가르쳐준다."\n - 오프라 윈프리',
    '"자신의 미래는 자신이 만든다."\n - 로렌스 J. 피터',
    '"성공을 위한 첫 번째 단계는 자기를 희생하는 것이다."\n - 로빈 S. 샤프',
    '"당신은 자신이 생각하는 대로 되기 직전에 있는 것이다."\n - 닉 포풀로스',
    '"진정한 힘은 나 자신을 통제하는 능력에 있다."\n - 에이브러',


  ];

  String displayedText = '';

  @override
  void initState() {
    super.initState();
    // initState에서 무작위 텍스트를 선택하여 displayedText를 업데이트합니다.
    displayedText = getRandomSplashText();
  }

  String getRandomSplashText() {
    final random = Random();
    final randomIndex = random.nextInt(splashTexts.length);
    return splashTexts[randomIndex];
  }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false; // 뒤로가기를 처리하지 않도록 함
        },
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0.0,
            title: Text(''),
            backgroundColor: Color(0XFF151515),
            elevation: 0,
          ),
          body: Container(
            color: Color(0xff151515),
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset('assets/PerpleSpace_Logo.png', width: 40, height: 40),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          'Purple Space',
                          style: TextStyle(
                            color: Color(0xFF8163E0),
                            fontSize: 20,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 160, // 원하는 위치로 조정
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.62,
                        child: Text(
                          displayedText, // 무작위로 선택된 텍스트 표시
                          style: TextStyle(
                            color: Color(0xFF555555),
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                          textAlign: TextAlign.center,

                        ),
                      ),
                  ),
                ],
              ),
            ),
          ),

        )
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late BannerAd myBanner;

  @override
  void initState() {
    super.initState();
    loadBannerAd(); // 광고를 로드하는 함수 호출
  }

  void loadBannerAd() {
    myBanner = GoogleAdMob.loadBannerAd();
    myBanner.load();
  }

  @override
  Widget build(BuildContext context) {
    final buttonWidth = MediaQuery.of(context).size.width - 40;

    return WillPopScope(
        onWillPop: () async {
          bool exit =
              await showExitDialog(context); // 다이얼로그를 표시하고 사용자의 선택을 기다립니다.
          return exit; // 사용자가 종료를 선택하면 true를 반환하고, 그렇지 않으면 false를 반환합니다.
        },
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0.0,
            title: Text(''),
            backgroundColor: Color(0XFF151515),
            elevation: 0,
            actions: [],
          ),
          body: Container(
            color: Color(0xff151515),
            child: Column(
              children: [
                SizedBox(height: 120),
                Image.asset('assets/PerpleSpace_Logo.png',
                    height: 80, width: 80),
                SizedBox(height: 20),
                Text(
                  '환영합니다:)\n이곳은 Purple Space입니다.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF555555),
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomCenter, // 하단 중앙 정렬
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.0), // 하단 간격 설정
                    child: Container(
                      margin: EdgeInsets.only(
                          right: 40, left: 40, top: 0, bottom: 0),
                      // 박스 바깥쪽 여백 설정
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      PiecePage(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return FadeTransition(
                                    opacity: animation, child: child);
                              },
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0x19888888)),
                          minimumSize:
                              MaterialStateProperty.all(Size(buttonWidth, 100)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0.50,
                                color: Colors.white.withOpacity(0.3),
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // 가로 방향으로 양쪽 정렬
                          children: [
                            Container(
                              padding: EdgeInsets.all(20.0), // 박스 내 여백 설정
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // 텍스트를 왼쪽 정렬로 설정
                                children: [
                                  Text(
                                    '고민 해결하기',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color(0xFF8163E0),
                                      fontSize: 22,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '고민 해결을 도와드릴게요.',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color(0xFF555555),
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20.0), // 박스 내 여백 설정
                              child: Image.asset('assets/stone_01.png',
                                  height: 40, width: 40),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter, // 하단 중앙 정렬
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.0), // 하단 간격 설정
                    child: Container(
                      margin: EdgeInsets.only(
                          right: 40, left: 40, top: 0, bottom: 0),
                      // 박스 바깥쪽 여백 설정
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      TodayPage(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return FadeTransition(
                                    opacity: animation, child: child);
                              },
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0x19888888)),
                          minimumSize:
                              MaterialStateProperty.all(Size(buttonWidth, 100)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0.50,
                                color: Colors.white.withOpacity(0.3),
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // 가로 방향으로 양쪽 정렬
                          children: [
                            Container(
                              padding: EdgeInsets.all(20.0), // 박스 내 여백 설정
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // 텍스트를 왼쪽 정렬로 설정
                                children: [
                                  Text(
                                    '오늘의 운세',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color(0xFF8163E0),
                                      fontSize: 22,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '오늘은 어떤 하루일까요?.',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color(0xFF555555),
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20.0), // 박스 내 여백 설정
                              child: Image.asset('assets/stone_02.png',
                                  height: 40, width: 40),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter, // 하단 중앙 정렬
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 40.0), // 하단 간격 설정
                    child: Container(
                      margin: EdgeInsets.only(
                          right: 40, left: 40, top: 0, bottom: 0),
                      // 박스 바깥쪽 여백 설정
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      KnowledgePage(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return FadeTransition(
                                    opacity: animation, child: child);
                              },
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0x19888888)),
                          minimumSize:
                              MaterialStateProperty.all(Size(buttonWidth, 100)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0.50,
                                color: Colors.white.withOpacity(0.3),
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // 가로 방향으로 양쪽 정렬
                          children: [
                            Container(
                              padding: EdgeInsets.all(20.0), // 박스 내 여백 설정
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // 텍스트를 왼쪽 정렬로 설정
                                children: [
                                  Text(
                                    '알고 계셨나요?',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color(0xFF8163E0),
                                      fontSize: 22,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '매일 새로운 지식을 드려요.',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color(0xFF555555),
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(20.0), // 박스 내 여백 설정
                              child: Image.asset('assets/stone_03.png',
                                  height: 40, width: 40),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future<bool> showExitDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
            side: BorderSide(color: Colors.white.withOpacity(0.3)),
          ),
          backgroundColor: Color(0xff222222),
          content: Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: myBanner.size.width.toDouble(),
                    height: myBanner.size.height.toDouble(),
                    child: AdWidget(ad: myBanner),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 10),
                    // 취소와 종료 버튼 사이의 간격 조절
                    child: Text(
                      '앱을 종료하시겠습니까?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                  // 원하는 다른 위젯 추가 가능
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(
                    '취소',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
                SizedBox(width: 10), // 취소와 종료 버튼 사이의 간격 조절
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                    SystemNavigator.pop();
                  },
                  child: Text(
                    '종료',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class GoogleAdMob {
  // 배너 광고 인스턴스를 생성하고 로딩하기 위한 함수
  static BannerAd loadBannerAd() {
    // 배너 광고
    BannerAd myBanner = BannerAd(
      adUnitId: 'ca-app-pub-8592816665846164/5444251021',
// 내 리워드 광고 통합 APP ID
      /*
      크기(폭x높이)        설명               AdSize 상수
      -----------------------------------------------------------------------
      320x50	            표준 배너	          banner
      320x100	            대형 배너	          largeBanner
      320x250	            중간 직사각형	      mediumRectangle
      468x60	            전체 크기 배너	    fullBanner
      728x90	            리더보드	          leaderboard
      화면 폭x32|50|90	  스마트 배너	        getSmartBanner(Orientation) 사용
      */
      size: AdSize.largeBanner,
      request: AdRequest(),
      listener: BannerAdListener(
        // 광고가 성공적으로 수신된 경우
        onAdLoaded: (Ad ad) => print('Ad loaded.'),
        // 광고 요청이 실패한 경우
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          // 광고 요청 오류 시 광고를 삭제하여 리소스 확보
          ad.dispose();
          print('Ad failed to load: $error');
        },
        // 광고가 화면을 덮는 오버레이를 열었을 때 호출
        // 사용자가 광고를 클릭하거나 특정 조건이 충족되어 광고가 표시 될 때 발생
        onAdOpened: (Ad ad) => print('Ad opened.'),
        // 광고가 화면을 덮는 오버레이를 닫았을 때 호출
        // 사용자가 광고를 닫거나 자동으로 닫힐 때 발생
        onAdClosed: (Ad ad) => print('Ad closed.'),
        // 광고가 노출 될 때 호출
        // 광고가 사용자에게 보여질 때 발생
        onAdImpression: (Ad ad) => print('Ad impression.'),
      ),
    );
    return myBanner;
  }

  // 배너 광고를 화면에 보여주기 위한 함수, 파라미터로 로드된 배너 인스턴스 필요
  static Container showBannerAd(BannerAd myBanner) {
    // 광고 디스플레이
    // 배너 광고를 위젯으로 표시하기 위해 지원되는 광고를 사용하여 AdWidget 인스턴스화
    final Container adContainer = Container(
      alignment: Alignment.center,
      width: myBanner.size.width.toDouble(),
      height: myBanner.size.height.toDouble(),
      child: AdWidget(ad: myBanner),
    );

    return adContainer;
  }

  // 전면 광고를 인스턴스를 생성하고 로딩하기 위한 함수
  static void showInterstitialAd() {
    // 전면 광고 로드
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-8592816665846164/9136084027', // 내 리워드 광고 통합 APP ID
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        // 전면 광고 로드 완료
        onAdLoaded: (InterstitialAd ad) {
          // 광고 보여주기
          ad.show();
          // 리소스 해제
          ad.dispose();
        },
        // 전면 광고 로드 실패
        onAdFailedToLoad: (LoadAdError error) {
          print('InterstitialAd failed to load: $error');
        },
      ),
    );
  }
}
