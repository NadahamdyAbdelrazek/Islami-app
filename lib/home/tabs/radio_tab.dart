import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/provider/My_provider.dart';
import 'package:provider/provider.dart';

class radiotab extends StatelessWidget {
  const radiotab({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyProvider()..getAllRadios(),
      child: Container(
        child: Consumer<MyProvider>(
          builder: (context, provider, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/radio_image.png"),
              SizedBox(
                height: 25,
              ),
              Text(
                "إذاعة القرآن الكريم",
                style: GoogleFonts.elMessiri(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: PageScrollPhysics(),
                  itemCount: provider.radios.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Text(provider.radios[index].name ?? ""),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    await provider.pauseAudio();
                                  },
                                  icon: Icon(
                                    Icons.pause,
                                    size: 50,
                                  ),
                                  color: Color(0xffB7935F),
                                ),
                                SizedBox(width: 20),
                                IconButton(
                                  onPressed: () async {
                                    await provider.playAudio(
                                        provider.radios[index].url ?? "");
                                  },
                                  icon: Icon(
                                    Icons.play_arrow,
                                    size: 80,
                                  ),
                                  color: Color(0xffB7935F),
                                ),
                              ]),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
