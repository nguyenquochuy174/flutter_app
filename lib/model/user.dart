class User {
    Address address;
    int id;
    String email;
    String username;
    String password;
    Name name;
    String phone;
    int v;

    User({
        required this.address,
        required this.id,
        required this.email,
        required this.username,
        required this.password,
        required this.name,
        required this.phone,
        required this.v,
    });
    factory User.fromJson(Map<String, dynamic> json) {
        return User(
            address: Address(
                geolocation: Geolocation(
                    lat: json['address']['geolocation']['lat'] ?? '',
                    long: json['address']['geolocation']['long'] ?? '',
                ),
                city: json['address']['city'] ?? '',
                street: json['address']['street'] ?? '',
                number: json['address']['number'] ?? 0,
                zipcode: json['address']['zipcode'] ?? '',
            ),
            id: json['id'] ?? 0,
            email: json['email'] ?? '',
            username: json['username'] ?? '',
            password: json['password'] ?? '',
            name: Name(
                firstname:  json['name']['firstname'] ?? '',
                lastname:  json['name']['lastname'] ?? '',
            ),
            phone: json['phone'] ?? '',
            v: json['__v'] ?? 0,
        );
    }
}

class Address {
    Geolocation geolocation;
    String city;
    String street;
    int number;
    String zipcode;

    Address({
        required this.geolocation,
        required this.city,
        required this.street,
        required this.number,
        required this.zipcode,
    });

}

class Geolocation {
    String lat;
    String long;

    Geolocation({
        required this.lat,
        required this.long,
    });

}

class Name {
    String firstname;
    String lastname;

    Name({
        required this.firstname,
        required this.lastname,
    });
    
    @override
    String toString() {
      return "$firstname $lastname";
    }

}
