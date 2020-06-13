part of sifa;

class _BlogState extends State<BlogPage> with TickerProviderStateMixin {
  InterstitialAd myInterstitial;

  InterstitialAd buildInterstitialAd() {
    return InterstitialAd(
      adUnitId: "ca-app-pub-9352913451465220/5377726944",
      listener: (MobileAdEvent event) {
        if (event == MobileAdEvent.loaded) {
          showInterstitialAd();
        } else if (event == MobileAdEvent.failedToLoad) {
          Navigator.of(context).pop();
        } else if (event == MobileAdEvent.closed) {
          Navigator.of(context).pop();
        }
        print(event);
      },
    );
  }

  void showInterstitialAd() {
    myInterstitial..show();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog<String>(
        context: context,
        builder: (BuildContext context) => new AlertDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 120, vertical: 20),
          title: new Text("Reklam Yükleniyor..."),
          content: Container(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(),
          ),
        ),
      );
    });
    myInterstitial = buildInterstitialAd()..load();
  }

  @override
  void dispose() {
    myInterstitial.dispose();
    super.dispose();
  }

  dynamic get jsonObj => widget.jsonObj;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(87, 175, 1, 1),
          title: Text(jsonObj.title),
        ),
        body: Column(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                child: Image.network(
                  ApiProvider.host + jsonObj.image,
                  fit: BoxFit.cover,
                )),
            Container(
                height: MediaQuery.of(context).size.height / 2,
                child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.only(top: 10, left: 5),
                      child: Text(
                        jsonObj.text,
                        style: GoogleFonts.ptSans(fontWeight: FontWeight.w600),
                      )),
                )),
          ],
        ));
  }
}
