import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'main.dart';

class SolutionPage2 extends StatefulWidget {
  final int selectedImageIndex;

  SolutionPage2({
    required this.selectedImageIndex,
  });

  @override
  _SolutionPage2State createState() => _SolutionPage2State(selectedImageIndex);
}

class _SolutionPage2State extends State<SolutionPage2> {
  final int selectedImageIndex;
  final List<String> adviceTexts = [
    "마음의 평온을 위해 머물러보세요.",
    "결정을 내리기에 아직 이르지 않았을지도 모릅니다.",
    "모든 것이 그 자체로 진행 중입니다.",
    "자신을 위한 쉼을 허락하세요.",
    "시간이 답을 찾을 것입니다.",
    "여유를 가지고 생각해 보세요.",
    "결정을 미루는 것도 한 가지 선택입니다.",
    "마음의 짐을 덜어보세요.",
    "무엇이 가장 잘 맞는지 생각해 보세요.",
    "자신을 위한 공간을 만드세요.",
    "마음의 안정을 찾아보세요.",
    "머릿속을 정리하고 기다려 보세요.",
    "앞날의 미지 길을 믿어보세요.",
    "마음이 편한 시간을 가져보세요.",
    "결정의 압박을 풀어보세요.",
    "자신의 진정한 욕망을 듣고 따르세요.",
    "결정이 당신을 향해 오게 두세요.",
    "마음을 가볍게 하고 즐기세요.",
    "무엇이 당신을 진정으로 행복하게 하는지 생각하세요.",
    "결정을 내리지 않는 것도 선택의 하나입니다.",
    "현재를 경험하고 즐기세요.",
    "자신을 위한 쉬는 시간을 가져보세요.",
    "머릿속의 소음을 멈추세요.",
    "결정을 내릴 준비가 될 때까지 기다려보세요.",
    "자신의 내부 소리를 듣고 신뢰하세요.",
    "마음의 평안을 찾으세요.",
    "결정이 당신을 기다리고 있을 것입니다.",
    "자신을 위한 자유를 경험하세요.",
    "무엇이 정말 중요한지 곰곰이 생각해 보세요.",
    "결정을 내리지 않는 것이 또 하나의 선택입니다.",
    "자신을 믿으세요.",
    "가장 중요한 것에 집중하세요.",
    "감정을 듣고 결정하세요.",
    "다양한 옵션을 고려하세요.",
    "미래를 상상하세요.",
    "자신의 가치를 고려해 보세요.",
    "간단한 단계부터 시작하세요.",
    "주변 환경을 고려하세요.",
    "감사하고 생각하세요.",
    "결정 후에도 조정이 가능합니다.",
    "자신을 위한 선택을 하세요.",
    "자신의 목표를 명확하게 정하세요.",
    "어떤 선택이 성장을 돕는가를 생각하세요.",
    "자신의 직감을 신뢰하세요.",
    "논리와 감정을 균형 있게 사용하세요.",
    "목표를 세우고 계획을 만드세요.",
    "미래의 후회를 고려하세요.",
    "자신의 꿈을 따라가세요.",
    "다른 사람의 조언을 듣고 생각하세요.",
    "마음의 평안을 찾으세요.",
    "가장 편안한 선택을 하세요.",
    "무엇이 당신을 진정으로 행복하게 하는가를 생각하세요.",
    "자신의 욕망을 목표로 삼으세요.",
    "결정을 내리면 행동하세요.",
    "자신을 사랑하세요.",
    "매 순간을 즐기세요.",
    "다른 사람의 의견에 눈을 감지 않고 선택하세요.",
    "목표를 실현하기 위해 움직이세요.",
    "자유롭게 선택하세요.",
    "당신을 나타내는 선택을 하세요.",
    "시간은 모든 것을 치유합니다.",
    "하루가 갈수록 어두운 밤은 빛을 내뿜는다.",
    "언젠가 모든 조각이 맞아 떨어질 것입니다.",
    "고민은 미래를 예측하지 못합니다.",
    "매 순간은 새로운 기회의 문입니다.",
    "우리는 자주 무엇을 놓치고 있을 수 있습니다.",
    "생명은 지속해 흐름입니다.",
    "인생은 짧고 아름다움은 무한합니다.",
    "고민은 구름처럼 지나갑니다.",
    "우리는 모두 별처럼 빛날 순간이 있습니다.",
    "꽃은 언제나 어디서나 피어납니다.",
    "가장 어두운 순간에도 빛을 찾을 수 있습니다.",
    "고민은 바다처럼 깊고 넓습니다.",
    "모든 것은 연결되어 있습니다.",
    "끊임없이 변화하는 것이 자연의 법칙입니다.",
    "때로는 고민을 풀어놓고 두고 보는 것이 중요합니다.",
    "마음의 고요함은 가장 강력한 힘입니다.",
    "고민은 물결처럼 오고 가는 것입니다.",
    "우리는 모두 공통점과 차이점을 공유합니다.",
    "모든 것은 순환의 과정을 따릅니다.",
    "고민은 생명의 여정 일부입니다.",
    "지금 살아갑시다.",
    "우리는 모두 하늘 아래 하나입니다.",
    "빛과 어둠은 함께 존재합니다.",
    "고민은 단지 일시적인 순간일 뿐입니다.",
    "우리는 모두 공통된 별을 보며 살고 있습니다.",
    "모든 결정은 우리의 길을 조각하고 있습니다.",
    "고민은 모든 이야기의 시작입니다.",
    "가장 아름다운 꽃은 가장 어두운 흙에서 자랍니다.",
    "우리는 모두 어딘가에서 연결되어 있습니다.",
    "고민은 당신의 강함을 발견할 기회입니다.",
    "모든 것은 더 큰 그림의 한 부분입니다.",
    "우리는 모두 이 행성 위의 손님입니다.",
    "모든 순간은 유용한 경험입니다.",
    "고민은 당신의 이야기를 더 풍부하게 만듭니다.",
    "우리는 모두 이 공간과 시간에서 함께합니다.",
    "모든 미래는 무한한 가능성으로 가득합니다.",
    "고민은 당신의 인생 여정 중 하나의 장면일 뿐입니다.",
    "자기 자신을 믿어보세요.",
    "가장 중요한 가치에 집중하세요.",
    "머릿속을 비우고 마음을 들으세요.",
    "가슴의 속삭임을 따르세요.",
    "어떤 선택이 마음을 더 편하게 만들까요?",
    "장기적인 목표를 고려하세요.",
    "다양한 관점을 고려해 보세요.",
    "과거의 경험을 고려하세요.",
    "가장 큰 두려움을 질문하세요.",
    "미래의 후회를 고려하세요.",
    "자신의 가장 큰 욕망에 집중하세요.",
    "가장 희망적인 결과를 상상하세요.",
    "다른 사람의 조언을 듣고 고려하세요.",
    "간단한 단계부터 시작하세요.",
    "당신을 나타내는 선택을 하세요.",
    "가장 중요한 것을 먼저 선택하세요.",
    "자신을 위한 선택을 하세요.",
    "감정에 귀 기울이세요.",
    "가장 진정한 목소리를 들으세요.",
    "자신의 편안함을 고려하세요.",
    "가장 먼저 자신의 가치와 욕망을 고려해 보세요.",
    "문제를 작게 나누고 하나씩 해결해 보세요.",
    "다양한 관점을 고려해 보고 결정하세요.",
    "친구나 가족의 조언을 듣고 의견을 수렴해 보세요.",
    "자세히 계획을 세우고 미래의 결과를 고려하세요.",
    "자신의 직감을 신뢰하고 내면의 목소리를 들어보세요.",
    "이전 경험에서 배운 교훈을 적용하세요.",
    "현재와 미래의 욕망을 비교하여 선택하세요.",
    "어떤 선택을 하더라도 학습의 기회가 될 것입니다.",
    "여유롭게 생각하고 시간을 갖고 선택하세요.",
    "주변 환경과 상황을 고려하여 결정하세요.",
    "가장 중요한 목표와 가치를 먼저 고려하세요.",
    "간단한 것부터 시작해 보고, 나아가며 조정하세요.",
    "가능한 옵션을 탐색하고 그중에서 최선의 것을 선택하세요.",
    "결정 후에도 조정이 가능하다는 것을 기억하세요.",
    "다른 사람의 의견에 눈을 감지 않고, 자신의 결정을 내리세요.",
    "미래의 후회를 고려하여 선택하세요.",
    "선택지를 비교하여 장단점을 분석하세요.",
    "마음이 편안하게 느껴지는 선택을 하세요.",
    "자신을 향한 자신의 진정한 욕망을 탐구해 보세요.",
    "내면의 평화를 찾기 위해 자신의 선택을 의식적으로 만들어 보세요.",
    "어떤 선택이든 당신의 삶을 더 풍요롭게 만들 수 있을 것입니다.",
    "선택을 비교하면서 어떤 것이 당신에게 더 의미가 있을지 고민해 보세요.",
    "선택지 사이에서 무엇이 더 큰 만족을 주는지 상상해 보세요.",
    "당신이 어떤 선택을 하든, 그것은 당신의 성장과 학습에 이바지할 것입니다.",
    "단기적인 만족보다 장기적인 만족을 고려해 보세요.",
    "선택지 모두를 고려하여 균형을 찾아보세요.",
    "모든 선택은 당신의 삶을 더 풍부하게 만들어 줄 것이며, 당신은 그 선택을 통해 성장할 것입니다.",
    "행동은 결과를 만듭니다.",
    "당신의 욕망을 추구하세요.",
    "단순화하고 집중하세요.",
    "의지력을 발휘하세요.",
    "두려움에 맞서세요.",
    "낙관적으로 생각하세요.",
    "신뢅는 선택의 시작입니다.",
    "진정으로 원하는 것을 선택하세요.",
    "시간을 허락하세요.",
    "불필요한 것을 버려주세요.",
    "실패는 배움의 출발점입니다.",
    "내부 목소리를 따르세요.",
    "자신의 열망을 추구하세요.",
    "마음의 안정을 찾으세요.",
    "단계적으로 진행하세요.",
    "해결책을 찾으세요.",
    "자신에게 충실하세요.",
    "마음을 가볍게 하세요.",
    "선택에 자신을 담으세요.",
    "자신의 강점을 활용하세요.",
    "가장 중요한 것을 먼저 처리하세요.",
    "타인의 기대치를 떨어뜨리세요.",
    "진실한 목표를 설정하세요.",
    "실제 행동으로 나아가세요.",
    "새로운 경험을 찾으세요.",
    "자신의 인생 주인공이라고 생각하세요.",
    "지금을 소중히 여기세요.",
    "고민에 짓눌리지 마세요.",
    "감사의 마음을 갖고 선택하세요.",
    "자신의 길을 찾아 선택하세요.",
    "일단 해보세요.",
    "더 노력하세요.",
    "후회해도 돌아오지 않습니다.",
    "좋지 않아 보여요.",
    "의미 있는 선택을 하세요.",
    "좋은 결과가 있을 거예요.",
  ];
  late final int randomIndex;
  late final String randomAdviceText;
  TextEditingController textController = TextEditingController();
  late BannerAd myBanner;



  _SolutionPage2State(this.selectedImageIndex) {
    randomIndex = Random().nextInt(adviceTexts.length);
    randomAdviceText = adviceTexts[randomIndex];
  }


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
                    children: [
                      Image.asset(
                        'assets/point/image_$selectedImageIndex.png',
                        width: 40, // 이미지의 폭 설정
                        height: 40, // 이미지의 높이 설정
                        fit: BoxFit.contain, // 이미지 크기 조절 옵션
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    '두 번째 답',
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
                    '같은 답이 나왔다면..\n운명의 답입니다.',
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
                  Stack(
                    children: [
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
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              randomAdviceText,
                              // randomAdviceText를 사용하여 텍스트 동적으로 변경
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
                '결정 완료',
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