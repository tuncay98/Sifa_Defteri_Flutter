part of sifa;

class _BlogState extends State<BlogPage> {
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
                ))
          ],
        ));
  }
}
