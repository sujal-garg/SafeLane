
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safelane/authentication/google_auth.dart';
import 'package:safelane/onBoarding/onbordingContents.dart';
class Onbording extends StatefulWidget {
  const Onbording({Key? key}) : super(key: key);

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {

late PageController _pageController;
@override
void initState()
{
  _pageController=PageController(initialPage: 0);
  super.initState();
}

@override
void dispose()
{
  _pageController.dispose();
  super.dispose();
}

int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: 
      SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index){
                  setState(() {
                  currentIndex=index;
                    
                  });
                },

                itemCount: Demo_data.length,
                controller: _pageController,
                itemBuilder: (context, index) =>OnBordingContent(
                image: Demo_data[index].image,
                title: Demo_data[index].title,
                description: Demo_data[index].description,)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                Demo_data.length, 
                (index) => buildDot(index, context)
              ),
            ),
            const SizedBox(height: 40,),
            
            SizedBox(
              height: 50,
              width: 220,
              child: ElevatedButton(
                  onPressed: (){
                    if(currentIndex==Demo_data.length-1){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> GoogleAuth()),
                      );
                    }
                    _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    )
                  ),
                  child: Text(currentIndex==Demo_data.length-1 ? "Get Started>>": "Next>>"),
                ),
            ),
            SizedBox(
              height: size.height*0.05,
              width: double.infinity,
            ),
          ],
        )
        ),
      );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
                  height: 12,
                  width: currentIndex==index? 30:12,
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: currentIndex==index?Colors.black: const Color(0xffDBDBDB),
                  ),
                  // color:Color(0xff005FFF),
                );
  }
}

class OnBordingContent extends StatelessWidget {
  const OnBordingContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Spacer(),
          SvgPicture.asset(
            image,
            width: 250,
          ),
          const Spacer(),
          Text(title,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              )),
          const SizedBox(
            height: 40,
          ),
          Text(
              description,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: const Color(0xff7A7A7A),
                height: 1.6,
              )),
          const Spacer(),
        ],
      ),
    );
  }
}
