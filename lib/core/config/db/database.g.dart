// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $HeadquartersTable extends Headquarters
    with TableInfo<$HeadquartersTable, Headquarter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HeadquartersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _synchronizedMeta = const VerificationMeta(
    'synchronized',
  );
  @override
  late final GeneratedColumn<int> synchronized = GeneratedColumn<int>(
    'synchronized',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<int> isActive = GeneratedColumn<int>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    address,
    city,
    phone,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'headquarters';
  @override
  VerificationContext validateIntegrity(
    Insertable<Headquarter> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('synchronized')) {
      context.handle(
        _synchronizedMeta,
        synchronized.isAcceptableOrUnknown(
          data['synchronized']!,
          _synchronizedMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Headquarter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Headquarter(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      synchronized: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}synchronized'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $HeadquartersTable createAlias(String alias) {
    return $HeadquartersTable(attachedDatabase, alias);
  }
}

class Headquarter extends DataClass implements Insertable<Headquarter> {
  final int id;
  final String name;
  final String address;
  final String city;
  final String phone;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int synchronized;
  final int isActive;
  const Headquarter({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
    required this.synchronized,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['address'] = Variable<String>(address);
    map['city'] = Variable<String>(city);
    map['phone'] = Variable<String>(phone);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['synchronized'] = Variable<int>(synchronized);
    map['is_active'] = Variable<int>(isActive);
    return map;
  }

  HeadquartersCompanion toCompanion(bool nullToAbsent) {
    return HeadquartersCompanion(
      id: Value(id),
      name: Value(name),
      address: Value(address),
      city: Value(city),
      phone: Value(phone),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      synchronized: Value(synchronized),
      isActive: Value(isActive),
    );
  }

  factory Headquarter.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Headquarter(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String>(json['address']),
      city: serializer.fromJson<String>(json['city']),
      phone: serializer.fromJson<String>(json['phone']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      synchronized: serializer.fromJson<int>(json['synchronized']),
      isActive: serializer.fromJson<int>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String>(address),
      'city': serializer.toJson<String>(city),
      'phone': serializer.toJson<String>(phone),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'synchronized': serializer.toJson<int>(synchronized),
      'isActive': serializer.toJson<int>(isActive),
    };
  }

  Headquarter copyWith({
    int? id,
    String? name,
    String? address,
    String? city,
    String? phone,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
    int? isActive,
  }) => Headquarter(
    id: id ?? this.id,
    name: name ?? this.name,
    address: address ?? this.address,
    city: city ?? this.city,
    phone: phone ?? this.phone,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    synchronized: synchronized ?? this.synchronized,
    isActive: isActive ?? this.isActive,
  );
  Headquarter copyWithCompanion(HeadquartersCompanion data) {
    return Headquarter(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      address: data.address.present ? data.address.value : this.address,
      city: data.city.present ? data.city.value : this.city,
      phone: data.phone.present ? data.phone.value : this.phone,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      synchronized: data.synchronized.present
          ? data.synchronized.value
          : this.synchronized,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Headquarter(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('city: $city, ')
          ..write('phone: $phone, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    address,
    city,
    phone,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Headquarter &&
          other.id == this.id &&
          other.name == this.name &&
          other.address == this.address &&
          other.city == this.city &&
          other.phone == this.phone &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.synchronized == this.synchronized &&
          other.isActive == this.isActive);
}

class HeadquartersCompanion extends UpdateCompanion<Headquarter> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> address;
  final Value<String> city;
  final Value<String> phone;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> synchronized;
  final Value<int> isActive;
  const HeadquartersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.city = const Value.absent(),
    this.phone = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  HeadquartersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String address,
    required String city,
    required String phone,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : name = Value(name),
       address = Value(address),
       city = Value(city),
       phone = Value(phone);
  static Insertable<Headquarter> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? address,
    Expression<String>? city,
    Expression<String>? phone,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? synchronized,
    Expression<int>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (city != null) 'city': city,
      if (phone != null) 'phone': phone,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (synchronized != null) 'synchronized': synchronized,
      if (isActive != null) 'is_active': isActive,
    });
  }

  HeadquartersCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? address,
    Value<String>? city,
    Value<String>? phone,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? synchronized,
    Value<int>? isActive,
  }) {
    return HeadquartersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      city: city ?? this.city,
      phone: phone ?? this.phone,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      synchronized: synchronized ?? this.synchronized,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (synchronized.present) {
      map['synchronized'] = Variable<int>(synchronized.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<int>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HeadquartersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('city: $city, ')
          ..write('phone: $phone, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _passwordMeta = const VerificationMeta(
    'password',
  );
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _headquarterIdMeta = const VerificationMeta(
    'headquarterId',
  );
  @override
  late final GeneratedColumn<int> headquarterId = GeneratedColumn<int>(
    'headquarter_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES headquarters (id) ON UPDATE CASCADE ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _synchronizedMeta = const VerificationMeta(
    'synchronized',
  );
  @override
  late final GeneratedColumn<int> synchronized = GeneratedColumn<int>(
    'synchronized',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<int> isActive = GeneratedColumn<int>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    username,
    password,
    headquarterId,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(
        _passwordMeta,
        password.isAcceptableOrUnknown(data['password']!, _passwordMeta),
      );
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('headquarter_id')) {
      context.handle(
        _headquarterIdMeta,
        headquarterId.isAcceptableOrUnknown(
          data['headquarter_id']!,
          _headquarterIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_headquarterIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('synchronized')) {
      context.handle(
        _synchronizedMeta,
        synchronized.isAcceptableOrUnknown(
          data['synchronized']!,
          _synchronizedMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      )!,
      password: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password'],
      )!,
      headquarterId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}headquarter_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      synchronized: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}synchronized'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String username;
  final String password;
  final int headquarterId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int synchronized;
  final int isActive;
  const User({
    required this.id,
    required this.username,
    required this.password,
    required this.headquarterId,
    required this.createdAt,
    required this.updatedAt,
    required this.synchronized,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['username'] = Variable<String>(username);
    map['password'] = Variable<String>(password);
    map['headquarter_id'] = Variable<int>(headquarterId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['synchronized'] = Variable<int>(synchronized);
    map['is_active'] = Variable<int>(isActive);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      username: Value(username),
      password: Value(password),
      headquarterId: Value(headquarterId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      synchronized: Value(synchronized),
      isActive: Value(isActive),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
      headquarterId: serializer.fromJson<int>(json['headquarterId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      synchronized: serializer.fromJson<int>(json['synchronized']),
      isActive: serializer.fromJson<int>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
      'headquarterId': serializer.toJson<int>(headquarterId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'synchronized': serializer.toJson<int>(synchronized),
      'isActive': serializer.toJson<int>(isActive),
    };
  }

  User copyWith({
    int? id,
    String? username,
    String? password,
    int? headquarterId,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
    int? isActive,
  }) => User(
    id: id ?? this.id,
    username: username ?? this.username,
    password: password ?? this.password,
    headquarterId: headquarterId ?? this.headquarterId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    synchronized: synchronized ?? this.synchronized,
    isActive: isActive ?? this.isActive,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      username: data.username.present ? data.username.value : this.username,
      password: data.password.present ? data.password.value : this.password,
      headquarterId: data.headquarterId.present
          ? data.headquarterId.value
          : this.headquarterId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      synchronized: data.synchronized.present
          ? data.synchronized.value
          : this.synchronized,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('headquarterId: $headquarterId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    username,
    password,
    headquarterId,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.username == this.username &&
          other.password == this.password &&
          other.headquarterId == this.headquarterId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.synchronized == this.synchronized &&
          other.isActive == this.isActive);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> username;
  final Value<String> password;
  final Value<int> headquarterId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> synchronized;
  final Value<int> isActive;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
    this.headquarterId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String username,
    required String password,
    required int headquarterId,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : username = Value(username),
       password = Value(password),
       headquarterId = Value(headquarterId);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? username,
    Expression<String>? password,
    Expression<int>? headquarterId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? synchronized,
    Expression<int>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
      if (headquarterId != null) 'headquarter_id': headquarterId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (synchronized != null) 'synchronized': synchronized,
      if (isActive != null) 'is_active': isActive,
    });
  }

  UsersCompanion copyWith({
    Value<int>? id,
    Value<String>? username,
    Value<String>? password,
    Value<int>? headquarterId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? synchronized,
    Value<int>? isActive,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      headquarterId: headquarterId ?? this.headquarterId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      synchronized: synchronized ?? this.synchronized,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (headquarterId.present) {
      map['headquarter_id'] = Variable<int>(headquarterId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (synchronized.present) {
      map['synchronized'] = Variable<int>(synchronized.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<int>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('headquarterId: $headquarterId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $SogisTable extends Sogis with TableInfo<$SogisTable, Sogi> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SogisTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _synchronizedMeta = const VerificationMeta(
    'synchronized',
  );
  @override
  late final GeneratedColumn<int> synchronized = GeneratedColumn<int>(
    'synchronized',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<int> isActive = GeneratedColumn<int>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sogis';
  @override
  VerificationContext validateIntegrity(
    Insertable<Sogi> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('synchronized')) {
      context.handle(
        _synchronizedMeta,
        synchronized.isAcceptableOrUnknown(
          data['synchronized']!,
          _synchronizedMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Sogi map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Sogi(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      synchronized: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}synchronized'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $SogisTable createAlias(String alias) {
    return $SogisTable(attachedDatabase, alias);
  }
}

class Sogi extends DataClass implements Insertable<Sogi> {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int synchronized;
  final int isActive;
  const Sogi({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.synchronized,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['synchronized'] = Variable<int>(synchronized);
    map['is_active'] = Variable<int>(isActive);
    return map;
  }

  SogisCompanion toCompanion(bool nullToAbsent) {
    return SogisCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      synchronized: Value(synchronized),
      isActive: Value(isActive),
    );
  }

  factory Sogi.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Sogi(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      synchronized: serializer.fromJson<int>(json['synchronized']),
      isActive: serializer.fromJson<int>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'synchronized': serializer.toJson<int>(synchronized),
      'isActive': serializer.toJson<int>(isActive),
    };
  }

  Sogi copyWith({
    int? id,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
    int? isActive,
  }) => Sogi(
    id: id ?? this.id,
    name: name ?? this.name,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    synchronized: synchronized ?? this.synchronized,
    isActive: isActive ?? this.isActive,
  );
  Sogi copyWithCompanion(SogisCompanion data) {
    return Sogi(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      synchronized: data.synchronized.present
          ? data.synchronized.value
          : this.synchronized,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Sogi(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, createdAt, updatedAt, synchronized, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Sogi &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.synchronized == this.synchronized &&
          other.isActive == this.isActive);
}

class SogisCompanion extends UpdateCompanion<Sogi> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> synchronized;
  final Value<int> isActive;
  const SogisCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  SogisCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Sogi> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? synchronized,
    Expression<int>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (synchronized != null) 'synchronized': synchronized,
      if (isActive != null) 'is_active': isActive,
    });
  }

  SogisCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? synchronized,
    Value<int>? isActive,
  }) {
    return SogisCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      synchronized: synchronized ?? this.synchronized,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (synchronized.present) {
      map['synchronized'] = Variable<int>(synchronized.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<int>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SogisCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $BelstsTable extends Belsts with TableInfo<$BelstsTable, Belst> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BelstsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _synchronizedMeta = const VerificationMeta(
    'synchronized',
  );
  @override
  late final GeneratedColumn<int> synchronized = GeneratedColumn<int>(
    'synchronized',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<int> isActive = GeneratedColumn<int>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'belsts';
  @override
  VerificationContext validateIntegrity(
    Insertable<Belst> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('synchronized')) {
      context.handle(
        _synchronizedMeta,
        synchronized.isAcceptableOrUnknown(
          data['synchronized']!,
          _synchronizedMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Belst map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Belst(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      synchronized: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}synchronized'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $BelstsTable createAlias(String alias) {
    return $BelstsTable(attachedDatabase, alias);
  }
}

class Belst extends DataClass implements Insertable<Belst> {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int synchronized;
  final int isActive;
  const Belst({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.synchronized,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['synchronized'] = Variable<int>(synchronized);
    map['is_active'] = Variable<int>(isActive);
    return map;
  }

  BelstsCompanion toCompanion(bool nullToAbsent) {
    return BelstsCompanion(
      id: Value(id),
      name: Value(name),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      synchronized: Value(synchronized),
      isActive: Value(isActive),
    );
  }

  factory Belst.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Belst(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      synchronized: serializer.fromJson<int>(json['synchronized']),
      isActive: serializer.fromJson<int>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'synchronized': serializer.toJson<int>(synchronized),
      'isActive': serializer.toJson<int>(isActive),
    };
  }

  Belst copyWith({
    int? id,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
    int? isActive,
  }) => Belst(
    id: id ?? this.id,
    name: name ?? this.name,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    synchronized: synchronized ?? this.synchronized,
    isActive: isActive ?? this.isActive,
  );
  Belst copyWithCompanion(BelstsCompanion data) {
    return Belst(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      synchronized: data.synchronized.present
          ? data.synchronized.value
          : this.synchronized,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Belst(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, createdAt, updatedAt, synchronized, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Belst &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.synchronized == this.synchronized &&
          other.isActive == this.isActive);
}

class BelstsCompanion extends UpdateCompanion<Belst> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> synchronized;
  final Value<int> isActive;
  const BelstsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  BelstsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Belst> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? synchronized,
    Expression<int>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (synchronized != null) 'synchronized': synchronized,
      if (isActive != null) 'is_active': isActive,
    });
  }

  BelstsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? synchronized,
    Value<int>? isActive,
  }) {
    return BelstsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      synchronized: synchronized ?? this.synchronized,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (synchronized.present) {
      map['synchronized'] = Variable<int>(synchronized.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<int>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BelstsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $SogiBeltsTable extends SogiBelts
    with TableInfo<$SogiBeltsTable, SogiBelt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SogiBeltsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _sogiIdMeta = const VerificationMeta('sogiId');
  @override
  late final GeneratedColumn<int> sogiId = GeneratedColumn<int>(
    'sogi_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES sogis (id) ON UPDATE CASCADE ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _beltsIdMeta = const VerificationMeta(
    'beltsId',
  );
  @override
  late final GeneratedColumn<int> beltsId = GeneratedColumn<int>(
    'belts_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES belsts (id) ON UPDATE CASCADE ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _synchronizedMeta = const VerificationMeta(
    'synchronized',
  );
  @override
  late final GeneratedColumn<int> synchronized = GeneratedColumn<int>(
    'synchronized',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<int> isActive = GeneratedColumn<int>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sogiId,
    beltsId,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sogi_belts';
  @override
  VerificationContext validateIntegrity(
    Insertable<SogiBelt> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sogi_id')) {
      context.handle(
        _sogiIdMeta,
        sogiId.isAcceptableOrUnknown(data['sogi_id']!, _sogiIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sogiIdMeta);
    }
    if (data.containsKey('belts_id')) {
      context.handle(
        _beltsIdMeta,
        beltsId.isAcceptableOrUnknown(data['belts_id']!, _beltsIdMeta),
      );
    } else if (isInserting) {
      context.missing(_beltsIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('synchronized')) {
      context.handle(
        _synchronizedMeta,
        synchronized.isAcceptableOrUnknown(
          data['synchronized']!,
          _synchronizedMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SogiBelt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SogiBelt(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      sogiId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sogi_id'],
      )!,
      beltsId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}belts_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      synchronized: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}synchronized'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $SogiBeltsTable createAlias(String alias) {
    return $SogiBeltsTable(attachedDatabase, alias);
  }
}

class SogiBelt extends DataClass implements Insertable<SogiBelt> {
  final int id;
  final int sogiId;
  final int beltsId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int synchronized;
  final int isActive;
  const SogiBelt({
    required this.id,
    required this.sogiId,
    required this.beltsId,
    required this.createdAt,
    required this.updatedAt,
    required this.synchronized,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sogi_id'] = Variable<int>(sogiId);
    map['belts_id'] = Variable<int>(beltsId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['synchronized'] = Variable<int>(synchronized);
    map['is_active'] = Variable<int>(isActive);
    return map;
  }

  SogiBeltsCompanion toCompanion(bool nullToAbsent) {
    return SogiBeltsCompanion(
      id: Value(id),
      sogiId: Value(sogiId),
      beltsId: Value(beltsId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      synchronized: Value(synchronized),
      isActive: Value(isActive),
    );
  }

  factory SogiBelt.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SogiBelt(
      id: serializer.fromJson<int>(json['id']),
      sogiId: serializer.fromJson<int>(json['sogiId']),
      beltsId: serializer.fromJson<int>(json['beltsId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      synchronized: serializer.fromJson<int>(json['synchronized']),
      isActive: serializer.fromJson<int>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sogiId': serializer.toJson<int>(sogiId),
      'beltsId': serializer.toJson<int>(beltsId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'synchronized': serializer.toJson<int>(synchronized),
      'isActive': serializer.toJson<int>(isActive),
    };
  }

  SogiBelt copyWith({
    int? id,
    int? sogiId,
    int? beltsId,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
    int? isActive,
  }) => SogiBelt(
    id: id ?? this.id,
    sogiId: sogiId ?? this.sogiId,
    beltsId: beltsId ?? this.beltsId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    synchronized: synchronized ?? this.synchronized,
    isActive: isActive ?? this.isActive,
  );
  SogiBelt copyWithCompanion(SogiBeltsCompanion data) {
    return SogiBelt(
      id: data.id.present ? data.id.value : this.id,
      sogiId: data.sogiId.present ? data.sogiId.value : this.sogiId,
      beltsId: data.beltsId.present ? data.beltsId.value : this.beltsId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      synchronized: data.synchronized.present
          ? data.synchronized.value
          : this.synchronized,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SogiBelt(')
          ..write('id: $id, ')
          ..write('sogiId: $sogiId, ')
          ..write('beltsId: $beltsId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    sogiId,
    beltsId,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SogiBelt &&
          other.id == this.id &&
          other.sogiId == this.sogiId &&
          other.beltsId == this.beltsId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.synchronized == this.synchronized &&
          other.isActive == this.isActive);
}

class SogiBeltsCompanion extends UpdateCompanion<SogiBelt> {
  final Value<int> id;
  final Value<int> sogiId;
  final Value<int> beltsId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> synchronized;
  final Value<int> isActive;
  const SogiBeltsCompanion({
    this.id = const Value.absent(),
    this.sogiId = const Value.absent(),
    this.beltsId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  SogiBeltsCompanion.insert({
    this.id = const Value.absent(),
    required int sogiId,
    required int beltsId,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : sogiId = Value(sogiId),
       beltsId = Value(beltsId);
  static Insertable<SogiBelt> custom({
    Expression<int>? id,
    Expression<int>? sogiId,
    Expression<int>? beltsId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? synchronized,
    Expression<int>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sogiId != null) 'sogi_id': sogiId,
      if (beltsId != null) 'belts_id': beltsId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (synchronized != null) 'synchronized': synchronized,
      if (isActive != null) 'is_active': isActive,
    });
  }

  SogiBeltsCompanion copyWith({
    Value<int>? id,
    Value<int>? sogiId,
    Value<int>? beltsId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? synchronized,
    Value<int>? isActive,
  }) {
    return SogiBeltsCompanion(
      id: id ?? this.id,
      sogiId: sogiId ?? this.sogiId,
      beltsId: beltsId ?? this.beltsId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      synchronized: synchronized ?? this.synchronized,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sogiId.present) {
      map['sogi_id'] = Variable<int>(sogiId.value);
    }
    if (beltsId.present) {
      map['belts_id'] = Variable<int>(beltsId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (synchronized.present) {
      map['synchronized'] = Variable<int>(synchronized.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<int>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SogiBeltsCompanion(')
          ..write('id: $id, ')
          ..write('sogiId: $sogiId, ')
          ..write('beltsId: $beltsId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $StudentsTable extends Students with TableInfo<$StudentsTable, Student> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _namesMeta = const VerificationMeta('names');
  @override
  late final GeneratedColumn<String> names = GeneratedColumn<String>(
    'names',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _surnamesMeta = const VerificationMeta(
    'surnames',
  );
  @override
  late final GeneratedColumn<String> surnames = GeneratedColumn<String>(
    'surnames',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeIdentifyMeta = const VerificationMeta(
    'typeIdentify',
  );
  @override
  late final GeneratedColumn<String> typeIdentify = GeneratedColumn<String>(
    'type_identify',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _identifyMeta = const VerificationMeta(
    'identify',
  );
  @override
  late final GeneratedColumn<String> identify = GeneratedColumn<String>(
    'identify',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
    'age',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
    'gender',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sizeMeta = const VerificationMeta('size');
  @override
  late final GeneratedColumn<double> size = GeneratedColumn<double>(
    'size',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _headquarterIdMeta = const VerificationMeta(
    'headquarterId',
  );
  @override
  late final GeneratedColumn<int> headquarterId = GeneratedColumn<int>(
    'headquarter_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES headquarters (id) ON UPDATE CASCADE ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _beltIdMeta = const VerificationMeta('beltId');
  @override
  late final GeneratedColumn<int> beltId = GeneratedColumn<int>(
    'belt_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES belsts (id) ON UPDATE CASCADE ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _synchronizedMeta = const VerificationMeta(
    'synchronized',
  );
  @override
  late final GeneratedColumn<int> synchronized = GeneratedColumn<int>(
    'synchronized',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<int> isActive = GeneratedColumn<int>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    names,
    surnames,
    typeIdentify,
    identify,
    age,
    gender,
    weight,
    size,
    headquarterId,
    beltId,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'students';
  @override
  VerificationContext validateIntegrity(
    Insertable<Student> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('names')) {
      context.handle(
        _namesMeta,
        names.isAcceptableOrUnknown(data['names']!, _namesMeta),
      );
    } else if (isInserting) {
      context.missing(_namesMeta);
    }
    if (data.containsKey('surnames')) {
      context.handle(
        _surnamesMeta,
        surnames.isAcceptableOrUnknown(data['surnames']!, _surnamesMeta),
      );
    } else if (isInserting) {
      context.missing(_surnamesMeta);
    }
    if (data.containsKey('type_identify')) {
      context.handle(
        _typeIdentifyMeta,
        typeIdentify.isAcceptableOrUnknown(
          data['type_identify']!,
          _typeIdentifyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_typeIdentifyMeta);
    }
    if (data.containsKey('identify')) {
      context.handle(
        _identifyMeta,
        identify.isAcceptableOrUnknown(data['identify']!, _identifyMeta),
      );
    } else if (isInserting) {
      context.missing(_identifyMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
        _ageMeta,
        age.isAcceptableOrUnknown(data['age']!, _ageMeta),
      );
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(
        _genderMeta,
        gender.isAcceptableOrUnknown(data['gender']!, _genderMeta),
      );
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('size')) {
      context.handle(
        _sizeMeta,
        size.isAcceptableOrUnknown(data['size']!, _sizeMeta),
      );
    } else if (isInserting) {
      context.missing(_sizeMeta);
    }
    if (data.containsKey('headquarter_id')) {
      context.handle(
        _headquarterIdMeta,
        headquarterId.isAcceptableOrUnknown(
          data['headquarter_id']!,
          _headquarterIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_headquarterIdMeta);
    }
    if (data.containsKey('belt_id')) {
      context.handle(
        _beltIdMeta,
        beltId.isAcceptableOrUnknown(data['belt_id']!, _beltIdMeta),
      );
    } else if (isInserting) {
      context.missing(_beltIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('synchronized')) {
      context.handle(
        _synchronizedMeta,
        synchronized.isAcceptableOrUnknown(
          data['synchronized']!,
          _synchronizedMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Student map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Student(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      names: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}names'],
      )!,
      surnames: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}surnames'],
      )!,
      typeIdentify: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type_identify'],
      )!,
      identify: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}identify'],
      )!,
      age: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}age'],
      )!,
      gender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gender'],
      )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      )!,
      size: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}size'],
      )!,
      headquarterId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}headquarter_id'],
      )!,
      beltId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}belt_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      synchronized: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}synchronized'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $StudentsTable createAlias(String alias) {
    return $StudentsTable(attachedDatabase, alias);
  }
}

class Student extends DataClass implements Insertable<Student> {
  final int id;
  final String names;
  final String surnames;
  final String typeIdentify;
  final String identify;
  final int age;
  final String gender;
  final double weight;
  final double size;
  final int headquarterId;
  final int beltId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int synchronized;
  final int isActive;
  const Student({
    required this.id,
    required this.names,
    required this.surnames,
    required this.typeIdentify,
    required this.identify,
    required this.age,
    required this.gender,
    required this.weight,
    required this.size,
    required this.headquarterId,
    required this.beltId,
    required this.createdAt,
    required this.updatedAt,
    required this.synchronized,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['names'] = Variable<String>(names);
    map['surnames'] = Variable<String>(surnames);
    map['type_identify'] = Variable<String>(typeIdentify);
    map['identify'] = Variable<String>(identify);
    map['age'] = Variable<int>(age);
    map['gender'] = Variable<String>(gender);
    map['weight'] = Variable<double>(weight);
    map['size'] = Variable<double>(size);
    map['headquarter_id'] = Variable<int>(headquarterId);
    map['belt_id'] = Variable<int>(beltId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['synchronized'] = Variable<int>(synchronized);
    map['is_active'] = Variable<int>(isActive);
    return map;
  }

  StudentsCompanion toCompanion(bool nullToAbsent) {
    return StudentsCompanion(
      id: Value(id),
      names: Value(names),
      surnames: Value(surnames),
      typeIdentify: Value(typeIdentify),
      identify: Value(identify),
      age: Value(age),
      gender: Value(gender),
      weight: Value(weight),
      size: Value(size),
      headquarterId: Value(headquarterId),
      beltId: Value(beltId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      synchronized: Value(synchronized),
      isActive: Value(isActive),
    );
  }

  factory Student.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Student(
      id: serializer.fromJson<int>(json['id']),
      names: serializer.fromJson<String>(json['names']),
      surnames: serializer.fromJson<String>(json['surnames']),
      typeIdentify: serializer.fromJson<String>(json['typeIdentify']),
      identify: serializer.fromJson<String>(json['identify']),
      age: serializer.fromJson<int>(json['age']),
      gender: serializer.fromJson<String>(json['gender']),
      weight: serializer.fromJson<double>(json['weight']),
      size: serializer.fromJson<double>(json['size']),
      headquarterId: serializer.fromJson<int>(json['headquarterId']),
      beltId: serializer.fromJson<int>(json['beltId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      synchronized: serializer.fromJson<int>(json['synchronized']),
      isActive: serializer.fromJson<int>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'names': serializer.toJson<String>(names),
      'surnames': serializer.toJson<String>(surnames),
      'typeIdentify': serializer.toJson<String>(typeIdentify),
      'identify': serializer.toJson<String>(identify),
      'age': serializer.toJson<int>(age),
      'gender': serializer.toJson<String>(gender),
      'weight': serializer.toJson<double>(weight),
      'size': serializer.toJson<double>(size),
      'headquarterId': serializer.toJson<int>(headquarterId),
      'beltId': serializer.toJson<int>(beltId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'synchronized': serializer.toJson<int>(synchronized),
      'isActive': serializer.toJson<int>(isActive),
    };
  }

  Student copyWith({
    int? id,
    String? names,
    String? surnames,
    String? typeIdentify,
    String? identify,
    int? age,
    String? gender,
    double? weight,
    double? size,
    int? headquarterId,
    int? beltId,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
    int? isActive,
  }) => Student(
    id: id ?? this.id,
    names: names ?? this.names,
    surnames: surnames ?? this.surnames,
    typeIdentify: typeIdentify ?? this.typeIdentify,
    identify: identify ?? this.identify,
    age: age ?? this.age,
    gender: gender ?? this.gender,
    weight: weight ?? this.weight,
    size: size ?? this.size,
    headquarterId: headquarterId ?? this.headquarterId,
    beltId: beltId ?? this.beltId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    synchronized: synchronized ?? this.synchronized,
    isActive: isActive ?? this.isActive,
  );
  Student copyWithCompanion(StudentsCompanion data) {
    return Student(
      id: data.id.present ? data.id.value : this.id,
      names: data.names.present ? data.names.value : this.names,
      surnames: data.surnames.present ? data.surnames.value : this.surnames,
      typeIdentify: data.typeIdentify.present
          ? data.typeIdentify.value
          : this.typeIdentify,
      identify: data.identify.present ? data.identify.value : this.identify,
      age: data.age.present ? data.age.value : this.age,
      gender: data.gender.present ? data.gender.value : this.gender,
      weight: data.weight.present ? data.weight.value : this.weight,
      size: data.size.present ? data.size.value : this.size,
      headquarterId: data.headquarterId.present
          ? data.headquarterId.value
          : this.headquarterId,
      beltId: data.beltId.present ? data.beltId.value : this.beltId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      synchronized: data.synchronized.present
          ? data.synchronized.value
          : this.synchronized,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Student(')
          ..write('id: $id, ')
          ..write('names: $names, ')
          ..write('surnames: $surnames, ')
          ..write('typeIdentify: $typeIdentify, ')
          ..write('identify: $identify, ')
          ..write('age: $age, ')
          ..write('gender: $gender, ')
          ..write('weight: $weight, ')
          ..write('size: $size, ')
          ..write('headquarterId: $headquarterId, ')
          ..write('beltId: $beltId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    names,
    surnames,
    typeIdentify,
    identify,
    age,
    gender,
    weight,
    size,
    headquarterId,
    beltId,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Student &&
          other.id == this.id &&
          other.names == this.names &&
          other.surnames == this.surnames &&
          other.typeIdentify == this.typeIdentify &&
          other.identify == this.identify &&
          other.age == this.age &&
          other.gender == this.gender &&
          other.weight == this.weight &&
          other.size == this.size &&
          other.headquarterId == this.headquarterId &&
          other.beltId == this.beltId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.synchronized == this.synchronized &&
          other.isActive == this.isActive);
}

class StudentsCompanion extends UpdateCompanion<Student> {
  final Value<int> id;
  final Value<String> names;
  final Value<String> surnames;
  final Value<String> typeIdentify;
  final Value<String> identify;
  final Value<int> age;
  final Value<String> gender;
  final Value<double> weight;
  final Value<double> size;
  final Value<int> headquarterId;
  final Value<int> beltId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> synchronized;
  final Value<int> isActive;
  const StudentsCompanion({
    this.id = const Value.absent(),
    this.names = const Value.absent(),
    this.surnames = const Value.absent(),
    this.typeIdentify = const Value.absent(),
    this.identify = const Value.absent(),
    this.age = const Value.absent(),
    this.gender = const Value.absent(),
    this.weight = const Value.absent(),
    this.size = const Value.absent(),
    this.headquarterId = const Value.absent(),
    this.beltId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  StudentsCompanion.insert({
    this.id = const Value.absent(),
    required String names,
    required String surnames,
    required String typeIdentify,
    required String identify,
    required int age,
    required String gender,
    required double weight,
    required double size,
    required int headquarterId,
    required int beltId,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : names = Value(names),
       surnames = Value(surnames),
       typeIdentify = Value(typeIdentify),
       identify = Value(identify),
       age = Value(age),
       gender = Value(gender),
       weight = Value(weight),
       size = Value(size),
       headquarterId = Value(headquarterId),
       beltId = Value(beltId);
  static Insertable<Student> custom({
    Expression<int>? id,
    Expression<String>? names,
    Expression<String>? surnames,
    Expression<String>? typeIdentify,
    Expression<String>? identify,
    Expression<int>? age,
    Expression<String>? gender,
    Expression<double>? weight,
    Expression<double>? size,
    Expression<int>? headquarterId,
    Expression<int>? beltId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? synchronized,
    Expression<int>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (names != null) 'names': names,
      if (surnames != null) 'surnames': surnames,
      if (typeIdentify != null) 'type_identify': typeIdentify,
      if (identify != null) 'identify': identify,
      if (age != null) 'age': age,
      if (gender != null) 'gender': gender,
      if (weight != null) 'weight': weight,
      if (size != null) 'size': size,
      if (headquarterId != null) 'headquarter_id': headquarterId,
      if (beltId != null) 'belt_id': beltId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (synchronized != null) 'synchronized': synchronized,
      if (isActive != null) 'is_active': isActive,
    });
  }

  StudentsCompanion copyWith({
    Value<int>? id,
    Value<String>? names,
    Value<String>? surnames,
    Value<String>? typeIdentify,
    Value<String>? identify,
    Value<int>? age,
    Value<String>? gender,
    Value<double>? weight,
    Value<double>? size,
    Value<int>? headquarterId,
    Value<int>? beltId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? synchronized,
    Value<int>? isActive,
  }) {
    return StudentsCompanion(
      id: id ?? this.id,
      names: names ?? this.names,
      surnames: surnames ?? this.surnames,
      typeIdentify: typeIdentify ?? this.typeIdentify,
      identify: identify ?? this.identify,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      weight: weight ?? this.weight,
      size: size ?? this.size,
      headquarterId: headquarterId ?? this.headquarterId,
      beltId: beltId ?? this.beltId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      synchronized: synchronized ?? this.synchronized,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (names.present) {
      map['names'] = Variable<String>(names.value);
    }
    if (surnames.present) {
      map['surnames'] = Variable<String>(surnames.value);
    }
    if (typeIdentify.present) {
      map['type_identify'] = Variable<String>(typeIdentify.value);
    }
    if (identify.present) {
      map['identify'] = Variable<String>(identify.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (size.present) {
      map['size'] = Variable<double>(size.value);
    }
    if (headquarterId.present) {
      map['headquarter_id'] = Variable<int>(headquarterId.value);
    }
    if (beltId.present) {
      map['belt_id'] = Variable<int>(beltId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (synchronized.present) {
      map['synchronized'] = Variable<int>(synchronized.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<int>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentsCompanion(')
          ..write('id: $id, ')
          ..write('names: $names, ')
          ..write('surnames: $surnames, ')
          ..write('typeIdentify: $typeIdentify, ')
          ..write('identify: $identify, ')
          ..write('age: $age, ')
          ..write('gender: $gender, ')
          ..write('weight: $weight, ')
          ..write('size: $size, ')
          ..write('headquarterId: $headquarterId, ')
          ..write('beltId: $beltId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $TournamentTable extends Tournament
    with TableInfo<$TournamentTable, TournamentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TournamentTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateStartMeta = const VerificationMeta(
    'dateStart',
  );
  @override
  late final GeneratedColumn<DateTime> dateStart = GeneratedColumn<DateTime>(
    'date_start',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateEndMeta = const VerificationMeta(
    'dateEnd',
  );
  @override
  late final GeneratedColumn<DateTime> dateEnd = GeneratedColumn<DateTime>(
    'date_end',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _synchronizedMeta = const VerificationMeta(
    'synchronized',
  );
  @override
  late final GeneratedColumn<int> synchronized = GeneratedColumn<int>(
    'synchronized',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<int> isActive = GeneratedColumn<int>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    location,
    dateStart,
    dateEnd,
    status,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tournament';
  @override
  VerificationContext validateIntegrity(
    Insertable<TournamentData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('date_start')) {
      context.handle(
        _dateStartMeta,
        dateStart.isAcceptableOrUnknown(data['date_start']!, _dateStartMeta),
      );
    } else if (isInserting) {
      context.missing(_dateStartMeta);
    }
    if (data.containsKey('date_end')) {
      context.handle(
        _dateEndMeta,
        dateEnd.isAcceptableOrUnknown(data['date_end']!, _dateEndMeta),
      );
    } else if (isInserting) {
      context.missing(_dateEndMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('synchronized')) {
      context.handle(
        _synchronizedMeta,
        synchronized.isAcceptableOrUnknown(
          data['synchronized']!,
          _synchronizedMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TournamentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TournamentData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      )!,
      dateStart: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_start'],
      )!,
      dateEnd: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_end'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      synchronized: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}synchronized'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $TournamentTable createAlias(String alias) {
    return $TournamentTable(attachedDatabase, alias);
  }
}

class TournamentData extends DataClass implements Insertable<TournamentData> {
  final int id;
  final String name;
  final String location;
  final DateTime dateStart;
  final DateTime dateEnd;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int synchronized;
  final int isActive;
  const TournamentData({
    required this.id,
    required this.name,
    required this.location,
    required this.dateStart,
    required this.dateEnd,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.synchronized,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['location'] = Variable<String>(location);
    map['date_start'] = Variable<DateTime>(dateStart);
    map['date_end'] = Variable<DateTime>(dateEnd);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['synchronized'] = Variable<int>(synchronized);
    map['is_active'] = Variable<int>(isActive);
    return map;
  }

  TournamentCompanion toCompanion(bool nullToAbsent) {
    return TournamentCompanion(
      id: Value(id),
      name: Value(name),
      location: Value(location),
      dateStart: Value(dateStart),
      dateEnd: Value(dateEnd),
      status: Value(status),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      synchronized: Value(synchronized),
      isActive: Value(isActive),
    );
  }

  factory TournamentData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TournamentData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      location: serializer.fromJson<String>(json['location']),
      dateStart: serializer.fromJson<DateTime>(json['dateStart']),
      dateEnd: serializer.fromJson<DateTime>(json['dateEnd']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      synchronized: serializer.fromJson<int>(json['synchronized']),
      isActive: serializer.fromJson<int>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'location': serializer.toJson<String>(location),
      'dateStart': serializer.toJson<DateTime>(dateStart),
      'dateEnd': serializer.toJson<DateTime>(dateEnd),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'synchronized': serializer.toJson<int>(synchronized),
      'isActive': serializer.toJson<int>(isActive),
    };
  }

  TournamentData copyWith({
    int? id,
    String? name,
    String? location,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
    int? isActive,
  }) => TournamentData(
    id: id ?? this.id,
    name: name ?? this.name,
    location: location ?? this.location,
    dateStart: dateStart ?? this.dateStart,
    dateEnd: dateEnd ?? this.dateEnd,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    synchronized: synchronized ?? this.synchronized,
    isActive: isActive ?? this.isActive,
  );
  TournamentData copyWithCompanion(TournamentCompanion data) {
    return TournamentData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      location: data.location.present ? data.location.value : this.location,
      dateStart: data.dateStart.present ? data.dateStart.value : this.dateStart,
      dateEnd: data.dateEnd.present ? data.dateEnd.value : this.dateEnd,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      synchronized: data.synchronized.present
          ? data.synchronized.value
          : this.synchronized,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TournamentData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('location: $location, ')
          ..write('dateStart: $dateStart, ')
          ..write('dateEnd: $dateEnd, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    location,
    dateStart,
    dateEnd,
    status,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TournamentData &&
          other.id == this.id &&
          other.name == this.name &&
          other.location == this.location &&
          other.dateStart == this.dateStart &&
          other.dateEnd == this.dateEnd &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.synchronized == this.synchronized &&
          other.isActive == this.isActive);
}

class TournamentCompanion extends UpdateCompanion<TournamentData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> location;
  final Value<DateTime> dateStart;
  final Value<DateTime> dateEnd;
  final Value<String> status;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> synchronized;
  final Value<int> isActive;
  const TournamentCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.location = const Value.absent(),
    this.dateStart = const Value.absent(),
    this.dateEnd = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  TournamentCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String location,
    required DateTime dateStart,
    required DateTime dateEnd,
    required String status,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : name = Value(name),
       location = Value(location),
       dateStart = Value(dateStart),
       dateEnd = Value(dateEnd),
       status = Value(status);
  static Insertable<TournamentData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? location,
    Expression<DateTime>? dateStart,
    Expression<DateTime>? dateEnd,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? synchronized,
    Expression<int>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (location != null) 'location': location,
      if (dateStart != null) 'date_start': dateStart,
      if (dateEnd != null) 'date_end': dateEnd,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (synchronized != null) 'synchronized': synchronized,
      if (isActive != null) 'is_active': isActive,
    });
  }

  TournamentCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? location,
    Value<DateTime>? dateStart,
    Value<DateTime>? dateEnd,
    Value<String>? status,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? synchronized,
    Value<int>? isActive,
  }) {
    return TournamentCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      dateStart: dateStart ?? this.dateStart,
      dateEnd: dateEnd ?? this.dateEnd,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      synchronized: synchronized ?? this.synchronized,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (dateStart.present) {
      map['date_start'] = Variable<DateTime>(dateStart.value);
    }
    if (dateEnd.present) {
      map['date_end'] = Variable<DateTime>(dateEnd.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (synchronized.present) {
      map['synchronized'] = Variable<int>(synchronized.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<int>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TournamentCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('location: $location, ')
          ..write('dateStart: $dateStart, ')
          ..write('dateEnd: $dateEnd, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $JudgeTable extends Judge with TableInfo<$JudgeTable, JudgeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JudgeTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _namesMeta = const VerificationMeta('names');
  @override
  late final GeneratedColumn<String> names = GeneratedColumn<String>(
    'names',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _surnamesMeta = const VerificationMeta(
    'surnames',
  );
  @override
  late final GeneratedColumn<String> surnames = GeneratedColumn<String>(
    'surnames',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _identifyMeta = const VerificationMeta(
    'identify',
  );
  @override
  late final GeneratedColumn<String> identify = GeneratedColumn<String>(
    'identify',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _synchronizedMeta = const VerificationMeta(
    'synchronized',
  );
  @override
  late final GeneratedColumn<int> synchronized = GeneratedColumn<int>(
    'synchronized',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<int> isActive = GeneratedColumn<int>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    names,
    surnames,
    identify,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'judge';
  @override
  VerificationContext validateIntegrity(
    Insertable<JudgeData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('names')) {
      context.handle(
        _namesMeta,
        names.isAcceptableOrUnknown(data['names']!, _namesMeta),
      );
    } else if (isInserting) {
      context.missing(_namesMeta);
    }
    if (data.containsKey('surnames')) {
      context.handle(
        _surnamesMeta,
        surnames.isAcceptableOrUnknown(data['surnames']!, _surnamesMeta),
      );
    } else if (isInserting) {
      context.missing(_surnamesMeta);
    }
    if (data.containsKey('identify')) {
      context.handle(
        _identifyMeta,
        identify.isAcceptableOrUnknown(data['identify']!, _identifyMeta),
      );
    } else if (isInserting) {
      context.missing(_identifyMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('synchronized')) {
      context.handle(
        _synchronizedMeta,
        synchronized.isAcceptableOrUnknown(
          data['synchronized']!,
          _synchronizedMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JudgeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JudgeData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      names: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}names'],
      )!,
      surnames: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}surnames'],
      )!,
      identify: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}identify'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      synchronized: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}synchronized'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $JudgeTable createAlias(String alias) {
    return $JudgeTable(attachedDatabase, alias);
  }
}

class JudgeData extends DataClass implements Insertable<JudgeData> {
  final int id;
  final String names;
  final String surnames;
  final String identify;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int synchronized;
  final int isActive;
  const JudgeData({
    required this.id,
    required this.names,
    required this.surnames,
    required this.identify,
    required this.createdAt,
    required this.updatedAt,
    required this.synchronized,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['names'] = Variable<String>(names);
    map['surnames'] = Variable<String>(surnames);
    map['identify'] = Variable<String>(identify);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['synchronized'] = Variable<int>(synchronized);
    map['is_active'] = Variable<int>(isActive);
    return map;
  }

  JudgeCompanion toCompanion(bool nullToAbsent) {
    return JudgeCompanion(
      id: Value(id),
      names: Value(names),
      surnames: Value(surnames),
      identify: Value(identify),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      synchronized: Value(synchronized),
      isActive: Value(isActive),
    );
  }

  factory JudgeData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JudgeData(
      id: serializer.fromJson<int>(json['id']),
      names: serializer.fromJson<String>(json['names']),
      surnames: serializer.fromJson<String>(json['surnames']),
      identify: serializer.fromJson<String>(json['identify']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      synchronized: serializer.fromJson<int>(json['synchronized']),
      isActive: serializer.fromJson<int>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'names': serializer.toJson<String>(names),
      'surnames': serializer.toJson<String>(surnames),
      'identify': serializer.toJson<String>(identify),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'synchronized': serializer.toJson<int>(synchronized),
      'isActive': serializer.toJson<int>(isActive),
    };
  }

  JudgeData copyWith({
    int? id,
    String? names,
    String? surnames,
    String? identify,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
    int? isActive,
  }) => JudgeData(
    id: id ?? this.id,
    names: names ?? this.names,
    surnames: surnames ?? this.surnames,
    identify: identify ?? this.identify,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    synchronized: synchronized ?? this.synchronized,
    isActive: isActive ?? this.isActive,
  );
  JudgeData copyWithCompanion(JudgeCompanion data) {
    return JudgeData(
      id: data.id.present ? data.id.value : this.id,
      names: data.names.present ? data.names.value : this.names,
      surnames: data.surnames.present ? data.surnames.value : this.surnames,
      identify: data.identify.present ? data.identify.value : this.identify,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      synchronized: data.synchronized.present
          ? data.synchronized.value
          : this.synchronized,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JudgeData(')
          ..write('id: $id, ')
          ..write('names: $names, ')
          ..write('surnames: $surnames, ')
          ..write('identify: $identify, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    names,
    surnames,
    identify,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JudgeData &&
          other.id == this.id &&
          other.names == this.names &&
          other.surnames == this.surnames &&
          other.identify == this.identify &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.synchronized == this.synchronized &&
          other.isActive == this.isActive);
}

class JudgeCompanion extends UpdateCompanion<JudgeData> {
  final Value<int> id;
  final Value<String> names;
  final Value<String> surnames;
  final Value<String> identify;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> synchronized;
  final Value<int> isActive;
  const JudgeCompanion({
    this.id = const Value.absent(),
    this.names = const Value.absent(),
    this.surnames = const Value.absent(),
    this.identify = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  JudgeCompanion.insert({
    this.id = const Value.absent(),
    required String names,
    required String surnames,
    required String identify,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : names = Value(names),
       surnames = Value(surnames),
       identify = Value(identify);
  static Insertable<JudgeData> custom({
    Expression<int>? id,
    Expression<String>? names,
    Expression<String>? surnames,
    Expression<String>? identify,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? synchronized,
    Expression<int>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (names != null) 'names': names,
      if (surnames != null) 'surnames': surnames,
      if (identify != null) 'identify': identify,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (synchronized != null) 'synchronized': synchronized,
      if (isActive != null) 'is_active': isActive,
    });
  }

  JudgeCompanion copyWith({
    Value<int>? id,
    Value<String>? names,
    Value<String>? surnames,
    Value<String>? identify,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? synchronized,
    Value<int>? isActive,
  }) {
    return JudgeCompanion(
      id: id ?? this.id,
      names: names ?? this.names,
      surnames: surnames ?? this.surnames,
      identify: identify ?? this.identify,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      synchronized: synchronized ?? this.synchronized,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (names.present) {
      map['names'] = Variable<String>(names.value);
    }
    if (surnames.present) {
      map['surnames'] = Variable<String>(surnames.value);
    }
    if (identify.present) {
      map['identify'] = Variable<String>(identify.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (synchronized.present) {
      map['synchronized'] = Variable<int>(synchronized.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<int>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JudgeCompanion(')
          ..write('id: $id, ')
          ..write('names: $names, ')
          ..write('surnames: $surnames, ')
          ..write('identify: $identify, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $JudgeTournamentTable extends JudgeTournament
    with TableInfo<$JudgeTournamentTable, JudgeTournamentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JudgeTournamentTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _judgeIdMeta = const VerificationMeta(
    'judgeId',
  );
  @override
  late final GeneratedColumn<int> judgeId = GeneratedColumn<int>(
    'judge_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES judge (id) ON UPDATE CASCADE ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _tournamentIdMeta = const VerificationMeta(
    'tournamentId',
  );
  @override
  late final GeneratedColumn<int> tournamentId = GeneratedColumn<int>(
    'tournament_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tournament (id) ON UPDATE CASCADE ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _synchronizedMeta = const VerificationMeta(
    'synchronized',
  );
  @override
  late final GeneratedColumn<int> synchronized = GeneratedColumn<int>(
    'synchronized',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<int> isActive = GeneratedColumn<int>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    judgeId,
    tournamentId,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'judge_tournament';
  @override
  VerificationContext validateIntegrity(
    Insertable<JudgeTournamentData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('judge_id')) {
      context.handle(
        _judgeIdMeta,
        judgeId.isAcceptableOrUnknown(data['judge_id']!, _judgeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_judgeIdMeta);
    }
    if (data.containsKey('tournament_id')) {
      context.handle(
        _tournamentIdMeta,
        tournamentId.isAcceptableOrUnknown(
          data['tournament_id']!,
          _tournamentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tournamentIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('synchronized')) {
      context.handle(
        _synchronizedMeta,
        synchronized.isAcceptableOrUnknown(
          data['synchronized']!,
          _synchronizedMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JudgeTournamentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JudgeTournamentData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      judgeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}judge_id'],
      )!,
      tournamentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tournament_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      synchronized: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}synchronized'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $JudgeTournamentTable createAlias(String alias) {
    return $JudgeTournamentTable(attachedDatabase, alias);
  }
}

class JudgeTournamentData extends DataClass
    implements Insertable<JudgeTournamentData> {
  final int id;
  final int judgeId;
  final int tournamentId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int synchronized;
  final int isActive;
  const JudgeTournamentData({
    required this.id,
    required this.judgeId,
    required this.tournamentId,
    required this.createdAt,
    required this.updatedAt,
    required this.synchronized,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['judge_id'] = Variable<int>(judgeId);
    map['tournament_id'] = Variable<int>(tournamentId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['synchronized'] = Variable<int>(synchronized);
    map['is_active'] = Variable<int>(isActive);
    return map;
  }

  JudgeTournamentCompanion toCompanion(bool nullToAbsent) {
    return JudgeTournamentCompanion(
      id: Value(id),
      judgeId: Value(judgeId),
      tournamentId: Value(tournamentId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      synchronized: Value(synchronized),
      isActive: Value(isActive),
    );
  }

  factory JudgeTournamentData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JudgeTournamentData(
      id: serializer.fromJson<int>(json['id']),
      judgeId: serializer.fromJson<int>(json['judgeId']),
      tournamentId: serializer.fromJson<int>(json['tournamentId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      synchronized: serializer.fromJson<int>(json['synchronized']),
      isActive: serializer.fromJson<int>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'judgeId': serializer.toJson<int>(judgeId),
      'tournamentId': serializer.toJson<int>(tournamentId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'synchronized': serializer.toJson<int>(synchronized),
      'isActive': serializer.toJson<int>(isActive),
    };
  }

  JudgeTournamentData copyWith({
    int? id,
    int? judgeId,
    int? tournamentId,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
    int? isActive,
  }) => JudgeTournamentData(
    id: id ?? this.id,
    judgeId: judgeId ?? this.judgeId,
    tournamentId: tournamentId ?? this.tournamentId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    synchronized: synchronized ?? this.synchronized,
    isActive: isActive ?? this.isActive,
  );
  JudgeTournamentData copyWithCompanion(JudgeTournamentCompanion data) {
    return JudgeTournamentData(
      id: data.id.present ? data.id.value : this.id,
      judgeId: data.judgeId.present ? data.judgeId.value : this.judgeId,
      tournamentId: data.tournamentId.present
          ? data.tournamentId.value
          : this.tournamentId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      synchronized: data.synchronized.present
          ? data.synchronized.value
          : this.synchronized,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JudgeTournamentData(')
          ..write('id: $id, ')
          ..write('judgeId: $judgeId, ')
          ..write('tournamentId: $tournamentId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    judgeId,
    tournamentId,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JudgeTournamentData &&
          other.id == this.id &&
          other.judgeId == this.judgeId &&
          other.tournamentId == this.tournamentId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.synchronized == this.synchronized &&
          other.isActive == this.isActive);
}

class JudgeTournamentCompanion extends UpdateCompanion<JudgeTournamentData> {
  final Value<int> id;
  final Value<int> judgeId;
  final Value<int> tournamentId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> synchronized;
  final Value<int> isActive;
  const JudgeTournamentCompanion({
    this.id = const Value.absent(),
    this.judgeId = const Value.absent(),
    this.tournamentId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  JudgeTournamentCompanion.insert({
    this.id = const Value.absent(),
    required int judgeId,
    required int tournamentId,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : judgeId = Value(judgeId),
       tournamentId = Value(tournamentId);
  static Insertable<JudgeTournamentData> custom({
    Expression<int>? id,
    Expression<int>? judgeId,
    Expression<int>? tournamentId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? synchronized,
    Expression<int>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (judgeId != null) 'judge_id': judgeId,
      if (tournamentId != null) 'tournament_id': tournamentId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (synchronized != null) 'synchronized': synchronized,
      if (isActive != null) 'is_active': isActive,
    });
  }

  JudgeTournamentCompanion copyWith({
    Value<int>? id,
    Value<int>? judgeId,
    Value<int>? tournamentId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? synchronized,
    Value<int>? isActive,
  }) {
    return JudgeTournamentCompanion(
      id: id ?? this.id,
      judgeId: judgeId ?? this.judgeId,
      tournamentId: tournamentId ?? this.tournamentId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      synchronized: synchronized ?? this.synchronized,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (judgeId.present) {
      map['judge_id'] = Variable<int>(judgeId.value);
    }
    if (tournamentId.present) {
      map['tournament_id'] = Variable<int>(tournamentId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (synchronized.present) {
      map['synchronized'] = Variable<int>(synchronized.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<int>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JudgeTournamentCompanion(')
          ..write('id: $id, ')
          ..write('judgeId: $judgeId, ')
          ..write('tournamentId: $tournamentId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $GrupTable extends Grup with TableInfo<$GrupTable, GrupData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GrupTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _synchronizedMeta = const VerificationMeta(
    'synchronized',
  );
  @override
  late final GeneratedColumn<int> synchronized = GeneratedColumn<int>(
    'synchronized',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<int> isActive = GeneratedColumn<int>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'grup';
  @override
  VerificationContext validateIntegrity(
    Insertable<GrupData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('synchronized')) {
      context.handle(
        _synchronizedMeta,
        synchronized.isAcceptableOrUnknown(
          data['synchronized']!,
          _synchronizedMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GrupData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GrupData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      synchronized: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}synchronized'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $GrupTable createAlias(String alias) {
    return $GrupTable(attachedDatabase, alias);
  }
}

class GrupData extends DataClass implements Insertable<GrupData> {
  final int id;
  final String name;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int synchronized;
  final int isActive;
  const GrupData({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.synchronized,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['synchronized'] = Variable<int>(synchronized);
    map['is_active'] = Variable<int>(isActive);
    return map;
  }

  GrupCompanion toCompanion(bool nullToAbsent) {
    return GrupCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      synchronized: Value(synchronized),
      isActive: Value(isActive),
    );
  }

  factory GrupData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GrupData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      synchronized: serializer.fromJson<int>(json['synchronized']),
      isActive: serializer.fromJson<int>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'synchronized': serializer.toJson<int>(synchronized),
      'isActive': serializer.toJson<int>(isActive),
    };
  }

  GrupData copyWith({
    int? id,
    String? name,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
    int? isActive,
  }) => GrupData(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    synchronized: synchronized ?? this.synchronized,
    isActive: isActive ?? this.isActive,
  );
  GrupData copyWithCompanion(GrupCompanion data) {
    return GrupData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      synchronized: data.synchronized.present
          ? data.synchronized.value
          : this.synchronized,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GrupData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    description,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GrupData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.synchronized == this.synchronized &&
          other.isActive == this.isActive);
}

class GrupCompanion extends UpdateCompanion<GrupData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> synchronized;
  final Value<int> isActive;
  const GrupCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  GrupCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : name = Value(name),
       description = Value(description);
  static Insertable<GrupData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? synchronized,
    Expression<int>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (synchronized != null) 'synchronized': synchronized,
      if (isActive != null) 'is_active': isActive,
    });
  }

  GrupCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? description,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? synchronized,
    Value<int>? isActive,
  }) {
    return GrupCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      synchronized: synchronized ?? this.synchronized,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (synchronized.present) {
      map['synchronized'] = Variable<int>(synchronized.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<int>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GrupCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $InscriptionTable extends Inscription
    with TableInfo<$InscriptionTable, InscriptionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InscriptionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _studentIdMeta = const VerificationMeta(
    'studentId',
  );
  @override
  late final GeneratedColumn<int> studentId = GeneratedColumn<int>(
    'student_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES students (id) ON UPDATE CASCADE ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _tournamentIdMeta = const VerificationMeta(
    'tournamentId',
  );
  @override
  late final GeneratedColumn<int> tournamentId = GeneratedColumn<int>(
    'tournament_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tournament (id) ON UPDATE CASCADE ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _grupIdMeta = const VerificationMeta('grupId');
  @override
  late final GeneratedColumn<int> grupId = GeneratedColumn<int>(
    'grup_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES grup (id) ON UPDATE CASCADE ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _synchronizedMeta = const VerificationMeta(
    'synchronized',
  );
  @override
  late final GeneratedColumn<int> synchronized = GeneratedColumn<int>(
    'synchronized',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<int> isActive = GeneratedColumn<int>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    date,
    studentId,
    tournamentId,
    grupId,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inscription';
  @override
  VerificationContext validateIntegrity(
    Insertable<InscriptionData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    }
    if (data.containsKey('student_id')) {
      context.handle(
        _studentIdMeta,
        studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_studentIdMeta);
    }
    if (data.containsKey('tournament_id')) {
      context.handle(
        _tournamentIdMeta,
        tournamentId.isAcceptableOrUnknown(
          data['tournament_id']!,
          _tournamentIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tournamentIdMeta);
    }
    if (data.containsKey('grup_id')) {
      context.handle(
        _grupIdMeta,
        grupId.isAcceptableOrUnknown(data['grup_id']!, _grupIdMeta),
      );
    } else if (isInserting) {
      context.missing(_grupIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('synchronized')) {
      context.handle(
        _synchronizedMeta,
        synchronized.isAcceptableOrUnknown(
          data['synchronized']!,
          _synchronizedMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InscriptionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InscriptionData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      studentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}student_id'],
      )!,
      tournamentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tournament_id'],
      )!,
      grupId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}grup_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      synchronized: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}synchronized'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $InscriptionTable createAlias(String alias) {
    return $InscriptionTable(attachedDatabase, alias);
  }
}

class InscriptionData extends DataClass implements Insertable<InscriptionData> {
  final int id;
  final DateTime date;
  final int studentId;
  final int tournamentId;
  final int grupId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int synchronized;
  final int isActive;
  const InscriptionData({
    required this.id,
    required this.date,
    required this.studentId,
    required this.tournamentId,
    required this.grupId,
    required this.createdAt,
    required this.updatedAt,
    required this.synchronized,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<DateTime>(date);
    map['student_id'] = Variable<int>(studentId);
    map['tournament_id'] = Variable<int>(tournamentId);
    map['grup_id'] = Variable<int>(grupId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['synchronized'] = Variable<int>(synchronized);
    map['is_active'] = Variable<int>(isActive);
    return map;
  }

  InscriptionCompanion toCompanion(bool nullToAbsent) {
    return InscriptionCompanion(
      id: Value(id),
      date: Value(date),
      studentId: Value(studentId),
      tournamentId: Value(tournamentId),
      grupId: Value(grupId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      synchronized: Value(synchronized),
      isActive: Value(isActive),
    );
  }

  factory InscriptionData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InscriptionData(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      studentId: serializer.fromJson<int>(json['studentId']),
      tournamentId: serializer.fromJson<int>(json['tournamentId']),
      grupId: serializer.fromJson<int>(json['grupId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      synchronized: serializer.fromJson<int>(json['synchronized']),
      isActive: serializer.fromJson<int>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<DateTime>(date),
      'studentId': serializer.toJson<int>(studentId),
      'tournamentId': serializer.toJson<int>(tournamentId),
      'grupId': serializer.toJson<int>(grupId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'synchronized': serializer.toJson<int>(synchronized),
      'isActive': serializer.toJson<int>(isActive),
    };
  }

  InscriptionData copyWith({
    int? id,
    DateTime? date,
    int? studentId,
    int? tournamentId,
    int? grupId,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
    int? isActive,
  }) => InscriptionData(
    id: id ?? this.id,
    date: date ?? this.date,
    studentId: studentId ?? this.studentId,
    tournamentId: tournamentId ?? this.tournamentId,
    grupId: grupId ?? this.grupId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    synchronized: synchronized ?? this.synchronized,
    isActive: isActive ?? this.isActive,
  );
  InscriptionData copyWithCompanion(InscriptionCompanion data) {
    return InscriptionData(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
      tournamentId: data.tournamentId.present
          ? data.tournamentId.value
          : this.tournamentId,
      grupId: data.grupId.present ? data.grupId.value : this.grupId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      synchronized: data.synchronized.present
          ? data.synchronized.value
          : this.synchronized,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InscriptionData(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('studentId: $studentId, ')
          ..write('tournamentId: $tournamentId, ')
          ..write('grupId: $grupId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    date,
    studentId,
    tournamentId,
    grupId,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InscriptionData &&
          other.id == this.id &&
          other.date == this.date &&
          other.studentId == this.studentId &&
          other.tournamentId == this.tournamentId &&
          other.grupId == this.grupId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.synchronized == this.synchronized &&
          other.isActive == this.isActive);
}

class InscriptionCompanion extends UpdateCompanion<InscriptionData> {
  final Value<int> id;
  final Value<DateTime> date;
  final Value<int> studentId;
  final Value<int> tournamentId;
  final Value<int> grupId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> synchronized;
  final Value<int> isActive;
  const InscriptionCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.studentId = const Value.absent(),
    this.tournamentId = const Value.absent(),
    this.grupId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  InscriptionCompanion.insert({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    required int studentId,
    required int tournamentId,
    required int grupId,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : studentId = Value(studentId),
       tournamentId = Value(tournamentId),
       grupId = Value(grupId);
  static Insertable<InscriptionData> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<int>? studentId,
    Expression<int>? tournamentId,
    Expression<int>? grupId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? synchronized,
    Expression<int>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (studentId != null) 'student_id': studentId,
      if (tournamentId != null) 'tournament_id': tournamentId,
      if (grupId != null) 'grup_id': grupId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (synchronized != null) 'synchronized': synchronized,
      if (isActive != null) 'is_active': isActive,
    });
  }

  InscriptionCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? date,
    Value<int>? studentId,
    Value<int>? tournamentId,
    Value<int>? grupId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? synchronized,
    Value<int>? isActive,
  }) {
    return InscriptionCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      studentId: studentId ?? this.studentId,
      tournamentId: tournamentId ?? this.tournamentId,
      grupId: grupId ?? this.grupId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      synchronized: synchronized ?? this.synchronized,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (studentId.present) {
      map['student_id'] = Variable<int>(studentId.value);
    }
    if (tournamentId.present) {
      map['tournament_id'] = Variable<int>(tournamentId.value);
    }
    if (grupId.present) {
      map['grup_id'] = Variable<int>(grupId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (synchronized.present) {
      map['synchronized'] = Variable<int>(synchronized.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<int>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InscriptionCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('studentId: $studentId, ')
          ..write('tournamentId: $tournamentId, ')
          ..write('grupId: $grupId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $VersusTable extends Versus with TableInfo<$VersusTable, VersusData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VersusTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _inscription1IdMeta = const VerificationMeta(
    'inscription1Id',
  );
  @override
  late final GeneratedColumn<int> inscription1Id = GeneratedColumn<int>(
    'inscription1_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES inscription (id) ON UPDATE CASCADE ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _inscription2IdMeta = const VerificationMeta(
    'inscription2Id',
  );
  @override
  late final GeneratedColumn<int> inscription2Id = GeneratedColumn<int>(
    'inscription2_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES inscription (id) ON UPDATE CASCADE ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _grupidMeta = const VerificationMeta('grupid');
  @override
  late final GeneratedColumn<int> grupid = GeneratedColumn<int>(
    'grupid',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES grup (id) ON UPDATE CASCADE ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _synchronizedMeta = const VerificationMeta(
    'synchronized',
  );
  @override
  late final GeneratedColumn<int> synchronized = GeneratedColumn<int>(
    'synchronized',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<int> isActive = GeneratedColumn<int>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    inscription1Id,
    inscription2Id,
    grupid,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'versus';
  @override
  VerificationContext validateIntegrity(
    Insertable<VersusData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('inscription1_id')) {
      context.handle(
        _inscription1IdMeta,
        inscription1Id.isAcceptableOrUnknown(
          data['inscription1_id']!,
          _inscription1IdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_inscription1IdMeta);
    }
    if (data.containsKey('inscription2_id')) {
      context.handle(
        _inscription2IdMeta,
        inscription2Id.isAcceptableOrUnknown(
          data['inscription2_id']!,
          _inscription2IdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_inscription2IdMeta);
    }
    if (data.containsKey('grupid')) {
      context.handle(
        _grupidMeta,
        grupid.isAcceptableOrUnknown(data['grupid']!, _grupidMeta),
      );
    } else if (isInserting) {
      context.missing(_grupidMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('synchronized')) {
      context.handle(
        _synchronizedMeta,
        synchronized.isAcceptableOrUnknown(
          data['synchronized']!,
          _synchronizedMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VersusData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VersusData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      inscription1Id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}inscription1_id'],
      )!,
      inscription2Id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}inscription2_id'],
      )!,
      grupid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}grupid'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      synchronized: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}synchronized'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $VersusTable createAlias(String alias) {
    return $VersusTable(attachedDatabase, alias);
  }
}

class VersusData extends DataClass implements Insertable<VersusData> {
  final int id;
  final int inscription1Id;
  final int inscription2Id;
  final int grupid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int synchronized;
  final int isActive;
  const VersusData({
    required this.id,
    required this.inscription1Id,
    required this.inscription2Id,
    required this.grupid,
    required this.createdAt,
    required this.updatedAt,
    required this.synchronized,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['inscription1_id'] = Variable<int>(inscription1Id);
    map['inscription2_id'] = Variable<int>(inscription2Id);
    map['grupid'] = Variable<int>(grupid);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['synchronized'] = Variable<int>(synchronized);
    map['is_active'] = Variable<int>(isActive);
    return map;
  }

  VersusCompanion toCompanion(bool nullToAbsent) {
    return VersusCompanion(
      id: Value(id),
      inscription1Id: Value(inscription1Id),
      inscription2Id: Value(inscription2Id),
      grupid: Value(grupid),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      synchronized: Value(synchronized),
      isActive: Value(isActive),
    );
  }

  factory VersusData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VersusData(
      id: serializer.fromJson<int>(json['id']),
      inscription1Id: serializer.fromJson<int>(json['inscription1Id']),
      inscription2Id: serializer.fromJson<int>(json['inscription2Id']),
      grupid: serializer.fromJson<int>(json['grupid']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      synchronized: serializer.fromJson<int>(json['synchronized']),
      isActive: serializer.fromJson<int>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'inscription1Id': serializer.toJson<int>(inscription1Id),
      'inscription2Id': serializer.toJson<int>(inscription2Id),
      'grupid': serializer.toJson<int>(grupid),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'synchronized': serializer.toJson<int>(synchronized),
      'isActive': serializer.toJson<int>(isActive),
    };
  }

  VersusData copyWith({
    int? id,
    int? inscription1Id,
    int? inscription2Id,
    int? grupid,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
    int? isActive,
  }) => VersusData(
    id: id ?? this.id,
    inscription1Id: inscription1Id ?? this.inscription1Id,
    inscription2Id: inscription2Id ?? this.inscription2Id,
    grupid: grupid ?? this.grupid,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    synchronized: synchronized ?? this.synchronized,
    isActive: isActive ?? this.isActive,
  );
  VersusData copyWithCompanion(VersusCompanion data) {
    return VersusData(
      id: data.id.present ? data.id.value : this.id,
      inscription1Id: data.inscription1Id.present
          ? data.inscription1Id.value
          : this.inscription1Id,
      inscription2Id: data.inscription2Id.present
          ? data.inscription2Id.value
          : this.inscription2Id,
      grupid: data.grupid.present ? data.grupid.value : this.grupid,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      synchronized: data.synchronized.present
          ? data.synchronized.value
          : this.synchronized,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VersusData(')
          ..write('id: $id, ')
          ..write('inscription1Id: $inscription1Id, ')
          ..write('inscription2Id: $inscription2Id, ')
          ..write('grupid: $grupid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    inscription1Id,
    inscription2Id,
    grupid,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VersusData &&
          other.id == this.id &&
          other.inscription1Id == this.inscription1Id &&
          other.inscription2Id == this.inscription2Id &&
          other.grupid == this.grupid &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.synchronized == this.synchronized &&
          other.isActive == this.isActive);
}

class VersusCompanion extends UpdateCompanion<VersusData> {
  final Value<int> id;
  final Value<int> inscription1Id;
  final Value<int> inscription2Id;
  final Value<int> grupid;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> synchronized;
  final Value<int> isActive;
  const VersusCompanion({
    this.id = const Value.absent(),
    this.inscription1Id = const Value.absent(),
    this.inscription2Id = const Value.absent(),
    this.grupid = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  VersusCompanion.insert({
    this.id = const Value.absent(),
    required int inscription1Id,
    required int inscription2Id,
    required int grupid,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : inscription1Id = Value(inscription1Id),
       inscription2Id = Value(inscription2Id),
       grupid = Value(grupid);
  static Insertable<VersusData> custom({
    Expression<int>? id,
    Expression<int>? inscription1Id,
    Expression<int>? inscription2Id,
    Expression<int>? grupid,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? synchronized,
    Expression<int>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (inscription1Id != null) 'inscription1_id': inscription1Id,
      if (inscription2Id != null) 'inscription2_id': inscription2Id,
      if (grupid != null) 'grupid': grupid,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (synchronized != null) 'synchronized': synchronized,
      if (isActive != null) 'is_active': isActive,
    });
  }

  VersusCompanion copyWith({
    Value<int>? id,
    Value<int>? inscription1Id,
    Value<int>? inscription2Id,
    Value<int>? grupid,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? synchronized,
    Value<int>? isActive,
  }) {
    return VersusCompanion(
      id: id ?? this.id,
      inscription1Id: inscription1Id ?? this.inscription1Id,
      inscription2Id: inscription2Id ?? this.inscription2Id,
      grupid: grupid ?? this.grupid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      synchronized: synchronized ?? this.synchronized,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (inscription1Id.present) {
      map['inscription1_id'] = Variable<int>(inscription1Id.value);
    }
    if (inscription2Id.present) {
      map['inscription2_id'] = Variable<int>(inscription2Id.value);
    }
    if (grupid.present) {
      map['grupid'] = Variable<int>(grupid.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (synchronized.present) {
      map['synchronized'] = Variable<int>(synchronized.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<int>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VersusCompanion(')
          ..write('id: $id, ')
          ..write('inscription1Id: $inscription1Id, ')
          ..write('inscription2Id: $inscription2Id, ')
          ..write('grupid: $grupid, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $ScoreTable extends Score with TableInfo<$ScoreTable, ScoreData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScoreTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _scoreOneMeta = const VerificationMeta(
    'scoreOne',
  );
  @override
  late final GeneratedColumn<double> scoreOne = GeneratedColumn<double>(
    'score_one',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scoreTwoMeta = const VerificationMeta(
    'scoreTwo',
  );
  @override
  late final GeneratedColumn<double> scoreTwo = GeneratedColumn<double>(
    'score_two',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _judgeIdMeta = const VerificationMeta(
    'judgeId',
  );
  @override
  late final GeneratedColumn<int> judgeId = GeneratedColumn<int>(
    'judge_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES judge (id) ON UPDATE CASCADE ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _versusIdMeta = const VerificationMeta(
    'versusId',
  );
  @override
  late final GeneratedColumn<int> versusId = GeneratedColumn<int>(
    'versus_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES versus (id) ON UPDATE CASCADE ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _sogisOneMeta = const VerificationMeta(
    'sogisOne',
  );
  @override
  late final GeneratedColumn<int> sogisOne = GeneratedColumn<int>(
    'sogis_one',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES sogis (id) ON UPDATE CASCADE ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _sogisTwoMeta = const VerificationMeta(
    'sogisTwo',
  );
  @override
  late final GeneratedColumn<int> sogisTwo = GeneratedColumn<int>(
    'sogis_two',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES sogis (id) ON UPDATE CASCADE ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _synchronizedMeta = const VerificationMeta(
    'synchronized',
  );
  @override
  late final GeneratedColumn<int> synchronized = GeneratedColumn<int>(
    'synchronized',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<int> isActive = GeneratedColumn<int>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    scoreOne,
    scoreTwo,
    judgeId,
    versusId,
    sogisOne,
    sogisTwo,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'score';
  @override
  VerificationContext validateIntegrity(
    Insertable<ScoreData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('score_one')) {
      context.handle(
        _scoreOneMeta,
        scoreOne.isAcceptableOrUnknown(data['score_one']!, _scoreOneMeta),
      );
    } else if (isInserting) {
      context.missing(_scoreOneMeta);
    }
    if (data.containsKey('score_two')) {
      context.handle(
        _scoreTwoMeta,
        scoreTwo.isAcceptableOrUnknown(data['score_two']!, _scoreTwoMeta),
      );
    } else if (isInserting) {
      context.missing(_scoreTwoMeta);
    }
    if (data.containsKey('judge_id')) {
      context.handle(
        _judgeIdMeta,
        judgeId.isAcceptableOrUnknown(data['judge_id']!, _judgeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_judgeIdMeta);
    }
    if (data.containsKey('versus_id')) {
      context.handle(
        _versusIdMeta,
        versusId.isAcceptableOrUnknown(data['versus_id']!, _versusIdMeta),
      );
    } else if (isInserting) {
      context.missing(_versusIdMeta);
    }
    if (data.containsKey('sogis_one')) {
      context.handle(
        _sogisOneMeta,
        sogisOne.isAcceptableOrUnknown(data['sogis_one']!, _sogisOneMeta),
      );
    } else if (isInserting) {
      context.missing(_sogisOneMeta);
    }
    if (data.containsKey('sogis_two')) {
      context.handle(
        _sogisTwoMeta,
        sogisTwo.isAcceptableOrUnknown(data['sogis_two']!, _sogisTwoMeta),
      );
    } else if (isInserting) {
      context.missing(_sogisTwoMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('synchronized')) {
      context.handle(
        _synchronizedMeta,
        synchronized.isAcceptableOrUnknown(
          data['synchronized']!,
          _synchronizedMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScoreData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScoreData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      scoreOne: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}score_one'],
      )!,
      scoreTwo: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}score_two'],
      )!,
      judgeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}judge_id'],
      )!,
      versusId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}versus_id'],
      )!,
      sogisOne: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sogis_one'],
      )!,
      sogisTwo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sogis_two'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      synchronized: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}synchronized'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $ScoreTable createAlias(String alias) {
    return $ScoreTable(attachedDatabase, alias);
  }
}

class ScoreData extends DataClass implements Insertable<ScoreData> {
  final int id;
  final double scoreOne;
  final double scoreTwo;
  final int judgeId;
  final int versusId;
  final int sogisOne;
  final int sogisTwo;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int synchronized;
  final int isActive;
  const ScoreData({
    required this.id,
    required this.scoreOne,
    required this.scoreTwo,
    required this.judgeId,
    required this.versusId,
    required this.sogisOne,
    required this.sogisTwo,
    required this.createdAt,
    required this.updatedAt,
    required this.synchronized,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['score_one'] = Variable<double>(scoreOne);
    map['score_two'] = Variable<double>(scoreTwo);
    map['judge_id'] = Variable<int>(judgeId);
    map['versus_id'] = Variable<int>(versusId);
    map['sogis_one'] = Variable<int>(sogisOne);
    map['sogis_two'] = Variable<int>(sogisTwo);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['synchronized'] = Variable<int>(synchronized);
    map['is_active'] = Variable<int>(isActive);
    return map;
  }

  ScoreCompanion toCompanion(bool nullToAbsent) {
    return ScoreCompanion(
      id: Value(id),
      scoreOne: Value(scoreOne),
      scoreTwo: Value(scoreTwo),
      judgeId: Value(judgeId),
      versusId: Value(versusId),
      sogisOne: Value(sogisOne),
      sogisTwo: Value(sogisTwo),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      synchronized: Value(synchronized),
      isActive: Value(isActive),
    );
  }

  factory ScoreData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScoreData(
      id: serializer.fromJson<int>(json['id']),
      scoreOne: serializer.fromJson<double>(json['scoreOne']),
      scoreTwo: serializer.fromJson<double>(json['scoreTwo']),
      judgeId: serializer.fromJson<int>(json['judgeId']),
      versusId: serializer.fromJson<int>(json['versusId']),
      sogisOne: serializer.fromJson<int>(json['sogisOne']),
      sogisTwo: serializer.fromJson<int>(json['sogisTwo']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      synchronized: serializer.fromJson<int>(json['synchronized']),
      isActive: serializer.fromJson<int>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'scoreOne': serializer.toJson<double>(scoreOne),
      'scoreTwo': serializer.toJson<double>(scoreTwo),
      'judgeId': serializer.toJson<int>(judgeId),
      'versusId': serializer.toJson<int>(versusId),
      'sogisOne': serializer.toJson<int>(sogisOne),
      'sogisTwo': serializer.toJson<int>(sogisTwo),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'synchronized': serializer.toJson<int>(synchronized),
      'isActive': serializer.toJson<int>(isActive),
    };
  }

  ScoreData copyWith({
    int? id,
    double? scoreOne,
    double? scoreTwo,
    int? judgeId,
    int? versusId,
    int? sogisOne,
    int? sogisTwo,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
    int? isActive,
  }) => ScoreData(
    id: id ?? this.id,
    scoreOne: scoreOne ?? this.scoreOne,
    scoreTwo: scoreTwo ?? this.scoreTwo,
    judgeId: judgeId ?? this.judgeId,
    versusId: versusId ?? this.versusId,
    sogisOne: sogisOne ?? this.sogisOne,
    sogisTwo: sogisTwo ?? this.sogisTwo,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    synchronized: synchronized ?? this.synchronized,
    isActive: isActive ?? this.isActive,
  );
  ScoreData copyWithCompanion(ScoreCompanion data) {
    return ScoreData(
      id: data.id.present ? data.id.value : this.id,
      scoreOne: data.scoreOne.present ? data.scoreOne.value : this.scoreOne,
      scoreTwo: data.scoreTwo.present ? data.scoreTwo.value : this.scoreTwo,
      judgeId: data.judgeId.present ? data.judgeId.value : this.judgeId,
      versusId: data.versusId.present ? data.versusId.value : this.versusId,
      sogisOne: data.sogisOne.present ? data.sogisOne.value : this.sogisOne,
      sogisTwo: data.sogisTwo.present ? data.sogisTwo.value : this.sogisTwo,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      synchronized: data.synchronized.present
          ? data.synchronized.value
          : this.synchronized,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScoreData(')
          ..write('id: $id, ')
          ..write('scoreOne: $scoreOne, ')
          ..write('scoreTwo: $scoreTwo, ')
          ..write('judgeId: $judgeId, ')
          ..write('versusId: $versusId, ')
          ..write('sogisOne: $sogisOne, ')
          ..write('sogisTwo: $sogisTwo, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    scoreOne,
    scoreTwo,
    judgeId,
    versusId,
    sogisOne,
    sogisTwo,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScoreData &&
          other.id == this.id &&
          other.scoreOne == this.scoreOne &&
          other.scoreTwo == this.scoreTwo &&
          other.judgeId == this.judgeId &&
          other.versusId == this.versusId &&
          other.sogisOne == this.sogisOne &&
          other.sogisTwo == this.sogisTwo &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.synchronized == this.synchronized &&
          other.isActive == this.isActive);
}

class ScoreCompanion extends UpdateCompanion<ScoreData> {
  final Value<int> id;
  final Value<double> scoreOne;
  final Value<double> scoreTwo;
  final Value<int> judgeId;
  final Value<int> versusId;
  final Value<int> sogisOne;
  final Value<int> sogisTwo;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> synchronized;
  final Value<int> isActive;
  const ScoreCompanion({
    this.id = const Value.absent(),
    this.scoreOne = const Value.absent(),
    this.scoreTwo = const Value.absent(),
    this.judgeId = const Value.absent(),
    this.versusId = const Value.absent(),
    this.sogisOne = const Value.absent(),
    this.sogisTwo = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  ScoreCompanion.insert({
    this.id = const Value.absent(),
    required double scoreOne,
    required double scoreTwo,
    required int judgeId,
    required int versusId,
    required int sogisOne,
    required int sogisTwo,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : scoreOne = Value(scoreOne),
       scoreTwo = Value(scoreTwo),
       judgeId = Value(judgeId),
       versusId = Value(versusId),
       sogisOne = Value(sogisOne),
       sogisTwo = Value(sogisTwo);
  static Insertable<ScoreData> custom({
    Expression<int>? id,
    Expression<double>? scoreOne,
    Expression<double>? scoreTwo,
    Expression<int>? judgeId,
    Expression<int>? versusId,
    Expression<int>? sogisOne,
    Expression<int>? sogisTwo,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? synchronized,
    Expression<int>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (scoreOne != null) 'score_one': scoreOne,
      if (scoreTwo != null) 'score_two': scoreTwo,
      if (judgeId != null) 'judge_id': judgeId,
      if (versusId != null) 'versus_id': versusId,
      if (sogisOne != null) 'sogis_one': sogisOne,
      if (sogisTwo != null) 'sogis_two': sogisTwo,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (synchronized != null) 'synchronized': synchronized,
      if (isActive != null) 'is_active': isActive,
    });
  }

  ScoreCompanion copyWith({
    Value<int>? id,
    Value<double>? scoreOne,
    Value<double>? scoreTwo,
    Value<int>? judgeId,
    Value<int>? versusId,
    Value<int>? sogisOne,
    Value<int>? sogisTwo,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? synchronized,
    Value<int>? isActive,
  }) {
    return ScoreCompanion(
      id: id ?? this.id,
      scoreOne: scoreOne ?? this.scoreOne,
      scoreTwo: scoreTwo ?? this.scoreTwo,
      judgeId: judgeId ?? this.judgeId,
      versusId: versusId ?? this.versusId,
      sogisOne: sogisOne ?? this.sogisOne,
      sogisTwo: sogisTwo ?? this.sogisTwo,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      synchronized: synchronized ?? this.synchronized,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (scoreOne.present) {
      map['score_one'] = Variable<double>(scoreOne.value);
    }
    if (scoreTwo.present) {
      map['score_two'] = Variable<double>(scoreTwo.value);
    }
    if (judgeId.present) {
      map['judge_id'] = Variable<int>(judgeId.value);
    }
    if (versusId.present) {
      map['versus_id'] = Variable<int>(versusId.value);
    }
    if (sogisOne.present) {
      map['sogis_one'] = Variable<int>(sogisOne.value);
    }
    if (sogisTwo.present) {
      map['sogis_two'] = Variable<int>(sogisTwo.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (synchronized.present) {
      map['synchronized'] = Variable<int>(synchronized.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<int>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScoreCompanion(')
          ..write('id: $id, ')
          ..write('scoreOne: $scoreOne, ')
          ..write('scoreTwo: $scoreTwo, ')
          ..write('judgeId: $judgeId, ')
          ..write('versusId: $versusId, ')
          ..write('sogisOne: $sogisOne, ')
          ..write('sogisTwo: $sogisTwo, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $WinnerTable extends Winner with TableInfo<$WinnerTable, WinnerData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WinnerTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _inscriptionIdMeta = const VerificationMeta(
    'inscriptionId',
  );
  @override
  late final GeneratedColumn<int> inscriptionId = GeneratedColumn<int>(
    'inscription_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES inscription (id) ON UPDATE CASCADE ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _scoreIdMeta = const VerificationMeta(
    'scoreId',
  );
  @override
  late final GeneratedColumn<int> scoreId = GeneratedColumn<int>(
    'score_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES score (id) ON UPDATE CASCADE ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _synchronizedMeta = const VerificationMeta(
    'synchronized',
  );
  @override
  late final GeneratedColumn<int> synchronized = GeneratedColumn<int>(
    'synchronized',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<int> isActive = GeneratedColumn<int>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    inscriptionId,
    scoreId,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'winner';
  @override
  VerificationContext validateIntegrity(
    Insertable<WinnerData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('inscription_id')) {
      context.handle(
        _inscriptionIdMeta,
        inscriptionId.isAcceptableOrUnknown(
          data['inscription_id']!,
          _inscriptionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_inscriptionIdMeta);
    }
    if (data.containsKey('score_id')) {
      context.handle(
        _scoreIdMeta,
        scoreId.isAcceptableOrUnknown(data['score_id']!, _scoreIdMeta),
      );
    } else if (isInserting) {
      context.missing(_scoreIdMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('synchronized')) {
      context.handle(
        _synchronizedMeta,
        synchronized.isAcceptableOrUnknown(
          data['synchronized']!,
          _synchronizedMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WinnerData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WinnerData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      inscriptionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}inscription_id'],
      )!,
      scoreId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}score_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      synchronized: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}synchronized'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $WinnerTable createAlias(String alias) {
    return $WinnerTable(attachedDatabase, alias);
  }
}

class WinnerData extends DataClass implements Insertable<WinnerData> {
  final int id;
  final int inscriptionId;
  final int scoreId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int synchronized;
  final int isActive;
  const WinnerData({
    required this.id,
    required this.inscriptionId,
    required this.scoreId,
    required this.createdAt,
    required this.updatedAt,
    required this.synchronized,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['inscription_id'] = Variable<int>(inscriptionId);
    map['score_id'] = Variable<int>(scoreId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['synchronized'] = Variable<int>(synchronized);
    map['is_active'] = Variable<int>(isActive);
    return map;
  }

  WinnerCompanion toCompanion(bool nullToAbsent) {
    return WinnerCompanion(
      id: Value(id),
      inscriptionId: Value(inscriptionId),
      scoreId: Value(scoreId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      synchronized: Value(synchronized),
      isActive: Value(isActive),
    );
  }

  factory WinnerData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WinnerData(
      id: serializer.fromJson<int>(json['id']),
      inscriptionId: serializer.fromJson<int>(json['inscriptionId']),
      scoreId: serializer.fromJson<int>(json['scoreId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      synchronized: serializer.fromJson<int>(json['synchronized']),
      isActive: serializer.fromJson<int>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'inscriptionId': serializer.toJson<int>(inscriptionId),
      'scoreId': serializer.toJson<int>(scoreId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'synchronized': serializer.toJson<int>(synchronized),
      'isActive': serializer.toJson<int>(isActive),
    };
  }

  WinnerData copyWith({
    int? id,
    int? inscriptionId,
    int? scoreId,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
    int? isActive,
  }) => WinnerData(
    id: id ?? this.id,
    inscriptionId: inscriptionId ?? this.inscriptionId,
    scoreId: scoreId ?? this.scoreId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    synchronized: synchronized ?? this.synchronized,
    isActive: isActive ?? this.isActive,
  );
  WinnerData copyWithCompanion(WinnerCompanion data) {
    return WinnerData(
      id: data.id.present ? data.id.value : this.id,
      inscriptionId: data.inscriptionId.present
          ? data.inscriptionId.value
          : this.inscriptionId,
      scoreId: data.scoreId.present ? data.scoreId.value : this.scoreId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      synchronized: data.synchronized.present
          ? data.synchronized.value
          : this.synchronized,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WinnerData(')
          ..write('id: $id, ')
          ..write('inscriptionId: $inscriptionId, ')
          ..write('scoreId: $scoreId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    inscriptionId,
    scoreId,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WinnerData &&
          other.id == this.id &&
          other.inscriptionId == this.inscriptionId &&
          other.scoreId == this.scoreId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.synchronized == this.synchronized &&
          other.isActive == this.isActive);
}

class WinnerCompanion extends UpdateCompanion<WinnerData> {
  final Value<int> id;
  final Value<int> inscriptionId;
  final Value<int> scoreId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> synchronized;
  final Value<int> isActive;
  const WinnerCompanion({
    this.id = const Value.absent(),
    this.inscriptionId = const Value.absent(),
    this.scoreId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  WinnerCompanion.insert({
    this.id = const Value.absent(),
    required int inscriptionId,
    required int scoreId,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : inscriptionId = Value(inscriptionId),
       scoreId = Value(scoreId);
  static Insertable<WinnerData> custom({
    Expression<int>? id,
    Expression<int>? inscriptionId,
    Expression<int>? scoreId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? synchronized,
    Expression<int>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (inscriptionId != null) 'inscription_id': inscriptionId,
      if (scoreId != null) 'score_id': scoreId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (synchronized != null) 'synchronized': synchronized,
      if (isActive != null) 'is_active': isActive,
    });
  }

  WinnerCompanion copyWith({
    Value<int>? id,
    Value<int>? inscriptionId,
    Value<int>? scoreId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? synchronized,
    Value<int>? isActive,
  }) {
    return WinnerCompanion(
      id: id ?? this.id,
      inscriptionId: inscriptionId ?? this.inscriptionId,
      scoreId: scoreId ?? this.scoreId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      synchronized: synchronized ?? this.synchronized,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (inscriptionId.present) {
      map['inscription_id'] = Variable<int>(inscriptionId.value);
    }
    if (scoreId.present) {
      map['score_id'] = Variable<int>(scoreId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (synchronized.present) {
      map['synchronized'] = Variable<int>(synchronized.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<int>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WinnerCompanion(')
          ..write('id: $id, ')
          ..write('inscriptionId: $inscriptionId, ')
          ..write('scoreId: $scoreId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $HeadquartersTable headquarters = $HeadquartersTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $SogisTable sogis = $SogisTable(this);
  late final $BelstsTable belsts = $BelstsTable(this);
  late final $SogiBeltsTable sogiBelts = $SogiBeltsTable(this);
  late final $StudentsTable students = $StudentsTable(this);
  late final $TournamentTable tournament = $TournamentTable(this);
  late final $JudgeTable judge = $JudgeTable(this);
  late final $JudgeTournamentTable judgeTournament = $JudgeTournamentTable(
    this,
  );
  late final $GrupTable grup = $GrupTable(this);
  late final $InscriptionTable inscription = $InscriptionTable(this);
  late final $VersusTable versus = $VersusTable(this);
  late final $ScoreTable score = $ScoreTable(this);
  late final $WinnerTable winner = $WinnerTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    headquarters,
    users,
    sogis,
    belsts,
    sogiBelts,
    students,
    tournament,
    judge,
    judgeTournament,
    grup,
    inscription,
    versus,
    score,
    winner,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'headquarters',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('users', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'headquarters',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('users', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'sogis',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('sogi_belts', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'sogis',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('sogi_belts', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'belsts',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('sogi_belts', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'belsts',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('sogi_belts', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'headquarters',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('students', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'headquarters',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('students', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'belsts',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('students', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'belsts',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('students', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'judge',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('judge_tournament', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'judge',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('judge_tournament', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'tournament',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('judge_tournament', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'tournament',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('judge_tournament', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'students',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('inscription', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'students',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('inscription', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'tournament',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('inscription', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'tournament',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('inscription', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'grup',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('inscription', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'grup',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('inscription', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'inscription',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('versus', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'inscription',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('versus', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'inscription',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('versus', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'inscription',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('versus', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'grup',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('versus', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'grup',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('versus', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'judge',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('score', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'judge',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('score', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'versus',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('score', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'versus',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('score', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'sogis',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('score', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'sogis',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('score', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'sogis',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('score', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'sogis',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('score', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'inscription',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('winner', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'inscription',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('winner', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'score',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('winner', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'score',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('winner', kind: UpdateKind.update)],
    ),
  ]);
}

typedef $$HeadquartersTableCreateCompanionBuilder =
    HeadquartersCompanion Function({
      Value<int> id,
      required String name,
      required String address,
      required String city,
      required String phone,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });
typedef $$HeadquartersTableUpdateCompanionBuilder =
    HeadquartersCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> address,
      Value<String> city,
      Value<String> phone,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });

final class $$HeadquartersTableReferences
    extends BaseReferences<_$AppDatabase, $HeadquartersTable, Headquarter> {
  $$HeadquartersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UsersTable, List<User>> _usersRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.users,
    aliasName: $_aliasNameGenerator(db.headquarters.id, db.users.headquarterId),
  );

  $$UsersTableProcessedTableManager get usersRefs {
    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.headquarterId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_usersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$StudentsTable, List<Student>> _studentsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.students,
    aliasName: $_aliasNameGenerator(
      db.headquarters.id,
      db.students.headquarterId,
    ),
  );

  $$StudentsTableProcessedTableManager get studentsRefs {
    final manager = $$StudentsTableTableManager(
      $_db,
      $_db.students,
    ).filter((f) => f.headquarterId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_studentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$HeadquartersTableFilterComposer
    extends Composer<_$AppDatabase, $HeadquartersTable> {
  $$HeadquartersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> usersRefs(
    Expression<bool> Function($$UsersTableFilterComposer f) f,
  ) {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.headquarterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> studentsRefs(
    Expression<bool> Function($$StudentsTableFilterComposer f) f,
  ) {
    final $$StudentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.students,
      getReferencedColumn: (t) => t.headquarterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentsTableFilterComposer(
            $db: $db,
            $table: $db.students,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$HeadquartersTableOrderingComposer
    extends Composer<_$AppDatabase, $HeadquartersTable> {
  $$HeadquartersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HeadquartersTableAnnotationComposer
    extends Composer<_$AppDatabase, $HeadquartersTable> {
  $$HeadquartersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => column,
  );

  GeneratedColumn<int> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  Expression<T> usersRefs<T extends Object>(
    Expression<T> Function($$UsersTableAnnotationComposer a) f,
  ) {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.headquarterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> studentsRefs<T extends Object>(
    Expression<T> Function($$StudentsTableAnnotationComposer a) f,
  ) {
    final $$StudentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.students,
      getReferencedColumn: (t) => t.headquarterId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentsTableAnnotationComposer(
            $db: $db,
            $table: $db.students,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$HeadquartersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HeadquartersTable,
          Headquarter,
          $$HeadquartersTableFilterComposer,
          $$HeadquartersTableOrderingComposer,
          $$HeadquartersTableAnnotationComposer,
          $$HeadquartersTableCreateCompanionBuilder,
          $$HeadquartersTableUpdateCompanionBuilder,
          (Headquarter, $$HeadquartersTableReferences),
          Headquarter,
          PrefetchHooks Function({bool usersRefs, bool studentsRefs})
        > {
  $$HeadquartersTableTableManager(_$AppDatabase db, $HeadquartersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HeadquartersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HeadquartersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HeadquartersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<String> city = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => HeadquartersCompanion(
                id: id,
                name: name,
                address: address,
                city: city,
                phone: phone,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String address,
                required String city,
                required String phone,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => HeadquartersCompanion.insert(
                id: id,
                name: name,
                address: address,
                city: city,
                phone: phone,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$HeadquartersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({usersRefs = false, studentsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (usersRefs) db.users,
                if (studentsRefs) db.students,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (usersRefs)
                    await $_getPrefetchedData<
                      Headquarter,
                      $HeadquartersTable,
                      User
                    >(
                      currentTable: table,
                      referencedTable: $$HeadquartersTableReferences
                          ._usersRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$HeadquartersTableReferences(
                            db,
                            table,
                            p0,
                          ).usersRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.headquarterId == item.id,
                          ),
                      typedResults: items,
                    ),
                  if (studentsRefs)
                    await $_getPrefetchedData<
                      Headquarter,
                      $HeadquartersTable,
                      Student
                    >(
                      currentTable: table,
                      referencedTable: $$HeadquartersTableReferences
                          ._studentsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$HeadquartersTableReferences(
                            db,
                            table,
                            p0,
                          ).studentsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.headquarterId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$HeadquartersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HeadquartersTable,
      Headquarter,
      $$HeadquartersTableFilterComposer,
      $$HeadquartersTableOrderingComposer,
      $$HeadquartersTableAnnotationComposer,
      $$HeadquartersTableCreateCompanionBuilder,
      $$HeadquartersTableUpdateCompanionBuilder,
      (Headquarter, $$HeadquartersTableReferences),
      Headquarter,
      PrefetchHooks Function({bool usersRefs, bool studentsRefs})
    >;
typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      required String username,
      required String password,
      required int headquarterId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      Value<String> username,
      Value<String> password,
      Value<int> headquarterId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $HeadquartersTable _headquarterIdTable(_$AppDatabase db) =>
      db.headquarters.createAlias(
        $_aliasNameGenerator(db.users.headquarterId, db.headquarters.id),
      );

  $$HeadquartersTableProcessedTableManager get headquarterId {
    final $_column = $_itemColumn<int>('headquarter_id')!;

    final manager = $$HeadquartersTableTableManager(
      $_db,
      $_db.headquarters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_headquarterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  $$HeadquartersTableFilterComposer get headquarterId {
    final $$HeadquartersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.headquarterId,
      referencedTable: $db.headquarters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HeadquartersTableFilterComposer(
            $db: $db,
            $table: $db.headquarters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  $$HeadquartersTableOrderingComposer get headquarterId {
    final $$HeadquartersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.headquarterId,
      referencedTable: $db.headquarters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HeadquartersTableOrderingComposer(
            $db: $db,
            $table: $db.headquarters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => column,
  );

  GeneratedColumn<int> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  $$HeadquartersTableAnnotationComposer get headquarterId {
    final $$HeadquartersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.headquarterId,
      referencedTable: $db.headquarters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HeadquartersTableAnnotationComposer(
            $db: $db,
            $table: $db.headquarters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, $$UsersTableReferences),
          User,
          PrefetchHooks Function({bool headquarterId})
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> username = const Value.absent(),
                Value<String> password = const Value.absent(),
                Value<int> headquarterId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                username: username,
                password: password,
                headquarterId: headquarterId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String username,
                required String password,
                required int headquarterId,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => UsersCompanion.insert(
                id: id,
                username: username,
                password: password,
                headquarterId: headquarterId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UsersTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({headquarterId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (headquarterId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.headquarterId,
                                referencedTable: $$UsersTableReferences
                                    ._headquarterIdTable(db),
                                referencedColumn: $$UsersTableReferences
                                    ._headquarterIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, $$UsersTableReferences),
      User,
      PrefetchHooks Function({bool headquarterId})
    >;
typedef $$SogisTableCreateCompanionBuilder =
    SogisCompanion Function({
      Value<int> id,
      required String name,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });
typedef $$SogisTableUpdateCompanionBuilder =
    SogisCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });

final class $$SogisTableReferences
    extends BaseReferences<_$AppDatabase, $SogisTable, Sogi> {
  $$SogisTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SogiBeltsTable, List<SogiBelt>>
  _sogiBeltsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.sogiBelts,
    aliasName: $_aliasNameGenerator(db.sogis.id, db.sogiBelts.sogiId),
  );

  $$SogiBeltsTableProcessedTableManager get sogiBeltsRefs {
    final manager = $$SogiBeltsTableTableManager(
      $_db,
      $_db.sogiBelts,
    ).filter((f) => f.sogiId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_sogiBeltsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ScoreTable, List<ScoreData>> _sogisOneTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.score,
    aliasName: $_aliasNameGenerator(db.sogis.id, db.score.sogisOne),
  );

  $$ScoreTableProcessedTableManager get sogisOne {
    final manager = $$ScoreTableTableManager(
      $_db,
      $_db.score,
    ).filter((f) => f.sogisOne.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_sogisOneTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ScoreTable, List<ScoreData>> _sogisTwoTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.score,
    aliasName: $_aliasNameGenerator(db.sogis.id, db.score.sogisTwo),
  );

  $$ScoreTableProcessedTableManager get sogisTwo {
    final manager = $$ScoreTableTableManager(
      $_db,
      $_db.score,
    ).filter((f) => f.sogisTwo.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_sogisTwoTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SogisTableFilterComposer extends Composer<_$AppDatabase, $SogisTable> {
  $$SogisTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> sogiBeltsRefs(
    Expression<bool> Function($$SogiBeltsTableFilterComposer f) f,
  ) {
    final $$SogiBeltsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sogiBelts,
      getReferencedColumn: (t) => t.sogiId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SogiBeltsTableFilterComposer(
            $db: $db,
            $table: $db.sogiBelts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> sogisOne(
    Expression<bool> Function($$ScoreTableFilterComposer f) f,
  ) {
    final $$ScoreTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.score,
      getReferencedColumn: (t) => t.sogisOne,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScoreTableFilterComposer(
            $db: $db,
            $table: $db.score,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> sogisTwo(
    Expression<bool> Function($$ScoreTableFilterComposer f) f,
  ) {
    final $$ScoreTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.score,
      getReferencedColumn: (t) => t.sogisTwo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScoreTableFilterComposer(
            $db: $db,
            $table: $db.score,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SogisTableOrderingComposer
    extends Composer<_$AppDatabase, $SogisTable> {
  $$SogisTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SogisTableAnnotationComposer
    extends Composer<_$AppDatabase, $SogisTable> {
  $$SogisTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => column,
  );

  GeneratedColumn<int> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  Expression<T> sogiBeltsRefs<T extends Object>(
    Expression<T> Function($$SogiBeltsTableAnnotationComposer a) f,
  ) {
    final $$SogiBeltsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sogiBelts,
      getReferencedColumn: (t) => t.sogiId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SogiBeltsTableAnnotationComposer(
            $db: $db,
            $table: $db.sogiBelts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> sogisOne<T extends Object>(
    Expression<T> Function($$ScoreTableAnnotationComposer a) f,
  ) {
    final $$ScoreTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.score,
      getReferencedColumn: (t) => t.sogisOne,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScoreTableAnnotationComposer(
            $db: $db,
            $table: $db.score,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> sogisTwo<T extends Object>(
    Expression<T> Function($$ScoreTableAnnotationComposer a) f,
  ) {
    final $$ScoreTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.score,
      getReferencedColumn: (t) => t.sogisTwo,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScoreTableAnnotationComposer(
            $db: $db,
            $table: $db.score,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SogisTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SogisTable,
          Sogi,
          $$SogisTableFilterComposer,
          $$SogisTableOrderingComposer,
          $$SogisTableAnnotationComposer,
          $$SogisTableCreateCompanionBuilder,
          $$SogisTableUpdateCompanionBuilder,
          (Sogi, $$SogisTableReferences),
          Sogi,
          PrefetchHooks Function({
            bool sogiBeltsRefs,
            bool sogisOne,
            bool sogisTwo,
          })
        > {
  $$SogisTableTableManager(_$AppDatabase db, $SogisTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SogisTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SogisTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SogisTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => SogisCompanion(
                id: id,
                name: name,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => SogisCompanion.insert(
                id: id,
                name: name,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$SogisTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({sogiBeltsRefs = false, sogisOne = false, sogisTwo = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (sogiBeltsRefs) db.sogiBelts,
                    if (sogisOne) db.score,
                    if (sogisTwo) db.score,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (sogiBeltsRefs)
                        await $_getPrefetchedData<Sogi, $SogisTable, SogiBelt>(
                          currentTable: table,
                          referencedTable: $$SogisTableReferences
                              ._sogiBeltsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SogisTableReferences(
                                db,
                                table,
                                p0,
                              ).sogiBeltsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.sogiId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (sogisOne)
                        await $_getPrefetchedData<Sogi, $SogisTable, ScoreData>(
                          currentTable: table,
                          referencedTable: $$SogisTableReferences
                              ._sogisOneTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SogisTableReferences(db, table, p0).sogisOne,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.sogisOne == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (sogisTwo)
                        await $_getPrefetchedData<Sogi, $SogisTable, ScoreData>(
                          currentTable: table,
                          referencedTable: $$SogisTableReferences
                              ._sogisTwoTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SogisTableReferences(db, table, p0).sogisTwo,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.sogisTwo == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$SogisTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SogisTable,
      Sogi,
      $$SogisTableFilterComposer,
      $$SogisTableOrderingComposer,
      $$SogisTableAnnotationComposer,
      $$SogisTableCreateCompanionBuilder,
      $$SogisTableUpdateCompanionBuilder,
      (Sogi, $$SogisTableReferences),
      Sogi,
      PrefetchHooks Function({bool sogiBeltsRefs, bool sogisOne, bool sogisTwo})
    >;
typedef $$BelstsTableCreateCompanionBuilder =
    BelstsCompanion Function({
      Value<int> id,
      required String name,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });
typedef $$BelstsTableUpdateCompanionBuilder =
    BelstsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });

final class $$BelstsTableReferences
    extends BaseReferences<_$AppDatabase, $BelstsTable, Belst> {
  $$BelstsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SogiBeltsTable, List<SogiBelt>>
  _sogiBeltsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.sogiBelts,
    aliasName: $_aliasNameGenerator(db.belsts.id, db.sogiBelts.beltsId),
  );

  $$SogiBeltsTableProcessedTableManager get sogiBeltsRefs {
    final manager = $$SogiBeltsTableTableManager(
      $_db,
      $_db.sogiBelts,
    ).filter((f) => f.beltsId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_sogiBeltsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$StudentsTable, List<Student>> _studentsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.students,
    aliasName: $_aliasNameGenerator(db.belsts.id, db.students.beltId),
  );

  $$StudentsTableProcessedTableManager get studentsRefs {
    final manager = $$StudentsTableTableManager(
      $_db,
      $_db.students,
    ).filter((f) => f.beltId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_studentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BelstsTableFilterComposer
    extends Composer<_$AppDatabase, $BelstsTable> {
  $$BelstsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> sogiBeltsRefs(
    Expression<bool> Function($$SogiBeltsTableFilterComposer f) f,
  ) {
    final $$SogiBeltsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sogiBelts,
      getReferencedColumn: (t) => t.beltsId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SogiBeltsTableFilterComposer(
            $db: $db,
            $table: $db.sogiBelts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> studentsRefs(
    Expression<bool> Function($$StudentsTableFilterComposer f) f,
  ) {
    final $$StudentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.students,
      getReferencedColumn: (t) => t.beltId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentsTableFilterComposer(
            $db: $db,
            $table: $db.students,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BelstsTableOrderingComposer
    extends Composer<_$AppDatabase, $BelstsTable> {
  $$BelstsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BelstsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BelstsTable> {
  $$BelstsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => column,
  );

  GeneratedColumn<int> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  Expression<T> sogiBeltsRefs<T extends Object>(
    Expression<T> Function($$SogiBeltsTableAnnotationComposer a) f,
  ) {
    final $$SogiBeltsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sogiBelts,
      getReferencedColumn: (t) => t.beltsId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SogiBeltsTableAnnotationComposer(
            $db: $db,
            $table: $db.sogiBelts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> studentsRefs<T extends Object>(
    Expression<T> Function($$StudentsTableAnnotationComposer a) f,
  ) {
    final $$StudentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.students,
      getReferencedColumn: (t) => t.beltId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentsTableAnnotationComposer(
            $db: $db,
            $table: $db.students,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BelstsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BelstsTable,
          Belst,
          $$BelstsTableFilterComposer,
          $$BelstsTableOrderingComposer,
          $$BelstsTableAnnotationComposer,
          $$BelstsTableCreateCompanionBuilder,
          $$BelstsTableUpdateCompanionBuilder,
          (Belst, $$BelstsTableReferences),
          Belst,
          PrefetchHooks Function({bool sogiBeltsRefs, bool studentsRefs})
        > {
  $$BelstsTableTableManager(_$AppDatabase db, $BelstsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BelstsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BelstsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BelstsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => BelstsCompanion(
                id: id,
                name: name,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => BelstsCompanion.insert(
                id: id,
                name: name,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$BelstsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({sogiBeltsRefs = false, studentsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (sogiBeltsRefs) db.sogiBelts,
                    if (studentsRefs) db.students,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (sogiBeltsRefs)
                        await $_getPrefetchedData<
                          Belst,
                          $BelstsTable,
                          SogiBelt
                        >(
                          currentTable: table,
                          referencedTable: $$BelstsTableReferences
                              ._sogiBeltsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BelstsTableReferences(
                                db,
                                table,
                                p0,
                              ).sogiBeltsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.beltsId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (studentsRefs)
                        await $_getPrefetchedData<Belst, $BelstsTable, Student>(
                          currentTable: table,
                          referencedTable: $$BelstsTableReferences
                              ._studentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BelstsTableReferences(
                                db,
                                table,
                                p0,
                              ).studentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.beltId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$BelstsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BelstsTable,
      Belst,
      $$BelstsTableFilterComposer,
      $$BelstsTableOrderingComposer,
      $$BelstsTableAnnotationComposer,
      $$BelstsTableCreateCompanionBuilder,
      $$BelstsTableUpdateCompanionBuilder,
      (Belst, $$BelstsTableReferences),
      Belst,
      PrefetchHooks Function({bool sogiBeltsRefs, bool studentsRefs})
    >;
typedef $$SogiBeltsTableCreateCompanionBuilder =
    SogiBeltsCompanion Function({
      Value<int> id,
      required int sogiId,
      required int beltsId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });
typedef $$SogiBeltsTableUpdateCompanionBuilder =
    SogiBeltsCompanion Function({
      Value<int> id,
      Value<int> sogiId,
      Value<int> beltsId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });

final class $$SogiBeltsTableReferences
    extends BaseReferences<_$AppDatabase, $SogiBeltsTable, SogiBelt> {
  $$SogiBeltsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SogisTable _sogiIdTable(_$AppDatabase db) => db.sogis.createAlias(
    $_aliasNameGenerator(db.sogiBelts.sogiId, db.sogis.id),
  );

  $$SogisTableProcessedTableManager get sogiId {
    final $_column = $_itemColumn<int>('sogi_id')!;

    final manager = $$SogisTableTableManager(
      $_db,
      $_db.sogis,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sogiIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $BelstsTable _beltsIdTable(_$AppDatabase db) => db.belsts.createAlias(
    $_aliasNameGenerator(db.sogiBelts.beltsId, db.belsts.id),
  );

  $$BelstsTableProcessedTableManager get beltsId {
    final $_column = $_itemColumn<int>('belts_id')!;

    final manager = $$BelstsTableTableManager(
      $_db,
      $_db.belsts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_beltsIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SogiBeltsTableFilterComposer
    extends Composer<_$AppDatabase, $SogiBeltsTable> {
  $$SogiBeltsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  $$SogisTableFilterComposer get sogiId {
    final $$SogisTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sogiId,
      referencedTable: $db.sogis,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SogisTableFilterComposer(
            $db: $db,
            $table: $db.sogis,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BelstsTableFilterComposer get beltsId {
    final $$BelstsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.beltsId,
      referencedTable: $db.belsts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BelstsTableFilterComposer(
            $db: $db,
            $table: $db.belsts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SogiBeltsTableOrderingComposer
    extends Composer<_$AppDatabase, $SogiBeltsTable> {
  $$SogiBeltsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  $$SogisTableOrderingComposer get sogiId {
    final $$SogisTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sogiId,
      referencedTable: $db.sogis,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SogisTableOrderingComposer(
            $db: $db,
            $table: $db.sogis,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BelstsTableOrderingComposer get beltsId {
    final $$BelstsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.beltsId,
      referencedTable: $db.belsts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BelstsTableOrderingComposer(
            $db: $db,
            $table: $db.belsts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SogiBeltsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SogiBeltsTable> {
  $$SogiBeltsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => column,
  );

  GeneratedColumn<int> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  $$SogisTableAnnotationComposer get sogiId {
    final $$SogisTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sogiId,
      referencedTable: $db.sogis,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SogisTableAnnotationComposer(
            $db: $db,
            $table: $db.sogis,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BelstsTableAnnotationComposer get beltsId {
    final $$BelstsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.beltsId,
      referencedTable: $db.belsts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BelstsTableAnnotationComposer(
            $db: $db,
            $table: $db.belsts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SogiBeltsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SogiBeltsTable,
          SogiBelt,
          $$SogiBeltsTableFilterComposer,
          $$SogiBeltsTableOrderingComposer,
          $$SogiBeltsTableAnnotationComposer,
          $$SogiBeltsTableCreateCompanionBuilder,
          $$SogiBeltsTableUpdateCompanionBuilder,
          (SogiBelt, $$SogiBeltsTableReferences),
          SogiBelt,
          PrefetchHooks Function({bool sogiId, bool beltsId})
        > {
  $$SogiBeltsTableTableManager(_$AppDatabase db, $SogiBeltsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SogiBeltsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SogiBeltsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SogiBeltsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> sogiId = const Value.absent(),
                Value<int> beltsId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => SogiBeltsCompanion(
                id: id,
                sogiId: sogiId,
                beltsId: beltsId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int sogiId,
                required int beltsId,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => SogiBeltsCompanion.insert(
                id: id,
                sogiId: sogiId,
                beltsId: beltsId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SogiBeltsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({sogiId = false, beltsId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (sogiId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.sogiId,
                                referencedTable: $$SogiBeltsTableReferences
                                    ._sogiIdTable(db),
                                referencedColumn: $$SogiBeltsTableReferences
                                    ._sogiIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (beltsId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.beltsId,
                                referencedTable: $$SogiBeltsTableReferences
                                    ._beltsIdTable(db),
                                referencedColumn: $$SogiBeltsTableReferences
                                    ._beltsIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SogiBeltsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SogiBeltsTable,
      SogiBelt,
      $$SogiBeltsTableFilterComposer,
      $$SogiBeltsTableOrderingComposer,
      $$SogiBeltsTableAnnotationComposer,
      $$SogiBeltsTableCreateCompanionBuilder,
      $$SogiBeltsTableUpdateCompanionBuilder,
      (SogiBelt, $$SogiBeltsTableReferences),
      SogiBelt,
      PrefetchHooks Function({bool sogiId, bool beltsId})
    >;
typedef $$StudentsTableCreateCompanionBuilder =
    StudentsCompanion Function({
      Value<int> id,
      required String names,
      required String surnames,
      required String typeIdentify,
      required String identify,
      required int age,
      required String gender,
      required double weight,
      required double size,
      required int headquarterId,
      required int beltId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });
typedef $$StudentsTableUpdateCompanionBuilder =
    StudentsCompanion Function({
      Value<int> id,
      Value<String> names,
      Value<String> surnames,
      Value<String> typeIdentify,
      Value<String> identify,
      Value<int> age,
      Value<String> gender,
      Value<double> weight,
      Value<double> size,
      Value<int> headquarterId,
      Value<int> beltId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });

final class $$StudentsTableReferences
    extends BaseReferences<_$AppDatabase, $StudentsTable, Student> {
  $$StudentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $HeadquartersTable _headquarterIdTable(_$AppDatabase db) =>
      db.headquarters.createAlias(
        $_aliasNameGenerator(db.students.headquarterId, db.headquarters.id),
      );

  $$HeadquartersTableProcessedTableManager get headquarterId {
    final $_column = $_itemColumn<int>('headquarter_id')!;

    final manager = $$HeadquartersTableTableManager(
      $_db,
      $_db.headquarters,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_headquarterIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $BelstsTable _beltIdTable(_$AppDatabase db) => db.belsts.createAlias(
    $_aliasNameGenerator(db.students.beltId, db.belsts.id),
  );

  $$BelstsTableProcessedTableManager get beltId {
    final $_column = $_itemColumn<int>('belt_id')!;

    final manager = $$BelstsTableTableManager(
      $_db,
      $_db.belsts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_beltIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$InscriptionTable, List<InscriptionData>>
  _inscriptionRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.inscription,
    aliasName: $_aliasNameGenerator(db.students.id, db.inscription.studentId),
  );

  $$InscriptionTableProcessedTableManager get inscriptionRefs {
    final manager = $$InscriptionTableTableManager(
      $_db,
      $_db.inscription,
    ).filter((f) => f.studentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_inscriptionRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$StudentsTableFilterComposer
    extends Composer<_$AppDatabase, $StudentsTable> {
  $$StudentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get names => $composableBuilder(
    column: $table.names,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get surnames => $composableBuilder(
    column: $table.surnames,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get typeIdentify => $composableBuilder(
    column: $table.typeIdentify,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get identify => $composableBuilder(
    column: $table.identify,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get size => $composableBuilder(
    column: $table.size,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  $$HeadquartersTableFilterComposer get headquarterId {
    final $$HeadquartersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.headquarterId,
      referencedTable: $db.headquarters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HeadquartersTableFilterComposer(
            $db: $db,
            $table: $db.headquarters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BelstsTableFilterComposer get beltId {
    final $$BelstsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.beltId,
      referencedTable: $db.belsts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BelstsTableFilterComposer(
            $db: $db,
            $table: $db.belsts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> inscriptionRefs(
    Expression<bool> Function($$InscriptionTableFilterComposer f) f,
  ) {
    final $$InscriptionTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.inscription,
      getReferencedColumn: (t) => t.studentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InscriptionTableFilterComposer(
            $db: $db,
            $table: $db.inscription,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StudentsTableOrderingComposer
    extends Composer<_$AppDatabase, $StudentsTable> {
  $$StudentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get names => $composableBuilder(
    column: $table.names,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get surnames => $composableBuilder(
    column: $table.surnames,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get typeIdentify => $composableBuilder(
    column: $table.typeIdentify,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get identify => $composableBuilder(
    column: $table.identify,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get age => $composableBuilder(
    column: $table.age,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get size => $composableBuilder(
    column: $table.size,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  $$HeadquartersTableOrderingComposer get headquarterId {
    final $$HeadquartersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.headquarterId,
      referencedTable: $db.headquarters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HeadquartersTableOrderingComposer(
            $db: $db,
            $table: $db.headquarters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BelstsTableOrderingComposer get beltId {
    final $$BelstsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.beltId,
      referencedTable: $db.belsts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BelstsTableOrderingComposer(
            $db: $db,
            $table: $db.belsts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StudentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StudentsTable> {
  $$StudentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get names =>
      $composableBuilder(column: $table.names, builder: (column) => column);

  GeneratedColumn<String> get surnames =>
      $composableBuilder(column: $table.surnames, builder: (column) => column);

  GeneratedColumn<String> get typeIdentify => $composableBuilder(
    column: $table.typeIdentify,
    builder: (column) => column,
  );

  GeneratedColumn<String> get identify =>
      $composableBuilder(column: $table.identify, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<double> get size =>
      $composableBuilder(column: $table.size, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => column,
  );

  GeneratedColumn<int> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  $$HeadquartersTableAnnotationComposer get headquarterId {
    final $$HeadquartersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.headquarterId,
      referencedTable: $db.headquarters,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HeadquartersTableAnnotationComposer(
            $db: $db,
            $table: $db.headquarters,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BelstsTableAnnotationComposer get beltId {
    final $$BelstsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.beltId,
      referencedTable: $db.belsts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BelstsTableAnnotationComposer(
            $db: $db,
            $table: $db.belsts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> inscriptionRefs<T extends Object>(
    Expression<T> Function($$InscriptionTableAnnotationComposer a) f,
  ) {
    final $$InscriptionTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.inscription,
      getReferencedColumn: (t) => t.studentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InscriptionTableAnnotationComposer(
            $db: $db,
            $table: $db.inscription,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StudentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StudentsTable,
          Student,
          $$StudentsTableFilterComposer,
          $$StudentsTableOrderingComposer,
          $$StudentsTableAnnotationComposer,
          $$StudentsTableCreateCompanionBuilder,
          $$StudentsTableUpdateCompanionBuilder,
          (Student, $$StudentsTableReferences),
          Student,
          PrefetchHooks Function({
            bool headquarterId,
            bool beltId,
            bool inscriptionRefs,
          })
        > {
  $$StudentsTableTableManager(_$AppDatabase db, $StudentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> names = const Value.absent(),
                Value<String> surnames = const Value.absent(),
                Value<String> typeIdentify = const Value.absent(),
                Value<String> identify = const Value.absent(),
                Value<int> age = const Value.absent(),
                Value<String> gender = const Value.absent(),
                Value<double> weight = const Value.absent(),
                Value<double> size = const Value.absent(),
                Value<int> headquarterId = const Value.absent(),
                Value<int> beltId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => StudentsCompanion(
                id: id,
                names: names,
                surnames: surnames,
                typeIdentify: typeIdentify,
                identify: identify,
                age: age,
                gender: gender,
                weight: weight,
                size: size,
                headquarterId: headquarterId,
                beltId: beltId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String names,
                required String surnames,
                required String typeIdentify,
                required String identify,
                required int age,
                required String gender,
                required double weight,
                required double size,
                required int headquarterId,
                required int beltId,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => StudentsCompanion.insert(
                id: id,
                names: names,
                surnames: surnames,
                typeIdentify: typeIdentify,
                identify: identify,
                age: age,
                gender: gender,
                weight: weight,
                size: size,
                headquarterId: headquarterId,
                beltId: beltId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$StudentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                headquarterId = false,
                beltId = false,
                inscriptionRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (inscriptionRefs) db.inscription,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (headquarterId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.headquarterId,
                                    referencedTable: $$StudentsTableReferences
                                        ._headquarterIdTable(db),
                                    referencedColumn: $$StudentsTableReferences
                                        ._headquarterIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (beltId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.beltId,
                                    referencedTable: $$StudentsTableReferences
                                        ._beltIdTable(db),
                                    referencedColumn: $$StudentsTableReferences
                                        ._beltIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (inscriptionRefs)
                        await $_getPrefetchedData<
                          Student,
                          $StudentsTable,
                          InscriptionData
                        >(
                          currentTable: table,
                          referencedTable: $$StudentsTableReferences
                              ._inscriptionRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$StudentsTableReferences(
                                db,
                                table,
                                p0,
                              ).inscriptionRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.studentId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$StudentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StudentsTable,
      Student,
      $$StudentsTableFilterComposer,
      $$StudentsTableOrderingComposer,
      $$StudentsTableAnnotationComposer,
      $$StudentsTableCreateCompanionBuilder,
      $$StudentsTableUpdateCompanionBuilder,
      (Student, $$StudentsTableReferences),
      Student,
      PrefetchHooks Function({
        bool headquarterId,
        bool beltId,
        bool inscriptionRefs,
      })
    >;
typedef $$TournamentTableCreateCompanionBuilder =
    TournamentCompanion Function({
      Value<int> id,
      required String name,
      required String location,
      required DateTime dateStart,
      required DateTime dateEnd,
      required String status,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });
typedef $$TournamentTableUpdateCompanionBuilder =
    TournamentCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> location,
      Value<DateTime> dateStart,
      Value<DateTime> dateEnd,
      Value<String> status,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });

final class $$TournamentTableReferences
    extends BaseReferences<_$AppDatabase, $TournamentTable, TournamentData> {
  $$TournamentTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$JudgeTournamentTable, List<JudgeTournamentData>>
  _judgeTournamentRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.judgeTournament,
    aliasName: $_aliasNameGenerator(
      db.tournament.id,
      db.judgeTournament.tournamentId,
    ),
  );

  $$JudgeTournamentTableProcessedTableManager get judgeTournamentRefs {
    final manager = $$JudgeTournamentTableTableManager(
      $_db,
      $_db.judgeTournament,
    ).filter((f) => f.tournamentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _judgeTournamentRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$InscriptionTable, List<InscriptionData>>
  _inscriptionRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.inscription,
    aliasName: $_aliasNameGenerator(
      db.tournament.id,
      db.inscription.tournamentId,
    ),
  );

  $$InscriptionTableProcessedTableManager get inscriptionRefs {
    final manager = $$InscriptionTableTableManager(
      $_db,
      $_db.inscription,
    ).filter((f) => f.tournamentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_inscriptionRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TournamentTableFilterComposer
    extends Composer<_$AppDatabase, $TournamentTable> {
  $$TournamentTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateStart => $composableBuilder(
    column: $table.dateStart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateEnd => $composableBuilder(
    column: $table.dateEnd,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> judgeTournamentRefs(
    Expression<bool> Function($$JudgeTournamentTableFilterComposer f) f,
  ) {
    final $$JudgeTournamentTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.judgeTournament,
      getReferencedColumn: (t) => t.tournamentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JudgeTournamentTableFilterComposer(
            $db: $db,
            $table: $db.judgeTournament,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> inscriptionRefs(
    Expression<bool> Function($$InscriptionTableFilterComposer f) f,
  ) {
    final $$InscriptionTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.inscription,
      getReferencedColumn: (t) => t.tournamentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InscriptionTableFilterComposer(
            $db: $db,
            $table: $db.inscription,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TournamentTableOrderingComposer
    extends Composer<_$AppDatabase, $TournamentTable> {
  $$TournamentTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateStart => $composableBuilder(
    column: $table.dateStart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateEnd => $composableBuilder(
    column: $table.dateEnd,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TournamentTableAnnotationComposer
    extends Composer<_$AppDatabase, $TournamentTable> {
  $$TournamentTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<DateTime> get dateStart =>
      $composableBuilder(column: $table.dateStart, builder: (column) => column);

  GeneratedColumn<DateTime> get dateEnd =>
      $composableBuilder(column: $table.dateEnd, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => column,
  );

  GeneratedColumn<int> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  Expression<T> judgeTournamentRefs<T extends Object>(
    Expression<T> Function($$JudgeTournamentTableAnnotationComposer a) f,
  ) {
    final $$JudgeTournamentTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.judgeTournament,
      getReferencedColumn: (t) => t.tournamentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JudgeTournamentTableAnnotationComposer(
            $db: $db,
            $table: $db.judgeTournament,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> inscriptionRefs<T extends Object>(
    Expression<T> Function($$InscriptionTableAnnotationComposer a) f,
  ) {
    final $$InscriptionTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.inscription,
      getReferencedColumn: (t) => t.tournamentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InscriptionTableAnnotationComposer(
            $db: $db,
            $table: $db.inscription,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TournamentTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TournamentTable,
          TournamentData,
          $$TournamentTableFilterComposer,
          $$TournamentTableOrderingComposer,
          $$TournamentTableAnnotationComposer,
          $$TournamentTableCreateCompanionBuilder,
          $$TournamentTableUpdateCompanionBuilder,
          (TournamentData, $$TournamentTableReferences),
          TournamentData,
          PrefetchHooks Function({
            bool judgeTournamentRefs,
            bool inscriptionRefs,
          })
        > {
  $$TournamentTableTableManager(_$AppDatabase db, $TournamentTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TournamentTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TournamentTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TournamentTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> location = const Value.absent(),
                Value<DateTime> dateStart = const Value.absent(),
                Value<DateTime> dateEnd = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => TournamentCompanion(
                id: id,
                name: name,
                location: location,
                dateStart: dateStart,
                dateEnd: dateEnd,
                status: status,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String location,
                required DateTime dateStart,
                required DateTime dateEnd,
                required String status,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => TournamentCompanion.insert(
                id: id,
                name: name,
                location: location,
                dateStart: dateStart,
                dateEnd: dateEnd,
                status: status,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TournamentTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({judgeTournamentRefs = false, inscriptionRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (judgeTournamentRefs) db.judgeTournament,
                    if (inscriptionRefs) db.inscription,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (judgeTournamentRefs)
                        await $_getPrefetchedData<
                          TournamentData,
                          $TournamentTable,
                          JudgeTournamentData
                        >(
                          currentTable: table,
                          referencedTable: $$TournamentTableReferences
                              ._judgeTournamentRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TournamentTableReferences(
                                db,
                                table,
                                p0,
                              ).judgeTournamentRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.tournamentId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (inscriptionRefs)
                        await $_getPrefetchedData<
                          TournamentData,
                          $TournamentTable,
                          InscriptionData
                        >(
                          currentTable: table,
                          referencedTable: $$TournamentTableReferences
                              ._inscriptionRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TournamentTableReferences(
                                db,
                                table,
                                p0,
                              ).inscriptionRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.tournamentId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TournamentTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TournamentTable,
      TournamentData,
      $$TournamentTableFilterComposer,
      $$TournamentTableOrderingComposer,
      $$TournamentTableAnnotationComposer,
      $$TournamentTableCreateCompanionBuilder,
      $$TournamentTableUpdateCompanionBuilder,
      (TournamentData, $$TournamentTableReferences),
      TournamentData,
      PrefetchHooks Function({bool judgeTournamentRefs, bool inscriptionRefs})
    >;
typedef $$JudgeTableCreateCompanionBuilder =
    JudgeCompanion Function({
      Value<int> id,
      required String names,
      required String surnames,
      required String identify,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });
typedef $$JudgeTableUpdateCompanionBuilder =
    JudgeCompanion Function({
      Value<int> id,
      Value<String> names,
      Value<String> surnames,
      Value<String> identify,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });

final class $$JudgeTableReferences
    extends BaseReferences<_$AppDatabase, $JudgeTable, JudgeData> {
  $$JudgeTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$JudgeTournamentTable, List<JudgeTournamentData>>
  _judgeTournamentRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.judgeTournament,
    aliasName: $_aliasNameGenerator(db.judge.id, db.judgeTournament.judgeId),
  );

  $$JudgeTournamentTableProcessedTableManager get judgeTournamentRefs {
    final manager = $$JudgeTournamentTableTableManager(
      $_db,
      $_db.judgeTournament,
    ).filter((f) => f.judgeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _judgeTournamentRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ScoreTable, List<ScoreData>> _scoreRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.score,
    aliasName: $_aliasNameGenerator(db.judge.id, db.score.judgeId),
  );

  $$ScoreTableProcessedTableManager get scoreRefs {
    final manager = $$ScoreTableTableManager(
      $_db,
      $_db.score,
    ).filter((f) => f.judgeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_scoreRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$JudgeTableFilterComposer extends Composer<_$AppDatabase, $JudgeTable> {
  $$JudgeTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get names => $composableBuilder(
    column: $table.names,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get surnames => $composableBuilder(
    column: $table.surnames,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get identify => $composableBuilder(
    column: $table.identify,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> judgeTournamentRefs(
    Expression<bool> Function($$JudgeTournamentTableFilterComposer f) f,
  ) {
    final $$JudgeTournamentTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.judgeTournament,
      getReferencedColumn: (t) => t.judgeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JudgeTournamentTableFilterComposer(
            $db: $db,
            $table: $db.judgeTournament,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> scoreRefs(
    Expression<bool> Function($$ScoreTableFilterComposer f) f,
  ) {
    final $$ScoreTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.score,
      getReferencedColumn: (t) => t.judgeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScoreTableFilterComposer(
            $db: $db,
            $table: $db.score,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$JudgeTableOrderingComposer
    extends Composer<_$AppDatabase, $JudgeTable> {
  $$JudgeTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get names => $composableBuilder(
    column: $table.names,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get surnames => $composableBuilder(
    column: $table.surnames,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get identify => $composableBuilder(
    column: $table.identify,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$JudgeTableAnnotationComposer
    extends Composer<_$AppDatabase, $JudgeTable> {
  $$JudgeTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get names =>
      $composableBuilder(column: $table.names, builder: (column) => column);

  GeneratedColumn<String> get surnames =>
      $composableBuilder(column: $table.surnames, builder: (column) => column);

  GeneratedColumn<String> get identify =>
      $composableBuilder(column: $table.identify, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => column,
  );

  GeneratedColumn<int> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  Expression<T> judgeTournamentRefs<T extends Object>(
    Expression<T> Function($$JudgeTournamentTableAnnotationComposer a) f,
  ) {
    final $$JudgeTournamentTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.judgeTournament,
      getReferencedColumn: (t) => t.judgeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JudgeTournamentTableAnnotationComposer(
            $db: $db,
            $table: $db.judgeTournament,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> scoreRefs<T extends Object>(
    Expression<T> Function($$ScoreTableAnnotationComposer a) f,
  ) {
    final $$ScoreTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.score,
      getReferencedColumn: (t) => t.judgeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScoreTableAnnotationComposer(
            $db: $db,
            $table: $db.score,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$JudgeTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JudgeTable,
          JudgeData,
          $$JudgeTableFilterComposer,
          $$JudgeTableOrderingComposer,
          $$JudgeTableAnnotationComposer,
          $$JudgeTableCreateCompanionBuilder,
          $$JudgeTableUpdateCompanionBuilder,
          (JudgeData, $$JudgeTableReferences),
          JudgeData,
          PrefetchHooks Function({bool judgeTournamentRefs, bool scoreRefs})
        > {
  $$JudgeTableTableManager(_$AppDatabase db, $JudgeTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JudgeTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JudgeTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JudgeTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> names = const Value.absent(),
                Value<String> surnames = const Value.absent(),
                Value<String> identify = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => JudgeCompanion(
                id: id,
                names: names,
                surnames: surnames,
                identify: identify,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String names,
                required String surnames,
                required String identify,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => JudgeCompanion.insert(
                id: id,
                names: names,
                surnames: surnames,
                identify: identify,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$JudgeTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({judgeTournamentRefs = false, scoreRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (judgeTournamentRefs) db.judgeTournament,
                    if (scoreRefs) db.score,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (judgeTournamentRefs)
                        await $_getPrefetchedData<
                          JudgeData,
                          $JudgeTable,
                          JudgeTournamentData
                        >(
                          currentTable: table,
                          referencedTable: $$JudgeTableReferences
                              ._judgeTournamentRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$JudgeTableReferences(
                                db,
                                table,
                                p0,
                              ).judgeTournamentRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.judgeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (scoreRefs)
                        await $_getPrefetchedData<
                          JudgeData,
                          $JudgeTable,
                          ScoreData
                        >(
                          currentTable: table,
                          referencedTable: $$JudgeTableReferences
                              ._scoreRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$JudgeTableReferences(db, table, p0).scoreRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.judgeId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$JudgeTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JudgeTable,
      JudgeData,
      $$JudgeTableFilterComposer,
      $$JudgeTableOrderingComposer,
      $$JudgeTableAnnotationComposer,
      $$JudgeTableCreateCompanionBuilder,
      $$JudgeTableUpdateCompanionBuilder,
      (JudgeData, $$JudgeTableReferences),
      JudgeData,
      PrefetchHooks Function({bool judgeTournamentRefs, bool scoreRefs})
    >;
typedef $$JudgeTournamentTableCreateCompanionBuilder =
    JudgeTournamentCompanion Function({
      Value<int> id,
      required int judgeId,
      required int tournamentId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });
typedef $$JudgeTournamentTableUpdateCompanionBuilder =
    JudgeTournamentCompanion Function({
      Value<int> id,
      Value<int> judgeId,
      Value<int> tournamentId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });

final class $$JudgeTournamentTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $JudgeTournamentTable,
          JudgeTournamentData
        > {
  $$JudgeTournamentTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $JudgeTable _judgeIdTable(_$AppDatabase db) => db.judge.createAlias(
    $_aliasNameGenerator(db.judgeTournament.judgeId, db.judge.id),
  );

  $$JudgeTableProcessedTableManager get judgeId {
    final $_column = $_itemColumn<int>('judge_id')!;

    final manager = $$JudgeTableTableManager(
      $_db,
      $_db.judge,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_judgeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TournamentTable _tournamentIdTable(_$AppDatabase db) =>
      db.tournament.createAlias(
        $_aliasNameGenerator(db.judgeTournament.tournamentId, db.tournament.id),
      );

  $$TournamentTableProcessedTableManager get tournamentId {
    final $_column = $_itemColumn<int>('tournament_id')!;

    final manager = $$TournamentTableTableManager(
      $_db,
      $_db.tournament,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tournamentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$JudgeTournamentTableFilterComposer
    extends Composer<_$AppDatabase, $JudgeTournamentTable> {
  $$JudgeTournamentTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  $$JudgeTableFilterComposer get judgeId {
    final $$JudgeTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.judgeId,
      referencedTable: $db.judge,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JudgeTableFilterComposer(
            $db: $db,
            $table: $db.judge,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TournamentTableFilterComposer get tournamentId {
    final $$TournamentTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tournamentId,
      referencedTable: $db.tournament,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TournamentTableFilterComposer(
            $db: $db,
            $table: $db.tournament,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$JudgeTournamentTableOrderingComposer
    extends Composer<_$AppDatabase, $JudgeTournamentTable> {
  $$JudgeTournamentTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  $$JudgeTableOrderingComposer get judgeId {
    final $$JudgeTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.judgeId,
      referencedTable: $db.judge,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JudgeTableOrderingComposer(
            $db: $db,
            $table: $db.judge,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TournamentTableOrderingComposer get tournamentId {
    final $$TournamentTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tournamentId,
      referencedTable: $db.tournament,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TournamentTableOrderingComposer(
            $db: $db,
            $table: $db.tournament,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$JudgeTournamentTableAnnotationComposer
    extends Composer<_$AppDatabase, $JudgeTournamentTable> {
  $$JudgeTournamentTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => column,
  );

  GeneratedColumn<int> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  $$JudgeTableAnnotationComposer get judgeId {
    final $$JudgeTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.judgeId,
      referencedTable: $db.judge,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JudgeTableAnnotationComposer(
            $db: $db,
            $table: $db.judge,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TournamentTableAnnotationComposer get tournamentId {
    final $$TournamentTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tournamentId,
      referencedTable: $db.tournament,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TournamentTableAnnotationComposer(
            $db: $db,
            $table: $db.tournament,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$JudgeTournamentTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $JudgeTournamentTable,
          JudgeTournamentData,
          $$JudgeTournamentTableFilterComposer,
          $$JudgeTournamentTableOrderingComposer,
          $$JudgeTournamentTableAnnotationComposer,
          $$JudgeTournamentTableCreateCompanionBuilder,
          $$JudgeTournamentTableUpdateCompanionBuilder,
          (JudgeTournamentData, $$JudgeTournamentTableReferences),
          JudgeTournamentData,
          PrefetchHooks Function({bool judgeId, bool tournamentId})
        > {
  $$JudgeTournamentTableTableManager(
    _$AppDatabase db,
    $JudgeTournamentTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JudgeTournamentTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JudgeTournamentTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JudgeTournamentTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> judgeId = const Value.absent(),
                Value<int> tournamentId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => JudgeTournamentCompanion(
                id: id,
                judgeId: judgeId,
                tournamentId: tournamentId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int judgeId,
                required int tournamentId,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => JudgeTournamentCompanion.insert(
                id: id,
                judgeId: judgeId,
                tournamentId: tournamentId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$JudgeTournamentTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({judgeId = false, tournamentId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (judgeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.judgeId,
                                referencedTable:
                                    $$JudgeTournamentTableReferences
                                        ._judgeIdTable(db),
                                referencedColumn:
                                    $$JudgeTournamentTableReferences
                                        ._judgeIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (tournamentId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.tournamentId,
                                referencedTable:
                                    $$JudgeTournamentTableReferences
                                        ._tournamentIdTable(db),
                                referencedColumn:
                                    $$JudgeTournamentTableReferences
                                        ._tournamentIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$JudgeTournamentTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $JudgeTournamentTable,
      JudgeTournamentData,
      $$JudgeTournamentTableFilterComposer,
      $$JudgeTournamentTableOrderingComposer,
      $$JudgeTournamentTableAnnotationComposer,
      $$JudgeTournamentTableCreateCompanionBuilder,
      $$JudgeTournamentTableUpdateCompanionBuilder,
      (JudgeTournamentData, $$JudgeTournamentTableReferences),
      JudgeTournamentData,
      PrefetchHooks Function({bool judgeId, bool tournamentId})
    >;
typedef $$GrupTableCreateCompanionBuilder =
    GrupCompanion Function({
      Value<int> id,
      required String name,
      required String description,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });
typedef $$GrupTableUpdateCompanionBuilder =
    GrupCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> description,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });

final class $$GrupTableReferences
    extends BaseReferences<_$AppDatabase, $GrupTable, GrupData> {
  $$GrupTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$InscriptionTable, List<InscriptionData>>
  _inscriptionRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.inscription,
    aliasName: $_aliasNameGenerator(db.grup.id, db.inscription.grupId),
  );

  $$InscriptionTableProcessedTableManager get inscriptionRefs {
    final manager = $$InscriptionTableTableManager(
      $_db,
      $_db.inscription,
    ).filter((f) => f.grupId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_inscriptionRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$VersusTable, List<VersusData>> _versusRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.versus,
    aliasName: $_aliasNameGenerator(db.grup.id, db.versus.grupid),
  );

  $$VersusTableProcessedTableManager get versusRefs {
    final manager = $$VersusTableTableManager(
      $_db,
      $_db.versus,
    ).filter((f) => f.grupid.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_versusRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$GrupTableFilterComposer extends Composer<_$AppDatabase, $GrupTable> {
  $$GrupTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> inscriptionRefs(
    Expression<bool> Function($$InscriptionTableFilterComposer f) f,
  ) {
    final $$InscriptionTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.inscription,
      getReferencedColumn: (t) => t.grupId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InscriptionTableFilterComposer(
            $db: $db,
            $table: $db.inscription,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> versusRefs(
    Expression<bool> Function($$VersusTableFilterComposer f) f,
  ) {
    final $$VersusTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.versus,
      getReferencedColumn: (t) => t.grupid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VersusTableFilterComposer(
            $db: $db,
            $table: $db.versus,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GrupTableOrderingComposer extends Composer<_$AppDatabase, $GrupTable> {
  $$GrupTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GrupTableAnnotationComposer
    extends Composer<_$AppDatabase, $GrupTable> {
  $$GrupTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => column,
  );

  GeneratedColumn<int> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  Expression<T> inscriptionRefs<T extends Object>(
    Expression<T> Function($$InscriptionTableAnnotationComposer a) f,
  ) {
    final $$InscriptionTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.inscription,
      getReferencedColumn: (t) => t.grupId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InscriptionTableAnnotationComposer(
            $db: $db,
            $table: $db.inscription,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> versusRefs<T extends Object>(
    Expression<T> Function($$VersusTableAnnotationComposer a) f,
  ) {
    final $$VersusTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.versus,
      getReferencedColumn: (t) => t.grupid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VersusTableAnnotationComposer(
            $db: $db,
            $table: $db.versus,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GrupTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GrupTable,
          GrupData,
          $$GrupTableFilterComposer,
          $$GrupTableOrderingComposer,
          $$GrupTableAnnotationComposer,
          $$GrupTableCreateCompanionBuilder,
          $$GrupTableUpdateCompanionBuilder,
          (GrupData, $$GrupTableReferences),
          GrupData,
          PrefetchHooks Function({bool inscriptionRefs, bool versusRefs})
        > {
  $$GrupTableTableManager(_$AppDatabase db, $GrupTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GrupTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GrupTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GrupTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => GrupCompanion(
                id: id,
                name: name,
                description: description,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String description,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => GrupCompanion.insert(
                id: id,
                name: name,
                description: description,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$GrupTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({inscriptionRefs = false, versusRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (inscriptionRefs) db.inscription,
                    if (versusRefs) db.versus,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (inscriptionRefs)
                        await $_getPrefetchedData<
                          GrupData,
                          $GrupTable,
                          InscriptionData
                        >(
                          currentTable: table,
                          referencedTable: $$GrupTableReferences
                              ._inscriptionRefsTable(db),
                          managerFromTypedResult: (p0) => $$GrupTableReferences(
                            db,
                            table,
                            p0,
                          ).inscriptionRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.grupId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (versusRefs)
                        await $_getPrefetchedData<
                          GrupData,
                          $GrupTable,
                          VersusData
                        >(
                          currentTable: table,
                          referencedTable: $$GrupTableReferences
                              ._versusRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$GrupTableReferences(db, table, p0).versusRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.grupid == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$GrupTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GrupTable,
      GrupData,
      $$GrupTableFilterComposer,
      $$GrupTableOrderingComposer,
      $$GrupTableAnnotationComposer,
      $$GrupTableCreateCompanionBuilder,
      $$GrupTableUpdateCompanionBuilder,
      (GrupData, $$GrupTableReferences),
      GrupData,
      PrefetchHooks Function({bool inscriptionRefs, bool versusRefs})
    >;
typedef $$InscriptionTableCreateCompanionBuilder =
    InscriptionCompanion Function({
      Value<int> id,
      Value<DateTime> date,
      required int studentId,
      required int tournamentId,
      required int grupId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });
typedef $$InscriptionTableUpdateCompanionBuilder =
    InscriptionCompanion Function({
      Value<int> id,
      Value<DateTime> date,
      Value<int> studentId,
      Value<int> tournamentId,
      Value<int> grupId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });

final class $$InscriptionTableReferences
    extends BaseReferences<_$AppDatabase, $InscriptionTable, InscriptionData> {
  $$InscriptionTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $StudentsTable _studentIdTable(_$AppDatabase db) =>
      db.students.createAlias(
        $_aliasNameGenerator(db.inscription.studentId, db.students.id),
      );

  $$StudentsTableProcessedTableManager get studentId {
    final $_column = $_itemColumn<int>('student_id')!;

    final manager = $$StudentsTableTableManager(
      $_db,
      $_db.students,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_studentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TournamentTable _tournamentIdTable(_$AppDatabase db) =>
      db.tournament.createAlias(
        $_aliasNameGenerator(db.inscription.tournamentId, db.tournament.id),
      );

  $$TournamentTableProcessedTableManager get tournamentId {
    final $_column = $_itemColumn<int>('tournament_id')!;

    final manager = $$TournamentTableTableManager(
      $_db,
      $_db.tournament,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tournamentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $GrupTable _grupIdTable(_$AppDatabase db) => db.grup.createAlias(
    $_aliasNameGenerator(db.inscription.grupId, db.grup.id),
  );

  $$GrupTableProcessedTableManager get grupId {
    final $_column = $_itemColumn<int>('grup_id')!;

    final manager = $$GrupTableTableManager(
      $_db,
      $_db.grup,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_grupIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$VersusTable, List<VersusData>> _inscription1Table(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.versus,
    aliasName: $_aliasNameGenerator(
      db.inscription.id,
      db.versus.inscription1Id,
    ),
  );

  $$VersusTableProcessedTableManager get inscription1 {
    final manager = $$VersusTableTableManager(
      $_db,
      $_db.versus,
    ).filter((f) => f.inscription1Id.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_inscription1Table($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$VersusTable, List<VersusData>> _inscription2Table(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.versus,
    aliasName: $_aliasNameGenerator(
      db.inscription.id,
      db.versus.inscription2Id,
    ),
  );

  $$VersusTableProcessedTableManager get inscription2 {
    final manager = $$VersusTableTableManager(
      $_db,
      $_db.versus,
    ).filter((f) => f.inscription2Id.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_inscription2Table($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$WinnerTable, List<WinnerData>> _winnerRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.winner,
    aliasName: $_aliasNameGenerator(db.inscription.id, db.winner.inscriptionId),
  );

  $$WinnerTableProcessedTableManager get winnerRefs {
    final manager = $$WinnerTableTableManager(
      $_db,
      $_db.winner,
    ).filter((f) => f.inscriptionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_winnerRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$InscriptionTableFilterComposer
    extends Composer<_$AppDatabase, $InscriptionTable> {
  $$InscriptionTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  $$StudentsTableFilterComposer get studentId {
    final $$StudentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentId,
      referencedTable: $db.students,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentsTableFilterComposer(
            $db: $db,
            $table: $db.students,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TournamentTableFilterComposer get tournamentId {
    final $$TournamentTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tournamentId,
      referencedTable: $db.tournament,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TournamentTableFilterComposer(
            $db: $db,
            $table: $db.tournament,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GrupTableFilterComposer get grupId {
    final $$GrupTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.grupId,
      referencedTable: $db.grup,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GrupTableFilterComposer(
            $db: $db,
            $table: $db.grup,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> inscription1(
    Expression<bool> Function($$VersusTableFilterComposer f) f,
  ) {
    final $$VersusTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.versus,
      getReferencedColumn: (t) => t.inscription1Id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VersusTableFilterComposer(
            $db: $db,
            $table: $db.versus,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> inscription2(
    Expression<bool> Function($$VersusTableFilterComposer f) f,
  ) {
    final $$VersusTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.versus,
      getReferencedColumn: (t) => t.inscription2Id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VersusTableFilterComposer(
            $db: $db,
            $table: $db.versus,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> winnerRefs(
    Expression<bool> Function($$WinnerTableFilterComposer f) f,
  ) {
    final $$WinnerTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.winner,
      getReferencedColumn: (t) => t.inscriptionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WinnerTableFilterComposer(
            $db: $db,
            $table: $db.winner,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InscriptionTableOrderingComposer
    extends Composer<_$AppDatabase, $InscriptionTable> {
  $$InscriptionTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  $$StudentsTableOrderingComposer get studentId {
    final $$StudentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentId,
      referencedTable: $db.students,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentsTableOrderingComposer(
            $db: $db,
            $table: $db.students,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TournamentTableOrderingComposer get tournamentId {
    final $$TournamentTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tournamentId,
      referencedTable: $db.tournament,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TournamentTableOrderingComposer(
            $db: $db,
            $table: $db.tournament,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GrupTableOrderingComposer get grupId {
    final $$GrupTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.grupId,
      referencedTable: $db.grup,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GrupTableOrderingComposer(
            $db: $db,
            $table: $db.grup,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InscriptionTableAnnotationComposer
    extends Composer<_$AppDatabase, $InscriptionTable> {
  $$InscriptionTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => column,
  );

  GeneratedColumn<int> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  $$StudentsTableAnnotationComposer get studentId {
    final $$StudentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentId,
      referencedTable: $db.students,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentsTableAnnotationComposer(
            $db: $db,
            $table: $db.students,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TournamentTableAnnotationComposer get tournamentId {
    final $$TournamentTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tournamentId,
      referencedTable: $db.tournament,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TournamentTableAnnotationComposer(
            $db: $db,
            $table: $db.tournament,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GrupTableAnnotationComposer get grupId {
    final $$GrupTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.grupId,
      referencedTable: $db.grup,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GrupTableAnnotationComposer(
            $db: $db,
            $table: $db.grup,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> inscription1<T extends Object>(
    Expression<T> Function($$VersusTableAnnotationComposer a) f,
  ) {
    final $$VersusTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.versus,
      getReferencedColumn: (t) => t.inscription1Id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VersusTableAnnotationComposer(
            $db: $db,
            $table: $db.versus,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> inscription2<T extends Object>(
    Expression<T> Function($$VersusTableAnnotationComposer a) f,
  ) {
    final $$VersusTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.versus,
      getReferencedColumn: (t) => t.inscription2Id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VersusTableAnnotationComposer(
            $db: $db,
            $table: $db.versus,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> winnerRefs<T extends Object>(
    Expression<T> Function($$WinnerTableAnnotationComposer a) f,
  ) {
    final $$WinnerTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.winner,
      getReferencedColumn: (t) => t.inscriptionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WinnerTableAnnotationComposer(
            $db: $db,
            $table: $db.winner,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InscriptionTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InscriptionTable,
          InscriptionData,
          $$InscriptionTableFilterComposer,
          $$InscriptionTableOrderingComposer,
          $$InscriptionTableAnnotationComposer,
          $$InscriptionTableCreateCompanionBuilder,
          $$InscriptionTableUpdateCompanionBuilder,
          (InscriptionData, $$InscriptionTableReferences),
          InscriptionData,
          PrefetchHooks Function({
            bool studentId,
            bool tournamentId,
            bool grupId,
            bool inscription1,
            bool inscription2,
            bool winnerRefs,
          })
        > {
  $$InscriptionTableTableManager(_$AppDatabase db, $InscriptionTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InscriptionTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InscriptionTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InscriptionTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> studentId = const Value.absent(),
                Value<int> tournamentId = const Value.absent(),
                Value<int> grupId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => InscriptionCompanion(
                id: id,
                date: date,
                studentId: studentId,
                tournamentId: tournamentId,
                grupId: grupId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                required int studentId,
                required int tournamentId,
                required int grupId,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => InscriptionCompanion.insert(
                id: id,
                date: date,
                studentId: studentId,
                tournamentId: tournamentId,
                grupId: grupId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$InscriptionTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                studentId = false,
                tournamentId = false,
                grupId = false,
                inscription1 = false,
                inscription2 = false,
                winnerRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (inscription1) db.versus,
                    if (inscription2) db.versus,
                    if (winnerRefs) db.winner,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (studentId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.studentId,
                                    referencedTable:
                                        $$InscriptionTableReferences
                                            ._studentIdTable(db),
                                    referencedColumn:
                                        $$InscriptionTableReferences
                                            ._studentIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (tournamentId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.tournamentId,
                                    referencedTable:
                                        $$InscriptionTableReferences
                                            ._tournamentIdTable(db),
                                    referencedColumn:
                                        $$InscriptionTableReferences
                                            ._tournamentIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (grupId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.grupId,
                                    referencedTable:
                                        $$InscriptionTableReferences
                                            ._grupIdTable(db),
                                    referencedColumn:
                                        $$InscriptionTableReferences
                                            ._grupIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (inscription1)
                        await $_getPrefetchedData<
                          InscriptionData,
                          $InscriptionTable,
                          VersusData
                        >(
                          currentTable: table,
                          referencedTable: $$InscriptionTableReferences
                              ._inscription1Table(db),
                          managerFromTypedResult: (p0) =>
                              $$InscriptionTableReferences(
                                db,
                                table,
                                p0,
                              ).inscription1,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.inscription1Id == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (inscription2)
                        await $_getPrefetchedData<
                          InscriptionData,
                          $InscriptionTable,
                          VersusData
                        >(
                          currentTable: table,
                          referencedTable: $$InscriptionTableReferences
                              ._inscription2Table(db),
                          managerFromTypedResult: (p0) =>
                              $$InscriptionTableReferences(
                                db,
                                table,
                                p0,
                              ).inscription2,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.inscription2Id == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (winnerRefs)
                        await $_getPrefetchedData<
                          InscriptionData,
                          $InscriptionTable,
                          WinnerData
                        >(
                          currentTable: table,
                          referencedTable: $$InscriptionTableReferences
                              ._winnerRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$InscriptionTableReferences(
                                db,
                                table,
                                p0,
                              ).winnerRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.inscriptionId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$InscriptionTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InscriptionTable,
      InscriptionData,
      $$InscriptionTableFilterComposer,
      $$InscriptionTableOrderingComposer,
      $$InscriptionTableAnnotationComposer,
      $$InscriptionTableCreateCompanionBuilder,
      $$InscriptionTableUpdateCompanionBuilder,
      (InscriptionData, $$InscriptionTableReferences),
      InscriptionData,
      PrefetchHooks Function({
        bool studentId,
        bool tournamentId,
        bool grupId,
        bool inscription1,
        bool inscription2,
        bool winnerRefs,
      })
    >;
typedef $$VersusTableCreateCompanionBuilder =
    VersusCompanion Function({
      Value<int> id,
      required int inscription1Id,
      required int inscription2Id,
      required int grupid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });
typedef $$VersusTableUpdateCompanionBuilder =
    VersusCompanion Function({
      Value<int> id,
      Value<int> inscription1Id,
      Value<int> inscription2Id,
      Value<int> grupid,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });

final class $$VersusTableReferences
    extends BaseReferences<_$AppDatabase, $VersusTable, VersusData> {
  $$VersusTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $InscriptionTable _inscription1IdTable(_$AppDatabase db) =>
      db.inscription.createAlias(
        $_aliasNameGenerator(db.versus.inscription1Id, db.inscription.id),
      );

  $$InscriptionTableProcessedTableManager get inscription1Id {
    final $_column = $_itemColumn<int>('inscription1_id')!;

    final manager = $$InscriptionTableTableManager(
      $_db,
      $_db.inscription,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_inscription1IdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $InscriptionTable _inscription2IdTable(_$AppDatabase db) =>
      db.inscription.createAlias(
        $_aliasNameGenerator(db.versus.inscription2Id, db.inscription.id),
      );

  $$InscriptionTableProcessedTableManager get inscription2Id {
    final $_column = $_itemColumn<int>('inscription2_id')!;

    final manager = $$InscriptionTableTableManager(
      $_db,
      $_db.inscription,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_inscription2IdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $GrupTable _grupidTable(_$AppDatabase db) =>
      db.grup.createAlias($_aliasNameGenerator(db.versus.grupid, db.grup.id));

  $$GrupTableProcessedTableManager get grupid {
    final $_column = $_itemColumn<int>('grupid')!;

    final manager = $$GrupTableTableManager(
      $_db,
      $_db.grup,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_grupidTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ScoreTable, List<ScoreData>> _scoreRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.score,
    aliasName: $_aliasNameGenerator(db.versus.id, db.score.versusId),
  );

  $$ScoreTableProcessedTableManager get scoreRefs {
    final manager = $$ScoreTableTableManager(
      $_db,
      $_db.score,
    ).filter((f) => f.versusId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_scoreRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$VersusTableFilterComposer
    extends Composer<_$AppDatabase, $VersusTable> {
  $$VersusTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  $$InscriptionTableFilterComposer get inscription1Id {
    final $$InscriptionTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.inscription1Id,
      referencedTable: $db.inscription,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InscriptionTableFilterComposer(
            $db: $db,
            $table: $db.inscription,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$InscriptionTableFilterComposer get inscription2Id {
    final $$InscriptionTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.inscription2Id,
      referencedTable: $db.inscription,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InscriptionTableFilterComposer(
            $db: $db,
            $table: $db.inscription,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GrupTableFilterComposer get grupid {
    final $$GrupTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.grupid,
      referencedTable: $db.grup,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GrupTableFilterComposer(
            $db: $db,
            $table: $db.grup,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> scoreRefs(
    Expression<bool> Function($$ScoreTableFilterComposer f) f,
  ) {
    final $$ScoreTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.score,
      getReferencedColumn: (t) => t.versusId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScoreTableFilterComposer(
            $db: $db,
            $table: $db.score,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VersusTableOrderingComposer
    extends Composer<_$AppDatabase, $VersusTable> {
  $$VersusTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  $$InscriptionTableOrderingComposer get inscription1Id {
    final $$InscriptionTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.inscription1Id,
      referencedTable: $db.inscription,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InscriptionTableOrderingComposer(
            $db: $db,
            $table: $db.inscription,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$InscriptionTableOrderingComposer get inscription2Id {
    final $$InscriptionTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.inscription2Id,
      referencedTable: $db.inscription,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InscriptionTableOrderingComposer(
            $db: $db,
            $table: $db.inscription,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GrupTableOrderingComposer get grupid {
    final $$GrupTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.grupid,
      referencedTable: $db.grup,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GrupTableOrderingComposer(
            $db: $db,
            $table: $db.grup,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VersusTableAnnotationComposer
    extends Composer<_$AppDatabase, $VersusTable> {
  $$VersusTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => column,
  );

  GeneratedColumn<int> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  $$InscriptionTableAnnotationComposer get inscription1Id {
    final $$InscriptionTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.inscription1Id,
      referencedTable: $db.inscription,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InscriptionTableAnnotationComposer(
            $db: $db,
            $table: $db.inscription,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$InscriptionTableAnnotationComposer get inscription2Id {
    final $$InscriptionTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.inscription2Id,
      referencedTable: $db.inscription,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InscriptionTableAnnotationComposer(
            $db: $db,
            $table: $db.inscription,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GrupTableAnnotationComposer get grupid {
    final $$GrupTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.grupid,
      referencedTable: $db.grup,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GrupTableAnnotationComposer(
            $db: $db,
            $table: $db.grup,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> scoreRefs<T extends Object>(
    Expression<T> Function($$ScoreTableAnnotationComposer a) f,
  ) {
    final $$ScoreTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.score,
      getReferencedColumn: (t) => t.versusId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScoreTableAnnotationComposer(
            $db: $db,
            $table: $db.score,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VersusTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VersusTable,
          VersusData,
          $$VersusTableFilterComposer,
          $$VersusTableOrderingComposer,
          $$VersusTableAnnotationComposer,
          $$VersusTableCreateCompanionBuilder,
          $$VersusTableUpdateCompanionBuilder,
          (VersusData, $$VersusTableReferences),
          VersusData,
          PrefetchHooks Function({
            bool inscription1Id,
            bool inscription2Id,
            bool grupid,
            bool scoreRefs,
          })
        > {
  $$VersusTableTableManager(_$AppDatabase db, $VersusTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VersusTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VersusTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VersusTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> inscription1Id = const Value.absent(),
                Value<int> inscription2Id = const Value.absent(),
                Value<int> grupid = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => VersusCompanion(
                id: id,
                inscription1Id: inscription1Id,
                inscription2Id: inscription2Id,
                grupid: grupid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int inscription1Id,
                required int inscription2Id,
                required int grupid,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => VersusCompanion.insert(
                id: id,
                inscription1Id: inscription1Id,
                inscription2Id: inscription2Id,
                grupid: grupid,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$VersusTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                inscription1Id = false,
                inscription2Id = false,
                grupid = false,
                scoreRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (scoreRefs) db.score],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (inscription1Id) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.inscription1Id,
                                    referencedTable: $$VersusTableReferences
                                        ._inscription1IdTable(db),
                                    referencedColumn: $$VersusTableReferences
                                        ._inscription1IdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (inscription2Id) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.inscription2Id,
                                    referencedTable: $$VersusTableReferences
                                        ._inscription2IdTable(db),
                                    referencedColumn: $$VersusTableReferences
                                        ._inscription2IdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (grupid) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.grupid,
                                    referencedTable: $$VersusTableReferences
                                        ._grupidTable(db),
                                    referencedColumn: $$VersusTableReferences
                                        ._grupidTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (scoreRefs)
                        await $_getPrefetchedData<
                          VersusData,
                          $VersusTable,
                          ScoreData
                        >(
                          currentTable: table,
                          referencedTable: $$VersusTableReferences
                              ._scoreRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$VersusTableReferences(db, table, p0).scoreRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.versusId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$VersusTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VersusTable,
      VersusData,
      $$VersusTableFilterComposer,
      $$VersusTableOrderingComposer,
      $$VersusTableAnnotationComposer,
      $$VersusTableCreateCompanionBuilder,
      $$VersusTableUpdateCompanionBuilder,
      (VersusData, $$VersusTableReferences),
      VersusData,
      PrefetchHooks Function({
        bool inscription1Id,
        bool inscription2Id,
        bool grupid,
        bool scoreRefs,
      })
    >;
typedef $$ScoreTableCreateCompanionBuilder =
    ScoreCompanion Function({
      Value<int> id,
      required double scoreOne,
      required double scoreTwo,
      required int judgeId,
      required int versusId,
      required int sogisOne,
      required int sogisTwo,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });
typedef $$ScoreTableUpdateCompanionBuilder =
    ScoreCompanion Function({
      Value<int> id,
      Value<double> scoreOne,
      Value<double> scoreTwo,
      Value<int> judgeId,
      Value<int> versusId,
      Value<int> sogisOne,
      Value<int> sogisTwo,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });

final class $$ScoreTableReferences
    extends BaseReferences<_$AppDatabase, $ScoreTable, ScoreData> {
  $$ScoreTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $JudgeTable _judgeIdTable(_$AppDatabase db) =>
      db.judge.createAlias($_aliasNameGenerator(db.score.judgeId, db.judge.id));

  $$JudgeTableProcessedTableManager get judgeId {
    final $_column = $_itemColumn<int>('judge_id')!;

    final manager = $$JudgeTableTableManager(
      $_db,
      $_db.judge,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_judgeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $VersusTable _versusIdTable(_$AppDatabase db) => db.versus.createAlias(
    $_aliasNameGenerator(db.score.versusId, db.versus.id),
  );

  $$VersusTableProcessedTableManager get versusId {
    final $_column = $_itemColumn<int>('versus_id')!;

    final manager = $$VersusTableTableManager(
      $_db,
      $_db.versus,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_versusIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SogisTable _sogisOneTable(_$AppDatabase db) => db.sogis.createAlias(
    $_aliasNameGenerator(db.score.sogisOne, db.sogis.id),
  );

  $$SogisTableProcessedTableManager get sogisOne {
    final $_column = $_itemColumn<int>('sogis_one')!;

    final manager = $$SogisTableTableManager(
      $_db,
      $_db.sogis,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sogisOneTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SogisTable _sogisTwoTable(_$AppDatabase db) => db.sogis.createAlias(
    $_aliasNameGenerator(db.score.sogisTwo, db.sogis.id),
  );

  $$SogisTableProcessedTableManager get sogisTwo {
    final $_column = $_itemColumn<int>('sogis_two')!;

    final manager = $$SogisTableTableManager(
      $_db,
      $_db.sogis,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sogisTwoTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$WinnerTable, List<WinnerData>> _winnerRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.winner,
    aliasName: $_aliasNameGenerator(db.score.id, db.winner.scoreId),
  );

  $$WinnerTableProcessedTableManager get winnerRefs {
    final manager = $$WinnerTableTableManager(
      $_db,
      $_db.winner,
    ).filter((f) => f.scoreId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_winnerRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ScoreTableFilterComposer extends Composer<_$AppDatabase, $ScoreTable> {
  $$ScoreTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get scoreOne => $composableBuilder(
    column: $table.scoreOne,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get scoreTwo => $composableBuilder(
    column: $table.scoreTwo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  $$JudgeTableFilterComposer get judgeId {
    final $$JudgeTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.judgeId,
      referencedTable: $db.judge,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JudgeTableFilterComposer(
            $db: $db,
            $table: $db.judge,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VersusTableFilterComposer get versusId {
    final $$VersusTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.versusId,
      referencedTable: $db.versus,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VersusTableFilterComposer(
            $db: $db,
            $table: $db.versus,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SogisTableFilterComposer get sogisOne {
    final $$SogisTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sogisOne,
      referencedTable: $db.sogis,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SogisTableFilterComposer(
            $db: $db,
            $table: $db.sogis,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SogisTableFilterComposer get sogisTwo {
    final $$SogisTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sogisTwo,
      referencedTable: $db.sogis,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SogisTableFilterComposer(
            $db: $db,
            $table: $db.sogis,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> winnerRefs(
    Expression<bool> Function($$WinnerTableFilterComposer f) f,
  ) {
    final $$WinnerTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.winner,
      getReferencedColumn: (t) => t.scoreId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WinnerTableFilterComposer(
            $db: $db,
            $table: $db.winner,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ScoreTableOrderingComposer
    extends Composer<_$AppDatabase, $ScoreTable> {
  $$ScoreTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get scoreOne => $composableBuilder(
    column: $table.scoreOne,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get scoreTwo => $composableBuilder(
    column: $table.scoreTwo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  $$JudgeTableOrderingComposer get judgeId {
    final $$JudgeTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.judgeId,
      referencedTable: $db.judge,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JudgeTableOrderingComposer(
            $db: $db,
            $table: $db.judge,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VersusTableOrderingComposer get versusId {
    final $$VersusTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.versusId,
      referencedTable: $db.versus,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VersusTableOrderingComposer(
            $db: $db,
            $table: $db.versus,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SogisTableOrderingComposer get sogisOne {
    final $$SogisTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sogisOne,
      referencedTable: $db.sogis,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SogisTableOrderingComposer(
            $db: $db,
            $table: $db.sogis,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SogisTableOrderingComposer get sogisTwo {
    final $$SogisTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sogisTwo,
      referencedTable: $db.sogis,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SogisTableOrderingComposer(
            $db: $db,
            $table: $db.sogis,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ScoreTableAnnotationComposer
    extends Composer<_$AppDatabase, $ScoreTable> {
  $$ScoreTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get scoreOne =>
      $composableBuilder(column: $table.scoreOne, builder: (column) => column);

  GeneratedColumn<double> get scoreTwo =>
      $composableBuilder(column: $table.scoreTwo, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => column,
  );

  GeneratedColumn<int> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  $$JudgeTableAnnotationComposer get judgeId {
    final $$JudgeTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.judgeId,
      referencedTable: $db.judge,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$JudgeTableAnnotationComposer(
            $db: $db,
            $table: $db.judge,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VersusTableAnnotationComposer get versusId {
    final $$VersusTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.versusId,
      referencedTable: $db.versus,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VersusTableAnnotationComposer(
            $db: $db,
            $table: $db.versus,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SogisTableAnnotationComposer get sogisOne {
    final $$SogisTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sogisOne,
      referencedTable: $db.sogis,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SogisTableAnnotationComposer(
            $db: $db,
            $table: $db.sogis,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SogisTableAnnotationComposer get sogisTwo {
    final $$SogisTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sogisTwo,
      referencedTable: $db.sogis,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SogisTableAnnotationComposer(
            $db: $db,
            $table: $db.sogis,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> winnerRefs<T extends Object>(
    Expression<T> Function($$WinnerTableAnnotationComposer a) f,
  ) {
    final $$WinnerTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.winner,
      getReferencedColumn: (t) => t.scoreId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WinnerTableAnnotationComposer(
            $db: $db,
            $table: $db.winner,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ScoreTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ScoreTable,
          ScoreData,
          $$ScoreTableFilterComposer,
          $$ScoreTableOrderingComposer,
          $$ScoreTableAnnotationComposer,
          $$ScoreTableCreateCompanionBuilder,
          $$ScoreTableUpdateCompanionBuilder,
          (ScoreData, $$ScoreTableReferences),
          ScoreData,
          PrefetchHooks Function({
            bool judgeId,
            bool versusId,
            bool sogisOne,
            bool sogisTwo,
            bool winnerRefs,
          })
        > {
  $$ScoreTableTableManager(_$AppDatabase db, $ScoreTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScoreTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ScoreTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ScoreTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> scoreOne = const Value.absent(),
                Value<double> scoreTwo = const Value.absent(),
                Value<int> judgeId = const Value.absent(),
                Value<int> versusId = const Value.absent(),
                Value<int> sogisOne = const Value.absent(),
                Value<int> sogisTwo = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => ScoreCompanion(
                id: id,
                scoreOne: scoreOne,
                scoreTwo: scoreTwo,
                judgeId: judgeId,
                versusId: versusId,
                sogisOne: sogisOne,
                sogisTwo: sogisTwo,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required double scoreOne,
                required double scoreTwo,
                required int judgeId,
                required int versusId,
                required int sogisOne,
                required int sogisTwo,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => ScoreCompanion.insert(
                id: id,
                scoreOne: scoreOne,
                scoreTwo: scoreTwo,
                judgeId: judgeId,
                versusId: versusId,
                sogisOne: sogisOne,
                sogisTwo: sogisTwo,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$ScoreTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                judgeId = false,
                versusId = false,
                sogisOne = false,
                sogisTwo = false,
                winnerRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (winnerRefs) db.winner],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (judgeId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.judgeId,
                                    referencedTable: $$ScoreTableReferences
                                        ._judgeIdTable(db),
                                    referencedColumn: $$ScoreTableReferences
                                        ._judgeIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (versusId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.versusId,
                                    referencedTable: $$ScoreTableReferences
                                        ._versusIdTable(db),
                                    referencedColumn: $$ScoreTableReferences
                                        ._versusIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (sogisOne) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.sogisOne,
                                    referencedTable: $$ScoreTableReferences
                                        ._sogisOneTable(db),
                                    referencedColumn: $$ScoreTableReferences
                                        ._sogisOneTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (sogisTwo) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.sogisTwo,
                                    referencedTable: $$ScoreTableReferences
                                        ._sogisTwoTable(db),
                                    referencedColumn: $$ScoreTableReferences
                                        ._sogisTwoTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (winnerRefs)
                        await $_getPrefetchedData<
                          ScoreData,
                          $ScoreTable,
                          WinnerData
                        >(
                          currentTable: table,
                          referencedTable: $$ScoreTableReferences
                              ._winnerRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ScoreTableReferences(db, table, p0).winnerRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.scoreId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ScoreTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ScoreTable,
      ScoreData,
      $$ScoreTableFilterComposer,
      $$ScoreTableOrderingComposer,
      $$ScoreTableAnnotationComposer,
      $$ScoreTableCreateCompanionBuilder,
      $$ScoreTableUpdateCompanionBuilder,
      (ScoreData, $$ScoreTableReferences),
      ScoreData,
      PrefetchHooks Function({
        bool judgeId,
        bool versusId,
        bool sogisOne,
        bool sogisTwo,
        bool winnerRefs,
      })
    >;
typedef $$WinnerTableCreateCompanionBuilder =
    WinnerCompanion Function({
      Value<int> id,
      required int inscriptionId,
      required int scoreId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });
typedef $$WinnerTableUpdateCompanionBuilder =
    WinnerCompanion Function({
      Value<int> id,
      Value<int> inscriptionId,
      Value<int> scoreId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });

final class $$WinnerTableReferences
    extends BaseReferences<_$AppDatabase, $WinnerTable, WinnerData> {
  $$WinnerTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $InscriptionTable _inscriptionIdTable(_$AppDatabase db) =>
      db.inscription.createAlias(
        $_aliasNameGenerator(db.winner.inscriptionId, db.inscription.id),
      );

  $$InscriptionTableProcessedTableManager get inscriptionId {
    final $_column = $_itemColumn<int>('inscription_id')!;

    final manager = $$InscriptionTableTableManager(
      $_db,
      $_db.inscription,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_inscriptionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ScoreTable _scoreIdTable(_$AppDatabase db) => db.score.createAlias(
    $_aliasNameGenerator(db.winner.scoreId, db.score.id),
  );

  $$ScoreTableProcessedTableManager get scoreId {
    final $_column = $_itemColumn<int>('score_id')!;

    final manager = $$ScoreTableTableManager(
      $_db,
      $_db.score,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_scoreIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$WinnerTableFilterComposer
    extends Composer<_$AppDatabase, $WinnerTable> {
  $$WinnerTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  $$InscriptionTableFilterComposer get inscriptionId {
    final $$InscriptionTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.inscriptionId,
      referencedTable: $db.inscription,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InscriptionTableFilterComposer(
            $db: $db,
            $table: $db.inscription,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ScoreTableFilterComposer get scoreId {
    final $$ScoreTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.scoreId,
      referencedTable: $db.score,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScoreTableFilterComposer(
            $db: $db,
            $table: $db.score,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WinnerTableOrderingComposer
    extends Composer<_$AppDatabase, $WinnerTable> {
  $$WinnerTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  $$InscriptionTableOrderingComposer get inscriptionId {
    final $$InscriptionTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.inscriptionId,
      referencedTable: $db.inscription,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InscriptionTableOrderingComposer(
            $db: $db,
            $table: $db.inscription,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ScoreTableOrderingComposer get scoreId {
    final $$ScoreTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.scoreId,
      referencedTable: $db.score,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScoreTableOrderingComposer(
            $db: $db,
            $table: $db.score,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WinnerTableAnnotationComposer
    extends Composer<_$AppDatabase, $WinnerTable> {
  $$WinnerTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get synchronized => $composableBuilder(
    column: $table.synchronized,
    builder: (column) => column,
  );

  GeneratedColumn<int> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  $$InscriptionTableAnnotationComposer get inscriptionId {
    final $$InscriptionTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.inscriptionId,
      referencedTable: $db.inscription,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InscriptionTableAnnotationComposer(
            $db: $db,
            $table: $db.inscription,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ScoreTableAnnotationComposer get scoreId {
    final $$ScoreTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.scoreId,
      referencedTable: $db.score,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScoreTableAnnotationComposer(
            $db: $db,
            $table: $db.score,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WinnerTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WinnerTable,
          WinnerData,
          $$WinnerTableFilterComposer,
          $$WinnerTableOrderingComposer,
          $$WinnerTableAnnotationComposer,
          $$WinnerTableCreateCompanionBuilder,
          $$WinnerTableUpdateCompanionBuilder,
          (WinnerData, $$WinnerTableReferences),
          WinnerData,
          PrefetchHooks Function({bool inscriptionId, bool scoreId})
        > {
  $$WinnerTableTableManager(_$AppDatabase db, $WinnerTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WinnerTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WinnerTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WinnerTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> inscriptionId = const Value.absent(),
                Value<int> scoreId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => WinnerCompanion(
                id: id,
                inscriptionId: inscriptionId,
                scoreId: scoreId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int inscriptionId,
                required int scoreId,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => WinnerCompanion.insert(
                id: id,
                inscriptionId: inscriptionId,
                scoreId: scoreId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$WinnerTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({inscriptionId = false, scoreId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (inscriptionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.inscriptionId,
                                referencedTable: $$WinnerTableReferences
                                    ._inscriptionIdTable(db),
                                referencedColumn: $$WinnerTableReferences
                                    ._inscriptionIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (scoreId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.scoreId,
                                referencedTable: $$WinnerTableReferences
                                    ._scoreIdTable(db),
                                referencedColumn: $$WinnerTableReferences
                                    ._scoreIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$WinnerTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WinnerTable,
      WinnerData,
      $$WinnerTableFilterComposer,
      $$WinnerTableOrderingComposer,
      $$WinnerTableAnnotationComposer,
      $$WinnerTableCreateCompanionBuilder,
      $$WinnerTableUpdateCompanionBuilder,
      (WinnerData, $$WinnerTableReferences),
      WinnerData,
      PrefetchHooks Function({bool inscriptionId, bool scoreId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$HeadquartersTableTableManager get headquarters =>
      $$HeadquartersTableTableManager(_db, _db.headquarters);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$SogisTableTableManager get sogis =>
      $$SogisTableTableManager(_db, _db.sogis);
  $$BelstsTableTableManager get belsts =>
      $$BelstsTableTableManager(_db, _db.belsts);
  $$SogiBeltsTableTableManager get sogiBelts =>
      $$SogiBeltsTableTableManager(_db, _db.sogiBelts);
  $$StudentsTableTableManager get students =>
      $$StudentsTableTableManager(_db, _db.students);
  $$TournamentTableTableManager get tournament =>
      $$TournamentTableTableManager(_db, _db.tournament);
  $$JudgeTableTableManager get judge =>
      $$JudgeTableTableManager(_db, _db.judge);
  $$JudgeTournamentTableTableManager get judgeTournament =>
      $$JudgeTournamentTableTableManager(_db, _db.judgeTournament);
  $$GrupTableTableManager get grup => $$GrupTableTableManager(_db, _db.grup);
  $$InscriptionTableTableManager get inscription =>
      $$InscriptionTableTableManager(_db, _db.inscription);
  $$VersusTableTableManager get versus =>
      $$VersusTableTableManager(_db, _db.versus);
  $$ScoreTableTableManager get score =>
      $$ScoreTableTableManager(_db, _db.score);
  $$WinnerTableTableManager get winner =>
      $$WinnerTableTableManager(_db, _db.winner);
}
