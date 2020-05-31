part of sifa;

class _AllState extends State<All> {
  int get type => widget.type;

  @override
  void initState() {
    super.initState();
    type == 1 ? bloc.fetchDiseases() : bloc.fetchHerbs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(87, 175, 1, 1),
        title: type == 1 ? Text('Hastalıklar') : Text("Şifalı Bitkiler"),
        actions: <Widget>[
          /*IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              })*/
        ],
      ),
      body: StreamBuilder(
          stream: type == 1 ? bloc.allDiseases : bloc.allHerbs,
          builder: (context, AsyncSnapshot<List<Blog>> snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BlogPage(snapshot.data[index])),
                              );
                            },
                            child: Card(
                                color: Colors.green,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        child: Image.network(
                                          ApiProvider.host +
                                              snapshot.data[index]._image,
                                          fit: BoxFit.cover,
                                        )),
                                    Container(
                                        color: Colors.black45,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        snapshot.data[index]._title,
                                        style: GoogleFonts.ptSans(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ))));
                  });
            }
            return Container(
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                ));
          }),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
            ),
          )
        ],
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Column();
  }
}
