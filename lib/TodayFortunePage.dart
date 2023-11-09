import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'main.dart';


class Fortune {
  final String description;

  Fortune(this.description);
}

List<Fortune> generateRandomFortunes() {
  List<Fortune> fortunes = [
    Fortune("오늘은 중요한 결정을 내리기에 좋은 날입니다."),
    Fortune("오늘은 긍정적인 에너지로 가득한 날이 될 것입니다."),
    Fortune("오늘은 새로운 기회가 당신을 기다리고 있을 것입니다."),
    Fortune("오늘은 친구와 함께 미소 지을 수 있는 순간이 있을 것입니다."),
    Fortune("오늘은 더 나은 미래를 위한 계획을 세울 수 있는 날입니다."),
    Fortune("오늘은 예상치 못한 선물을 받을 수 있는 날입니다."),
    Fortune("오늘은 자기 계발에 도전하고 성취할 수 있는 날입니다."),
    Fortune("오늘은 인간관계에서 중요한 이해와 화해가 이뤄질 것입니다."),
    Fortune("오늘은 건강을 위한 습관을 더 강화할 수 있는 날입니다."),
    Fortune("오늘은 스트레스를 해소하고 편안함을 찾을 수 있는 날입니다."),
    Fortune("오늘은 소중한 사람과의 시간을 더욱 가치 있게 보낼 것입니다."),
    Fortune("오늘은 도전적인 일을 완료하고 성취감을 느낄 수 있을 것입니다."),
    Fortune("오늘은 예술과 창의성을 표현하기에 좋은 날일 것입니다."),
    Fortune("오늘은 새로운 지식을 습득하고 배울 수 있는 날입니다."),
    Fortune("오늘은 금전 운이 좋아져 재물이 늘어날 것입니다."),
    Fortune("오늘은 자신을 더 사랑하고 긍정적으로 성장할 수 있는 날입니다."),
    Fortune("오늘은 가족과의 소중한 순간을 만들 수 있을 것입니다."),
    Fortune("오늘은 미래 계획을 세우고 목표를 달성하기에 좋은 날입니다."),
    Fortune("오늘은 새로운 인연을 만나고 친밀함을 공유할 것입니다."),
    Fortune("오늘은 뜻밖의 변화가 일어날 수 있는 날입니다."),
    Fortune("오늘은 인내심과 인내가 필요한 날이 될 것입니다."),
    Fortune("오늘은 독서나 학습을 통해 스스로를 발전시킬 수 있는 날입니다."),
    Fortune("오늘은 새로운 문제를 해결하고 진전을 이룰 수 있는 날입니다."),
    Fortune("오늘은 주변 환경과 조화롭게 어울릴 수 있는 날입니다."),
    Fortune("오늘은 가까운 친구와의 연락이 뜻밖의 기쁨을 줄 것입니다."),
    Fortune("오늘은 꿈과 비전을 현실로 만들기에 좋은 날일 것입니다."),
    Fortune("오늘은 건강한 습관을 유지하고 에너지를 충전할 수 있는 날입니다."),
    Fortune("오늘은 재미있는 여행 계획을 세워보세요."),
    Fortune("오늘은 새로운 기술을 익히는 데 도전하는 날입니다."),
    Fortune("오늘은 스트레스 관리를 중요하게 생각하세요."),
    Fortune("오늘은 업무와 경제적인 성공을 위해 노력하는 날입니다."),
    Fortune("오늘은 팀 작업을 통해 목표를 달성할 수 있을 것입니다."),
    Fortune("오늘은 건강한 식습관을 유지하고 몸을 돌보세요."),
    Fortune("오늘은 가족과 함께 시간을 보내고 소통하세요."),
    Fortune("오늘은 도전에 뛰어들어 스스로를 발전시킬 수 있는 날입니다."),
    Fortune("오늘은 가족이나 친구와의 인연을 더 강화할 수 있을 것입니다."),
    Fortune("오늘은 새로운 아이디어로 문제를 해결하세요."),
    Fortune("오늘은 금전적인 어려움을 극복할 수 있을 것입니다."),
    Fortune("오늘은 스스로를 나 끼고 휴식을 취하세요."),
    Fortune("오늘은 친구와 함께 즐겁게 지낼 수 있을 것입니다."),
    Fortune("오늘은 미래를 위한 저축 계획을 세우세요."),
    Fortune("오늘은 새로운 취미나 관심사를 개발해 보세요."),
    Fortune("오늘은 독서나 학습을 통해 스스로를 발전시킬 수 있는 날입니다."),
    Fortune("오늘은 열린 마음으로 새로운 경험을 쌓을 수 있을 것입니다."),
    Fortune("오늘은 자기 자신을 사랑하고 긍정적으로 성장하세요."),
    Fortune("오늘은 문제를 해결하기 위한 창의적인 방법을 찾아보세요."),
    Fortune("오늘은 대인관계에서 더 나은 커뮤니케이션을 추구하세요."),
    Fortune("오늘은 새로운 기회를 잡아 성과를 끌어올릴 수 있을 것입니다."),
    Fortune("오늘은 열린 마음으로 사회 활동을 확대하세요."),
    Fortune("오늘은 미뤄왔던 목표를 이루기 위해 힘을 모아보세요."),
    Fortune("오늘은 재물 운이 좋아질 것입니다."),
    Fortune("오늘은 가족과 조화로운 시간을 보낼 수 있을 것입니다."),
    Fortune("오늘은 새로운 기회를 잡으세요."),
    Fortune("오늘은 스트레스 관리가 필요할 수 있습니다."),
    Fortune("오늘은 자신의 업무나 공부에 집중하세요."),
    Fortune("오늘은 긍정적인 마음가짐으로 새로운 시작을 해보세요."),
    Fortune("오늘은 가족과 함께 특별한 순간을 만들 수 있을 것입니다."),
    Fortune("오늘은 뜻밖의 기쁨을 주는 일이 생길 것입니다."),
    Fortune("오늘은 새로운 사람을 만나 인연이 연결될 것입니다."),
    Fortune("오늘은 친구와 함께 즐겁게 지낼 수 있을 것입니다."),
    Fortune("오늘은 업무나 공부에서 높은 성과를 얻을 수 있을 것입니다."),
    Fortune("오늘은 가족이나 가까운 친구와의 관계를 더욱 강화하세요."),
    Fortune("오늘은 자신의 목표를 세우고 달성하기에 좋은 날입니다."),
    Fortune("오늘은 미루었던 일을 해결하고 정리하는 데 도움이 될 것입니다."),
    Fortune("오늘은 금전적인 변화가 있을 수 있습니다."),
    Fortune("오늘은 새로운 기술을 익히는 데 관심을 가져보세요."),
    Fortune("오늘은 스트레스 관리에 더욱 신경을 써보세요."),
    Fortune("오늘은 업무와 경제적인 성공이 기다릴 것입니다."),
    Fortune("오늘은 훌륭한 사람과 인연을 맺을 기회가 있을 것입니다."),
    Fortune("오늘은 건강에 대한 관심을 더 가져보세요."),
    Fortune("오늘은 재미있는 여행 기회가 찾아올 수 있을 것입니다."),
    Fortune("오늘은 금전운이 확실해질 것입니다."),
    Fortune("오늘은 가족과 조화로운 시간을 보낼 수 있을 것입니다."),
    Fortune("오늘은 좋은 운세로 시작되며, 기쁜 소식을 듣게 될 것입니다."),
    Fortune("오늘은 긍정적인 에너지로 가득 차 있어 행운을 만날 것입니다."),
    Fortune("오늘은 인내와 인내가 필요한 날이며, 참을성을 유지하세요."),
    Fortune("오늘은 중요한 결정을 내리기 좋은 날이 되어 행운이 따를 것입니다."),
    Fortune("오늘은 스스로를 믿고 자기 능력을 발휘할 수 있는 날입니다."),
    Fortune("오늘은 금전 운이 좋아져 대물적인 이득을 얻을 수 있을 것입니다."),
    Fortune("오늘은 사랑과 관계에서 더욱더 가까워질 수 있는 날입니다."),
    Fortune("오늘은 예상치 못한 기쁨이 찾아올 것으로 예측됩니다."),
    Fortune("오늘은 건강을 더욱 신경 써야 할 필요가 있을 것입니다."),
    Fortune("오늘은 친구와 함께 즐겁게 지낼 수 있을 것입니다."),
    Fortune("오늘은 새로운 기회를 잡고 성공을 경험할 수 있을 것입니다."),
    Fortune("오늘은 문제를 해결하기 위한 창의적인 아이디어를 발견할 것입니다."),
    Fortune("오늘은 가족과 조화롭고 행복한 순간을 만들 수 있을 것입니다."),
    Fortune("오늘은 스트레스를 해소하고 편안함을 찾을 수 있는 날입니다."),
    Fortune("오늘은 뜻밖의 선물을 받을 수 있는 날로 기대됩니다."),
    Fortune("오늘은 자기 계발을 위한 시간을 가질 수 있는 날입니다."),
    Fortune("오늘은 인간관계에서 중요한 이해와 화해가 이뤄질 것입니다."),
    Fortune("오늘은 목표를 달성하기 위한 열정과 의지가 높아질 것입니다."),
    Fortune("오늘은 새로운 지식을 습득하고 배울 수 있는 날입니다."),
    Fortune("오늘은 예술과 창의성을 표현하기에 좋은 날로 예상됩니다."),
    Fortune("오늘은 도전적인 목표를 세우기에 좋은 날입니다."),
    Fortune("오늘은 금전적인 어려움을 극복할 수 있는 날로 예측됩니다."),
    Fortune("오늘은 미래 계획을 세우고 목표를 달성하기에 좋은 날입니다."),
    Fortune("오늘은 자신의 업무나 공부에 집중하기에 좋은 날입니다."),
    Fortune("오늘은 미뤄왔던 일을 마무리 짓는 데 도움이 될 것입니다."),
    Fortune("오늘은 건강을 위한 습관을 더욱 신경 써보세요."),
    Fortune("오늘은 친구와 함께 미소 짓는 시간을 가질 수 있을 것입니다."),
    Fortune("오늘은 새로운 경험을 쌓기에 좋은 날입니다."),
    Fortune("오늘은 스트레스를 해소하고 내적 안정을 찾을 수 있는 날입니다."),
    Fortune("오늘은 긍정적인 마음가짐으로 새로운 시작을 해보세요."),
    Fortune("오늘은 인연이 연결되는 날로 예상됩니다."),
    Fortune("오늘은 도전에 뛰어들어 스스로를 발전시킬 수 있는 날입니다."),
    Fortune("오늘은 긍정적인 에너지를 띠고 미래를 기대하세요."),
    Fortune("오늘은 업무나 공부에서 높은 성과를 얻을 수 있을 것입니다."),
    Fortune("오늘은 가족과의 소중한 시간을 더욱 가치 있게 보낼 것입니다."),
    Fortune("오늘은 소중한 사람과의 관계를 강화하는 데 기여할 것입니다."),
    Fortune("오늘은 새로운 인연을 만나고 친밀함을 공유할 것입니다."),
    Fortune("오늘은 뜻밖의 변화가 일어날 수 있는 날입니다."),
    Fortune("오늘은 인내와 인내가 필요한 날이며, 참을성을 유지하세요."),
    Fortune("오늘은 건강을 더욱 신경 써보세요."),


  ];

  return fortunes;
}

