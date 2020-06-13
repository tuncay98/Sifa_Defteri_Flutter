part of sifa;

class Bloc {
  final _repository = Repository();
  final _diseaseFetcher = PublishSubject<List<Blog>>();
  final _herbsFetcher = PublishSubject<List<Blog>>();
  //final _seriesFetcher = PublishSubject<List<ItemModel>>();

  Stream<List<Blog>> get allDiseases => _diseaseFetcher.stream;
  Stream<List<Blog>> get allHerbs => _herbsFetcher.stream;

  fetchDiseases() async {
    List<Blog> items = await _repository.fetchDiseases();
    _diseaseFetcher.sink.add(items);
  }

  fetchHerbs() async {
    List<Blog> items = await _repository.fetchHerbs();
    _herbsFetcher.sink.add(items);
  }

  dispose() {
    //_sendLike.close();
    _diseaseFetcher.close();
    _herbsFetcher.close();
  }
}

final bloc = Bloc();

class Repository {
  final apiProvider = ApiProvider();

  Future<List<Blog>> fetchDiseases() => apiProvider.fetchDiseases();
  Future<List<Blog>> fetchHerbs() => apiProvider.fetchHerbs();
}

class ApiProvider {
  static final String host = 'https://sifadefterim.com';
  Map<String, String> header = {"auth": "5591980supertun"};
  Client client = Client();

  Future<List<Blog>> fetchDiseases() async {
    final response = await client.get('$host/api/getDiseases', headers: header);
    if (response.statusCode == 200) {
      String body = response.body;
      return List.from(json.decode(body)).map((m) => Blog.fromJson(m)).toList();
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<List<Blog>> fetchHerbs() async {
    final response = await client.get('$host/api/getHerbs', headers: header);
    if (response.statusCode == 200) {
      String body = response.body;
      return List.from(json.decode(body)).map((m) => Blog.fromJson(m)).toList();
    } else {
      throw Exception('Failed to load post');
    }
  }
}

class Blog {
  int _id;
  String _title;
  String _text;
  String _image;
  int _category;

  Blog.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    _title = parsedJson['title'];
    _text = parsedJson['text'];
    _image = parsedJson['image'];
    _category = parsedJson['categoryId'];
  }

  int get id => _id;
  String get title => _title;
  String get image => _image;
  String get text => _text;
  int get category => _category;
}
