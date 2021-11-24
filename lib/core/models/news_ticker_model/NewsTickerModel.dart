class AutoGenerate {
  AutoGenerate({
    required this.s,
    required this.m,
    required this.d,
  });
  late final int s;
  late final String m;
  late final List<D> d;

  AutoGenerate.fromJson(Map<String, dynamic> json) {
    s = json['s'];
    m = json['m'];
    d = List.from(json['d']).map((e) => D.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['s'] = s;
    _data['m'] = m;
    _data['d'] = d.map((e) => e.toJson()).toList();
    return _data;
  }
}

class D {
  D({
    required this.curCode,
    required this.curName,
    required this.turkishLira,
    this.try_24hChange,
    this.eur,
    this.eur_24hChange,
    this.usd,
    this.usd_24hChange,
    required this.img,
  });
  late final String curCode;
  late final String curName;
  late final double? turkishLira;
  late final double? try_24hChange;
  late final int? eur;
  late final double? eur_24hChange;
  late final int? usd;
  late final double? usd_24hChange;
  late final String img;

  D.fromJson(Map<String, dynamic> json) {
    curCode = json['cur_code'];
    curName = json['cur_name'];
    turkishLira = json['try'];
    try_24hChange = null;
    eur = null;
    eur_24hChange = null;
    usd = null;
    usd_24hChange = null;
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cur_code'] = curCode;
    _data['cur_name'] = curName;
    _data['try'] = turkishLira;
    _data['try_24h_change'] = try_24hChange;
    _data['eur'] = eur;
    _data['eur_24h_change'] = eur_24hChange;
    _data['usd'] = usd;
    _data['usd_24h_change'] = usd_24hChange;
    _data['img'] = img;
    return _data;
  }
}