class TodayFortunePage extends StatefulWidget {
  @override
  _TodayFortunePageState createState() => _TodayFortunePageState();
}

class _TodayFortunePageState extends State<TodayFortunePage> {
  final List<Fortune> fortunes = generateRandomFortunes();
  final Random random = Random();
  TextEditingController textController = TextEditingController();
  late BannerAd myBanner;

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    loadBannerAd(); // 광고를 로드하는 함수 호출
  }

  void loadBannerAd() {
    // 배너 광고
    myBanner = GoogleAdMob.loadBannerAd(); // 여기에 광고 ID를 설정
    myBanner.load();
  }

  @override
  Widget build(BuildContext context) {
    final int randomIndex = random.nextInt(fortunes.length);
    final Fortune randomFortune = fortunes[randomIndex];

    return Scaffold(
      appBar: null, // 상단의 appBar 제거
      body: Stack(
        children: [
          Container(
            color: Color(0xff151515),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Stack(
                    alignment: Alignment.center,
                    children: [],
                  ),
                  SizedBox(height: 20),
                  Text(
                    '오늘의 운세',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF8163E0),
                      fontSize: 22,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '언제나 좋은 하루를 응원합니다.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF555555),
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  SizedBox(height: 60),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: ShapeDecoration(
                      color: Color(0x19555555),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.50,
                          color: Colors.white.withOpacity(0.3),
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 0),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              randomFortune.description,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    alignment: Alignment.center,
                    width: myBanner.size.width.toDouble(),
                    height: myBanner.size.height.toDouble(),
                    child: AdWidget(ad: myBanner),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20, // 화면 아래에서 40픽셀 띄움
            left: (MediaQuery.of(context).size.width -
                MediaQuery.of(context).size.width * 0.9) /
                2, // 화면 가로 중앙 정렬
            width: MediaQuery.of(context).size.width * 0.9, // 가로 폭 설정
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage(),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF8163E0)),
                // 색상 변경
                minimumSize: MaterialStateProperty.all(
                  Size(
                    MediaQuery.of(context).size.width * 0.86,
                    54,
                  ),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              child: Text(
                '홈',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}