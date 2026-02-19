class CustomerDetails {
  final String name;
  final String city;
  final List<String> favouritePlaces;
  final double balance;

  CustomerDetails({
    required this.name,
    required this.city,
    required this.favouritePlaces,
    required this.balance,
  });

  CustomerDetails copyWith({
    String? name,
    String? city,
    List<String>? favouritePlaces,
    double? balance,
  }) {
    return CustomerDetails(
      name: name ?? this.name,
      city: city ?? this.city,
      favouritePlaces: favouritePlaces ?? List.from(this.favouritePlaces),
      balance: balance ?? this.balance,
    );
  }

  factory CustomerDetails.fromJson(Map<String, dynamic> json) {
    return CustomerDetails(
      name: json['name'] as String? ?? '',
      city: json['city'] as String? ?? '',
      favouritePlaces: json['favouritePlaces'] != null
          ? List<String>.from(json['favouritePlaces'] as List)
          : <String>[],
      balance: (json['balance'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'city': city,
        'favouritePlaces': favouritePlaces,
        'balance': balance,
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CustomerDetails &&
        other.name == name &&
        other.city == city &&
        _listEquals(other.favouritePlaces, favouritePlaces) &&
        other.balance == balance;
  }

  @override
  int get hashCode =>
      name.hashCode ^ city.hashCode ^ favouritePlaces.hashCode ^ balance.hashCode;

  static bool _listEquals(List<String> a, List<String> b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
