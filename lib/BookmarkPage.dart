import 'package:flutter/material.dart';

class BookmarkPage extends StatelessWidget {
  final List<int> colorCodes = <int>[50, 100, 200];
  final List<String> dateCodes = <String>[
    "12th Feb'21",
    "08th Jan'21",
    "24th Dec'20"
  ];
  final List<String> highlightedCodes = <String>[
    "Union Budget 2021:Highlights",
    "Why Do Companies Buy Back Shares From Investors?",
    "IT firms recuit more flexi-staff for projects"
  ];
  final List<String> descriptionCodes = <String>[
    "1 February, 2021, witnessed the announcement of the Union Budget for FY 2021-22. The focus in this year's Budget is to strengthen the Sankalp of Nation First, Doubling Farmer's Income, Strong Infrastructure, Healthy India, Good Governance, Opportunities for youth, Education for All, Women Empowerment, and Inclusive Development among others.",
    "When a company buys back shares, it results in a reduction of the number of shares outstanding and the capital base. To that extent, it improves the EPS and the ROE of the company. When the EPS goes up, assuming the P/E remains constant the price of the stock should also go up.",
    "Flexi-staffing is gaining traction among technology firms as they rush to meet the growing need for people with digital skills for short-term projects. The pace has intensified during the pandemic as a rapid shift towards digitalization and automation has brought down the average tenure of projects."
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Align(
                      child: Text(
                        'Expert opinions',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Icon(Icons.refresh),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Latest',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 900,
                child: ListView.builder(
                  itemCount: colorCodes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: Colors.blue[colorCodes[index]],
                        elevation: 10,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        height: 30,
                                        width: 50.0,
                                        child: Image(
                                          image: AssetImage(
                                              "images/editorial.jpg"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '${dateCodes[index]}',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '${highlightedCodes[index]}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              height: 150,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text('${descriptionCodes[index]}',
                                          style: TextStyle(fontSize: 18)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
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
