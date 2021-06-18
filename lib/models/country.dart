// To parse this JSON data, do
//
//     final country = countryFromJson(jsonString);

import 'dart:convert';

List<Country> countryFromJson(String str) => List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

String countryToJson(List<Country> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Country {
    Country({
        this.name,
        this.topLevelDomain,
        this.alpha2Code,
        this.alpha3Code,
        this.callingCodes,
        this.capital,
        this.altSpellings,
        this.region,
        this.subregion,
        this.population,
        this.latlng,
        this.demonym,
        this.area,
        this.gini,
        this.timezones,
        this.borders,
        this.nativeName,
        this.numericCode,
        this.currencies,
        this.languages,
        this.translations,
        this.flag,
        this.regionalBlocs,
        this.cioc,
    });

    String name;
    List<String> topLevelDomain;
    String alpha2Code;
    String alpha3Code;
    List<String> callingCodes;
    String capital;
    List<String> altSpellings;
    Region region;
    Subregion subregion;
    int population;
    List<double> latlng;
    String demonym;
    double area;
    double gini;
    List<String> timezones;
    List<String> borders;
    String nativeName;
    String numericCode;
    List<Currency> currencies;
    List<Language> languages;
    Translations translations;
    String flag;
    List<RegionalBloc> regionalBlocs;
    String cioc;

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        topLevelDomain: List<String>.from(json["topLevelDomain"].map((x) => x)),
        alpha2Code: json["alpha2Code"],
        alpha3Code: json["alpha3Code"],
        callingCodes: List<String>.from(json["callingCodes"].map((x) => x)),
        capital: json["capital"],
        altSpellings: List<String>.from(json["altSpellings"].map((x) => x)),
        region: regionValues.map[json["region"]],
        subregion: subregionValues.map[json["subregion"]],
        population: json["population"],
        latlng: List<double>.from(json["latlng"].map((x) => x.toDouble())),
        demonym: json["demonym"],
        area: json["area"] == null ? null : json["area"].toDouble(),
        gini: json["gini"] == null ? null : json["gini"].toDouble(),
        timezones: List<String>.from(json["timezones"].map((x) => x)),
        borders: List<String>.from(json["borders"].map((x) => x)),
        nativeName: json["nativeName"],
        numericCode: json["numericCode"] == null ? null : json["numericCode"],
        currencies: List<Currency>.from(json["currencies"].map((x) => Currency.fromJson(x))),
        languages: List<Language>.from(json["languages"].map((x) => Language.fromJson(x))),
        translations: Translations.fromJson(json["translations"]),
        flag: json["flag"],
        regionalBlocs: List<RegionalBloc>.from(json["regionalBlocs"].map((x) => RegionalBloc.fromJson(x))),
        cioc: json["cioc"] == null ? null : json["cioc"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "topLevelDomain": List<dynamic>.from(topLevelDomain.map((x) => x)),
        "alpha2Code": alpha2Code,
        "alpha3Code": alpha3Code,
        "callingCodes": List<dynamic>.from(callingCodes.map((x) => x)),
        "capital": capital,
        "altSpellings": List<dynamic>.from(altSpellings.map((x) => x)),
        "region": regionValues.reverse[region],
        "subregion": subregionValues.reverse[subregion],
        "population": population,
        "latlng": List<dynamic>.from(latlng.map((x) => x)),
        "demonym": demonym,
        "area": area == null ? null : area,
        "gini": gini == null ? null : gini,
        "timezones": List<dynamic>.from(timezones.map((x) => x)),
        "borders": List<dynamic>.from(borders.map((x) => x)),
        "nativeName": nativeName,
        "numericCode": numericCode == null ? null : numericCode,
        "currencies": List<dynamic>.from(currencies.map((x) => x.toJson())),
        "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
        "translations": translations.toJson(),
        "flag": flag,
        "regionalBlocs": List<dynamic>.from(regionalBlocs.map((x) => x.toJson())),
        "cioc": cioc == null ? null : cioc,
    };
}

class Currency {
    Currency({
        this.code,
        this.name,
        this.symbol,
    });

    String code;
    String name;
    String symbol;

    factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        code: json["code"],
        name: json["name"],
        symbol: json["symbol"] == null ? null : json["symbol"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "symbol": symbol == null ? null : symbol,
    };
}

class Language {
    Language({
        this.iso6391,
        this.iso6392,
        this.name,
        this.nativeName,
    });

    String iso6391;
    String iso6392;
    String name;
    String nativeName;

    factory Language.fromJson(Map<String, dynamic> json) => Language(
        iso6391: json["iso639_1"],
        iso6392: json["iso639_2"],
        name: json["name"],
        nativeName: json["nativeName"],
    );

    Map<String, dynamic> toJson() => {
        "iso639_1": iso6391,
        "iso639_2": iso6392,
        "name": name,
        "nativeName": nativeName,
    };
}

enum Region { EUROPE }

final regionValues = EnumValues({
    "Europe": Region.EUROPE
});

class RegionalBloc {
    RegionalBloc({
        this.acronym,
        this.name,
        this.otherAcronyms,
        this.otherNames,
    });

    Acronym acronym;
    Name name;
    List<String> otherAcronyms;
    List<dynamic> otherNames;

    factory RegionalBloc.fromJson(Map<String, dynamic> json) => RegionalBloc(
        acronym: acronymValues.map[json["acronym"]],
        name: nameValues.map[json["name"]],
        otherAcronyms: List<String>.from(json["otherAcronyms"].map((x) => x)),
        otherNames: List<dynamic>.from(json["otherNames"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "acronym": acronymValues.reverse[acronym],
        "name": nameValues.reverse[name],
        "otherAcronyms": List<dynamic>.from(otherAcronyms.map((x) => x)),
        "otherNames": List<dynamic>.from(otherNames.map((x) => x)),
    };
}

enum Acronym { EU, CEFTA, EEU, EFTA }

final acronymValues = EnumValues({
    "CEFTA": Acronym.CEFTA,
    "EEU": Acronym.EEU,
    "EFTA": Acronym.EFTA,
    "EU": Acronym.EU
});

enum Name { EUROPEAN_UNION, CENTRAL_EUROPEAN_FREE_TRADE_AGREEMENT, EURASIAN_ECONOMIC_UNION, EUROPEAN_FREE_TRADE_ASSOCIATION }

final nameValues = EnumValues({
    "Central European Free Trade Agreement": Name.CENTRAL_EUROPEAN_FREE_TRADE_AGREEMENT,
    "Eurasian Economic Union": Name.EURASIAN_ECONOMIC_UNION,
    "European Free Trade Association": Name.EUROPEAN_FREE_TRADE_ASSOCIATION,
    "European Union": Name.EUROPEAN_UNION
});

enum Subregion { NORTHERN_EUROPE, SOUTHERN_EUROPE, WESTERN_EUROPE, EASTERN_EUROPE }

final subregionValues = EnumValues({
    "Eastern Europe": Subregion.EASTERN_EUROPE,
    "Northern Europe": Subregion.NORTHERN_EUROPE,
    "Southern Europe": Subregion.SOUTHERN_EUROPE,
    "Western Europe": Subregion.WESTERN_EUROPE
});

class Translations {
    Translations({
        this.de,
        this.es,
        this.fr,
        this.ja,
        this.it,
        this.br,
        this.pt,
        this.nl,
        this.hr,
        this.fa,
    });

    String de;
    String es;
    String fr;
    String ja;
    String it;
    String br;
    String pt;
    String nl;
    String hr;
    String fa;

    factory Translations.fromJson(Map<String, dynamic> json) => Translations(
        de: json["de"] == null ? null : json["de"],
        es: json["es"],
        fr: json["fr"] == null ? null : json["fr"],
        ja: json["ja"] == null ? null : json["ja"],
        it: json["it"] == null ? null : json["it"],
        br: json["br"],
        pt: json["pt"],
        nl: json["nl"] == null ? null : json["nl"],
        hr: json["hr"],
        fa: json["fa"],
    );

    Map<String, dynamic> toJson() => {
        "de": de == null ? null : de,
        "es": es,
        "fr": fr == null ? null : fr,
        "ja": ja == null ? null : ja,
        "it": it == null ? null : it,
        "br": br,
        "pt": pt,
        "nl": nl == null ? null : nl,
        "hr": hr,
        "fa": fa,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
