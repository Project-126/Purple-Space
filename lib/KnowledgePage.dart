import 'main.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class LottoPage extends StatefulWidget {
  @override
  _LottoPageState createState() => _LottoPageState();
}

class _LottoPageState extends State<LottoPage> {
  late BannerAd myBanner;
  List<String> foodMenu = [
    '따뜻한 우동',
    '깔끔하게 초밥',
    '맛있는 피자',
    '스테이크',
    '샐러드',
    '매콤한 떡볶이',
    '신선한 회덮밥',
    '담백한 두부요리',
    '카레라이스',
    '된장찌개',
    '김치찌개',
    '텐동',
    '떡갈비',
    '삼겹살',
    '해산물 파스타',
    '로제 파스타',
    '파스타',
    '로제 떡볶이',
    '건강한 비빔밥',
    '버섯전골',
    '김밥',
    '누룽지',
    '여러가지 부침개',
    '뜨끈한 수제비',
    '칼국수',
    '치즈떡볶이',
    '오므라이스',
    '소고기',
    '매콤한 닭갈비',
    '얼큰한 마라탕',
    '마라샹궈',
    '찹쌀 꿔바로우',
    '고추장불고기',
    '양념갈비',
    '알리오올리오',
    '김치볶음밥',
    '찜닭',
    '해물 짬뽕',
    '닭볶음탕',
    '시원한 냉면',
    '비빔냉면',
    '맛있는 햄버거',
    '느끼한 치즈버거',
    '든든한 국밥',
    '얼큰한 순대국',
    '라면',
    '일본라멘',
    '짜장라면',
    '짜장면',
    '라볶이',
    '돈까스',
    '규카츠',
    '치킨까스',
    '고구마치즈돈까스',
    '족발',
    '보쌈',
    '불족발',
    '오리훈제',
    '바베큐치킨',
    '후라이드치킨',
    '양념치킨',
    '파닭',
    '쌈밥',
    '훠궈',
    '편백찜',
    '부대찌개',
    '감자탕',
    '낙곱새',
    '매콤한 김치찜',
    '낙지덮밥',
    '샌드위치',
    '곰탕',
    '샤브샤브',
    '규동',
    '쪽갈비',
    '제육볶음',
    '삼계탕',
    '신선한 회',
    '고구마 피자',
    '포테이토 피자',
    '페퍼로니 피자',
    '피자빵',
    '도시락',
    '빵',
    '쭈꾸미 볶음',
    '스파게티',
    '탕수육',
    '양고기',
    '타코야끼',
    '핫도그',
    '토스트',
    '쌀국수',
    '돈까스덮밥',
    '국수 한 그릇',
    '든든한 죽',
    '백반',
    '미나리 삼겹살',


  ]; // 예시 식사 메뉴

  @override
  void initState() {
    super.initState();
    loadBannerAd();
  }

  void loadBannerAd() {
    myBanner = GoogleAdMob.loadBannerAd();
    myBanner.load();
  }

  List<String> getRandomFoods() {
    // 랜덤으로 식사 메뉴 선택
    Random random = Random();
    List<String> selectedMenus = [];
    while (selectedMenus.length < 2) {
      int randomNumber = random.nextInt(foodMenu.length);
      String selectedMenu = foodMenu[randomNumber];
      if (!selectedMenus.contains(selectedMenu)) {
        selectedMenus.add(selectedMenu);
      }
    }
    return selectedMenus;
  }

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;

    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainPage(),
          ),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0.0,
          title: Text(''),
          backgroundColor: Color(0XFF151515),
          elevation: 0,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/back.gif'),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 160),
                Image.asset(
                  'assets/Icon3.png',
                  width: 26,
                  height: 26,
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 60.0, right: 60),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '1순위',
                            style: TextStyle(
                              color: Color(0xffffffff),
                              fontSize: isSmallScreen ? 16 : 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 26),
                          Text(
                            getRandomFoods()[0], // 랜덤으로 선택된 식사 메뉴 표시
                            style: TextStyle(
                              color: Color(0xffffffff),
                              fontSize: isSmallScreen ? 20 : 20,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '2순위',
                            style: TextStyle(
                              color: Color(0xffffffff),
                              fontSize: isSmallScreen ? 16 : 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 26),
                          Text(
                            getRandomFoods()[1], // 랜덤으로 선택된 식사 메뉴 표시
                            style: TextStyle(
                              color: Color(0xffffffff),
                              fontSize: isSmallScreen ? 20 : 20,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(),

                SizedBox(height: 60),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            40), // 모서리 반지름 값
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color(0x1affffff)), // 배경색
                    side: MaterialStateProperty.all<BorderSide>(
                        BorderSide(color: Color(0x4dffffff),
                            width: 1)), // 테두리 선
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 22.0, right: 54, left: 54, bottom: 22),
                    child: Text(
                      '나가기',
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: isSmallScreen ? 18 : 18,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  child: Container(
                    alignment: Alignment.center,
                    width: myBanner.size.width.toDouble(),
                    height: myBanner.size.height.toDouble(),
                    child: AdWidget(ad: myBanner),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
