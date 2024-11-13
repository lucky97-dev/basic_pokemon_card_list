class PokemonCardResponse {
  List<PokemonCard>? data;

  PokemonCardResponse({this.data});

  factory PokemonCardResponse.fromJson(Map<String, dynamic> json) {
    return PokemonCardResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PokemonCard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((e) => e.toJson()).toList(),
    };
  }
}

class PokemonCard {
  final String id;
  final String name;
  final String supertype;
  final List<String> subtypes;
  final String? level;
  final String hp;
  final List<String> types;
  final String? evolvesFrom;
  final List<String>? evolvesTo;
  final List<Ability>? abilities;
  final List<Attack> attacks;
  final List<Weakness> weaknesses;
  final List<Resistance>? resistances;
  final List<String> retreatCost;
  final int convertedRetreatCost;
  final CardSet set;
  final String number;
  final String artist;
  final String rarity;
  final String? flavorText;
  final List<int> nationalPokedexNumbers;
  final Legalities legalities;
  final CardImages images;

  PokemonCard({
    required this.id,
    required this.name,
    required this.supertype,
    required this.subtypes,
    this.level,
    required this.hp,
    required this.types,
    this.evolvesFrom,
    this.evolvesTo,
    this.abilities,
    required this.attacks,
    required this.weaknesses,
    this.resistances,
    required this.retreatCost,
    required this.convertedRetreatCost,
    required this.set,
    required this.number,
    required this.artist,
    required this.rarity,
    this.flavorText,
    required this.nationalPokedexNumbers,
    required this.legalities,
    required this.images,
  });

  factory PokemonCard.fromJson(Map<String, dynamic> json) => PokemonCard(
        id: json['id'],
        name: json['name'],
        supertype: json['supertype'],
        subtypes: List<String>.from(json['subtypes'] ?? []),
        level: json['level'],
        hp: json['hp'],
        types: List<String>.from(json['types'] ?? []),
        evolvesFrom: json['evolvesFrom'],
        evolvesTo: List<String>.from(json['evolvesTo'] ?? []),
        abilities: json['abilities'] != null
            ? (json['abilities'] as List)
                .map((i) => Ability.fromJson(i))
                .toList()
            : null,
        attacks:
            (json['attacks'] as List).map((i) => Attack.fromJson(i)).toList(),
        weaknesses: json['weaknesses'] != null
            ? (json['weaknesses'] as List)
                .map((i) => Weakness.fromJson(i))
                .toList()
            : [],
        resistances: json['resistances'] != null
            ? (json['resistances'] as List)
                .map((i) => Resistance.fromJson(i))
                .toList()
            : null,
        retreatCost: List<String>.from(json['retreatCost'] ?? []),
        convertedRetreatCost: json['convertedRetreatCost'] ?? 0,
        set: CardSet.fromJson(json['set']),
        number: json['number'],
        artist: json['artist'],
        rarity: json['rarity'] ?? "",
        flavorText: json['flavorText'],
        nationalPokedexNumbers:
            List<int>.from(json['nationalPokedexNumbers'] ?? []),
        legalities: Legalities.fromJson(json['legalities']),
        images: CardImages.fromJson(json['images']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'supertype': supertype,
        'subtypes': subtypes,
        'level': level,
        'hp': hp,
        'types': types,
        'evolvesFrom': evolvesFrom,
        'evolvesTo': evolvesTo,
        'abilities': abilities?.map((a) => a.toJson()).toList(),
        'attacks': attacks.map((a) => a.toJson()).toList(),
        'weaknesses': weaknesses!.map((w) => w!.toJson()).toList(),
        'resistances': resistances?.map((r) => r.toJson()).toList(),
        'retreatCost': retreatCost,
        'convertedRetreatCost': convertedRetreatCost,
        'set': set.toJson(),
        'number': number,
        'artist': artist,
        'rarity': rarity,
        'flavorText': flavorText,
        'nationalPokedexNumbers': nationalPokedexNumbers,
        'legalities': legalities.toJson(),
        'images': images.toJson(),
      };
}

class Ability {
  final String name;
  final String text;
  final String type;

  Ability({required this.name, required this.text, required this.type});

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        name: json['name'],
        text: json['text'],
        type: json['type'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'text': text,
        'type': type,
      };
}

class Attack {
  final String name;
  final List<String> cost;
  final int convertedEnergyCost;
  final String damage;
  final String text;

  Attack(
      {required this.name,
      required this.cost,
      required this.convertedEnergyCost,
      required this.damage,
      required this.text});

  factory Attack.fromJson(Map<String, dynamic> json) => Attack(
        name: json['name'],
        cost: List<String>.from(json['cost']),
        convertedEnergyCost: json['convertedEnergyCost'],
        damage: json['damage'],
        text: json['text'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'cost': cost,
        'convertedEnergyCost': convertedEnergyCost,
        'damage': damage,
        'text': text,
      };
}

class Weakness {
  final String type;
  final String value;

  Weakness({required this.type, required this.value});

  factory Weakness.fromJson(Map<String, dynamic> json) => Weakness(
        type: json['type'],
        value: json['value'],
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'value': value,
      };
}

class Resistance {
  final String type;
  final String value;

  Resistance({required this.type, required this.value});

  factory Resistance.fromJson(Map<String, dynamic> json) => Resistance(
        type: json['type'],
        value: json['value'],
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'value': value,
      };
}

class CardSet {
  final String id;
  final String name;
  final String series;
  final String ptcgoCode;
  final String releaseDate;
  final String? symbolUrl;
  final String? logoUrl;

  CardSet({
    required this.id,
    required this.name,
    required this.series,
    required this.ptcgoCode,
    required this.releaseDate,
    this.symbolUrl,
    this.logoUrl,
  });

  factory CardSet.fromJson(Map<String, dynamic> json) => CardSet(
        id: json['id'],
        name: json['name'],
        series: json['series'],
        ptcgoCode: json['ptcgoCode'] ?? "",
        releaseDate: json['releaseDate'],
        symbolUrl: json['images']['symbol'],
        logoUrl: json['images']['logo'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'series': series,
        'ptcgoCode': ptcgoCode,
        'releaseDate': releaseDate,
        'images': {'symbol': symbolUrl, 'logo': logoUrl},
      };
}

class Legalities {
  final String unlimited;
  final String? expanded;

  Legalities({required this.unlimited, this.expanded});

  factory Legalities.fromJson(Map<String, dynamic> json) => Legalities(
        unlimited: json['unlimited'],
        expanded: json['expanded'],
      );

  Map<String, dynamic> toJson() => {
        'unlimited': unlimited,
        'expanded': expanded,
      };
}

class CardImages {
  final String small;
  final String large;

  CardImages({required this.small, required this.large});

  factory CardImages.fromJson(Map<String, dynamic> json) => CardImages(
        small: json['small'],
        large: json['large'],
      );

  Map<String, dynamic> toJson() => {
        'small': small,
        'large': large,
      };
}

class MarketPrices {
  final double? low;
  final double? mid;
  final double? high;
  final double? market;
  final double? directLow;

  MarketPrices({this.low, this.mid, this.high, this.market, this.directLow});

  factory MarketPrices.fromJson(Map<String, dynamic> json) => MarketPrices(
        low: json['low']?.toDouble(),
        mid: json['mid']?.toDouble(),
        high: json['high']?.toDouble(),
        market: json['market']?.toDouble(),
        directLow: json['directLow']?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'low': low,
        'mid': mid,
        'high': high,
        'market': market,
        'directLow': directLow,
      };
}
