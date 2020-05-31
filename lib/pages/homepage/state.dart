part of sifa;

class _HomepageState extends State<Home> {
  @override
  void initState() {
    super.initState();
    bloc.fetchDiseases();
    bloc.fetchHerbs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2 - 25,
          child: Stack(
            children: <Widget>[
              Align(
                  alignment: Alignment.center,
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Image(
                        image: AssetImage('images/sifa.png'),
                      ))),
              Positioned(
                  top: -50,
                  left: -50,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(87, 175, 1, 1),
                        image: null,
                        shape: BoxShape.circle),
                  )),
              Positioned(
                  bottom: 0,
                  left: MediaQuery.of(context).size.width -
                      (MediaQuery.of(context).size.width / 3) / 2.5,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(87, 175, 1, 1),
                        image: null,
                        shape: BoxShape.circle),
                  )),
              Positioned(
                  left: -28,
                  bottom: 0,
                  child: Image(
                    image: AssetImage("images/leaf.png"),
                    width: MediaQuery.of(context).size.width / 3,
                  )),
              Positioned(
                  top: -10,
                  right: -15,
                  child: Transform.rotate(angle: 66, child: Image(
                    image: AssetImage("images/leaf.png"),
                    width: MediaQuery.of(context).size.width / 3,
                  )))
            ],
          ),
        ),

        //Hastalik
        Container(
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).size.height / 2) / 2,
            child: Column(
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 5,
                          top: 7,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => All(1)),
                              );
                            },
                            child: Text(
                              "Tum Liste",
                              style: GoogleFonts.ptSerif(
                                  fontSize: 15, color: Colors.black),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text("Hastalıklar",
                              style: GoogleFonts.ptSerif(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(87, 175, 1, 1),
                                  fontSize: 20)),
                        ),
                      ],
                    )),
                Padding(padding: EdgeInsets.only(bottom: 5)),
                Container(
                    height: ((MediaQuery.of(context).size.height / 2) / 2) - 55,
                    child: StreamBuilder(
                        stream: bloc.allDiseases,
                        builder: (context, AsyncSnapshot<List<Blog>> snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (BuildContext ctxt, int index) {
                                  return Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BlogPage(snapshot
                                                          .data[index])),
                                            );
                                          },
                                          child: Card(
                                              color: Colors.green,
                                              elevation: 2,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              child: Stack(
                                                children: <Widget>[
                                                  Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.5,
                                                      height: ((MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  2) /
                                                              2) -
                                                          55,
                                                      child: Image.network(
                                                        ApiProvider.host +
                                                            snapshot.data[index]
                                                                ._image,
                                                        fit: BoxFit.cover,
                                                      )),
                                                  Container(
                                                    color: Colors.black45,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.5,
                                                    height: ((MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                2) /
                                                            2) -
                                                        55,
                                                  ),
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      snapshot
                                                          .data[index]._title,
                                                      style: GoogleFonts.ptSans(
                                                          fontSize: 20,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              ))));
                                });
                          }
                          return Align(alignment: Alignment.center, child: CircularProgressIndicator());
                        }))
              ],
            )),

        //Bitkiler
        Container(
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).size.height / 2) / 2,
            child: Column(
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                            left: 5,
                            top: 7,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => All(2)),
                                );
                              },
                              child: Text(
                                "Tum Liste",
                                style: GoogleFonts.ptSerif(
                                    fontSize: 15, color: Colors.black),
                              ),
                            )),
                        Align(
                          alignment: Alignment.center,
                          child: Text("Şifalı Bitkiler",
                              style: GoogleFonts.ptSerif(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(87, 175, 1, 1),
                                  fontSize: 20)),
                        ),
                      ],
                    )),
                Padding(padding: EdgeInsets.only(bottom: 5)),
                Container(
                    height: ((MediaQuery.of(context).size.height / 2) / 2) - 55,
                    child: StreamBuilder(
                        stream: bloc.allHerbs,
                        builder: (context, AsyncSnapshot<List<Blog>> snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (BuildContext ctxt, int index) {
                                  return Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BlogPage(snapshot
                                                          .data[index])),
                                            );
                                          },
                                          child: Card(
                                              color: Colors.green,
                                              elevation: 2,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              child: Stack(
                                                children: <Widget>[
                                                  Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2.5,
                                                      height: ((MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  2) /
                                                              2) -
                                                          55,
                                                      child: Image.network(
                                                        ApiProvider.host +
                                                            snapshot.data[index]
                                                                ._image,
                                                        fit: BoxFit.cover,
                                                      )),
                                                  Container(
                                                    color: Colors.black45,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.5,
                                                    height: ((MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                2) /
                                                            2) -
                                                        55,
                                                  ),
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      snapshot
                                                          .data[index]._title,
                                                      style: GoogleFonts.ptSans(
                                                          fontSize: 20,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              ))));
                                });
                          }
                          return Align(alignment: Alignment.center, child: CircularProgressIndicator());
                        }))
              ],
            ))
      ],
    ));
  }
}
