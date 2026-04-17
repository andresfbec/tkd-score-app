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
  static const VerificationMeta _masterMeta = const VerificationMeta('master');
  @override
  late final GeneratedColumn<String> master = GeneratedColumn<String>(
    'master',
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
    master,
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
    if (data.containsKey('master')) {
      context.handle(
        _masterMeta,
        master.isAcceptableOrUnknown(data['master']!, _masterMeta),
      );
    } else if (isInserting) {
      context.missing(_masterMeta);
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
      master: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}master'],
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
  final String master;
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
    required this.master,
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
    map['master'] = Variable<String>(master);
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
      master: Value(master),
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
      master: serializer.fromJson<String>(json['master']),
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
      'master': serializer.toJson<String>(master),
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
    String? master,
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
    master: master ?? this.master,
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
      master: data.master.present ? data.master.value : this.master,
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
          ..write('master: $master, ')
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
    master,
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
          other.master == this.master &&
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
  final Value<String> master;
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
    this.master = const Value.absent(),
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
    required String master,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : name = Value(name),
       address = Value(address),
       city = Value(city),
       phone = Value(phone),
       master = Value(master);
  static Insertable<Headquarter> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? address,
    Expression<String>? city,
    Expression<String>? phone,
    Expression<String>? master,
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
      if (master != null) 'master': master,
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
    Value<String>? master,
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
      master: master ?? this.master,
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
    if (master.present) {
      map['master'] = Variable<String>(master.value);
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
          ..write('master: $master, ')
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

class $BeltsTable extends Belts with TableInfo<$BeltsTable, Belt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BeltsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _primaryColorMeta = const VerificationMeta(
    'primaryColor',
  );
  @override
  late final GeneratedColumn<String> primaryColor = GeneratedColumn<String>(
    'primary_color',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _secondaryColorMeta = const VerificationMeta(
    'secondaryColor',
  );
  @override
  late final GeneratedColumn<String> secondaryColor = GeneratedColumn<String>(
    'secondary_color',
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
    primaryColor,
    secondaryColor,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'belts';
  @override
  VerificationContext validateIntegrity(
    Insertable<Belt> instance, {
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
    if (data.containsKey('primary_color')) {
      context.handle(
        _primaryColorMeta,
        primaryColor.isAcceptableOrUnknown(
          data['primary_color']!,
          _primaryColorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_primaryColorMeta);
    }
    if (data.containsKey('secondary_color')) {
      context.handle(
        _secondaryColorMeta,
        secondaryColor.isAcceptableOrUnknown(
          data['secondary_color']!,
          _secondaryColorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_secondaryColorMeta);
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
  Belt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Belt(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      primaryColor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}primary_color'],
      )!,
      secondaryColor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}secondary_color'],
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
  $BeltsTable createAlias(String alias) {
    return $BeltsTable(attachedDatabase, alias);
  }
}

class Belt extends DataClass implements Insertable<Belt> {
  final int id;
  final String name;
  final String primaryColor;
  final String secondaryColor;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int synchronized;
  final int isActive;
  const Belt({
    required this.id,
    required this.name,
    required this.primaryColor,
    required this.secondaryColor,
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
    map['primary_color'] = Variable<String>(primaryColor);
    map['secondary_color'] = Variable<String>(secondaryColor);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['synchronized'] = Variable<int>(synchronized);
    map['is_active'] = Variable<int>(isActive);
    return map;
  }

  BeltsCompanion toCompanion(bool nullToAbsent) {
    return BeltsCompanion(
      id: Value(id),
      name: Value(name),
      primaryColor: Value(primaryColor),
      secondaryColor: Value(secondaryColor),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      synchronized: Value(synchronized),
      isActive: Value(isActive),
    );
  }

  factory Belt.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Belt(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      primaryColor: serializer.fromJson<String>(json['primaryColor']),
      secondaryColor: serializer.fromJson<String>(json['secondaryColor']),
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
      'primaryColor': serializer.toJson<String>(primaryColor),
      'secondaryColor': serializer.toJson<String>(secondaryColor),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'synchronized': serializer.toJson<int>(synchronized),
      'isActive': serializer.toJson<int>(isActive),
    };
  }

  Belt copyWith({
    int? id,
    String? name,
    String? primaryColor,
    String? secondaryColor,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
    int? isActive,
  }) => Belt(
    id: id ?? this.id,
    name: name ?? this.name,
    primaryColor: primaryColor ?? this.primaryColor,
    secondaryColor: secondaryColor ?? this.secondaryColor,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    synchronized: synchronized ?? this.synchronized,
    isActive: isActive ?? this.isActive,
  );
  Belt copyWithCompanion(BeltsCompanion data) {
    return Belt(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      primaryColor: data.primaryColor.present
          ? data.primaryColor.value
          : this.primaryColor,
      secondaryColor: data.secondaryColor.present
          ? data.secondaryColor.value
          : this.secondaryColor,
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
    return (StringBuffer('Belt(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('primaryColor: $primaryColor, ')
          ..write('secondaryColor: $secondaryColor, ')
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
    primaryColor,
    secondaryColor,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Belt &&
          other.id == this.id &&
          other.name == this.name &&
          other.primaryColor == this.primaryColor &&
          other.secondaryColor == this.secondaryColor &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.synchronized == this.synchronized &&
          other.isActive == this.isActive);
}

class BeltsCompanion extends UpdateCompanion<Belt> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> primaryColor;
  final Value<String> secondaryColor;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> synchronized;
  final Value<int> isActive;
  const BeltsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.primaryColor = const Value.absent(),
    this.secondaryColor = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  BeltsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String primaryColor,
    required String secondaryColor,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : name = Value(name),
       primaryColor = Value(primaryColor),
       secondaryColor = Value(secondaryColor);
  static Insertable<Belt> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? primaryColor,
    Expression<String>? secondaryColor,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? synchronized,
    Expression<int>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (primaryColor != null) 'primary_color': primaryColor,
      if (secondaryColor != null) 'secondary_color': secondaryColor,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (synchronized != null) 'synchronized': synchronized,
      if (isActive != null) 'is_active': isActive,
    });
  }

  BeltsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? primaryColor,
    Value<String>? secondaryColor,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? synchronized,
    Value<int>? isActive,
  }) {
    return BeltsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
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
    if (primaryColor.present) {
      map['primary_color'] = Variable<String>(primaryColor.value);
    }
    if (secondaryColor.present) {
      map['secondary_color'] = Variable<String>(secondaryColor.value);
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
    return (StringBuffer('BeltsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('primaryColor: $primaryColor, ')
          ..write('secondaryColor: $secondaryColor, ')
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
      'REFERENCES belts (id) ON UPDATE CASCADE ON DELETE SET NULL',
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
  static const VerificationMeta _numberIdentifyMeta = const VerificationMeta(
    'numberIdentify',
  );
  @override
  late final GeneratedColumn<String> numberIdentify = GeneratedColumn<String>(
    'number_identify',
    aliasedName,
    false,
    type: DriftSqlType.string,
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
  static const VerificationMeta _birthDateMeta = const VerificationMeta(
    'birthDate',
  );
  @override
  late final GeneratedColumn<DateTime> birthDate = GeneratedColumn<DateTime>(
    'birth_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tournamentWinsMeta = const VerificationMeta(
    'tournamentWins',
  );
  @override
  late final GeneratedColumn<int> tournamentWins = GeneratedColumn<int>(
    'tournament_wins',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _participationsMeta = const VerificationMeta(
    'participations',
  );
  @override
  late final GeneratedColumn<int> participations = GeneratedColumn<int>(
    'participations',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _weightKgMeta = const VerificationMeta(
    'weightKg',
  );
  @override
  late final GeneratedColumn<double> weightKg = GeneratedColumn<double>(
    'weight_kg',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _heightCmMeta = const VerificationMeta(
    'heightCm',
  );
  @override
  late final GeneratedColumn<double> heightCm = GeneratedColumn<double>(
    'height_cm',
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
      'REFERENCES belts (id) ON UPDATE CASCADE ON DELETE SET NULL',
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
    numberIdentify,
    gender,
    birthDate,
    tournamentWins,
    participations,
    weightKg,
    heightCm,
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
    if (data.containsKey('number_identify')) {
      context.handle(
        _numberIdentifyMeta,
        numberIdentify.isAcceptableOrUnknown(
          data['number_identify']!,
          _numberIdentifyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_numberIdentifyMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(
        _genderMeta,
        gender.isAcceptableOrUnknown(data['gender']!, _genderMeta),
      );
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('birth_date')) {
      context.handle(
        _birthDateMeta,
        birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta),
      );
    } else if (isInserting) {
      context.missing(_birthDateMeta);
    }
    if (data.containsKey('tournament_wins')) {
      context.handle(
        _tournamentWinsMeta,
        tournamentWins.isAcceptableOrUnknown(
          data['tournament_wins']!,
          _tournamentWinsMeta,
        ),
      );
    }
    if (data.containsKey('participations')) {
      context.handle(
        _participationsMeta,
        participations.isAcceptableOrUnknown(
          data['participations']!,
          _participationsMeta,
        ),
      );
    }
    if (data.containsKey('weight_kg')) {
      context.handle(
        _weightKgMeta,
        weightKg.isAcceptableOrUnknown(data['weight_kg']!, _weightKgMeta),
      );
    } else if (isInserting) {
      context.missing(_weightKgMeta);
    }
    if (data.containsKey('height_cm')) {
      context.handle(
        _heightCmMeta,
        heightCm.isAcceptableOrUnknown(data['height_cm']!, _heightCmMeta),
      );
    } else if (isInserting) {
      context.missing(_heightCmMeta);
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
      numberIdentify: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}number_identify'],
      )!,
      gender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gender'],
      )!,
      birthDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}birth_date'],
      )!,
      tournamentWins: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tournament_wins'],
      )!,
      participations: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}participations'],
      )!,
      weightKg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight_kg'],
      )!,
      heightCm: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}height_cm'],
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
  final String numberIdentify;
  final String gender;
  final DateTime birthDate;
  final int tournamentWins;
  final int participations;
  final double weightKg;
  final double heightCm;
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
    required this.numberIdentify,
    required this.gender,
    required this.birthDate,
    required this.tournamentWins,
    required this.participations,
    required this.weightKg,
    required this.heightCm,
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
    map['number_identify'] = Variable<String>(numberIdentify);
    map['gender'] = Variable<String>(gender);
    map['birth_date'] = Variable<DateTime>(birthDate);
    map['tournament_wins'] = Variable<int>(tournamentWins);
    map['participations'] = Variable<int>(participations);
    map['weight_kg'] = Variable<double>(weightKg);
    map['height_cm'] = Variable<double>(heightCm);
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
      numberIdentify: Value(numberIdentify),
      gender: Value(gender),
      birthDate: Value(birthDate),
      tournamentWins: Value(tournamentWins),
      participations: Value(participations),
      weightKg: Value(weightKg),
      heightCm: Value(heightCm),
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
      numberIdentify: serializer.fromJson<String>(json['numberIdentify']),
      gender: serializer.fromJson<String>(json['gender']),
      birthDate: serializer.fromJson<DateTime>(json['birthDate']),
      tournamentWins: serializer.fromJson<int>(json['tournamentWins']),
      participations: serializer.fromJson<int>(json['participations']),
      weightKg: serializer.fromJson<double>(json['weightKg']),
      heightCm: serializer.fromJson<double>(json['heightCm']),
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
      'numberIdentify': serializer.toJson<String>(numberIdentify),
      'gender': serializer.toJson<String>(gender),
      'birthDate': serializer.toJson<DateTime>(birthDate),
      'tournamentWins': serializer.toJson<int>(tournamentWins),
      'participations': serializer.toJson<int>(participations),
      'weightKg': serializer.toJson<double>(weightKg),
      'heightCm': serializer.toJson<double>(heightCm),
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
    String? numberIdentify,
    String? gender,
    DateTime? birthDate,
    int? tournamentWins,
    int? participations,
    double? weightKg,
    double? heightCm,
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
    numberIdentify: numberIdentify ?? this.numberIdentify,
    gender: gender ?? this.gender,
    birthDate: birthDate ?? this.birthDate,
    tournamentWins: tournamentWins ?? this.tournamentWins,
    participations: participations ?? this.participations,
    weightKg: weightKg ?? this.weightKg,
    heightCm: heightCm ?? this.heightCm,
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
      numberIdentify: data.numberIdentify.present
          ? data.numberIdentify.value
          : this.numberIdentify,
      gender: data.gender.present ? data.gender.value : this.gender,
      birthDate: data.birthDate.present ? data.birthDate.value : this.birthDate,
      tournamentWins: data.tournamentWins.present
          ? data.tournamentWins.value
          : this.tournamentWins,
      participations: data.participations.present
          ? data.participations.value
          : this.participations,
      weightKg: data.weightKg.present ? data.weightKg.value : this.weightKg,
      heightCm: data.heightCm.present ? data.heightCm.value : this.heightCm,
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
          ..write('numberIdentify: $numberIdentify, ')
          ..write('gender: $gender, ')
          ..write('birthDate: $birthDate, ')
          ..write('tournamentWins: $tournamentWins, ')
          ..write('participations: $participations, ')
          ..write('weightKg: $weightKg, ')
          ..write('heightCm: $heightCm, ')
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
    numberIdentify,
    gender,
    birthDate,
    tournamentWins,
    participations,
    weightKg,
    heightCm,
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
          other.numberIdentify == this.numberIdentify &&
          other.gender == this.gender &&
          other.birthDate == this.birthDate &&
          other.tournamentWins == this.tournamentWins &&
          other.participations == this.participations &&
          other.weightKg == this.weightKg &&
          other.heightCm == this.heightCm &&
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
  final Value<String> numberIdentify;
  final Value<String> gender;
  final Value<DateTime> birthDate;
  final Value<int> tournamentWins;
  final Value<int> participations;
  final Value<double> weightKg;
  final Value<double> heightCm;
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
    this.numberIdentify = const Value.absent(),
    this.gender = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.tournamentWins = const Value.absent(),
    this.participations = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.heightCm = const Value.absent(),
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
    required String numberIdentify,
    required String gender,
    required DateTime birthDate,
    this.tournamentWins = const Value.absent(),
    this.participations = const Value.absent(),
    required double weightKg,
    required double heightCm,
    required int headquarterId,
    required int beltId,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : names = Value(names),
       surnames = Value(surnames),
       typeIdentify = Value(typeIdentify),
       numberIdentify = Value(numberIdentify),
       gender = Value(gender),
       birthDate = Value(birthDate),
       weightKg = Value(weightKg),
       heightCm = Value(heightCm),
       headquarterId = Value(headquarterId),
       beltId = Value(beltId);
  static Insertable<Student> custom({
    Expression<int>? id,
    Expression<String>? names,
    Expression<String>? surnames,
    Expression<String>? typeIdentify,
    Expression<String>? numberIdentify,
    Expression<String>? gender,
    Expression<DateTime>? birthDate,
    Expression<int>? tournamentWins,
    Expression<int>? participations,
    Expression<double>? weightKg,
    Expression<double>? heightCm,
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
      if (numberIdentify != null) 'number_identify': numberIdentify,
      if (gender != null) 'gender': gender,
      if (birthDate != null) 'birth_date': birthDate,
      if (tournamentWins != null) 'tournament_wins': tournamentWins,
      if (participations != null) 'participations': participations,
      if (weightKg != null) 'weight_kg': weightKg,
      if (heightCm != null) 'height_cm': heightCm,
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
    Value<String>? numberIdentify,
    Value<String>? gender,
    Value<DateTime>? birthDate,
    Value<int>? tournamentWins,
    Value<int>? participations,
    Value<double>? weightKg,
    Value<double>? heightCm,
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
      numberIdentify: numberIdentify ?? this.numberIdentify,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      tournamentWins: tournamentWins ?? this.tournamentWins,
      participations: participations ?? this.participations,
      weightKg: weightKg ?? this.weightKg,
      heightCm: heightCm ?? this.heightCm,
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
    if (numberIdentify.present) {
      map['number_identify'] = Variable<String>(numberIdentify.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<DateTime>(birthDate.value);
    }
    if (tournamentWins.present) {
      map['tournament_wins'] = Variable<int>(tournamentWins.value);
    }
    if (participations.present) {
      map['participations'] = Variable<int>(participations.value);
    }
    if (weightKg.present) {
      map['weight_kg'] = Variable<double>(weightKg.value);
    }
    if (heightCm.present) {
      map['height_cm'] = Variable<double>(heightCm.value);
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
          ..write('numberIdentify: $numberIdentify, ')
          ..write('gender: $gender, ')
          ..write('birthDate: $birthDate, ')
          ..write('tournamentWins: $tournamentWins, ')
          ..write('participations: $participations, ')
          ..write('weightKg: $weightKg, ')
          ..write('heightCm: $heightCm, ')
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
  static const VerificationMeta _hostMeta = const VerificationMeta('host');
  @override
  late final GeneratedColumn<String> host = GeneratedColumn<String>(
    'host',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
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
  static const VerificationMeta _disciplineMeta = const VerificationMeta(
    'discipline',
  );
  @override
  late final GeneratedColumn<String> discipline = GeneratedColumn<String>(
    'discipline',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('combat'),
  );
  static const VerificationMeta _setupPhaseMeta = const VerificationMeta(
    'setupPhase',
  );
  @override
  late final GeneratedColumn<String> setupPhase = GeneratedColumn<String>(
    'setup_phase',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('draft'),
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
    host,
    location,
    dateStart,
    dateEnd,
    status,
    discipline,
    setupPhase,
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
    if (data.containsKey('host')) {
      context.handle(
        _hostMeta,
        host.isAcceptableOrUnknown(data['host']!, _hostMeta),
      );
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
    if (data.containsKey('discipline')) {
      context.handle(
        _disciplineMeta,
        discipline.isAcceptableOrUnknown(data['discipline']!, _disciplineMeta),
      );
    }
    if (data.containsKey('setup_phase')) {
      context.handle(
        _setupPhaseMeta,
        setupPhase.isAcceptableOrUnknown(data['setup_phase']!, _setupPhaseMeta),
      );
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
      host: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}host'],
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
      discipline: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}discipline'],
      )!,
      setupPhase: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}setup_phase'],
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
  final String host;
  final String location;
  final DateTime dateStart;
  final DateTime dateEnd;
  final String status;
  final String discipline;
  final String setupPhase;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int synchronized;
  final int isActive;
  const TournamentData({
    required this.id,
    required this.name,
    required this.host,
    required this.location,
    required this.dateStart,
    required this.dateEnd,
    required this.status,
    required this.discipline,
    required this.setupPhase,
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
    map['host'] = Variable<String>(host);
    map['location'] = Variable<String>(location);
    map['date_start'] = Variable<DateTime>(dateStart);
    map['date_end'] = Variable<DateTime>(dateEnd);
    map['status'] = Variable<String>(status);
    map['discipline'] = Variable<String>(discipline);
    map['setup_phase'] = Variable<String>(setupPhase);
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
      host: Value(host),
      location: Value(location),
      dateStart: Value(dateStart),
      dateEnd: Value(dateEnd),
      status: Value(status),
      discipline: Value(discipline),
      setupPhase: Value(setupPhase),
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
      host: serializer.fromJson<String>(json['host']),
      location: serializer.fromJson<String>(json['location']),
      dateStart: serializer.fromJson<DateTime>(json['dateStart']),
      dateEnd: serializer.fromJson<DateTime>(json['dateEnd']),
      status: serializer.fromJson<String>(json['status']),
      discipline: serializer.fromJson<String>(json['discipline']),
      setupPhase: serializer.fromJson<String>(json['setupPhase']),
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
      'host': serializer.toJson<String>(host),
      'location': serializer.toJson<String>(location),
      'dateStart': serializer.toJson<DateTime>(dateStart),
      'dateEnd': serializer.toJson<DateTime>(dateEnd),
      'status': serializer.toJson<String>(status),
      'discipline': serializer.toJson<String>(discipline),
      'setupPhase': serializer.toJson<String>(setupPhase),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'synchronized': serializer.toJson<int>(synchronized),
      'isActive': serializer.toJson<int>(isActive),
    };
  }

  TournamentData copyWith({
    int? id,
    String? name,
    String? host,
    String? location,
    DateTime? dateStart,
    DateTime? dateEnd,
    String? status,
    String? discipline,
    String? setupPhase,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
    int? isActive,
  }) => TournamentData(
    id: id ?? this.id,
    name: name ?? this.name,
    host: host ?? this.host,
    location: location ?? this.location,
    dateStart: dateStart ?? this.dateStart,
    dateEnd: dateEnd ?? this.dateEnd,
    status: status ?? this.status,
    discipline: discipline ?? this.discipline,
    setupPhase: setupPhase ?? this.setupPhase,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    synchronized: synchronized ?? this.synchronized,
    isActive: isActive ?? this.isActive,
  );
  TournamentData copyWithCompanion(TournamentCompanion data) {
    return TournamentData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      host: data.host.present ? data.host.value : this.host,
      location: data.location.present ? data.location.value : this.location,
      dateStart: data.dateStart.present ? data.dateStart.value : this.dateStart,
      dateEnd: data.dateEnd.present ? data.dateEnd.value : this.dateEnd,
      status: data.status.present ? data.status.value : this.status,
      discipline: data.discipline.present
          ? data.discipline.value
          : this.discipline,
      setupPhase: data.setupPhase.present
          ? data.setupPhase.value
          : this.setupPhase,
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
          ..write('host: $host, ')
          ..write('location: $location, ')
          ..write('dateStart: $dateStart, ')
          ..write('dateEnd: $dateEnd, ')
          ..write('status: $status, ')
          ..write('discipline: $discipline, ')
          ..write('setupPhase: $setupPhase, ')
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
    host,
    location,
    dateStart,
    dateEnd,
    status,
    discipline,
    setupPhase,
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
          other.host == this.host &&
          other.location == this.location &&
          other.dateStart == this.dateStart &&
          other.dateEnd == this.dateEnd &&
          other.status == this.status &&
          other.discipline == this.discipline &&
          other.setupPhase == this.setupPhase &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.synchronized == this.synchronized &&
          other.isActive == this.isActive);
}

class TournamentCompanion extends UpdateCompanion<TournamentData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> host;
  final Value<String> location;
  final Value<DateTime> dateStart;
  final Value<DateTime> dateEnd;
  final Value<String> status;
  final Value<String> discipline;
  final Value<String> setupPhase;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> synchronized;
  final Value<int> isActive;
  const TournamentCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.host = const Value.absent(),
    this.location = const Value.absent(),
    this.dateStart = const Value.absent(),
    this.dateEnd = const Value.absent(),
    this.status = const Value.absent(),
    this.discipline = const Value.absent(),
    this.setupPhase = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  TournamentCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.host = const Value.absent(),
    required String location,
    required DateTime dateStart,
    required DateTime dateEnd,
    required String status,
    this.discipline = const Value.absent(),
    this.setupPhase = const Value.absent(),
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
    Expression<String>? host,
    Expression<String>? location,
    Expression<DateTime>? dateStart,
    Expression<DateTime>? dateEnd,
    Expression<String>? status,
    Expression<String>? discipline,
    Expression<String>? setupPhase,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? synchronized,
    Expression<int>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (host != null) 'host': host,
      if (location != null) 'location': location,
      if (dateStart != null) 'date_start': dateStart,
      if (dateEnd != null) 'date_end': dateEnd,
      if (status != null) 'status': status,
      if (discipline != null) 'discipline': discipline,
      if (setupPhase != null) 'setup_phase': setupPhase,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (synchronized != null) 'synchronized': synchronized,
      if (isActive != null) 'is_active': isActive,
    });
  }

  TournamentCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? host,
    Value<String>? location,
    Value<DateTime>? dateStart,
    Value<DateTime>? dateEnd,
    Value<String>? status,
    Value<String>? discipline,
    Value<String>? setupPhase,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? synchronized,
    Value<int>? isActive,
  }) {
    return TournamentCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      host: host ?? this.host,
      location: location ?? this.location,
      dateStart: dateStart ?? this.dateStart,
      dateEnd: dateEnd ?? this.dateEnd,
      status: status ?? this.status,
      discipline: discipline ?? this.discipline,
      setupPhase: setupPhase ?? this.setupPhase,
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
    if (host.present) {
      map['host'] = Variable<String>(host.value);
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
    if (discipline.present) {
      map['discipline'] = Variable<String>(discipline.value);
    }
    if (setupPhase.present) {
      map['setup_phase'] = Variable<String>(setupPhase.value);
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
          ..write('host: $host, ')
          ..write('location: $location, ')
          ..write('dateStart: $dateStart, ')
          ..write('dateEnd: $dateEnd, ')
          ..write('status: $status, ')
          ..write('discipline: $discipline, ')
          ..write('setupPhase: $setupPhase, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $CombatSettingsTable extends CombatSettings
    with TableInfo<$CombatSettingsTable, CombatSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CombatSettingsTable(this.attachedDatabase, [this._alias]);
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
      'REFERENCES tournament (id) ON UPDATE CASCADE ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _roundsMaxMeta = const VerificationMeta(
    'roundsMax',
  );
  @override
  late final GeneratedColumn<int> roundsMax = GeneratedColumn<int>(
    'rounds_max',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _formatTypeMeta = const VerificationMeta(
    'formatType',
  );
  @override
  late final GeneratedColumn<String> formatType = GeneratedColumn<String>(
    'format_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roundDurationSecondsMeta =
      const VerificationMeta('roundDurationSeconds');
  @override
  late final GeneratedColumn<int> roundDurationSeconds = GeneratedColumn<int>(
    'round_duration_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pointsToWinMeta = const VerificationMeta(
    'pointsToWin',
  );
  @override
  late final GeneratedColumn<int> pointsToWin = GeneratedColumn<int>(
    'points_to_win',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _playAllRoundsMeta = const VerificationMeta(
    'playAllRounds',
  );
  @override
  late final GeneratedColumn<int> playAllRounds = GeneratedColumn<int>(
    'play_all_rounds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _eliminationTypeMeta = const VerificationMeta(
    'eliminationType',
  );
  @override
  late final GeneratedColumn<String> eliminationType = GeneratedColumn<String>(
    'elimination_type',
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
    tournamentId,
    roundsMax,
    formatType,
    roundDurationSeconds,
    pointsToWin,
    playAllRounds,
    eliminationType,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'combat_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<CombatSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    if (data.containsKey('rounds_max')) {
      context.handle(
        _roundsMaxMeta,
        roundsMax.isAcceptableOrUnknown(data['rounds_max']!, _roundsMaxMeta),
      );
    } else if (isInserting) {
      context.missing(_roundsMaxMeta);
    }
    if (data.containsKey('format_type')) {
      context.handle(
        _formatTypeMeta,
        formatType.isAcceptableOrUnknown(data['format_type']!, _formatTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_formatTypeMeta);
    }
    if (data.containsKey('round_duration_seconds')) {
      context.handle(
        _roundDurationSecondsMeta,
        roundDurationSeconds.isAcceptableOrUnknown(
          data['round_duration_seconds']!,
          _roundDurationSecondsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_roundDurationSecondsMeta);
    }
    if (data.containsKey('points_to_win')) {
      context.handle(
        _pointsToWinMeta,
        pointsToWin.isAcceptableOrUnknown(
          data['points_to_win']!,
          _pointsToWinMeta,
        ),
      );
    }
    if (data.containsKey('play_all_rounds')) {
      context.handle(
        _playAllRoundsMeta,
        playAllRounds.isAcceptableOrUnknown(
          data['play_all_rounds']!,
          _playAllRoundsMeta,
        ),
      );
    }
    if (data.containsKey('elimination_type')) {
      context.handle(
        _eliminationTypeMeta,
        eliminationType.isAcceptableOrUnknown(
          data['elimination_type']!,
          _eliminationTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_eliminationTypeMeta);
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
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {tournamentId},
  ];
  @override
  CombatSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CombatSetting(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      tournamentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tournament_id'],
      )!,
      roundsMax: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rounds_max'],
      )!,
      formatType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}format_type'],
      )!,
      roundDurationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}round_duration_seconds'],
      )!,
      pointsToWin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}points_to_win'],
      ),
      playAllRounds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}play_all_rounds'],
      )!,
      eliminationType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}elimination_type'],
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
  $CombatSettingsTable createAlias(String alias) {
    return $CombatSettingsTable(attachedDatabase, alias);
  }
}

class CombatSetting extends DataClass implements Insertable<CombatSetting> {
  final int id;
  final int tournamentId;
  final int roundsMax;
  final String formatType;
  final int roundDurationSeconds;
  final int? pointsToWin;
  final int playAllRounds;
  final String eliminationType;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int synchronized;
  final int isActive;
  const CombatSetting({
    required this.id,
    required this.tournamentId,
    required this.roundsMax,
    required this.formatType,
    required this.roundDurationSeconds,
    this.pointsToWin,
    required this.playAllRounds,
    required this.eliminationType,
    required this.createdAt,
    required this.updatedAt,
    required this.synchronized,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tournament_id'] = Variable<int>(tournamentId);
    map['rounds_max'] = Variable<int>(roundsMax);
    map['format_type'] = Variable<String>(formatType);
    map['round_duration_seconds'] = Variable<int>(roundDurationSeconds);
    if (!nullToAbsent || pointsToWin != null) {
      map['points_to_win'] = Variable<int>(pointsToWin);
    }
    map['play_all_rounds'] = Variable<int>(playAllRounds);
    map['elimination_type'] = Variable<String>(eliminationType);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['synchronized'] = Variable<int>(synchronized);
    map['is_active'] = Variable<int>(isActive);
    return map;
  }

  CombatSettingsCompanion toCompanion(bool nullToAbsent) {
    return CombatSettingsCompanion(
      id: Value(id),
      tournamentId: Value(tournamentId),
      roundsMax: Value(roundsMax),
      formatType: Value(formatType),
      roundDurationSeconds: Value(roundDurationSeconds),
      pointsToWin: pointsToWin == null && nullToAbsent
          ? const Value.absent()
          : Value(pointsToWin),
      playAllRounds: Value(playAllRounds),
      eliminationType: Value(eliminationType),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      synchronized: Value(synchronized),
      isActive: Value(isActive),
    );
  }

  factory CombatSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CombatSetting(
      id: serializer.fromJson<int>(json['id']),
      tournamentId: serializer.fromJson<int>(json['tournamentId']),
      roundsMax: serializer.fromJson<int>(json['roundsMax']),
      formatType: serializer.fromJson<String>(json['formatType']),
      roundDurationSeconds: serializer.fromJson<int>(
        json['roundDurationSeconds'],
      ),
      pointsToWin: serializer.fromJson<int?>(json['pointsToWin']),
      playAllRounds: serializer.fromJson<int>(json['playAllRounds']),
      eliminationType: serializer.fromJson<String>(json['eliminationType']),
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
      'tournamentId': serializer.toJson<int>(tournamentId),
      'roundsMax': serializer.toJson<int>(roundsMax),
      'formatType': serializer.toJson<String>(formatType),
      'roundDurationSeconds': serializer.toJson<int>(roundDurationSeconds),
      'pointsToWin': serializer.toJson<int?>(pointsToWin),
      'playAllRounds': serializer.toJson<int>(playAllRounds),
      'eliminationType': serializer.toJson<String>(eliminationType),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'synchronized': serializer.toJson<int>(synchronized),
      'isActive': serializer.toJson<int>(isActive),
    };
  }

  CombatSetting copyWith({
    int? id,
    int? tournamentId,
    int? roundsMax,
    String? formatType,
    int? roundDurationSeconds,
    Value<int?> pointsToWin = const Value.absent(),
    int? playAllRounds,
    String? eliminationType,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
    int? isActive,
  }) => CombatSetting(
    id: id ?? this.id,
    tournamentId: tournamentId ?? this.tournamentId,
    roundsMax: roundsMax ?? this.roundsMax,
    formatType: formatType ?? this.formatType,
    roundDurationSeconds: roundDurationSeconds ?? this.roundDurationSeconds,
    pointsToWin: pointsToWin.present ? pointsToWin.value : this.pointsToWin,
    playAllRounds: playAllRounds ?? this.playAllRounds,
    eliminationType: eliminationType ?? this.eliminationType,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    synchronized: synchronized ?? this.synchronized,
    isActive: isActive ?? this.isActive,
  );
  CombatSetting copyWithCompanion(CombatSettingsCompanion data) {
    return CombatSetting(
      id: data.id.present ? data.id.value : this.id,
      tournamentId: data.tournamentId.present
          ? data.tournamentId.value
          : this.tournamentId,
      roundsMax: data.roundsMax.present ? data.roundsMax.value : this.roundsMax,
      formatType: data.formatType.present
          ? data.formatType.value
          : this.formatType,
      roundDurationSeconds: data.roundDurationSeconds.present
          ? data.roundDurationSeconds.value
          : this.roundDurationSeconds,
      pointsToWin: data.pointsToWin.present
          ? data.pointsToWin.value
          : this.pointsToWin,
      playAllRounds: data.playAllRounds.present
          ? data.playAllRounds.value
          : this.playAllRounds,
      eliminationType: data.eliminationType.present
          ? data.eliminationType.value
          : this.eliminationType,
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
    return (StringBuffer('CombatSetting(')
          ..write('id: $id, ')
          ..write('tournamentId: $tournamentId, ')
          ..write('roundsMax: $roundsMax, ')
          ..write('formatType: $formatType, ')
          ..write('roundDurationSeconds: $roundDurationSeconds, ')
          ..write('pointsToWin: $pointsToWin, ')
          ..write('playAllRounds: $playAllRounds, ')
          ..write('eliminationType: $eliminationType, ')
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
    tournamentId,
    roundsMax,
    formatType,
    roundDurationSeconds,
    pointsToWin,
    playAllRounds,
    eliminationType,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CombatSetting &&
          other.id == this.id &&
          other.tournamentId == this.tournamentId &&
          other.roundsMax == this.roundsMax &&
          other.formatType == this.formatType &&
          other.roundDurationSeconds == this.roundDurationSeconds &&
          other.pointsToWin == this.pointsToWin &&
          other.playAllRounds == this.playAllRounds &&
          other.eliminationType == this.eliminationType &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.synchronized == this.synchronized &&
          other.isActive == this.isActive);
}

class CombatSettingsCompanion extends UpdateCompanion<CombatSetting> {
  final Value<int> id;
  final Value<int> tournamentId;
  final Value<int> roundsMax;
  final Value<String> formatType;
  final Value<int> roundDurationSeconds;
  final Value<int?> pointsToWin;
  final Value<int> playAllRounds;
  final Value<String> eliminationType;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> synchronized;
  final Value<int> isActive;
  const CombatSettingsCompanion({
    this.id = const Value.absent(),
    this.tournamentId = const Value.absent(),
    this.roundsMax = const Value.absent(),
    this.formatType = const Value.absent(),
    this.roundDurationSeconds = const Value.absent(),
    this.pointsToWin = const Value.absent(),
    this.playAllRounds = const Value.absent(),
    this.eliminationType = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  CombatSettingsCompanion.insert({
    this.id = const Value.absent(),
    required int tournamentId,
    required int roundsMax,
    required String formatType,
    required int roundDurationSeconds,
    this.pointsToWin = const Value.absent(),
    this.playAllRounds = const Value.absent(),
    required String eliminationType,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : tournamentId = Value(tournamentId),
       roundsMax = Value(roundsMax),
       formatType = Value(formatType),
       roundDurationSeconds = Value(roundDurationSeconds),
       eliminationType = Value(eliminationType);
  static Insertable<CombatSetting> custom({
    Expression<int>? id,
    Expression<int>? tournamentId,
    Expression<int>? roundsMax,
    Expression<String>? formatType,
    Expression<int>? roundDurationSeconds,
    Expression<int>? pointsToWin,
    Expression<int>? playAllRounds,
    Expression<String>? eliminationType,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? synchronized,
    Expression<int>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tournamentId != null) 'tournament_id': tournamentId,
      if (roundsMax != null) 'rounds_max': roundsMax,
      if (formatType != null) 'format_type': formatType,
      if (roundDurationSeconds != null)
        'round_duration_seconds': roundDurationSeconds,
      if (pointsToWin != null) 'points_to_win': pointsToWin,
      if (playAllRounds != null) 'play_all_rounds': playAllRounds,
      if (eliminationType != null) 'elimination_type': eliminationType,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (synchronized != null) 'synchronized': synchronized,
      if (isActive != null) 'is_active': isActive,
    });
  }

  CombatSettingsCompanion copyWith({
    Value<int>? id,
    Value<int>? tournamentId,
    Value<int>? roundsMax,
    Value<String>? formatType,
    Value<int>? roundDurationSeconds,
    Value<int?>? pointsToWin,
    Value<int>? playAllRounds,
    Value<String>? eliminationType,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? synchronized,
    Value<int>? isActive,
  }) {
    return CombatSettingsCompanion(
      id: id ?? this.id,
      tournamentId: tournamentId ?? this.tournamentId,
      roundsMax: roundsMax ?? this.roundsMax,
      formatType: formatType ?? this.formatType,
      roundDurationSeconds: roundDurationSeconds ?? this.roundDurationSeconds,
      pointsToWin: pointsToWin ?? this.pointsToWin,
      playAllRounds: playAllRounds ?? this.playAllRounds,
      eliminationType: eliminationType ?? this.eliminationType,
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
    if (tournamentId.present) {
      map['tournament_id'] = Variable<int>(tournamentId.value);
    }
    if (roundsMax.present) {
      map['rounds_max'] = Variable<int>(roundsMax.value);
    }
    if (formatType.present) {
      map['format_type'] = Variable<String>(formatType.value);
    }
    if (roundDurationSeconds.present) {
      map['round_duration_seconds'] = Variable<int>(roundDurationSeconds.value);
    }
    if (pointsToWin.present) {
      map['points_to_win'] = Variable<int>(pointsToWin.value);
    }
    if (playAllRounds.present) {
      map['play_all_rounds'] = Variable<int>(playAllRounds.value);
    }
    if (eliminationType.present) {
      map['elimination_type'] = Variable<String>(eliminationType.value);
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
    return (StringBuffer('CombatSettingsCompanion(')
          ..write('id: $id, ')
          ..write('tournamentId: $tournamentId, ')
          ..write('roundsMax: $roundsMax, ')
          ..write('formatType: $formatType, ')
          ..write('roundDurationSeconds: $roundDurationSeconds, ')
          ..write('pointsToWin: $pointsToWin, ')
          ..write('playAllRounds: $playAllRounds, ')
          ..write('eliminationType: $eliminationType, ')
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
  static const VerificationMeta _clubMeta = const VerificationMeta('club');
  @override
  late final GeneratedColumn<String> club = GeneratedColumn<String>(
    'club',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _documentMeta = const VerificationMeta(
    'document',
  );
  @override
  late final GeneratedColumn<String> document = GeneratedColumn<String>(
    'document',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rankMeta = const VerificationMeta('rank');
  @override
  late final GeneratedColumn<String> rank = GeneratedColumn<String>(
    'rank',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _participationsMeta = const VerificationMeta(
    'participations',
  );
  @override
  late final GeneratedColumn<int> participations = GeneratedColumn<int>(
    'participations',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
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
    club,
    phone,
    document,
    rank,
    participations,
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
    if (data.containsKey('club')) {
      context.handle(
        _clubMeta,
        club.isAcceptableOrUnknown(data['club']!, _clubMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('document')) {
      context.handle(
        _documentMeta,
        document.isAcceptableOrUnknown(data['document']!, _documentMeta),
      );
    } else if (isInserting) {
      context.missing(_documentMeta);
    }
    if (data.containsKey('rank')) {
      context.handle(
        _rankMeta,
        rank.isAcceptableOrUnknown(data['rank']!, _rankMeta),
      );
    }
    if (data.containsKey('participations')) {
      context.handle(
        _participationsMeta,
        participations.isAcceptableOrUnknown(
          data['participations']!,
          _participationsMeta,
        ),
      );
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
      club: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}club'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      )!,
      document: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}document'],
      )!,
      rank: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rank'],
      )!,
      participations: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}participations'],
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
  final String club;
  final String phone;
  final String document;
  final String rank;
  final int participations;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int synchronized;
  final int isActive;
  const JudgeData({
    required this.id,
    required this.names,
    required this.club,
    required this.phone,
    required this.document,
    required this.rank,
    required this.participations,
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
    map['club'] = Variable<String>(club);
    map['phone'] = Variable<String>(phone);
    map['document'] = Variable<String>(document);
    map['rank'] = Variable<String>(rank);
    map['participations'] = Variable<int>(participations);
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
      club: Value(club),
      phone: Value(phone),
      document: Value(document),
      rank: Value(rank),
      participations: Value(participations),
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
      club: serializer.fromJson<String>(json['club']),
      phone: serializer.fromJson<String>(json['phone']),
      document: serializer.fromJson<String>(json['document']),
      rank: serializer.fromJson<String>(json['rank']),
      participations: serializer.fromJson<int>(json['participations']),
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
      'club': serializer.toJson<String>(club),
      'phone': serializer.toJson<String>(phone),
      'document': serializer.toJson<String>(document),
      'rank': serializer.toJson<String>(rank),
      'participations': serializer.toJson<int>(participations),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'synchronized': serializer.toJson<int>(synchronized),
      'isActive': serializer.toJson<int>(isActive),
    };
  }

  JudgeData copyWith({
    int? id,
    String? names,
    String? club,
    String? phone,
    String? document,
    String? rank,
    int? participations,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
    int? isActive,
  }) => JudgeData(
    id: id ?? this.id,
    names: names ?? this.names,
    club: club ?? this.club,
    phone: phone ?? this.phone,
    document: document ?? this.document,
    rank: rank ?? this.rank,
    participations: participations ?? this.participations,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    synchronized: synchronized ?? this.synchronized,
    isActive: isActive ?? this.isActive,
  );
  JudgeData copyWithCompanion(JudgeCompanion data) {
    return JudgeData(
      id: data.id.present ? data.id.value : this.id,
      names: data.names.present ? data.names.value : this.names,
      club: data.club.present ? data.club.value : this.club,
      phone: data.phone.present ? data.phone.value : this.phone,
      document: data.document.present ? data.document.value : this.document,
      rank: data.rank.present ? data.rank.value : this.rank,
      participations: data.participations.present
          ? data.participations.value
          : this.participations,
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
          ..write('club: $club, ')
          ..write('phone: $phone, ')
          ..write('document: $document, ')
          ..write('rank: $rank, ')
          ..write('participations: $participations, ')
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
    club,
    phone,
    document,
    rank,
    participations,
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
          other.club == this.club &&
          other.phone == this.phone &&
          other.document == this.document &&
          other.rank == this.rank &&
          other.participations == this.participations &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.synchronized == this.synchronized &&
          other.isActive == this.isActive);
}

class JudgeCompanion extends UpdateCompanion<JudgeData> {
  final Value<int> id;
  final Value<String> names;
  final Value<String> club;
  final Value<String> phone;
  final Value<String> document;
  final Value<String> rank;
  final Value<int> participations;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> synchronized;
  final Value<int> isActive;
  const JudgeCompanion({
    this.id = const Value.absent(),
    this.names = const Value.absent(),
    this.club = const Value.absent(),
    this.phone = const Value.absent(),
    this.document = const Value.absent(),
    this.rank = const Value.absent(),
    this.participations = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  JudgeCompanion.insert({
    this.id = const Value.absent(),
    required String names,
    this.club = const Value.absent(),
    this.phone = const Value.absent(),
    required String document,
    this.rank = const Value.absent(),
    this.participations = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : names = Value(names),
       document = Value(document);
  static Insertable<JudgeData> custom({
    Expression<int>? id,
    Expression<String>? names,
    Expression<String>? club,
    Expression<String>? phone,
    Expression<String>? document,
    Expression<String>? rank,
    Expression<int>? participations,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? synchronized,
    Expression<int>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (names != null) 'names': names,
      if (club != null) 'club': club,
      if (phone != null) 'phone': phone,
      if (document != null) 'document': document,
      if (rank != null) 'rank': rank,
      if (participations != null) 'participations': participations,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (synchronized != null) 'synchronized': synchronized,
      if (isActive != null) 'is_active': isActive,
    });
  }

  JudgeCompanion copyWith({
    Value<int>? id,
    Value<String>? names,
    Value<String>? club,
    Value<String>? phone,
    Value<String>? document,
    Value<String>? rank,
    Value<int>? participations,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? synchronized,
    Value<int>? isActive,
  }) {
    return JudgeCompanion(
      id: id ?? this.id,
      names: names ?? this.names,
      club: club ?? this.club,
      phone: phone ?? this.phone,
      document: document ?? this.document,
      rank: rank ?? this.rank,
      participations: participations ?? this.participations,
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
    if (club.present) {
      map['club'] = Variable<String>(club.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (document.present) {
      map['document'] = Variable<String>(document.value);
    }
    if (rank.present) {
      map['rank'] = Variable<String>(rank.value);
    }
    if (participations.present) {
      map['participations'] = Variable<int>(participations.value);
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
          ..write('club: $club, ')
          ..write('phone: $phone, ')
          ..write('document: $document, ')
          ..write('rank: $rank, ')
          ..write('participations: $participations, ')
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
      'REFERENCES judge (id) ON UPDATE CASCADE ON DELETE RESTRICT',
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
      'REFERENCES tournament (id) ON UPDATE CASCADE ON DELETE RESTRICT',
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

class $GroupsTable extends Groups with TableInfo<$GroupsTable, Group> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GroupsTable(this.attachedDatabase, [this._alias]);
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
      'REFERENCES tournament (id) ON UPDATE CASCADE ON DELETE RESTRICT',
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
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
    'gender',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('mixed'),
  );
  static const VerificationMeta _ageMinMeta = const VerificationMeta('ageMin');
  @override
  late final GeneratedColumn<int> ageMin = GeneratedColumn<int>(
    'age_min',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ageMaxMeta = const VerificationMeta('ageMax');
  @override
  late final GeneratedColumn<int> ageMax = GeneratedColumn<int>(
    'age_max',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weightMinMeta = const VerificationMeta(
    'weightMin',
  );
  @override
  late final GeneratedColumn<double> weightMin = GeneratedColumn<double>(
    'weight_min',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weightMaxMeta = const VerificationMeta(
    'weightMax',
  );
  @override
  late final GeneratedColumn<double> weightMax = GeneratedColumn<double>(
    'weight_max',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _beltFromIdMeta = const VerificationMeta(
    'beltFromId',
  );
  @override
  late final GeneratedColumn<int> beltFromId = GeneratedColumn<int>(
    'belt_from_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _beltToIdMeta = const VerificationMeta(
    'beltToId',
  );
  @override
  late final GeneratedColumn<int> beltToId = GeneratedColumn<int>(
    'belt_to_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
    'state',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('draft'),
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
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
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
    tournamentId,
    name,
    gender,
    ageMin,
    ageMax,
    weightMin,
    weightMax,
    beltFromId,
    beltToId,
    state,
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
  static const String $name = 'groups';
  @override
  VerificationContext validateIntegrity(
    Insertable<Group> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(
        _genderMeta,
        gender.isAcceptableOrUnknown(data['gender']!, _genderMeta),
      );
    }
    if (data.containsKey('age_min')) {
      context.handle(
        _ageMinMeta,
        ageMin.isAcceptableOrUnknown(data['age_min']!, _ageMinMeta),
      );
    }
    if (data.containsKey('age_max')) {
      context.handle(
        _ageMaxMeta,
        ageMax.isAcceptableOrUnknown(data['age_max']!, _ageMaxMeta),
      );
    }
    if (data.containsKey('weight_min')) {
      context.handle(
        _weightMinMeta,
        weightMin.isAcceptableOrUnknown(data['weight_min']!, _weightMinMeta),
      );
    }
    if (data.containsKey('weight_max')) {
      context.handle(
        _weightMaxMeta,
        weightMax.isAcceptableOrUnknown(data['weight_max']!, _weightMaxMeta),
      );
    }
    if (data.containsKey('belt_from_id')) {
      context.handle(
        _beltFromIdMeta,
        beltFromId.isAcceptableOrUnknown(
          data['belt_from_id']!,
          _beltFromIdMeta,
        ),
      );
    }
    if (data.containsKey('belt_to_id')) {
      context.handle(
        _beltToIdMeta,
        beltToId.isAcceptableOrUnknown(data['belt_to_id']!, _beltToIdMeta),
      );
    }
    if (data.containsKey('state')) {
      context.handle(
        _stateMeta,
        state.isAcceptableOrUnknown(data['state']!, _stateMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
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
  Group map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Group(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      tournamentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tournament_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      gender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gender'],
      )!,
      ageMin: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}age_min'],
      ),
      ageMax: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}age_max'],
      ),
      weightMin: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight_min'],
      ),
      weightMax: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight_max'],
      ),
      beltFromId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}belt_from_id'],
      ),
      beltToId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}belt_to_id'],
      ),
      state: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}state'],
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
  $GroupsTable createAlias(String alias) {
    return $GroupsTable(attachedDatabase, alias);
  }
}

class Group extends DataClass implements Insertable<Group> {
  final int id;
  final int tournamentId;
  final String name;
  final String gender;
  final int? ageMin;
  final int? ageMax;
  final double? weightMin;
  final double? weightMax;
  final int? beltFromId;
  final int? beltToId;

  /// draft | open (inscripciones) | closed (grupo cerrado) | ready
  final String state;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int synchronized;
  final int isActive;
  const Group({
    required this.id,
    required this.tournamentId,
    required this.name,
    required this.gender,
    this.ageMin,
    this.ageMax,
    this.weightMin,
    this.weightMax,
    this.beltFromId,
    this.beltToId,
    required this.state,
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
    map['tournament_id'] = Variable<int>(tournamentId);
    map['name'] = Variable<String>(name);
    map['gender'] = Variable<String>(gender);
    if (!nullToAbsent || ageMin != null) {
      map['age_min'] = Variable<int>(ageMin);
    }
    if (!nullToAbsent || ageMax != null) {
      map['age_max'] = Variable<int>(ageMax);
    }
    if (!nullToAbsent || weightMin != null) {
      map['weight_min'] = Variable<double>(weightMin);
    }
    if (!nullToAbsent || weightMax != null) {
      map['weight_max'] = Variable<double>(weightMax);
    }
    if (!nullToAbsent || beltFromId != null) {
      map['belt_from_id'] = Variable<int>(beltFromId);
    }
    if (!nullToAbsent || beltToId != null) {
      map['belt_to_id'] = Variable<int>(beltToId);
    }
    map['state'] = Variable<String>(state);
    map['description'] = Variable<String>(description);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['synchronized'] = Variable<int>(synchronized);
    map['is_active'] = Variable<int>(isActive);
    return map;
  }

  GroupsCompanion toCompanion(bool nullToAbsent) {
    return GroupsCompanion(
      id: Value(id),
      tournamentId: Value(tournamentId),
      name: Value(name),
      gender: Value(gender),
      ageMin: ageMin == null && nullToAbsent
          ? const Value.absent()
          : Value(ageMin),
      ageMax: ageMax == null && nullToAbsent
          ? const Value.absent()
          : Value(ageMax),
      weightMin: weightMin == null && nullToAbsent
          ? const Value.absent()
          : Value(weightMin),
      weightMax: weightMax == null && nullToAbsent
          ? const Value.absent()
          : Value(weightMax),
      beltFromId: beltFromId == null && nullToAbsent
          ? const Value.absent()
          : Value(beltFromId),
      beltToId: beltToId == null && nullToAbsent
          ? const Value.absent()
          : Value(beltToId),
      state: Value(state),
      description: Value(description),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      synchronized: Value(synchronized),
      isActive: Value(isActive),
    );
  }

  factory Group.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Group(
      id: serializer.fromJson<int>(json['id']),
      tournamentId: serializer.fromJson<int>(json['tournamentId']),
      name: serializer.fromJson<String>(json['name']),
      gender: serializer.fromJson<String>(json['gender']),
      ageMin: serializer.fromJson<int?>(json['ageMin']),
      ageMax: serializer.fromJson<int?>(json['ageMax']),
      weightMin: serializer.fromJson<double?>(json['weightMin']),
      weightMax: serializer.fromJson<double?>(json['weightMax']),
      beltFromId: serializer.fromJson<int?>(json['beltFromId']),
      beltToId: serializer.fromJson<int?>(json['beltToId']),
      state: serializer.fromJson<String>(json['state']),
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
      'tournamentId': serializer.toJson<int>(tournamentId),
      'name': serializer.toJson<String>(name),
      'gender': serializer.toJson<String>(gender),
      'ageMin': serializer.toJson<int?>(ageMin),
      'ageMax': serializer.toJson<int?>(ageMax),
      'weightMin': serializer.toJson<double?>(weightMin),
      'weightMax': serializer.toJson<double?>(weightMax),
      'beltFromId': serializer.toJson<int?>(beltFromId),
      'beltToId': serializer.toJson<int?>(beltToId),
      'state': serializer.toJson<String>(state),
      'description': serializer.toJson<String>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'synchronized': serializer.toJson<int>(synchronized),
      'isActive': serializer.toJson<int>(isActive),
    };
  }

  Group copyWith({
    int? id,
    int? tournamentId,
    String? name,
    String? gender,
    Value<int?> ageMin = const Value.absent(),
    Value<int?> ageMax = const Value.absent(),
    Value<double?> weightMin = const Value.absent(),
    Value<double?> weightMax = const Value.absent(),
    Value<int?> beltFromId = const Value.absent(),
    Value<int?> beltToId = const Value.absent(),
    String? state,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
    int? isActive,
  }) => Group(
    id: id ?? this.id,
    tournamentId: tournamentId ?? this.tournamentId,
    name: name ?? this.name,
    gender: gender ?? this.gender,
    ageMin: ageMin.present ? ageMin.value : this.ageMin,
    ageMax: ageMax.present ? ageMax.value : this.ageMax,
    weightMin: weightMin.present ? weightMin.value : this.weightMin,
    weightMax: weightMax.present ? weightMax.value : this.weightMax,
    beltFromId: beltFromId.present ? beltFromId.value : this.beltFromId,
    beltToId: beltToId.present ? beltToId.value : this.beltToId,
    state: state ?? this.state,
    description: description ?? this.description,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    synchronized: synchronized ?? this.synchronized,
    isActive: isActive ?? this.isActive,
  );
  Group copyWithCompanion(GroupsCompanion data) {
    return Group(
      id: data.id.present ? data.id.value : this.id,
      tournamentId: data.tournamentId.present
          ? data.tournamentId.value
          : this.tournamentId,
      name: data.name.present ? data.name.value : this.name,
      gender: data.gender.present ? data.gender.value : this.gender,
      ageMin: data.ageMin.present ? data.ageMin.value : this.ageMin,
      ageMax: data.ageMax.present ? data.ageMax.value : this.ageMax,
      weightMin: data.weightMin.present ? data.weightMin.value : this.weightMin,
      weightMax: data.weightMax.present ? data.weightMax.value : this.weightMax,
      beltFromId: data.beltFromId.present
          ? data.beltFromId.value
          : this.beltFromId,
      beltToId: data.beltToId.present ? data.beltToId.value : this.beltToId,
      state: data.state.present ? data.state.value : this.state,
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
    return (StringBuffer('Group(')
          ..write('id: $id, ')
          ..write('tournamentId: $tournamentId, ')
          ..write('name: $name, ')
          ..write('gender: $gender, ')
          ..write('ageMin: $ageMin, ')
          ..write('ageMax: $ageMax, ')
          ..write('weightMin: $weightMin, ')
          ..write('weightMax: $weightMax, ')
          ..write('beltFromId: $beltFromId, ')
          ..write('beltToId: $beltToId, ')
          ..write('state: $state, ')
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
    tournamentId,
    name,
    gender,
    ageMin,
    ageMax,
    weightMin,
    weightMax,
    beltFromId,
    beltToId,
    state,
    description,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Group &&
          other.id == this.id &&
          other.tournamentId == this.tournamentId &&
          other.name == this.name &&
          other.gender == this.gender &&
          other.ageMin == this.ageMin &&
          other.ageMax == this.ageMax &&
          other.weightMin == this.weightMin &&
          other.weightMax == this.weightMax &&
          other.beltFromId == this.beltFromId &&
          other.beltToId == this.beltToId &&
          other.state == this.state &&
          other.description == this.description &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.synchronized == this.synchronized &&
          other.isActive == this.isActive);
}

class GroupsCompanion extends UpdateCompanion<Group> {
  final Value<int> id;
  final Value<int> tournamentId;
  final Value<String> name;
  final Value<String> gender;
  final Value<int?> ageMin;
  final Value<int?> ageMax;
  final Value<double?> weightMin;
  final Value<double?> weightMax;
  final Value<int?> beltFromId;
  final Value<int?> beltToId;
  final Value<String> state;
  final Value<String> description;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> synchronized;
  final Value<int> isActive;
  const GroupsCompanion({
    this.id = const Value.absent(),
    this.tournamentId = const Value.absent(),
    this.name = const Value.absent(),
    this.gender = const Value.absent(),
    this.ageMin = const Value.absent(),
    this.ageMax = const Value.absent(),
    this.weightMin = const Value.absent(),
    this.weightMax = const Value.absent(),
    this.beltFromId = const Value.absent(),
    this.beltToId = const Value.absent(),
    this.state = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  GroupsCompanion.insert({
    this.id = const Value.absent(),
    required int tournamentId,
    required String name,
    this.gender = const Value.absent(),
    this.ageMin = const Value.absent(),
    this.ageMax = const Value.absent(),
    this.weightMin = const Value.absent(),
    this.weightMax = const Value.absent(),
    this.beltFromId = const Value.absent(),
    this.beltToId = const Value.absent(),
    this.state = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : tournamentId = Value(tournamentId),
       name = Value(name);
  static Insertable<Group> custom({
    Expression<int>? id,
    Expression<int>? tournamentId,
    Expression<String>? name,
    Expression<String>? gender,
    Expression<int>? ageMin,
    Expression<int>? ageMax,
    Expression<double>? weightMin,
    Expression<double>? weightMax,
    Expression<int>? beltFromId,
    Expression<int>? beltToId,
    Expression<String>? state,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? synchronized,
    Expression<int>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tournamentId != null) 'tournament_id': tournamentId,
      if (name != null) 'name': name,
      if (gender != null) 'gender': gender,
      if (ageMin != null) 'age_min': ageMin,
      if (ageMax != null) 'age_max': ageMax,
      if (weightMin != null) 'weight_min': weightMin,
      if (weightMax != null) 'weight_max': weightMax,
      if (beltFromId != null) 'belt_from_id': beltFromId,
      if (beltToId != null) 'belt_to_id': beltToId,
      if (state != null) 'state': state,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (synchronized != null) 'synchronized': synchronized,
      if (isActive != null) 'is_active': isActive,
    });
  }

  GroupsCompanion copyWith({
    Value<int>? id,
    Value<int>? tournamentId,
    Value<String>? name,
    Value<String>? gender,
    Value<int?>? ageMin,
    Value<int?>? ageMax,
    Value<double?>? weightMin,
    Value<double?>? weightMax,
    Value<int?>? beltFromId,
    Value<int?>? beltToId,
    Value<String>? state,
    Value<String>? description,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? synchronized,
    Value<int>? isActive,
  }) {
    return GroupsCompanion(
      id: id ?? this.id,
      tournamentId: tournamentId ?? this.tournamentId,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      ageMin: ageMin ?? this.ageMin,
      ageMax: ageMax ?? this.ageMax,
      weightMin: weightMin ?? this.weightMin,
      weightMax: weightMax ?? this.weightMax,
      beltFromId: beltFromId ?? this.beltFromId,
      beltToId: beltToId ?? this.beltToId,
      state: state ?? this.state,
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
    if (tournamentId.present) {
      map['tournament_id'] = Variable<int>(tournamentId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (ageMin.present) {
      map['age_min'] = Variable<int>(ageMin.value);
    }
    if (ageMax.present) {
      map['age_max'] = Variable<int>(ageMax.value);
    }
    if (weightMin.present) {
      map['weight_min'] = Variable<double>(weightMin.value);
    }
    if (weightMax.present) {
      map['weight_max'] = Variable<double>(weightMax.value);
    }
    if (beltFromId.present) {
      map['belt_from_id'] = Variable<int>(beltFromId.value);
    }
    if (beltToId.present) {
      map['belt_to_id'] = Variable<int>(beltToId.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
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
    return (StringBuffer('GroupsCompanion(')
          ..write('id: $id, ')
          ..write('tournamentId: $tournamentId, ')
          ..write('name: $name, ')
          ..write('gender: $gender, ')
          ..write('ageMin: $ageMin, ')
          ..write('ageMax: $ageMax, ')
          ..write('weightMin: $weightMin, ')
          ..write('weightMax: $weightMax, ')
          ..write('beltFromId: $beltFromId, ')
          ..write('beltToId: $beltToId, ')
          ..write('state: $state, ')
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
  static const VerificationMeta _groupIdMeta = const VerificationMeta(
    'groupId',
  );
  @override
  late final GeneratedColumn<int> groupId = GeneratedColumn<int>(
    'group_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES "groups" (id) ON UPDATE CASCADE ON DELETE RESTRICT',
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
    groupId,
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
    if (data.containsKey('group_id')) {
      context.handle(
        _groupIdMeta,
        groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta),
      );
    } else if (isInserting) {
      context.missing(_groupIdMeta);
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
      groupId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}group_id'],
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
  final int groupId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int synchronized;
  final int isActive;
  const InscriptionData({
    required this.id,
    required this.date,
    required this.studentId,
    required this.tournamentId,
    required this.groupId,
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
    map['group_id'] = Variable<int>(groupId);
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
      groupId: Value(groupId),
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
      groupId: serializer.fromJson<int>(json['groupId']),
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
      'groupId': serializer.toJson<int>(groupId),
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
    int? groupId,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
    int? isActive,
  }) => InscriptionData(
    id: id ?? this.id,
    date: date ?? this.date,
    studentId: studentId ?? this.studentId,
    tournamentId: tournamentId ?? this.tournamentId,
    groupId: groupId ?? this.groupId,
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
      groupId: data.groupId.present ? data.groupId.value : this.groupId,
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
          ..write('groupId: $groupId, ')
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
    groupId,
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
          other.groupId == this.groupId &&
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
  final Value<int> groupId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> synchronized;
  final Value<int> isActive;
  const InscriptionCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.studentId = const Value.absent(),
    this.tournamentId = const Value.absent(),
    this.groupId = const Value.absent(),
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
    required int groupId,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : studentId = Value(studentId),
       tournamentId = Value(tournamentId),
       groupId = Value(groupId);
  static Insertable<InscriptionData> custom({
    Expression<int>? id,
    Expression<DateTime>? date,
    Expression<int>? studentId,
    Expression<int>? tournamentId,
    Expression<int>? groupId,
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
      if (groupId != null) 'group_id': groupId,
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
    Value<int>? groupId,
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
      groupId: groupId ?? this.groupId,
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
    if (groupId.present) {
      map['group_id'] = Variable<int>(groupId.value);
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
          ..write('groupId: $groupId, ')
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
      'REFERENCES tournament (id) ON UPDATE CASCADE ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _inscriptionAIdMeta = const VerificationMeta(
    'inscriptionAId',
  );
  @override
  late final GeneratedColumn<int> inscriptionAId = GeneratedColumn<int>(
    'inscription_a_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES inscription (id) ON UPDATE CASCADE ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _inscriptionBIdMeta = const VerificationMeta(
    'inscriptionBId',
  );
  @override
  late final GeneratedColumn<int> inscriptionBId = GeneratedColumn<int>(
    'inscription_b_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES inscription (id) ON UPDATE CASCADE ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _groupIdMeta = const VerificationMeta(
    'groupId',
  );
  @override
  late final GeneratedColumn<int> groupId = GeneratedColumn<int>(
    'group_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES "groups" (id) ON UPDATE CASCADE ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _winnerInscriptionIdMeta =
      const VerificationMeta('winnerInscriptionId');
  @override
  late final GeneratedColumn<int> winnerInscriptionId = GeneratedColumn<int>(
    'winner_inscription_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES inscription (id) ON UPDATE CASCADE ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _bracketRoundMeta = const VerificationMeta(
    'bracketRound',
  );
  @override
  late final GeneratedColumn<int> bracketRound = GeneratedColumn<int>(
    'bracket_round',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _bracketOrderMeta = const VerificationMeta(
    'bracketOrder',
  );
  @override
  late final GeneratedColumn<int> bracketOrder = GeneratedColumn<int>(
    'bracket_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _nextVsWinnerIdMeta = const VerificationMeta(
    'nextVsWinnerId',
  );
  @override
  late final GeneratedColumn<int> nextVsWinnerId = GeneratedColumn<int>(
    'next_vs_winner_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES versus (id) ON UPDATE CASCADE ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _nextVsLoserIdMeta = const VerificationMeta(
    'nextVsLoserId',
  );
  @override
  late final GeneratedColumn<int> nextVsLoserId = GeneratedColumn<int>(
    'next_vs_loser_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES versus (id) ON UPDATE CASCADE ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
    'state',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
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
    tournamentId,
    inscriptionAId,
    inscriptionBId,
    groupId,
    winnerInscriptionId,
    bracketRound,
    bracketOrder,
    nextVsWinnerId,
    nextVsLoserId,
    state,
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
    if (data.containsKey('inscription_a_id')) {
      context.handle(
        _inscriptionAIdMeta,
        inscriptionAId.isAcceptableOrUnknown(
          data['inscription_a_id']!,
          _inscriptionAIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_inscriptionAIdMeta);
    }
    if (data.containsKey('inscription_b_id')) {
      context.handle(
        _inscriptionBIdMeta,
        inscriptionBId.isAcceptableOrUnknown(
          data['inscription_b_id']!,
          _inscriptionBIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_inscriptionBIdMeta);
    }
    if (data.containsKey('group_id')) {
      context.handle(
        _groupIdMeta,
        groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta),
      );
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    if (data.containsKey('winner_inscription_id')) {
      context.handle(
        _winnerInscriptionIdMeta,
        winnerInscriptionId.isAcceptableOrUnknown(
          data['winner_inscription_id']!,
          _winnerInscriptionIdMeta,
        ),
      );
    }
    if (data.containsKey('bracket_round')) {
      context.handle(
        _bracketRoundMeta,
        bracketRound.isAcceptableOrUnknown(
          data['bracket_round']!,
          _bracketRoundMeta,
        ),
      );
    }
    if (data.containsKey('bracket_order')) {
      context.handle(
        _bracketOrderMeta,
        bracketOrder.isAcceptableOrUnknown(
          data['bracket_order']!,
          _bracketOrderMeta,
        ),
      );
    }
    if (data.containsKey('next_vs_winner_id')) {
      context.handle(
        _nextVsWinnerIdMeta,
        nextVsWinnerId.isAcceptableOrUnknown(
          data['next_vs_winner_id']!,
          _nextVsWinnerIdMeta,
        ),
      );
    }
    if (data.containsKey('next_vs_loser_id')) {
      context.handle(
        _nextVsLoserIdMeta,
        nextVsLoserId.isAcceptableOrUnknown(
          data['next_vs_loser_id']!,
          _nextVsLoserIdMeta,
        ),
      );
    }
    if (data.containsKey('state')) {
      context.handle(
        _stateMeta,
        state.isAcceptableOrUnknown(data['state']!, _stateMeta),
      );
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
      tournamentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}tournament_id'],
      )!,
      inscriptionAId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}inscription_a_id'],
      )!,
      inscriptionBId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}inscription_b_id'],
      )!,
      groupId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}group_id'],
      )!,
      winnerInscriptionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}winner_inscription_id'],
      ),
      bracketRound: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bracket_round'],
      )!,
      bracketOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}bracket_order'],
      )!,
      nextVsWinnerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}next_vs_winner_id'],
      ),
      nextVsLoserId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}next_vs_loser_id'],
      ),
      state: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}state'],
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
  final int tournamentId;
  final int inscriptionAId;
  final int inscriptionBId;
  final int groupId;
  final int? winnerInscriptionId;
  final int bracketRound;
  final int bracketOrder;
  final int? nextVsWinnerId;
  final int? nextVsLoserId;
  final String state;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int synchronized;
  final int isActive;
  const VersusData({
    required this.id,
    required this.tournamentId,
    required this.inscriptionAId,
    required this.inscriptionBId,
    required this.groupId,
    this.winnerInscriptionId,
    required this.bracketRound,
    required this.bracketOrder,
    this.nextVsWinnerId,
    this.nextVsLoserId,
    required this.state,
    required this.createdAt,
    required this.updatedAt,
    required this.synchronized,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tournament_id'] = Variable<int>(tournamentId);
    map['inscription_a_id'] = Variable<int>(inscriptionAId);
    map['inscription_b_id'] = Variable<int>(inscriptionBId);
    map['group_id'] = Variable<int>(groupId);
    if (!nullToAbsent || winnerInscriptionId != null) {
      map['winner_inscription_id'] = Variable<int>(winnerInscriptionId);
    }
    map['bracket_round'] = Variable<int>(bracketRound);
    map['bracket_order'] = Variable<int>(bracketOrder);
    if (!nullToAbsent || nextVsWinnerId != null) {
      map['next_vs_winner_id'] = Variable<int>(nextVsWinnerId);
    }
    if (!nullToAbsent || nextVsLoserId != null) {
      map['next_vs_loser_id'] = Variable<int>(nextVsLoserId);
    }
    map['state'] = Variable<String>(state);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['synchronized'] = Variable<int>(synchronized);
    map['is_active'] = Variable<int>(isActive);
    return map;
  }

  VersusCompanion toCompanion(bool nullToAbsent) {
    return VersusCompanion(
      id: Value(id),
      tournamentId: Value(tournamentId),
      inscriptionAId: Value(inscriptionAId),
      inscriptionBId: Value(inscriptionBId),
      groupId: Value(groupId),
      winnerInscriptionId: winnerInscriptionId == null && nullToAbsent
          ? const Value.absent()
          : Value(winnerInscriptionId),
      bracketRound: Value(bracketRound),
      bracketOrder: Value(bracketOrder),
      nextVsWinnerId: nextVsWinnerId == null && nullToAbsent
          ? const Value.absent()
          : Value(nextVsWinnerId),
      nextVsLoserId: nextVsLoserId == null && nullToAbsent
          ? const Value.absent()
          : Value(nextVsLoserId),
      state: Value(state),
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
      tournamentId: serializer.fromJson<int>(json['tournamentId']),
      inscriptionAId: serializer.fromJson<int>(json['inscriptionAId']),
      inscriptionBId: serializer.fromJson<int>(json['inscriptionBId']),
      groupId: serializer.fromJson<int>(json['groupId']),
      winnerInscriptionId: serializer.fromJson<int?>(
        json['winnerInscriptionId'],
      ),
      bracketRound: serializer.fromJson<int>(json['bracketRound']),
      bracketOrder: serializer.fromJson<int>(json['bracketOrder']),
      nextVsWinnerId: serializer.fromJson<int?>(json['nextVsWinnerId']),
      nextVsLoserId: serializer.fromJson<int?>(json['nextVsLoserId']),
      state: serializer.fromJson<String>(json['state']),
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
      'tournamentId': serializer.toJson<int>(tournamentId),
      'inscriptionAId': serializer.toJson<int>(inscriptionAId),
      'inscriptionBId': serializer.toJson<int>(inscriptionBId),
      'groupId': serializer.toJson<int>(groupId),
      'winnerInscriptionId': serializer.toJson<int?>(winnerInscriptionId),
      'bracketRound': serializer.toJson<int>(bracketRound),
      'bracketOrder': serializer.toJson<int>(bracketOrder),
      'nextVsWinnerId': serializer.toJson<int?>(nextVsWinnerId),
      'nextVsLoserId': serializer.toJson<int?>(nextVsLoserId),
      'state': serializer.toJson<String>(state),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'synchronized': serializer.toJson<int>(synchronized),
      'isActive': serializer.toJson<int>(isActive),
    };
  }

  VersusData copyWith({
    int? id,
    int? tournamentId,
    int? inscriptionAId,
    int? inscriptionBId,
    int? groupId,
    Value<int?> winnerInscriptionId = const Value.absent(),
    int? bracketRound,
    int? bracketOrder,
    Value<int?> nextVsWinnerId = const Value.absent(),
    Value<int?> nextVsLoserId = const Value.absent(),
    String? state,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
    int? isActive,
  }) => VersusData(
    id: id ?? this.id,
    tournamentId: tournamentId ?? this.tournamentId,
    inscriptionAId: inscriptionAId ?? this.inscriptionAId,
    inscriptionBId: inscriptionBId ?? this.inscriptionBId,
    groupId: groupId ?? this.groupId,
    winnerInscriptionId: winnerInscriptionId.present
        ? winnerInscriptionId.value
        : this.winnerInscriptionId,
    bracketRound: bracketRound ?? this.bracketRound,
    bracketOrder: bracketOrder ?? this.bracketOrder,
    nextVsWinnerId: nextVsWinnerId.present
        ? nextVsWinnerId.value
        : this.nextVsWinnerId,
    nextVsLoserId: nextVsLoserId.present
        ? nextVsLoserId.value
        : this.nextVsLoserId,
    state: state ?? this.state,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    synchronized: synchronized ?? this.synchronized,
    isActive: isActive ?? this.isActive,
  );
  VersusData copyWithCompanion(VersusCompanion data) {
    return VersusData(
      id: data.id.present ? data.id.value : this.id,
      tournamentId: data.tournamentId.present
          ? data.tournamentId.value
          : this.tournamentId,
      inscriptionAId: data.inscriptionAId.present
          ? data.inscriptionAId.value
          : this.inscriptionAId,
      inscriptionBId: data.inscriptionBId.present
          ? data.inscriptionBId.value
          : this.inscriptionBId,
      groupId: data.groupId.present ? data.groupId.value : this.groupId,
      winnerInscriptionId: data.winnerInscriptionId.present
          ? data.winnerInscriptionId.value
          : this.winnerInscriptionId,
      bracketRound: data.bracketRound.present
          ? data.bracketRound.value
          : this.bracketRound,
      bracketOrder: data.bracketOrder.present
          ? data.bracketOrder.value
          : this.bracketOrder,
      nextVsWinnerId: data.nextVsWinnerId.present
          ? data.nextVsWinnerId.value
          : this.nextVsWinnerId,
      nextVsLoserId: data.nextVsLoserId.present
          ? data.nextVsLoserId.value
          : this.nextVsLoserId,
      state: data.state.present ? data.state.value : this.state,
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
          ..write('tournamentId: $tournamentId, ')
          ..write('inscriptionAId: $inscriptionAId, ')
          ..write('inscriptionBId: $inscriptionBId, ')
          ..write('groupId: $groupId, ')
          ..write('winnerInscriptionId: $winnerInscriptionId, ')
          ..write('bracketRound: $bracketRound, ')
          ..write('bracketOrder: $bracketOrder, ')
          ..write('nextVsWinnerId: $nextVsWinnerId, ')
          ..write('nextVsLoserId: $nextVsLoserId, ')
          ..write('state: $state, ')
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
    tournamentId,
    inscriptionAId,
    inscriptionBId,
    groupId,
    winnerInscriptionId,
    bracketRound,
    bracketOrder,
    nextVsWinnerId,
    nextVsLoserId,
    state,
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
          other.tournamentId == this.tournamentId &&
          other.inscriptionAId == this.inscriptionAId &&
          other.inscriptionBId == this.inscriptionBId &&
          other.groupId == this.groupId &&
          other.winnerInscriptionId == this.winnerInscriptionId &&
          other.bracketRound == this.bracketRound &&
          other.bracketOrder == this.bracketOrder &&
          other.nextVsWinnerId == this.nextVsWinnerId &&
          other.nextVsLoserId == this.nextVsLoserId &&
          other.state == this.state &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.synchronized == this.synchronized &&
          other.isActive == this.isActive);
}

class VersusCompanion extends UpdateCompanion<VersusData> {
  final Value<int> id;
  final Value<int> tournamentId;
  final Value<int> inscriptionAId;
  final Value<int> inscriptionBId;
  final Value<int> groupId;
  final Value<int?> winnerInscriptionId;
  final Value<int> bracketRound;
  final Value<int> bracketOrder;
  final Value<int?> nextVsWinnerId;
  final Value<int?> nextVsLoserId;
  final Value<String> state;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> synchronized;
  final Value<int> isActive;
  const VersusCompanion({
    this.id = const Value.absent(),
    this.tournamentId = const Value.absent(),
    this.inscriptionAId = const Value.absent(),
    this.inscriptionBId = const Value.absent(),
    this.groupId = const Value.absent(),
    this.winnerInscriptionId = const Value.absent(),
    this.bracketRound = const Value.absent(),
    this.bracketOrder = const Value.absent(),
    this.nextVsWinnerId = const Value.absent(),
    this.nextVsLoserId = const Value.absent(),
    this.state = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  VersusCompanion.insert({
    this.id = const Value.absent(),
    required int tournamentId,
    required int inscriptionAId,
    required int inscriptionBId,
    required int groupId,
    this.winnerInscriptionId = const Value.absent(),
    this.bracketRound = const Value.absent(),
    this.bracketOrder = const Value.absent(),
    this.nextVsWinnerId = const Value.absent(),
    this.nextVsLoserId = const Value.absent(),
    this.state = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : tournamentId = Value(tournamentId),
       inscriptionAId = Value(inscriptionAId),
       inscriptionBId = Value(inscriptionBId),
       groupId = Value(groupId);
  static Insertable<VersusData> custom({
    Expression<int>? id,
    Expression<int>? tournamentId,
    Expression<int>? inscriptionAId,
    Expression<int>? inscriptionBId,
    Expression<int>? groupId,
    Expression<int>? winnerInscriptionId,
    Expression<int>? bracketRound,
    Expression<int>? bracketOrder,
    Expression<int>? nextVsWinnerId,
    Expression<int>? nextVsLoserId,
    Expression<String>? state,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? synchronized,
    Expression<int>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tournamentId != null) 'tournament_id': tournamentId,
      if (inscriptionAId != null) 'inscription_a_id': inscriptionAId,
      if (inscriptionBId != null) 'inscription_b_id': inscriptionBId,
      if (groupId != null) 'group_id': groupId,
      if (winnerInscriptionId != null)
        'winner_inscription_id': winnerInscriptionId,
      if (bracketRound != null) 'bracket_round': bracketRound,
      if (bracketOrder != null) 'bracket_order': bracketOrder,
      if (nextVsWinnerId != null) 'next_vs_winner_id': nextVsWinnerId,
      if (nextVsLoserId != null) 'next_vs_loser_id': nextVsLoserId,
      if (state != null) 'state': state,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (synchronized != null) 'synchronized': synchronized,
      if (isActive != null) 'is_active': isActive,
    });
  }

  VersusCompanion copyWith({
    Value<int>? id,
    Value<int>? tournamentId,
    Value<int>? inscriptionAId,
    Value<int>? inscriptionBId,
    Value<int>? groupId,
    Value<int?>? winnerInscriptionId,
    Value<int>? bracketRound,
    Value<int>? bracketOrder,
    Value<int?>? nextVsWinnerId,
    Value<int?>? nextVsLoserId,
    Value<String>? state,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? synchronized,
    Value<int>? isActive,
  }) {
    return VersusCompanion(
      id: id ?? this.id,
      tournamentId: tournamentId ?? this.tournamentId,
      inscriptionAId: inscriptionAId ?? this.inscriptionAId,
      inscriptionBId: inscriptionBId ?? this.inscriptionBId,
      groupId: groupId ?? this.groupId,
      winnerInscriptionId: winnerInscriptionId ?? this.winnerInscriptionId,
      bracketRound: bracketRound ?? this.bracketRound,
      bracketOrder: bracketOrder ?? this.bracketOrder,
      nextVsWinnerId: nextVsWinnerId ?? this.nextVsWinnerId,
      nextVsLoserId: nextVsLoserId ?? this.nextVsLoserId,
      state: state ?? this.state,
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
    if (tournamentId.present) {
      map['tournament_id'] = Variable<int>(tournamentId.value);
    }
    if (inscriptionAId.present) {
      map['inscription_a_id'] = Variable<int>(inscriptionAId.value);
    }
    if (inscriptionBId.present) {
      map['inscription_b_id'] = Variable<int>(inscriptionBId.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<int>(groupId.value);
    }
    if (winnerInscriptionId.present) {
      map['winner_inscription_id'] = Variable<int>(winnerInscriptionId.value);
    }
    if (bracketRound.present) {
      map['bracket_round'] = Variable<int>(bracketRound.value);
    }
    if (bracketOrder.present) {
      map['bracket_order'] = Variable<int>(bracketOrder.value);
    }
    if (nextVsWinnerId.present) {
      map['next_vs_winner_id'] = Variable<int>(nextVsWinnerId.value);
    }
    if (nextVsLoserId.present) {
      map['next_vs_loser_id'] = Variable<int>(nextVsLoserId.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
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
          ..write('tournamentId: $tournamentId, ')
          ..write('inscriptionAId: $inscriptionAId, ')
          ..write('inscriptionBId: $inscriptionBId, ')
          ..write('groupId: $groupId, ')
          ..write('winnerInscriptionId: $winnerInscriptionId, ')
          ..write('bracketRound: $bracketRound, ')
          ..write('bracketOrder: $bracketOrder, ')
          ..write('nextVsWinnerId: $nextVsWinnerId, ')
          ..write('nextVsLoserId: $nextVsLoserId, ')
          ..write('state: $state, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $CombatRoundsTable extends CombatRounds
    with TableInfo<$CombatRoundsTable, CombatRound> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CombatRoundsTable(this.attachedDatabase, [this._alias]);
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
      'REFERENCES versus (id) ON UPDATE CASCADE ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _roundNumberMeta = const VerificationMeta(
    'roundNumber',
  );
  @override
  late final GeneratedColumn<int> roundNumber = GeneratedColumn<int>(
    'round_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pointsAMeta = const VerificationMeta(
    'pointsA',
  );
  @override
  late final GeneratedColumn<int> pointsA = GeneratedColumn<int>(
    'points_a',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _pointsBMeta = const VerificationMeta(
    'pointsB',
  );
  @override
  late final GeneratedColumn<int> pointsB = GeneratedColumn<int>(
    'points_b',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _winnerInscriptionIdMeta =
      const VerificationMeta('winnerInscriptionId');
  @override
  late final GeneratedColumn<int> winnerInscriptionId = GeneratedColumn<int>(
    'winner_inscription_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES inscription (id) ON UPDATE CASCADE ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
    'state',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _startAtMeta = const VerificationMeta(
    'startAt',
  );
  @override
  late final GeneratedColumn<DateTime> startAt = GeneratedColumn<DateTime>(
    'start_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endAtMeta = const VerificationMeta('endAt');
  @override
  late final GeneratedColumn<DateTime> endAt = GeneratedColumn<DateTime>(
    'end_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
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
    versusId,
    roundNumber,
    pointsA,
    pointsB,
    winnerInscriptionId,
    state,
    startAt,
    endAt,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'combat_rounds';
  @override
  VerificationContext validateIntegrity(
    Insertable<CombatRound> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('versus_id')) {
      context.handle(
        _versusIdMeta,
        versusId.isAcceptableOrUnknown(data['versus_id']!, _versusIdMeta),
      );
    } else if (isInserting) {
      context.missing(_versusIdMeta);
    }
    if (data.containsKey('round_number')) {
      context.handle(
        _roundNumberMeta,
        roundNumber.isAcceptableOrUnknown(
          data['round_number']!,
          _roundNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_roundNumberMeta);
    }
    if (data.containsKey('points_a')) {
      context.handle(
        _pointsAMeta,
        pointsA.isAcceptableOrUnknown(data['points_a']!, _pointsAMeta),
      );
    }
    if (data.containsKey('points_b')) {
      context.handle(
        _pointsBMeta,
        pointsB.isAcceptableOrUnknown(data['points_b']!, _pointsBMeta),
      );
    }
    if (data.containsKey('winner_inscription_id')) {
      context.handle(
        _winnerInscriptionIdMeta,
        winnerInscriptionId.isAcceptableOrUnknown(
          data['winner_inscription_id']!,
          _winnerInscriptionIdMeta,
        ),
      );
    }
    if (data.containsKey('state')) {
      context.handle(
        _stateMeta,
        state.isAcceptableOrUnknown(data['state']!, _stateMeta),
      );
    }
    if (data.containsKey('start_at')) {
      context.handle(
        _startAtMeta,
        startAt.isAcceptableOrUnknown(data['start_at']!, _startAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startAtMeta);
    }
    if (data.containsKey('end_at')) {
      context.handle(
        _endAtMeta,
        endAt.isAcceptableOrUnknown(data['end_at']!, _endAtMeta),
      );
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
  CombatRound map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CombatRound(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      versusId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}versus_id'],
      )!,
      roundNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}round_number'],
      )!,
      pointsA: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}points_a'],
      )!,
      pointsB: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}points_b'],
      )!,
      winnerInscriptionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}winner_inscription_id'],
      ),
      state: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}state'],
      )!,
      startAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_at'],
      )!,
      endAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_at'],
      ),
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
  $CombatRoundsTable createAlias(String alias) {
    return $CombatRoundsTable(attachedDatabase, alias);
  }
}

class CombatRound extends DataClass implements Insertable<CombatRound> {
  final int id;
  final int versusId;
  final int roundNumber;
  final int pointsA;
  final int pointsB;
  final int? winnerInscriptionId;
  final String state;
  final DateTime startAt;
  final DateTime? endAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int synchronized;
  final int isActive;
  const CombatRound({
    required this.id,
    required this.versusId,
    required this.roundNumber,
    required this.pointsA,
    required this.pointsB,
    this.winnerInscriptionId,
    required this.state,
    required this.startAt,
    this.endAt,
    required this.createdAt,
    required this.updatedAt,
    required this.synchronized,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['versus_id'] = Variable<int>(versusId);
    map['round_number'] = Variable<int>(roundNumber);
    map['points_a'] = Variable<int>(pointsA);
    map['points_b'] = Variable<int>(pointsB);
    if (!nullToAbsent || winnerInscriptionId != null) {
      map['winner_inscription_id'] = Variable<int>(winnerInscriptionId);
    }
    map['state'] = Variable<String>(state);
    map['start_at'] = Variable<DateTime>(startAt);
    if (!nullToAbsent || endAt != null) {
      map['end_at'] = Variable<DateTime>(endAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['synchronized'] = Variable<int>(synchronized);
    map['is_active'] = Variable<int>(isActive);
    return map;
  }

  CombatRoundsCompanion toCompanion(bool nullToAbsent) {
    return CombatRoundsCompanion(
      id: Value(id),
      versusId: Value(versusId),
      roundNumber: Value(roundNumber),
      pointsA: Value(pointsA),
      pointsB: Value(pointsB),
      winnerInscriptionId: winnerInscriptionId == null && nullToAbsent
          ? const Value.absent()
          : Value(winnerInscriptionId),
      state: Value(state),
      startAt: Value(startAt),
      endAt: endAt == null && nullToAbsent
          ? const Value.absent()
          : Value(endAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      synchronized: Value(synchronized),
      isActive: Value(isActive),
    );
  }

  factory CombatRound.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CombatRound(
      id: serializer.fromJson<int>(json['id']),
      versusId: serializer.fromJson<int>(json['versusId']),
      roundNumber: serializer.fromJson<int>(json['roundNumber']),
      pointsA: serializer.fromJson<int>(json['pointsA']),
      pointsB: serializer.fromJson<int>(json['pointsB']),
      winnerInscriptionId: serializer.fromJson<int?>(
        json['winnerInscriptionId'],
      ),
      state: serializer.fromJson<String>(json['state']),
      startAt: serializer.fromJson<DateTime>(json['startAt']),
      endAt: serializer.fromJson<DateTime?>(json['endAt']),
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
      'versusId': serializer.toJson<int>(versusId),
      'roundNumber': serializer.toJson<int>(roundNumber),
      'pointsA': serializer.toJson<int>(pointsA),
      'pointsB': serializer.toJson<int>(pointsB),
      'winnerInscriptionId': serializer.toJson<int?>(winnerInscriptionId),
      'state': serializer.toJson<String>(state),
      'startAt': serializer.toJson<DateTime>(startAt),
      'endAt': serializer.toJson<DateTime?>(endAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'synchronized': serializer.toJson<int>(synchronized),
      'isActive': serializer.toJson<int>(isActive),
    };
  }

  CombatRound copyWith({
    int? id,
    int? versusId,
    int? roundNumber,
    int? pointsA,
    int? pointsB,
    Value<int?> winnerInscriptionId = const Value.absent(),
    String? state,
    DateTime? startAt,
    Value<DateTime?> endAt = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
    int? isActive,
  }) => CombatRound(
    id: id ?? this.id,
    versusId: versusId ?? this.versusId,
    roundNumber: roundNumber ?? this.roundNumber,
    pointsA: pointsA ?? this.pointsA,
    pointsB: pointsB ?? this.pointsB,
    winnerInscriptionId: winnerInscriptionId.present
        ? winnerInscriptionId.value
        : this.winnerInscriptionId,
    state: state ?? this.state,
    startAt: startAt ?? this.startAt,
    endAt: endAt.present ? endAt.value : this.endAt,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    synchronized: synchronized ?? this.synchronized,
    isActive: isActive ?? this.isActive,
  );
  CombatRound copyWithCompanion(CombatRoundsCompanion data) {
    return CombatRound(
      id: data.id.present ? data.id.value : this.id,
      versusId: data.versusId.present ? data.versusId.value : this.versusId,
      roundNumber: data.roundNumber.present
          ? data.roundNumber.value
          : this.roundNumber,
      pointsA: data.pointsA.present ? data.pointsA.value : this.pointsA,
      pointsB: data.pointsB.present ? data.pointsB.value : this.pointsB,
      winnerInscriptionId: data.winnerInscriptionId.present
          ? data.winnerInscriptionId.value
          : this.winnerInscriptionId,
      state: data.state.present ? data.state.value : this.state,
      startAt: data.startAt.present ? data.startAt.value : this.startAt,
      endAt: data.endAt.present ? data.endAt.value : this.endAt,
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
    return (StringBuffer('CombatRound(')
          ..write('id: $id, ')
          ..write('versusId: $versusId, ')
          ..write('roundNumber: $roundNumber, ')
          ..write('pointsA: $pointsA, ')
          ..write('pointsB: $pointsB, ')
          ..write('winnerInscriptionId: $winnerInscriptionId, ')
          ..write('state: $state, ')
          ..write('startAt: $startAt, ')
          ..write('endAt: $endAt, ')
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
    versusId,
    roundNumber,
    pointsA,
    pointsB,
    winnerInscriptionId,
    state,
    startAt,
    endAt,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CombatRound &&
          other.id == this.id &&
          other.versusId == this.versusId &&
          other.roundNumber == this.roundNumber &&
          other.pointsA == this.pointsA &&
          other.pointsB == this.pointsB &&
          other.winnerInscriptionId == this.winnerInscriptionId &&
          other.state == this.state &&
          other.startAt == this.startAt &&
          other.endAt == this.endAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.synchronized == this.synchronized &&
          other.isActive == this.isActive);
}

class CombatRoundsCompanion extends UpdateCompanion<CombatRound> {
  final Value<int> id;
  final Value<int> versusId;
  final Value<int> roundNumber;
  final Value<int> pointsA;
  final Value<int> pointsB;
  final Value<int?> winnerInscriptionId;
  final Value<String> state;
  final Value<DateTime> startAt;
  final Value<DateTime?> endAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> synchronized;
  final Value<int> isActive;
  const CombatRoundsCompanion({
    this.id = const Value.absent(),
    this.versusId = const Value.absent(),
    this.roundNumber = const Value.absent(),
    this.pointsA = const Value.absent(),
    this.pointsB = const Value.absent(),
    this.winnerInscriptionId = const Value.absent(),
    this.state = const Value.absent(),
    this.startAt = const Value.absent(),
    this.endAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  CombatRoundsCompanion.insert({
    this.id = const Value.absent(),
    required int versusId,
    required int roundNumber,
    this.pointsA = const Value.absent(),
    this.pointsB = const Value.absent(),
    this.winnerInscriptionId = const Value.absent(),
    this.state = const Value.absent(),
    required DateTime startAt,
    this.endAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : versusId = Value(versusId),
       roundNumber = Value(roundNumber),
       startAt = Value(startAt);
  static Insertable<CombatRound> custom({
    Expression<int>? id,
    Expression<int>? versusId,
    Expression<int>? roundNumber,
    Expression<int>? pointsA,
    Expression<int>? pointsB,
    Expression<int>? winnerInscriptionId,
    Expression<String>? state,
    Expression<DateTime>? startAt,
    Expression<DateTime>? endAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? synchronized,
    Expression<int>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (versusId != null) 'versus_id': versusId,
      if (roundNumber != null) 'round_number': roundNumber,
      if (pointsA != null) 'points_a': pointsA,
      if (pointsB != null) 'points_b': pointsB,
      if (winnerInscriptionId != null)
        'winner_inscription_id': winnerInscriptionId,
      if (state != null) 'state': state,
      if (startAt != null) 'start_at': startAt,
      if (endAt != null) 'end_at': endAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (synchronized != null) 'synchronized': synchronized,
      if (isActive != null) 'is_active': isActive,
    });
  }

  CombatRoundsCompanion copyWith({
    Value<int>? id,
    Value<int>? versusId,
    Value<int>? roundNumber,
    Value<int>? pointsA,
    Value<int>? pointsB,
    Value<int?>? winnerInscriptionId,
    Value<String>? state,
    Value<DateTime>? startAt,
    Value<DateTime?>? endAt,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? synchronized,
    Value<int>? isActive,
  }) {
    return CombatRoundsCompanion(
      id: id ?? this.id,
      versusId: versusId ?? this.versusId,
      roundNumber: roundNumber ?? this.roundNumber,
      pointsA: pointsA ?? this.pointsA,
      pointsB: pointsB ?? this.pointsB,
      winnerInscriptionId: winnerInscriptionId ?? this.winnerInscriptionId,
      state: state ?? this.state,
      startAt: startAt ?? this.startAt,
      endAt: endAt ?? this.endAt,
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
    if (versusId.present) {
      map['versus_id'] = Variable<int>(versusId.value);
    }
    if (roundNumber.present) {
      map['round_number'] = Variable<int>(roundNumber.value);
    }
    if (pointsA.present) {
      map['points_a'] = Variable<int>(pointsA.value);
    }
    if (pointsB.present) {
      map['points_b'] = Variable<int>(pointsB.value);
    }
    if (winnerInscriptionId.present) {
      map['winner_inscription_id'] = Variable<int>(winnerInscriptionId.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (startAt.present) {
      map['start_at'] = Variable<DateTime>(startAt.value);
    }
    if (endAt.present) {
      map['end_at'] = Variable<DateTime>(endAt.value);
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
    return (StringBuffer('CombatRoundsCompanion(')
          ..write('id: $id, ')
          ..write('versusId: $versusId, ')
          ..write('roundNumber: $roundNumber, ')
          ..write('pointsA: $pointsA, ')
          ..write('pointsB: $pointsB, ')
          ..write('winnerInscriptionId: $winnerInscriptionId, ')
          ..write('state: $state, ')
          ..write('startAt: $startAt, ')
          ..write('endAt: $endAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('synchronized: $synchronized, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class $CombatEventsTable extends CombatEvents
    with TableInfo<$CombatEventsTable, CombatEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CombatEventsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _roundIdMeta = const VerificationMeta(
    'roundId',
  );
  @override
  late final GeneratedColumn<int> roundId = GeneratedColumn<int>(
    'round_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES combat_rounds (id) ON UPDATE CASCADE ON DELETE RESTRICT',
    ),
  );
  static const VerificationMeta _pointTypeMeta = const VerificationMeta(
    'pointType',
  );
  @override
  late final GeneratedColumn<String> pointType = GeneratedColumn<String>(
    'point_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _targetParticipantMeta = const VerificationMeta(
    'targetParticipant',
  );
  @override
  late final GeneratedColumn<String> targetParticipant =
      GeneratedColumn<String>(
        'target_participant',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _pointsDeltaMeta = const VerificationMeta(
    'pointsDelta',
  );
  @override
  late final GeneratedColumn<double> pointsDelta = GeneratedColumn<double>(
    'points_delta',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _matchSecondsMeta = const VerificationMeta(
    'matchSeconds',
  );
  @override
  late final GeneratedColumn<double> matchSeconds = GeneratedColumn<double>(
    'match_seconds',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _registeredByJudgeIdMeta =
      const VerificationMeta('registeredByJudgeId');
  @override
  late final GeneratedColumn<int> registeredByJudgeId = GeneratedColumn<int>(
    'registered_by_judge_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES judge (id) ON UPDATE CASCADE ON DELETE SET NULL',
    ),
  );
  static const VerificationMeta _isValidMeta = const VerificationMeta(
    'isValid',
  );
  @override
  late final GeneratedColumn<int> isValid = GeneratedColumn<int>(
    'is_valid',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _invalidatedAtMeta = const VerificationMeta(
    'invalidatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> invalidatedAt =
      GeneratedColumn<DateTime>(
        'invalidated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _invalidationReasonMeta =
      const VerificationMeta('invalidationReason');
  @override
  late final GeneratedColumn<String> invalidationReason =
      GeneratedColumn<String>(
        'invalidation_reason',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _replacesEventIdMeta = const VerificationMeta(
    'replacesEventId',
  );
  @override
  late final GeneratedColumn<int> replacesEventId = GeneratedColumn<int>(
    'replaces_event_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES combat_events (id) ON UPDATE CASCADE ON DELETE SET NULL',
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
    roundId,
    pointType,
    targetParticipant,
    pointsDelta,
    matchSeconds,
    registeredByJudgeId,
    isValid,
    invalidatedAt,
    invalidationReason,
    replacesEventId,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'combat_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<CombatEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('round_id')) {
      context.handle(
        _roundIdMeta,
        roundId.isAcceptableOrUnknown(data['round_id']!, _roundIdMeta),
      );
    } else if (isInserting) {
      context.missing(_roundIdMeta);
    }
    if (data.containsKey('point_type')) {
      context.handle(
        _pointTypeMeta,
        pointType.isAcceptableOrUnknown(data['point_type']!, _pointTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_pointTypeMeta);
    }
    if (data.containsKey('target_participant')) {
      context.handle(
        _targetParticipantMeta,
        targetParticipant.isAcceptableOrUnknown(
          data['target_participant']!,
          _targetParticipantMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_targetParticipantMeta);
    }
    if (data.containsKey('points_delta')) {
      context.handle(
        _pointsDeltaMeta,
        pointsDelta.isAcceptableOrUnknown(
          data['points_delta']!,
          _pointsDeltaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_pointsDeltaMeta);
    }
    if (data.containsKey('match_seconds')) {
      context.handle(
        _matchSecondsMeta,
        matchSeconds.isAcceptableOrUnknown(
          data['match_seconds']!,
          _matchSecondsMeta,
        ),
      );
    }
    if (data.containsKey('registered_by_judge_id')) {
      context.handle(
        _registeredByJudgeIdMeta,
        registeredByJudgeId.isAcceptableOrUnknown(
          data['registered_by_judge_id']!,
          _registeredByJudgeIdMeta,
        ),
      );
    }
    if (data.containsKey('is_valid')) {
      context.handle(
        _isValidMeta,
        isValid.isAcceptableOrUnknown(data['is_valid']!, _isValidMeta),
      );
    }
    if (data.containsKey('invalidated_at')) {
      context.handle(
        _invalidatedAtMeta,
        invalidatedAt.isAcceptableOrUnknown(
          data['invalidated_at']!,
          _invalidatedAtMeta,
        ),
      );
    }
    if (data.containsKey('invalidation_reason')) {
      context.handle(
        _invalidationReasonMeta,
        invalidationReason.isAcceptableOrUnknown(
          data['invalidation_reason']!,
          _invalidationReasonMeta,
        ),
      );
    }
    if (data.containsKey('replaces_event_id')) {
      context.handle(
        _replacesEventIdMeta,
        replacesEventId.isAcceptableOrUnknown(
          data['replaces_event_id']!,
          _replacesEventIdMeta,
        ),
      );
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
  CombatEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CombatEvent(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      roundId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}round_id'],
      )!,
      pointType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}point_type'],
      )!,
      targetParticipant: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}target_participant'],
      )!,
      pointsDelta: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}points_delta'],
      )!,
      matchSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}match_seconds'],
      ),
      registeredByJudgeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}registered_by_judge_id'],
      ),
      isValid: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_valid'],
      )!,
      invalidatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}invalidated_at'],
      ),
      invalidationReason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}invalidation_reason'],
      ),
      replacesEventId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}replaces_event_id'],
      ),
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
  $CombatEventsTable createAlias(String alias) {
    return $CombatEventsTable(attachedDatabase, alias);
  }
}

class CombatEvent extends DataClass implements Insertable<CombatEvent> {
  final int id;
  final int roundId;
  final String pointType;
  final String targetParticipant;
  final double pointsDelta;
  final double? matchSeconds;
  final int? registeredByJudgeId;
  final int isValid;
  final DateTime? invalidatedAt;
  final String? invalidationReason;
  final int? replacesEventId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int synchronized;
  final int isActive;
  const CombatEvent({
    required this.id,
    required this.roundId,
    required this.pointType,
    required this.targetParticipant,
    required this.pointsDelta,
    this.matchSeconds,
    this.registeredByJudgeId,
    required this.isValid,
    this.invalidatedAt,
    this.invalidationReason,
    this.replacesEventId,
    required this.createdAt,
    required this.updatedAt,
    required this.synchronized,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['round_id'] = Variable<int>(roundId);
    map['point_type'] = Variable<String>(pointType);
    map['target_participant'] = Variable<String>(targetParticipant);
    map['points_delta'] = Variable<double>(pointsDelta);
    if (!nullToAbsent || matchSeconds != null) {
      map['match_seconds'] = Variable<double>(matchSeconds);
    }
    if (!nullToAbsent || registeredByJudgeId != null) {
      map['registered_by_judge_id'] = Variable<int>(registeredByJudgeId);
    }
    map['is_valid'] = Variable<int>(isValid);
    if (!nullToAbsent || invalidatedAt != null) {
      map['invalidated_at'] = Variable<DateTime>(invalidatedAt);
    }
    if (!nullToAbsent || invalidationReason != null) {
      map['invalidation_reason'] = Variable<String>(invalidationReason);
    }
    if (!nullToAbsent || replacesEventId != null) {
      map['replaces_event_id'] = Variable<int>(replacesEventId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['synchronized'] = Variable<int>(synchronized);
    map['is_active'] = Variable<int>(isActive);
    return map;
  }

  CombatEventsCompanion toCompanion(bool nullToAbsent) {
    return CombatEventsCompanion(
      id: Value(id),
      roundId: Value(roundId),
      pointType: Value(pointType),
      targetParticipant: Value(targetParticipant),
      pointsDelta: Value(pointsDelta),
      matchSeconds: matchSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(matchSeconds),
      registeredByJudgeId: registeredByJudgeId == null && nullToAbsent
          ? const Value.absent()
          : Value(registeredByJudgeId),
      isValid: Value(isValid),
      invalidatedAt: invalidatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(invalidatedAt),
      invalidationReason: invalidationReason == null && nullToAbsent
          ? const Value.absent()
          : Value(invalidationReason),
      replacesEventId: replacesEventId == null && nullToAbsent
          ? const Value.absent()
          : Value(replacesEventId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      synchronized: Value(synchronized),
      isActive: Value(isActive),
    );
  }

  factory CombatEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CombatEvent(
      id: serializer.fromJson<int>(json['id']),
      roundId: serializer.fromJson<int>(json['roundId']),
      pointType: serializer.fromJson<String>(json['pointType']),
      targetParticipant: serializer.fromJson<String>(json['targetParticipant']),
      pointsDelta: serializer.fromJson<double>(json['pointsDelta']),
      matchSeconds: serializer.fromJson<double?>(json['matchSeconds']),
      registeredByJudgeId: serializer.fromJson<int?>(
        json['registeredByJudgeId'],
      ),
      isValid: serializer.fromJson<int>(json['isValid']),
      invalidatedAt: serializer.fromJson<DateTime?>(json['invalidatedAt']),
      invalidationReason: serializer.fromJson<String?>(
        json['invalidationReason'],
      ),
      replacesEventId: serializer.fromJson<int?>(json['replacesEventId']),
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
      'roundId': serializer.toJson<int>(roundId),
      'pointType': serializer.toJson<String>(pointType),
      'targetParticipant': serializer.toJson<String>(targetParticipant),
      'pointsDelta': serializer.toJson<double>(pointsDelta),
      'matchSeconds': serializer.toJson<double?>(matchSeconds),
      'registeredByJudgeId': serializer.toJson<int?>(registeredByJudgeId),
      'isValid': serializer.toJson<int>(isValid),
      'invalidatedAt': serializer.toJson<DateTime?>(invalidatedAt),
      'invalidationReason': serializer.toJson<String?>(invalidationReason),
      'replacesEventId': serializer.toJson<int?>(replacesEventId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'synchronized': serializer.toJson<int>(synchronized),
      'isActive': serializer.toJson<int>(isActive),
    };
  }

  CombatEvent copyWith({
    int? id,
    int? roundId,
    String? pointType,
    String? targetParticipant,
    double? pointsDelta,
    Value<double?> matchSeconds = const Value.absent(),
    Value<int?> registeredByJudgeId = const Value.absent(),
    int? isValid,
    Value<DateTime?> invalidatedAt = const Value.absent(),
    Value<String?> invalidationReason = const Value.absent(),
    Value<int?> replacesEventId = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    int? synchronized,
    int? isActive,
  }) => CombatEvent(
    id: id ?? this.id,
    roundId: roundId ?? this.roundId,
    pointType: pointType ?? this.pointType,
    targetParticipant: targetParticipant ?? this.targetParticipant,
    pointsDelta: pointsDelta ?? this.pointsDelta,
    matchSeconds: matchSeconds.present ? matchSeconds.value : this.matchSeconds,
    registeredByJudgeId: registeredByJudgeId.present
        ? registeredByJudgeId.value
        : this.registeredByJudgeId,
    isValid: isValid ?? this.isValid,
    invalidatedAt: invalidatedAt.present
        ? invalidatedAt.value
        : this.invalidatedAt,
    invalidationReason: invalidationReason.present
        ? invalidationReason.value
        : this.invalidationReason,
    replacesEventId: replacesEventId.present
        ? replacesEventId.value
        : this.replacesEventId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    synchronized: synchronized ?? this.synchronized,
    isActive: isActive ?? this.isActive,
  );
  CombatEvent copyWithCompanion(CombatEventsCompanion data) {
    return CombatEvent(
      id: data.id.present ? data.id.value : this.id,
      roundId: data.roundId.present ? data.roundId.value : this.roundId,
      pointType: data.pointType.present ? data.pointType.value : this.pointType,
      targetParticipant: data.targetParticipant.present
          ? data.targetParticipant.value
          : this.targetParticipant,
      pointsDelta: data.pointsDelta.present
          ? data.pointsDelta.value
          : this.pointsDelta,
      matchSeconds: data.matchSeconds.present
          ? data.matchSeconds.value
          : this.matchSeconds,
      registeredByJudgeId: data.registeredByJudgeId.present
          ? data.registeredByJudgeId.value
          : this.registeredByJudgeId,
      isValid: data.isValid.present ? data.isValid.value : this.isValid,
      invalidatedAt: data.invalidatedAt.present
          ? data.invalidatedAt.value
          : this.invalidatedAt,
      invalidationReason: data.invalidationReason.present
          ? data.invalidationReason.value
          : this.invalidationReason,
      replacesEventId: data.replacesEventId.present
          ? data.replacesEventId.value
          : this.replacesEventId,
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
    return (StringBuffer('CombatEvent(')
          ..write('id: $id, ')
          ..write('roundId: $roundId, ')
          ..write('pointType: $pointType, ')
          ..write('targetParticipant: $targetParticipant, ')
          ..write('pointsDelta: $pointsDelta, ')
          ..write('matchSeconds: $matchSeconds, ')
          ..write('registeredByJudgeId: $registeredByJudgeId, ')
          ..write('isValid: $isValid, ')
          ..write('invalidatedAt: $invalidatedAt, ')
          ..write('invalidationReason: $invalidationReason, ')
          ..write('replacesEventId: $replacesEventId, ')
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
    roundId,
    pointType,
    targetParticipant,
    pointsDelta,
    matchSeconds,
    registeredByJudgeId,
    isValid,
    invalidatedAt,
    invalidationReason,
    replacesEventId,
    createdAt,
    updatedAt,
    synchronized,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CombatEvent &&
          other.id == this.id &&
          other.roundId == this.roundId &&
          other.pointType == this.pointType &&
          other.targetParticipant == this.targetParticipant &&
          other.pointsDelta == this.pointsDelta &&
          other.matchSeconds == this.matchSeconds &&
          other.registeredByJudgeId == this.registeredByJudgeId &&
          other.isValid == this.isValid &&
          other.invalidatedAt == this.invalidatedAt &&
          other.invalidationReason == this.invalidationReason &&
          other.replacesEventId == this.replacesEventId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.synchronized == this.synchronized &&
          other.isActive == this.isActive);
}

class CombatEventsCompanion extends UpdateCompanion<CombatEvent> {
  final Value<int> id;
  final Value<int> roundId;
  final Value<String> pointType;
  final Value<String> targetParticipant;
  final Value<double> pointsDelta;
  final Value<double?> matchSeconds;
  final Value<int?> registeredByJudgeId;
  final Value<int> isValid;
  final Value<DateTime?> invalidatedAt;
  final Value<String?> invalidationReason;
  final Value<int?> replacesEventId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> synchronized;
  final Value<int> isActive;
  const CombatEventsCompanion({
    this.id = const Value.absent(),
    this.roundId = const Value.absent(),
    this.pointType = const Value.absent(),
    this.targetParticipant = const Value.absent(),
    this.pointsDelta = const Value.absent(),
    this.matchSeconds = const Value.absent(),
    this.registeredByJudgeId = const Value.absent(),
    this.isValid = const Value.absent(),
    this.invalidatedAt = const Value.absent(),
    this.invalidationReason = const Value.absent(),
    this.replacesEventId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  CombatEventsCompanion.insert({
    this.id = const Value.absent(),
    required int roundId,
    required String pointType,
    required String targetParticipant,
    required double pointsDelta,
    this.matchSeconds = const Value.absent(),
    this.registeredByJudgeId = const Value.absent(),
    this.isValid = const Value.absent(),
    this.invalidatedAt = const Value.absent(),
    this.invalidationReason = const Value.absent(),
    this.replacesEventId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.synchronized = const Value.absent(),
    this.isActive = const Value.absent(),
  }) : roundId = Value(roundId),
       pointType = Value(pointType),
       targetParticipant = Value(targetParticipant),
       pointsDelta = Value(pointsDelta);
  static Insertable<CombatEvent> custom({
    Expression<int>? id,
    Expression<int>? roundId,
    Expression<String>? pointType,
    Expression<String>? targetParticipant,
    Expression<double>? pointsDelta,
    Expression<double>? matchSeconds,
    Expression<int>? registeredByJudgeId,
    Expression<int>? isValid,
    Expression<DateTime>? invalidatedAt,
    Expression<String>? invalidationReason,
    Expression<int>? replacesEventId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? synchronized,
    Expression<int>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roundId != null) 'round_id': roundId,
      if (pointType != null) 'point_type': pointType,
      if (targetParticipant != null) 'target_participant': targetParticipant,
      if (pointsDelta != null) 'points_delta': pointsDelta,
      if (matchSeconds != null) 'match_seconds': matchSeconds,
      if (registeredByJudgeId != null)
        'registered_by_judge_id': registeredByJudgeId,
      if (isValid != null) 'is_valid': isValid,
      if (invalidatedAt != null) 'invalidated_at': invalidatedAt,
      if (invalidationReason != null) 'invalidation_reason': invalidationReason,
      if (replacesEventId != null) 'replaces_event_id': replacesEventId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (synchronized != null) 'synchronized': synchronized,
      if (isActive != null) 'is_active': isActive,
    });
  }

  CombatEventsCompanion copyWith({
    Value<int>? id,
    Value<int>? roundId,
    Value<String>? pointType,
    Value<String>? targetParticipant,
    Value<double>? pointsDelta,
    Value<double?>? matchSeconds,
    Value<int?>? registeredByJudgeId,
    Value<int>? isValid,
    Value<DateTime?>? invalidatedAt,
    Value<String?>? invalidationReason,
    Value<int?>? replacesEventId,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<int>? synchronized,
    Value<int>? isActive,
  }) {
    return CombatEventsCompanion(
      id: id ?? this.id,
      roundId: roundId ?? this.roundId,
      pointType: pointType ?? this.pointType,
      targetParticipant: targetParticipant ?? this.targetParticipant,
      pointsDelta: pointsDelta ?? this.pointsDelta,
      matchSeconds: matchSeconds ?? this.matchSeconds,
      registeredByJudgeId: registeredByJudgeId ?? this.registeredByJudgeId,
      isValid: isValid ?? this.isValid,
      invalidatedAt: invalidatedAt ?? this.invalidatedAt,
      invalidationReason: invalidationReason ?? this.invalidationReason,
      replacesEventId: replacesEventId ?? this.replacesEventId,
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
    if (roundId.present) {
      map['round_id'] = Variable<int>(roundId.value);
    }
    if (pointType.present) {
      map['point_type'] = Variable<String>(pointType.value);
    }
    if (targetParticipant.present) {
      map['target_participant'] = Variable<String>(targetParticipant.value);
    }
    if (pointsDelta.present) {
      map['points_delta'] = Variable<double>(pointsDelta.value);
    }
    if (matchSeconds.present) {
      map['match_seconds'] = Variable<double>(matchSeconds.value);
    }
    if (registeredByJudgeId.present) {
      map['registered_by_judge_id'] = Variable<int>(registeredByJudgeId.value);
    }
    if (isValid.present) {
      map['is_valid'] = Variable<int>(isValid.value);
    }
    if (invalidatedAt.present) {
      map['invalidated_at'] = Variable<DateTime>(invalidatedAt.value);
    }
    if (invalidationReason.present) {
      map['invalidation_reason'] = Variable<String>(invalidationReason.value);
    }
    if (replacesEventId.present) {
      map['replaces_event_id'] = Variable<int>(replacesEventId.value);
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
    return (StringBuffer('CombatEventsCompanion(')
          ..write('id: $id, ')
          ..write('roundId: $roundId, ')
          ..write('pointType: $pointType, ')
          ..write('targetParticipant: $targetParticipant, ')
          ..write('pointsDelta: $pointsDelta, ')
          ..write('matchSeconds: $matchSeconds, ')
          ..write('registeredByJudgeId: $registeredByJudgeId, ')
          ..write('isValid: $isValid, ')
          ..write('invalidatedAt: $invalidatedAt, ')
          ..write('invalidationReason: $invalidationReason, ')
          ..write('replacesEventId: $replacesEventId, ')
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
  late final $BeltsTable belts = $BeltsTable(this);
  late final $SogiBeltsTable sogiBelts = $SogiBeltsTable(this);
  late final $StudentsTable students = $StudentsTable(this);
  late final $TournamentTable tournament = $TournamentTable(this);
  late final $CombatSettingsTable combatSettings = $CombatSettingsTable(this);
  late final $JudgeTable judge = $JudgeTable(this);
  late final $JudgeTournamentTable judgeTournament = $JudgeTournamentTable(
    this,
  );
  late final $GroupsTable groups = $GroupsTable(this);
  late final $InscriptionTable inscription = $InscriptionTable(this);
  late final $VersusTable versus = $VersusTable(this);
  late final $CombatRoundsTable combatRounds = $CombatRoundsTable(this);
  late final $CombatEventsTable combatEvents = $CombatEventsTable(this);
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
    belts,
    sogiBelts,
    students,
    tournament,
    combatSettings,
    judge,
    judgeTournament,
    groups,
    inscription,
    versus,
    combatRounds,
    combatEvents,
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
        'belts',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('sogi_belts', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'belts',
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
        'belts',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('students', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'belts',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('students', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'tournament',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('combat_settings', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'tournament',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('combat_settings', kind: UpdateKind.update)],
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
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('judge_tournament', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'tournament',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('groups', kind: UpdateKind.update)],
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
        'groups',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('inscription', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'tournament',
        limitUpdateKind: UpdateKind.update,
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
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('versus', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'groups',
        limitUpdateKind: UpdateKind.update,
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
        'versus',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('versus', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'versus',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('versus', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'versus',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('versus', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'versus',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('versus', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'versus',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('combat_rounds', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'inscription',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('combat_rounds', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'combat_rounds',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('combat_events', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'judge',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('combat_events', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'judge',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('combat_events', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'combat_events',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('combat_events', kind: UpdateKind.update)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'combat_events',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [TableUpdate('combat_events', kind: UpdateKind.update)],
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
      required String master,
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
      Value<String> master,
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

  ColumnFilters<String> get master => $composableBuilder(
    column: $table.master,
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

  ColumnOrderings<String> get master => $composableBuilder(
    column: $table.master,
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

  GeneratedColumn<String> get master =>
      $composableBuilder(column: $table.master, builder: (column) => column);

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
                Value<String> master = const Value.absent(),
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
                master: master,
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
                required String master,
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
                master: master,
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
typedef $$BeltsTableCreateCompanionBuilder =
    BeltsCompanion Function({
      Value<int> id,
      required String name,
      required String primaryColor,
      required String secondaryColor,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });
typedef $$BeltsTableUpdateCompanionBuilder =
    BeltsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> primaryColor,
      Value<String> secondaryColor,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });

final class $$BeltsTableReferences
    extends BaseReferences<_$AppDatabase, $BeltsTable, Belt> {
  $$BeltsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SogiBeltsTable, List<SogiBelt>>
  _sogiBeltsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.sogiBelts,
    aliasName: $_aliasNameGenerator(db.belts.id, db.sogiBelts.beltsId),
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
    aliasName: $_aliasNameGenerator(db.belts.id, db.students.beltId),
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

class $$BeltsTableFilterComposer extends Composer<_$AppDatabase, $BeltsTable> {
  $$BeltsTableFilterComposer({
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

  ColumnFilters<String> get primaryColor => $composableBuilder(
    column: $table.primaryColor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get secondaryColor => $composableBuilder(
    column: $table.secondaryColor,
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

class $$BeltsTableOrderingComposer
    extends Composer<_$AppDatabase, $BeltsTable> {
  $$BeltsTableOrderingComposer({
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

  ColumnOrderings<String> get primaryColor => $composableBuilder(
    column: $table.primaryColor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get secondaryColor => $composableBuilder(
    column: $table.secondaryColor,
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

class $$BeltsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BeltsTable> {
  $$BeltsTableAnnotationComposer({
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

  GeneratedColumn<String> get primaryColor => $composableBuilder(
    column: $table.primaryColor,
    builder: (column) => column,
  );

  GeneratedColumn<String> get secondaryColor => $composableBuilder(
    column: $table.secondaryColor,
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

class $$BeltsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BeltsTable,
          Belt,
          $$BeltsTableFilterComposer,
          $$BeltsTableOrderingComposer,
          $$BeltsTableAnnotationComposer,
          $$BeltsTableCreateCompanionBuilder,
          $$BeltsTableUpdateCompanionBuilder,
          (Belt, $$BeltsTableReferences),
          Belt,
          PrefetchHooks Function({bool sogiBeltsRefs, bool studentsRefs})
        > {
  $$BeltsTableTableManager(_$AppDatabase db, $BeltsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BeltsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BeltsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BeltsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> primaryColor = const Value.absent(),
                Value<String> secondaryColor = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => BeltsCompanion(
                id: id,
                name: name,
                primaryColor: primaryColor,
                secondaryColor: secondaryColor,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String primaryColor,
                required String secondaryColor,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => BeltsCompanion.insert(
                id: id,
                name: name,
                primaryColor: primaryColor,
                secondaryColor: secondaryColor,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$BeltsTableReferences(db, table, e)),
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
                        await $_getPrefetchedData<Belt, $BeltsTable, SogiBelt>(
                          currentTable: table,
                          referencedTable: $$BeltsTableReferences
                              ._sogiBeltsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BeltsTableReferences(
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
                        await $_getPrefetchedData<Belt, $BeltsTable, Student>(
                          currentTable: table,
                          referencedTable: $$BeltsTableReferences
                              ._studentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BeltsTableReferences(
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

typedef $$BeltsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BeltsTable,
      Belt,
      $$BeltsTableFilterComposer,
      $$BeltsTableOrderingComposer,
      $$BeltsTableAnnotationComposer,
      $$BeltsTableCreateCompanionBuilder,
      $$BeltsTableUpdateCompanionBuilder,
      (Belt, $$BeltsTableReferences),
      Belt,
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

  static $BeltsTable _beltsIdTable(_$AppDatabase db) => db.belts.createAlias(
    $_aliasNameGenerator(db.sogiBelts.beltsId, db.belts.id),
  );

  $$BeltsTableProcessedTableManager get beltsId {
    final $_column = $_itemColumn<int>('belts_id')!;

    final manager = $$BeltsTableTableManager(
      $_db,
      $_db.belts,
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

  $$BeltsTableFilterComposer get beltsId {
    final $$BeltsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.beltsId,
      referencedTable: $db.belts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BeltsTableFilterComposer(
            $db: $db,
            $table: $db.belts,
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

  $$BeltsTableOrderingComposer get beltsId {
    final $$BeltsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.beltsId,
      referencedTable: $db.belts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BeltsTableOrderingComposer(
            $db: $db,
            $table: $db.belts,
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

  $$BeltsTableAnnotationComposer get beltsId {
    final $$BeltsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.beltsId,
      referencedTable: $db.belts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BeltsTableAnnotationComposer(
            $db: $db,
            $table: $db.belts,
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
      required String numberIdentify,
      required String gender,
      required DateTime birthDate,
      Value<int> tournamentWins,
      Value<int> participations,
      required double weightKg,
      required double heightCm,
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
      Value<String> numberIdentify,
      Value<String> gender,
      Value<DateTime> birthDate,
      Value<int> tournamentWins,
      Value<int> participations,
      Value<double> weightKg,
      Value<double> heightCm,
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

  static $BeltsTable _beltIdTable(_$AppDatabase db) => db.belts.createAlias(
    $_aliasNameGenerator(db.students.beltId, db.belts.id),
  );

  $$BeltsTableProcessedTableManager get beltId {
    final $_column = $_itemColumn<int>('belt_id')!;

    final manager = $$BeltsTableTableManager(
      $_db,
      $_db.belts,
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

  ColumnFilters<String> get numberIdentify => $composableBuilder(
    column: $table.numberIdentify,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get birthDate => $composableBuilder(
    column: $table.birthDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tournamentWins => $composableBuilder(
    column: $table.tournamentWins,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get participations => $composableBuilder(
    column: $table.participations,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get heightCm => $composableBuilder(
    column: $table.heightCm,
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

  $$BeltsTableFilterComposer get beltId {
    final $$BeltsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.beltId,
      referencedTable: $db.belts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BeltsTableFilterComposer(
            $db: $db,
            $table: $db.belts,
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

  ColumnOrderings<String> get numberIdentify => $composableBuilder(
    column: $table.numberIdentify,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get birthDate => $composableBuilder(
    column: $table.birthDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tournamentWins => $composableBuilder(
    column: $table.tournamentWins,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get participations => $composableBuilder(
    column: $table.participations,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get heightCm => $composableBuilder(
    column: $table.heightCm,
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

  $$BeltsTableOrderingComposer get beltId {
    final $$BeltsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.beltId,
      referencedTable: $db.belts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BeltsTableOrderingComposer(
            $db: $db,
            $table: $db.belts,
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

  GeneratedColumn<String> get numberIdentify => $composableBuilder(
    column: $table.numberIdentify,
    builder: (column) => column,
  );

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<DateTime> get birthDate =>
      $composableBuilder(column: $table.birthDate, builder: (column) => column);

  GeneratedColumn<int> get tournamentWins => $composableBuilder(
    column: $table.tournamentWins,
    builder: (column) => column,
  );

  GeneratedColumn<int> get participations => $composableBuilder(
    column: $table.participations,
    builder: (column) => column,
  );

  GeneratedColumn<double> get weightKg =>
      $composableBuilder(column: $table.weightKg, builder: (column) => column);

  GeneratedColumn<double> get heightCm =>
      $composableBuilder(column: $table.heightCm, builder: (column) => column);

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

  $$BeltsTableAnnotationComposer get beltId {
    final $$BeltsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.beltId,
      referencedTable: $db.belts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BeltsTableAnnotationComposer(
            $db: $db,
            $table: $db.belts,
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
                Value<String> numberIdentify = const Value.absent(),
                Value<String> gender = const Value.absent(),
                Value<DateTime> birthDate = const Value.absent(),
                Value<int> tournamentWins = const Value.absent(),
                Value<int> participations = const Value.absent(),
                Value<double> weightKg = const Value.absent(),
                Value<double> heightCm = const Value.absent(),
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
                numberIdentify: numberIdentify,
                gender: gender,
                birthDate: birthDate,
                tournamentWins: tournamentWins,
                participations: participations,
                weightKg: weightKg,
                heightCm: heightCm,
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
                required String numberIdentify,
                required String gender,
                required DateTime birthDate,
                Value<int> tournamentWins = const Value.absent(),
                Value<int> participations = const Value.absent(),
                required double weightKg,
                required double heightCm,
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
                numberIdentify: numberIdentify,
                gender: gender,
                birthDate: birthDate,
                tournamentWins: tournamentWins,
                participations: participations,
                weightKg: weightKg,
                heightCm: heightCm,
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
      Value<String> host,
      required String location,
      required DateTime dateStart,
      required DateTime dateEnd,
      required String status,
      Value<String> discipline,
      Value<String> setupPhase,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });
typedef $$TournamentTableUpdateCompanionBuilder =
    TournamentCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> host,
      Value<String> location,
      Value<DateTime> dateStart,
      Value<DateTime> dateEnd,
      Value<String> status,
      Value<String> discipline,
      Value<String> setupPhase,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });

final class $$TournamentTableReferences
    extends BaseReferences<_$AppDatabase, $TournamentTable, TournamentData> {
  $$TournamentTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CombatSettingsTable, List<CombatSetting>>
  _combatSettingsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.combatSettings,
    aliasName: $_aliasNameGenerator(
      db.tournament.id,
      db.combatSettings.tournamentId,
    ),
  );

  $$CombatSettingsTableProcessedTableManager get combatSettingsRefs {
    final manager = $$CombatSettingsTableTableManager(
      $_db,
      $_db.combatSettings,
    ).filter((f) => f.tournamentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_combatSettingsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

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

  static MultiTypedResultKey<$GroupsTable, List<Group>> _groupsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.groups,
    aliasName: $_aliasNameGenerator(db.tournament.id, db.groups.tournamentId),
  );

  $$GroupsTableProcessedTableManager get groupsRefs {
    final manager = $$GroupsTableTableManager(
      $_db,
      $_db.groups,
    ).filter((f) => f.tournamentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_groupsRefsTable($_db));
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

  static MultiTypedResultKey<$VersusTable, List<VersusData>> _versusRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.versus,
    aliasName: $_aliasNameGenerator(db.tournament.id, db.versus.tournamentId),
  );

  $$VersusTableProcessedTableManager get versusRefs {
    final manager = $$VersusTableTableManager(
      $_db,
      $_db.versus,
    ).filter((f) => f.tournamentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_versusRefsTable($_db));
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

  ColumnFilters<String> get host => $composableBuilder(
    column: $table.host,
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

  ColumnFilters<String> get discipline => $composableBuilder(
    column: $table.discipline,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get setupPhase => $composableBuilder(
    column: $table.setupPhase,
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

  Expression<bool> combatSettingsRefs(
    Expression<bool> Function($$CombatSettingsTableFilterComposer f) f,
  ) {
    final $$CombatSettingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.combatSettings,
      getReferencedColumn: (t) => t.tournamentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CombatSettingsTableFilterComposer(
            $db: $db,
            $table: $db.combatSettings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

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

  Expression<bool> groupsRefs(
    Expression<bool> Function($$GroupsTableFilterComposer f) f,
  ) {
    final $$GroupsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.groups,
      getReferencedColumn: (t) => t.tournamentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GroupsTableFilterComposer(
            $db: $db,
            $table: $db.groups,
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

  Expression<bool> versusRefs(
    Expression<bool> Function($$VersusTableFilterComposer f) f,
  ) {
    final $$VersusTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.versus,
      getReferencedColumn: (t) => t.tournamentId,
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

  ColumnOrderings<String> get host => $composableBuilder(
    column: $table.host,
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

  ColumnOrderings<String> get discipline => $composableBuilder(
    column: $table.discipline,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get setupPhase => $composableBuilder(
    column: $table.setupPhase,
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

  GeneratedColumn<String> get host =>
      $composableBuilder(column: $table.host, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<DateTime> get dateStart =>
      $composableBuilder(column: $table.dateStart, builder: (column) => column);

  GeneratedColumn<DateTime> get dateEnd =>
      $composableBuilder(column: $table.dateEnd, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get discipline => $composableBuilder(
    column: $table.discipline,
    builder: (column) => column,
  );

  GeneratedColumn<String> get setupPhase => $composableBuilder(
    column: $table.setupPhase,
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

  Expression<T> combatSettingsRefs<T extends Object>(
    Expression<T> Function($$CombatSettingsTableAnnotationComposer a) f,
  ) {
    final $$CombatSettingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.combatSettings,
      getReferencedColumn: (t) => t.tournamentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CombatSettingsTableAnnotationComposer(
            $db: $db,
            $table: $db.combatSettings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

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

  Expression<T> groupsRefs<T extends Object>(
    Expression<T> Function($$GroupsTableAnnotationComposer a) f,
  ) {
    final $$GroupsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.groups,
      getReferencedColumn: (t) => t.tournamentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GroupsTableAnnotationComposer(
            $db: $db,
            $table: $db.groups,
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

  Expression<T> versusRefs<T extends Object>(
    Expression<T> Function($$VersusTableAnnotationComposer a) f,
  ) {
    final $$VersusTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.versus,
      getReferencedColumn: (t) => t.tournamentId,
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
            bool combatSettingsRefs,
            bool judgeTournamentRefs,
            bool groupsRefs,
            bool inscriptionRefs,
            bool versusRefs,
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
                Value<String> host = const Value.absent(),
                Value<String> location = const Value.absent(),
                Value<DateTime> dateStart = const Value.absent(),
                Value<DateTime> dateEnd = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> discipline = const Value.absent(),
                Value<String> setupPhase = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => TournamentCompanion(
                id: id,
                name: name,
                host: host,
                location: location,
                dateStart: dateStart,
                dateEnd: dateEnd,
                status: status,
                discipline: discipline,
                setupPhase: setupPhase,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String> host = const Value.absent(),
                required String location,
                required DateTime dateStart,
                required DateTime dateEnd,
                required String status,
                Value<String> discipline = const Value.absent(),
                Value<String> setupPhase = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => TournamentCompanion.insert(
                id: id,
                name: name,
                host: host,
                location: location,
                dateStart: dateStart,
                dateEnd: dateEnd,
                status: status,
                discipline: discipline,
                setupPhase: setupPhase,
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
              ({
                combatSettingsRefs = false,
                judgeTournamentRefs = false,
                groupsRefs = false,
                inscriptionRefs = false,
                versusRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (combatSettingsRefs) db.combatSettings,
                    if (judgeTournamentRefs) db.judgeTournament,
                    if (groupsRefs) db.groups,
                    if (inscriptionRefs) db.inscription,
                    if (versusRefs) db.versus,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (combatSettingsRefs)
                        await $_getPrefetchedData<
                          TournamentData,
                          $TournamentTable,
                          CombatSetting
                        >(
                          currentTable: table,
                          referencedTable: $$TournamentTableReferences
                              ._combatSettingsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TournamentTableReferences(
                                db,
                                table,
                                p0,
                              ).combatSettingsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.tournamentId == item.id,
                              ),
                          typedResults: items,
                        ),
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
                      if (groupsRefs)
                        await $_getPrefetchedData<
                          TournamentData,
                          $TournamentTable,
                          Group
                        >(
                          currentTable: table,
                          referencedTable: $$TournamentTableReferences
                              ._groupsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TournamentTableReferences(
                                db,
                                table,
                                p0,
                              ).groupsRefs,
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
                      if (versusRefs)
                        await $_getPrefetchedData<
                          TournamentData,
                          $TournamentTable,
                          VersusData
                        >(
                          currentTable: table,
                          referencedTable: $$TournamentTableReferences
                              ._versusRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TournamentTableReferences(
                                db,
                                table,
                                p0,
                              ).versusRefs,
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
      PrefetchHooks Function({
        bool combatSettingsRefs,
        bool judgeTournamentRefs,
        bool groupsRefs,
        bool inscriptionRefs,
        bool versusRefs,
      })
    >;
typedef $$CombatSettingsTableCreateCompanionBuilder =
    CombatSettingsCompanion Function({
      Value<int> id,
      required int tournamentId,
      required int roundsMax,
      required String formatType,
      required int roundDurationSeconds,
      Value<int?> pointsToWin,
      Value<int> playAllRounds,
      required String eliminationType,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });
typedef $$CombatSettingsTableUpdateCompanionBuilder =
    CombatSettingsCompanion Function({
      Value<int> id,
      Value<int> tournamentId,
      Value<int> roundsMax,
      Value<String> formatType,
      Value<int> roundDurationSeconds,
      Value<int?> pointsToWin,
      Value<int> playAllRounds,
      Value<String> eliminationType,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });

final class $$CombatSettingsTableReferences
    extends BaseReferences<_$AppDatabase, $CombatSettingsTable, CombatSetting> {
  $$CombatSettingsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TournamentTable _tournamentIdTable(_$AppDatabase db) =>
      db.tournament.createAlias(
        $_aliasNameGenerator(db.combatSettings.tournamentId, db.tournament.id),
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

class $$CombatSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $CombatSettingsTable> {
  $$CombatSettingsTableFilterComposer({
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

  ColumnFilters<int> get roundsMax => $composableBuilder(
    column: $table.roundsMax,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get formatType => $composableBuilder(
    column: $table.formatType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get roundDurationSeconds => $composableBuilder(
    column: $table.roundDurationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pointsToWin => $composableBuilder(
    column: $table.pointsToWin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get playAllRounds => $composableBuilder(
    column: $table.playAllRounds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get eliminationType => $composableBuilder(
    column: $table.eliminationType,
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

class $$CombatSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $CombatSettingsTable> {
  $$CombatSettingsTableOrderingComposer({
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

  ColumnOrderings<int> get roundsMax => $composableBuilder(
    column: $table.roundsMax,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get formatType => $composableBuilder(
    column: $table.formatType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get roundDurationSeconds => $composableBuilder(
    column: $table.roundDurationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pointsToWin => $composableBuilder(
    column: $table.pointsToWin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get playAllRounds => $composableBuilder(
    column: $table.playAllRounds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get eliminationType => $composableBuilder(
    column: $table.eliminationType,
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

class $$CombatSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CombatSettingsTable> {
  $$CombatSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get roundsMax =>
      $composableBuilder(column: $table.roundsMax, builder: (column) => column);

  GeneratedColumn<String> get formatType => $composableBuilder(
    column: $table.formatType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get roundDurationSeconds => $composableBuilder(
    column: $table.roundDurationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<int> get pointsToWin => $composableBuilder(
    column: $table.pointsToWin,
    builder: (column) => column,
  );

  GeneratedColumn<int> get playAllRounds => $composableBuilder(
    column: $table.playAllRounds,
    builder: (column) => column,
  );

  GeneratedColumn<String> get eliminationType => $composableBuilder(
    column: $table.eliminationType,
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

class $$CombatSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CombatSettingsTable,
          CombatSetting,
          $$CombatSettingsTableFilterComposer,
          $$CombatSettingsTableOrderingComposer,
          $$CombatSettingsTableAnnotationComposer,
          $$CombatSettingsTableCreateCompanionBuilder,
          $$CombatSettingsTableUpdateCompanionBuilder,
          (CombatSetting, $$CombatSettingsTableReferences),
          CombatSetting,
          PrefetchHooks Function({bool tournamentId})
        > {
  $$CombatSettingsTableTableManager(
    _$AppDatabase db,
    $CombatSettingsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CombatSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CombatSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CombatSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> tournamentId = const Value.absent(),
                Value<int> roundsMax = const Value.absent(),
                Value<String> formatType = const Value.absent(),
                Value<int> roundDurationSeconds = const Value.absent(),
                Value<int?> pointsToWin = const Value.absent(),
                Value<int> playAllRounds = const Value.absent(),
                Value<String> eliminationType = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => CombatSettingsCompanion(
                id: id,
                tournamentId: tournamentId,
                roundsMax: roundsMax,
                formatType: formatType,
                roundDurationSeconds: roundDurationSeconds,
                pointsToWin: pointsToWin,
                playAllRounds: playAllRounds,
                eliminationType: eliminationType,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int tournamentId,
                required int roundsMax,
                required String formatType,
                required int roundDurationSeconds,
                Value<int?> pointsToWin = const Value.absent(),
                Value<int> playAllRounds = const Value.absent(),
                required String eliminationType,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => CombatSettingsCompanion.insert(
                id: id,
                tournamentId: tournamentId,
                roundsMax: roundsMax,
                formatType: formatType,
                roundDurationSeconds: roundDurationSeconds,
                pointsToWin: pointsToWin,
                playAllRounds: playAllRounds,
                eliminationType: eliminationType,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CombatSettingsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({tournamentId = false}) {
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
                    if (tournamentId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.tournamentId,
                                referencedTable: $$CombatSettingsTableReferences
                                    ._tournamentIdTable(db),
                                referencedColumn:
                                    $$CombatSettingsTableReferences
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

typedef $$CombatSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CombatSettingsTable,
      CombatSetting,
      $$CombatSettingsTableFilterComposer,
      $$CombatSettingsTableOrderingComposer,
      $$CombatSettingsTableAnnotationComposer,
      $$CombatSettingsTableCreateCompanionBuilder,
      $$CombatSettingsTableUpdateCompanionBuilder,
      (CombatSetting, $$CombatSettingsTableReferences),
      CombatSetting,
      PrefetchHooks Function({bool tournamentId})
    >;
typedef $$JudgeTableCreateCompanionBuilder =
    JudgeCompanion Function({
      Value<int> id,
      required String names,
      Value<String> club,
      Value<String> phone,
      required String document,
      Value<String> rank,
      Value<int> participations,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });
typedef $$JudgeTableUpdateCompanionBuilder =
    JudgeCompanion Function({
      Value<int> id,
      Value<String> names,
      Value<String> club,
      Value<String> phone,
      Value<String> document,
      Value<String> rank,
      Value<int> participations,
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

  static MultiTypedResultKey<$CombatEventsTable, List<CombatEvent>>
  _combatEventsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.combatEvents,
    aliasName: $_aliasNameGenerator(
      db.judge.id,
      db.combatEvents.registeredByJudgeId,
    ),
  );

  $$CombatEventsTableProcessedTableManager get combatEventsRefs {
    final manager = $$CombatEventsTableTableManager($_db, $_db.combatEvents)
        .filter(
          (f) => f.registeredByJudgeId.id.sqlEquals($_itemColumn<int>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_combatEventsRefsTable($_db));
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

  ColumnFilters<String> get club => $composableBuilder(
    column: $table.club,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get document => $composableBuilder(
    column: $table.document,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rank => $composableBuilder(
    column: $table.rank,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get participations => $composableBuilder(
    column: $table.participations,
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

  Expression<bool> combatEventsRefs(
    Expression<bool> Function($$CombatEventsTableFilterComposer f) f,
  ) {
    final $$CombatEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.combatEvents,
      getReferencedColumn: (t) => t.registeredByJudgeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CombatEventsTableFilterComposer(
            $db: $db,
            $table: $db.combatEvents,
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

  ColumnOrderings<String> get club => $composableBuilder(
    column: $table.club,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get document => $composableBuilder(
    column: $table.document,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rank => $composableBuilder(
    column: $table.rank,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get participations => $composableBuilder(
    column: $table.participations,
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

  GeneratedColumn<String> get club =>
      $composableBuilder(column: $table.club, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get document =>
      $composableBuilder(column: $table.document, builder: (column) => column);

  GeneratedColumn<String> get rank =>
      $composableBuilder(column: $table.rank, builder: (column) => column);

  GeneratedColumn<int> get participations => $composableBuilder(
    column: $table.participations,
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

  Expression<T> combatEventsRefs<T extends Object>(
    Expression<T> Function($$CombatEventsTableAnnotationComposer a) f,
  ) {
    final $$CombatEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.combatEvents,
      getReferencedColumn: (t) => t.registeredByJudgeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CombatEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.combatEvents,
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
          PrefetchHooks Function({
            bool judgeTournamentRefs,
            bool combatEventsRefs,
            bool scoreRefs,
          })
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
                Value<String> club = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<String> document = const Value.absent(),
                Value<String> rank = const Value.absent(),
                Value<int> participations = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => JudgeCompanion(
                id: id,
                names: names,
                club: club,
                phone: phone,
                document: document,
                rank: rank,
                participations: participations,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String names,
                Value<String> club = const Value.absent(),
                Value<String> phone = const Value.absent(),
                required String document,
                Value<String> rank = const Value.absent(),
                Value<int> participations = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => JudgeCompanion.insert(
                id: id,
                names: names,
                club: club,
                phone: phone,
                document: document,
                rank: rank,
                participations: participations,
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
              ({
                judgeTournamentRefs = false,
                combatEventsRefs = false,
                scoreRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (judgeTournamentRefs) db.judgeTournament,
                    if (combatEventsRefs) db.combatEvents,
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
                      if (combatEventsRefs)
                        await $_getPrefetchedData<
                          JudgeData,
                          $JudgeTable,
                          CombatEvent
                        >(
                          currentTable: table,
                          referencedTable: $$JudgeTableReferences
                              ._combatEventsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$JudgeTableReferences(
                                db,
                                table,
                                p0,
                              ).combatEventsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.registeredByJudgeId == item.id,
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
      PrefetchHooks Function({
        bool judgeTournamentRefs,
        bool combatEventsRefs,
        bool scoreRefs,
      })
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
typedef $$GroupsTableCreateCompanionBuilder =
    GroupsCompanion Function({
      Value<int> id,
      required int tournamentId,
      required String name,
      Value<String> gender,
      Value<int?> ageMin,
      Value<int?> ageMax,
      Value<double?> weightMin,
      Value<double?> weightMax,
      Value<int?> beltFromId,
      Value<int?> beltToId,
      Value<String> state,
      Value<String> description,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });
typedef $$GroupsTableUpdateCompanionBuilder =
    GroupsCompanion Function({
      Value<int> id,
      Value<int> tournamentId,
      Value<String> name,
      Value<String> gender,
      Value<int?> ageMin,
      Value<int?> ageMax,
      Value<double?> weightMin,
      Value<double?> weightMax,
      Value<int?> beltFromId,
      Value<int?> beltToId,
      Value<String> state,
      Value<String> description,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });

final class $$GroupsTableReferences
    extends BaseReferences<_$AppDatabase, $GroupsTable, Group> {
  $$GroupsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TournamentTable _tournamentIdTable(_$AppDatabase db) =>
      db.tournament.createAlias(
        $_aliasNameGenerator(db.groups.tournamentId, db.tournament.id),
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

  static MultiTypedResultKey<$InscriptionTable, List<InscriptionData>>
  _inscriptionRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.inscription,
    aliasName: $_aliasNameGenerator(db.groups.id, db.inscription.groupId),
  );

  $$InscriptionTableProcessedTableManager get inscriptionRefs {
    final manager = $$InscriptionTableTableManager(
      $_db,
      $_db.inscription,
    ).filter((f) => f.groupId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_inscriptionRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$VersusTable, List<VersusData>> _versusRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.versus,
    aliasName: $_aliasNameGenerator(db.groups.id, db.versus.groupId),
  );

  $$VersusTableProcessedTableManager get versusRefs {
    final manager = $$VersusTableTableManager(
      $_db,
      $_db.versus,
    ).filter((f) => f.groupId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_versusRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$GroupsTableFilterComposer
    extends Composer<_$AppDatabase, $GroupsTable> {
  $$GroupsTableFilterComposer({
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

  ColumnFilters<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ageMin => $composableBuilder(
    column: $table.ageMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ageMax => $composableBuilder(
    column: $table.ageMax,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weightMin => $composableBuilder(
    column: $table.weightMin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weightMax => $composableBuilder(
    column: $table.weightMax,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get beltFromId => $composableBuilder(
    column: $table.beltFromId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get beltToId => $composableBuilder(
    column: $table.beltToId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get state => $composableBuilder(
    column: $table.state,
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

  Expression<bool> inscriptionRefs(
    Expression<bool> Function($$InscriptionTableFilterComposer f) f,
  ) {
    final $$InscriptionTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.inscription,
      getReferencedColumn: (t) => t.groupId,
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
      getReferencedColumn: (t) => t.groupId,
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

class $$GroupsTableOrderingComposer
    extends Composer<_$AppDatabase, $GroupsTable> {
  $$GroupsTableOrderingComposer({
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

  ColumnOrderings<String> get gender => $composableBuilder(
    column: $table.gender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ageMin => $composableBuilder(
    column: $table.ageMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ageMax => $composableBuilder(
    column: $table.ageMax,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weightMin => $composableBuilder(
    column: $table.weightMin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weightMax => $composableBuilder(
    column: $table.weightMax,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get beltFromId => $composableBuilder(
    column: $table.beltFromId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get beltToId => $composableBuilder(
    column: $table.beltToId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get state => $composableBuilder(
    column: $table.state,
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

class $$GroupsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GroupsTable> {
  $$GroupsTableAnnotationComposer({
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

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<int> get ageMin =>
      $composableBuilder(column: $table.ageMin, builder: (column) => column);

  GeneratedColumn<int> get ageMax =>
      $composableBuilder(column: $table.ageMax, builder: (column) => column);

  GeneratedColumn<double> get weightMin =>
      $composableBuilder(column: $table.weightMin, builder: (column) => column);

  GeneratedColumn<double> get weightMax =>
      $composableBuilder(column: $table.weightMax, builder: (column) => column);

  GeneratedColumn<int> get beltFromId => $composableBuilder(
    column: $table.beltFromId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get beltToId =>
      $composableBuilder(column: $table.beltToId, builder: (column) => column);

  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

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

  Expression<T> inscriptionRefs<T extends Object>(
    Expression<T> Function($$InscriptionTableAnnotationComposer a) f,
  ) {
    final $$InscriptionTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.inscription,
      getReferencedColumn: (t) => t.groupId,
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
      getReferencedColumn: (t) => t.groupId,
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

class $$GroupsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GroupsTable,
          Group,
          $$GroupsTableFilterComposer,
          $$GroupsTableOrderingComposer,
          $$GroupsTableAnnotationComposer,
          $$GroupsTableCreateCompanionBuilder,
          $$GroupsTableUpdateCompanionBuilder,
          (Group, $$GroupsTableReferences),
          Group,
          PrefetchHooks Function({
            bool tournamentId,
            bool inscriptionRefs,
            bool versusRefs,
          })
        > {
  $$GroupsTableTableManager(_$AppDatabase db, $GroupsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GroupsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GroupsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GroupsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> tournamentId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> gender = const Value.absent(),
                Value<int?> ageMin = const Value.absent(),
                Value<int?> ageMax = const Value.absent(),
                Value<double?> weightMin = const Value.absent(),
                Value<double?> weightMax = const Value.absent(),
                Value<int?> beltFromId = const Value.absent(),
                Value<int?> beltToId = const Value.absent(),
                Value<String> state = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => GroupsCompanion(
                id: id,
                tournamentId: tournamentId,
                name: name,
                gender: gender,
                ageMin: ageMin,
                ageMax: ageMax,
                weightMin: weightMin,
                weightMax: weightMax,
                beltFromId: beltFromId,
                beltToId: beltToId,
                state: state,
                description: description,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int tournamentId,
                required String name,
                Value<String> gender = const Value.absent(),
                Value<int?> ageMin = const Value.absent(),
                Value<int?> ageMax = const Value.absent(),
                Value<double?> weightMin = const Value.absent(),
                Value<double?> weightMax = const Value.absent(),
                Value<int?> beltFromId = const Value.absent(),
                Value<int?> beltToId = const Value.absent(),
                Value<String> state = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => GroupsCompanion.insert(
                id: id,
                tournamentId: tournamentId,
                name: name,
                gender: gender,
                ageMin: ageMin,
                ageMax: ageMax,
                weightMin: weightMin,
                weightMax: weightMax,
                beltFromId: beltFromId,
                beltToId: beltToId,
                state: state,
                description: description,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$GroupsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                tournamentId = false,
                inscriptionRefs = false,
                versusRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (inscriptionRefs) db.inscription,
                    if (versusRefs) db.versus,
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
                        if (tournamentId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.tournamentId,
                                    referencedTable: $$GroupsTableReferences
                                        ._tournamentIdTable(db),
                                    referencedColumn: $$GroupsTableReferences
                                        ._tournamentIdTable(db)
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
                          Group,
                          $GroupsTable,
                          InscriptionData
                        >(
                          currentTable: table,
                          referencedTable: $$GroupsTableReferences
                              ._inscriptionRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$GroupsTableReferences(
                                db,
                                table,
                                p0,
                              ).inscriptionRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.groupId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (versusRefs)
                        await $_getPrefetchedData<
                          Group,
                          $GroupsTable,
                          VersusData
                        >(
                          currentTable: table,
                          referencedTable: $$GroupsTableReferences
                              ._versusRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$GroupsTableReferences(db, table, p0).versusRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.groupId == item.id,
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

typedef $$GroupsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GroupsTable,
      Group,
      $$GroupsTableFilterComposer,
      $$GroupsTableOrderingComposer,
      $$GroupsTableAnnotationComposer,
      $$GroupsTableCreateCompanionBuilder,
      $$GroupsTableUpdateCompanionBuilder,
      (Group, $$GroupsTableReferences),
      Group,
      PrefetchHooks Function({
        bool tournamentId,
        bool inscriptionRefs,
        bool versusRefs,
      })
    >;
typedef $$InscriptionTableCreateCompanionBuilder =
    InscriptionCompanion Function({
      Value<int> id,
      Value<DateTime> date,
      required int studentId,
      required int tournamentId,
      required int groupId,
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
      Value<int> groupId,
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

  static $GroupsTable _groupIdTable(_$AppDatabase db) => db.groups.createAlias(
    $_aliasNameGenerator(db.inscription.groupId, db.groups.id),
  );

  $$GroupsTableProcessedTableManager get groupId {
    final $_column = $_itemColumn<int>('group_id')!;

    final manager = $$GroupsTableTableManager(
      $_db,
      $_db.groups,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_groupIdTable($_db));
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
      db.versus.inscriptionAId,
    ),
  );

  $$VersusTableProcessedTableManager get inscription1 {
    final manager = $$VersusTableTableManager(
      $_db,
      $_db.versus,
    ).filter((f) => f.inscriptionAId.id.sqlEquals($_itemColumn<int>('id')!));

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
      db.versus.inscriptionBId,
    ),
  );

  $$VersusTableProcessedTableManager get inscription2 {
    final manager = $$VersusTableTableManager(
      $_db,
      $_db.versus,
    ).filter((f) => f.inscriptionBId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_inscription2Table($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$VersusTable, List<VersusData>> _versusRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.versus,
    aliasName: $_aliasNameGenerator(
      db.inscription.id,
      db.versus.winnerInscriptionId,
    ),
  );

  $$VersusTableProcessedTableManager get versusRefs {
    final manager = $$VersusTableTableManager($_db, $_db.versus).filter(
      (f) => f.winnerInscriptionId.id.sqlEquals($_itemColumn<int>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(_versusRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CombatRoundsTable, List<CombatRound>>
  _combatRoundsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.combatRounds,
    aliasName: $_aliasNameGenerator(
      db.inscription.id,
      db.combatRounds.winnerInscriptionId,
    ),
  );

  $$CombatRoundsTableProcessedTableManager get combatRoundsRefs {
    final manager = $$CombatRoundsTableTableManager($_db, $_db.combatRounds)
        .filter(
          (f) => f.winnerInscriptionId.id.sqlEquals($_itemColumn<int>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(_combatRoundsRefsTable($_db));
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

  $$GroupsTableFilterComposer get groupId {
    final $$GroupsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.groupId,
      referencedTable: $db.groups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GroupsTableFilterComposer(
            $db: $db,
            $table: $db.groups,
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
      getReferencedColumn: (t) => t.inscriptionAId,
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
      getReferencedColumn: (t) => t.inscriptionBId,
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

  Expression<bool> versusRefs(
    Expression<bool> Function($$VersusTableFilterComposer f) f,
  ) {
    final $$VersusTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.versus,
      getReferencedColumn: (t) => t.winnerInscriptionId,
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

  Expression<bool> combatRoundsRefs(
    Expression<bool> Function($$CombatRoundsTableFilterComposer f) f,
  ) {
    final $$CombatRoundsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.combatRounds,
      getReferencedColumn: (t) => t.winnerInscriptionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CombatRoundsTableFilterComposer(
            $db: $db,
            $table: $db.combatRounds,
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

  $$GroupsTableOrderingComposer get groupId {
    final $$GroupsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.groupId,
      referencedTable: $db.groups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GroupsTableOrderingComposer(
            $db: $db,
            $table: $db.groups,
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

  $$GroupsTableAnnotationComposer get groupId {
    final $$GroupsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.groupId,
      referencedTable: $db.groups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GroupsTableAnnotationComposer(
            $db: $db,
            $table: $db.groups,
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
      getReferencedColumn: (t) => t.inscriptionAId,
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
      getReferencedColumn: (t) => t.inscriptionBId,
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

  Expression<T> versusRefs<T extends Object>(
    Expression<T> Function($$VersusTableAnnotationComposer a) f,
  ) {
    final $$VersusTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.versus,
      getReferencedColumn: (t) => t.winnerInscriptionId,
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

  Expression<T> combatRoundsRefs<T extends Object>(
    Expression<T> Function($$CombatRoundsTableAnnotationComposer a) f,
  ) {
    final $$CombatRoundsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.combatRounds,
      getReferencedColumn: (t) => t.winnerInscriptionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CombatRoundsTableAnnotationComposer(
            $db: $db,
            $table: $db.combatRounds,
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
            bool groupId,
            bool inscription1,
            bool inscription2,
            bool versusRefs,
            bool combatRoundsRefs,
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
                Value<int> groupId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => InscriptionCompanion(
                id: id,
                date: date,
                studentId: studentId,
                tournamentId: tournamentId,
                groupId: groupId,
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
                required int groupId,
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => InscriptionCompanion.insert(
                id: id,
                date: date,
                studentId: studentId,
                tournamentId: tournamentId,
                groupId: groupId,
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
                groupId = false,
                inscription1 = false,
                inscription2 = false,
                versusRefs = false,
                combatRoundsRefs = false,
                winnerRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (inscription1) db.versus,
                    if (inscription2) db.versus,
                    if (versusRefs) db.versus,
                    if (combatRoundsRefs) db.combatRounds,
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
                        if (groupId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.groupId,
                                    referencedTable:
                                        $$InscriptionTableReferences
                                            ._groupIdTable(db),
                                    referencedColumn:
                                        $$InscriptionTableReferences
                                            ._groupIdTable(db)
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
                                (e) => e.inscriptionAId == item.id,
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
                                (e) => e.inscriptionBId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (versusRefs)
                        await $_getPrefetchedData<
                          InscriptionData,
                          $InscriptionTable,
                          VersusData
                        >(
                          currentTable: table,
                          referencedTable: $$InscriptionTableReferences
                              ._versusRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$InscriptionTableReferences(
                                db,
                                table,
                                p0,
                              ).versusRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.winnerInscriptionId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (combatRoundsRefs)
                        await $_getPrefetchedData<
                          InscriptionData,
                          $InscriptionTable,
                          CombatRound
                        >(
                          currentTable: table,
                          referencedTable: $$InscriptionTableReferences
                              ._combatRoundsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$InscriptionTableReferences(
                                db,
                                table,
                                p0,
                              ).combatRoundsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.winnerInscriptionId == item.id,
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
        bool groupId,
        bool inscription1,
        bool inscription2,
        bool versusRefs,
        bool combatRoundsRefs,
        bool winnerRefs,
      })
    >;
typedef $$VersusTableCreateCompanionBuilder =
    VersusCompanion Function({
      Value<int> id,
      required int tournamentId,
      required int inscriptionAId,
      required int inscriptionBId,
      required int groupId,
      Value<int?> winnerInscriptionId,
      Value<int> bracketRound,
      Value<int> bracketOrder,
      Value<int?> nextVsWinnerId,
      Value<int?> nextVsLoserId,
      Value<String> state,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });
typedef $$VersusTableUpdateCompanionBuilder =
    VersusCompanion Function({
      Value<int> id,
      Value<int> tournamentId,
      Value<int> inscriptionAId,
      Value<int> inscriptionBId,
      Value<int> groupId,
      Value<int?> winnerInscriptionId,
      Value<int> bracketRound,
      Value<int> bracketOrder,
      Value<int?> nextVsWinnerId,
      Value<int?> nextVsLoserId,
      Value<String> state,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });

final class $$VersusTableReferences
    extends BaseReferences<_$AppDatabase, $VersusTable, VersusData> {
  $$VersusTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TournamentTable _tournamentIdTable(_$AppDatabase db) =>
      db.tournament.createAlias(
        $_aliasNameGenerator(db.versus.tournamentId, db.tournament.id),
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

  static $InscriptionTable _inscriptionAIdTable(_$AppDatabase db) =>
      db.inscription.createAlias(
        $_aliasNameGenerator(db.versus.inscriptionAId, db.inscription.id),
      );

  $$InscriptionTableProcessedTableManager get inscriptionAId {
    final $_column = $_itemColumn<int>('inscription_a_id')!;

    final manager = $$InscriptionTableTableManager(
      $_db,
      $_db.inscription,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_inscriptionAIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $InscriptionTable _inscriptionBIdTable(_$AppDatabase db) =>
      db.inscription.createAlias(
        $_aliasNameGenerator(db.versus.inscriptionBId, db.inscription.id),
      );

  $$InscriptionTableProcessedTableManager get inscriptionBId {
    final $_column = $_itemColumn<int>('inscription_b_id')!;

    final manager = $$InscriptionTableTableManager(
      $_db,
      $_db.inscription,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_inscriptionBIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $GroupsTable _groupIdTable(_$AppDatabase db) => db.groups.createAlias(
    $_aliasNameGenerator(db.versus.groupId, db.groups.id),
  );

  $$GroupsTableProcessedTableManager get groupId {
    final $_column = $_itemColumn<int>('group_id')!;

    final manager = $$GroupsTableTableManager(
      $_db,
      $_db.groups,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_groupIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $InscriptionTable _winnerInscriptionIdTable(_$AppDatabase db) =>
      db.inscription.createAlias(
        $_aliasNameGenerator(db.versus.winnerInscriptionId, db.inscription.id),
      );

  $$InscriptionTableProcessedTableManager? get winnerInscriptionId {
    final $_column = $_itemColumn<int>('winner_inscription_id');
    if ($_column == null) return null;
    final manager = $$InscriptionTableTableManager(
      $_db,
      $_db.inscription,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_winnerInscriptionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $VersusTable _nextVsWinnerIdTable(_$AppDatabase db) =>
      db.versus.createAlias(
        $_aliasNameGenerator(db.versus.nextVsWinnerId, db.versus.id),
      );

  $$VersusTableProcessedTableManager? get nextVsWinnerId {
    final $_column = $_itemColumn<int>('next_vs_winner_id');
    if ($_column == null) return null;
    final manager = $$VersusTableTableManager(
      $_db,
      $_db.versus,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_nextVsWinnerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $VersusTable _nextVsLoserIdTable(_$AppDatabase db) => db.versus
      .createAlias($_aliasNameGenerator(db.versus.nextVsLoserId, db.versus.id));

  $$VersusTableProcessedTableManager? get nextVsLoserId {
    final $_column = $_itemColumn<int>('next_vs_loser_id');
    if ($_column == null) return null;
    final manager = $$VersusTableTableManager(
      $_db,
      $_db.versus,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_nextVsLoserIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$CombatRoundsTable, List<CombatRound>>
  _combatRoundsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.combatRounds,
    aliasName: $_aliasNameGenerator(db.versus.id, db.combatRounds.versusId),
  );

  $$CombatRoundsTableProcessedTableManager get combatRoundsRefs {
    final manager = $$CombatRoundsTableTableManager(
      $_db,
      $_db.combatRounds,
    ).filter((f) => f.versusId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_combatRoundsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
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

  ColumnFilters<int> get bracketRound => $composableBuilder(
    column: $table.bracketRound,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bracketOrder => $composableBuilder(
    column: $table.bracketOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get state => $composableBuilder(
    column: $table.state,
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

  $$InscriptionTableFilterComposer get inscriptionAId {
    final $$InscriptionTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.inscriptionAId,
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

  $$InscriptionTableFilterComposer get inscriptionBId {
    final $$InscriptionTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.inscriptionBId,
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

  $$GroupsTableFilterComposer get groupId {
    final $$GroupsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.groupId,
      referencedTable: $db.groups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GroupsTableFilterComposer(
            $db: $db,
            $table: $db.groups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$InscriptionTableFilterComposer get winnerInscriptionId {
    final $$InscriptionTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.winnerInscriptionId,
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

  $$VersusTableFilterComposer get nextVsWinnerId {
    final $$VersusTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.nextVsWinnerId,
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

  $$VersusTableFilterComposer get nextVsLoserId {
    final $$VersusTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.nextVsLoserId,
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

  Expression<bool> combatRoundsRefs(
    Expression<bool> Function($$CombatRoundsTableFilterComposer f) f,
  ) {
    final $$CombatRoundsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.combatRounds,
      getReferencedColumn: (t) => t.versusId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CombatRoundsTableFilterComposer(
            $db: $db,
            $table: $db.combatRounds,
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

  ColumnOrderings<int> get bracketRound => $composableBuilder(
    column: $table.bracketRound,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bracketOrder => $composableBuilder(
    column: $table.bracketOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get state => $composableBuilder(
    column: $table.state,
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

  $$InscriptionTableOrderingComposer get inscriptionAId {
    final $$InscriptionTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.inscriptionAId,
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

  $$InscriptionTableOrderingComposer get inscriptionBId {
    final $$InscriptionTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.inscriptionBId,
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

  $$GroupsTableOrderingComposer get groupId {
    final $$GroupsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.groupId,
      referencedTable: $db.groups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GroupsTableOrderingComposer(
            $db: $db,
            $table: $db.groups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$InscriptionTableOrderingComposer get winnerInscriptionId {
    final $$InscriptionTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.winnerInscriptionId,
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

  $$VersusTableOrderingComposer get nextVsWinnerId {
    final $$VersusTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.nextVsWinnerId,
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

  $$VersusTableOrderingComposer get nextVsLoserId {
    final $$VersusTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.nextVsLoserId,
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

  GeneratedColumn<int> get bracketRound => $composableBuilder(
    column: $table.bracketRound,
    builder: (column) => column,
  );

  GeneratedColumn<int> get bracketOrder => $composableBuilder(
    column: $table.bracketOrder,
    builder: (column) => column,
  );

  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

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

  $$InscriptionTableAnnotationComposer get inscriptionAId {
    final $$InscriptionTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.inscriptionAId,
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

  $$InscriptionTableAnnotationComposer get inscriptionBId {
    final $$InscriptionTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.inscriptionBId,
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

  $$GroupsTableAnnotationComposer get groupId {
    final $$GroupsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.groupId,
      referencedTable: $db.groups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GroupsTableAnnotationComposer(
            $db: $db,
            $table: $db.groups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$InscriptionTableAnnotationComposer get winnerInscriptionId {
    final $$InscriptionTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.winnerInscriptionId,
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

  $$VersusTableAnnotationComposer get nextVsWinnerId {
    final $$VersusTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.nextVsWinnerId,
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

  $$VersusTableAnnotationComposer get nextVsLoserId {
    final $$VersusTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.nextVsLoserId,
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

  Expression<T> combatRoundsRefs<T extends Object>(
    Expression<T> Function($$CombatRoundsTableAnnotationComposer a) f,
  ) {
    final $$CombatRoundsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.combatRounds,
      getReferencedColumn: (t) => t.versusId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CombatRoundsTableAnnotationComposer(
            $db: $db,
            $table: $db.combatRounds,
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
            bool tournamentId,
            bool inscriptionAId,
            bool inscriptionBId,
            bool groupId,
            bool winnerInscriptionId,
            bool nextVsWinnerId,
            bool nextVsLoserId,
            bool combatRoundsRefs,
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
                Value<int> tournamentId = const Value.absent(),
                Value<int> inscriptionAId = const Value.absent(),
                Value<int> inscriptionBId = const Value.absent(),
                Value<int> groupId = const Value.absent(),
                Value<int?> winnerInscriptionId = const Value.absent(),
                Value<int> bracketRound = const Value.absent(),
                Value<int> bracketOrder = const Value.absent(),
                Value<int?> nextVsWinnerId = const Value.absent(),
                Value<int?> nextVsLoserId = const Value.absent(),
                Value<String> state = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => VersusCompanion(
                id: id,
                tournamentId: tournamentId,
                inscriptionAId: inscriptionAId,
                inscriptionBId: inscriptionBId,
                groupId: groupId,
                winnerInscriptionId: winnerInscriptionId,
                bracketRound: bracketRound,
                bracketOrder: bracketOrder,
                nextVsWinnerId: nextVsWinnerId,
                nextVsLoserId: nextVsLoserId,
                state: state,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int tournamentId,
                required int inscriptionAId,
                required int inscriptionBId,
                required int groupId,
                Value<int?> winnerInscriptionId = const Value.absent(),
                Value<int> bracketRound = const Value.absent(),
                Value<int> bracketOrder = const Value.absent(),
                Value<int?> nextVsWinnerId = const Value.absent(),
                Value<int?> nextVsLoserId = const Value.absent(),
                Value<String> state = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => VersusCompanion.insert(
                id: id,
                tournamentId: tournamentId,
                inscriptionAId: inscriptionAId,
                inscriptionBId: inscriptionBId,
                groupId: groupId,
                winnerInscriptionId: winnerInscriptionId,
                bracketRound: bracketRound,
                bracketOrder: bracketOrder,
                nextVsWinnerId: nextVsWinnerId,
                nextVsLoserId: nextVsLoserId,
                state: state,
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
                tournamentId = false,
                inscriptionAId = false,
                inscriptionBId = false,
                groupId = false,
                winnerInscriptionId = false,
                nextVsWinnerId = false,
                nextVsLoserId = false,
                combatRoundsRefs = false,
                scoreRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (combatRoundsRefs) db.combatRounds,
                    if (scoreRefs) db.score,
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
                        if (tournamentId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.tournamentId,
                                    referencedTable: $$VersusTableReferences
                                        ._tournamentIdTable(db),
                                    referencedColumn: $$VersusTableReferences
                                        ._tournamentIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (inscriptionAId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.inscriptionAId,
                                    referencedTable: $$VersusTableReferences
                                        ._inscriptionAIdTable(db),
                                    referencedColumn: $$VersusTableReferences
                                        ._inscriptionAIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (inscriptionBId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.inscriptionBId,
                                    referencedTable: $$VersusTableReferences
                                        ._inscriptionBIdTable(db),
                                    referencedColumn: $$VersusTableReferences
                                        ._inscriptionBIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (groupId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.groupId,
                                    referencedTable: $$VersusTableReferences
                                        ._groupIdTable(db),
                                    referencedColumn: $$VersusTableReferences
                                        ._groupIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (winnerInscriptionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.winnerInscriptionId,
                                    referencedTable: $$VersusTableReferences
                                        ._winnerInscriptionIdTable(db),
                                    referencedColumn: $$VersusTableReferences
                                        ._winnerInscriptionIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (nextVsWinnerId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.nextVsWinnerId,
                                    referencedTable: $$VersusTableReferences
                                        ._nextVsWinnerIdTable(db),
                                    referencedColumn: $$VersusTableReferences
                                        ._nextVsWinnerIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (nextVsLoserId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.nextVsLoserId,
                                    referencedTable: $$VersusTableReferences
                                        ._nextVsLoserIdTable(db),
                                    referencedColumn: $$VersusTableReferences
                                        ._nextVsLoserIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (combatRoundsRefs)
                        await $_getPrefetchedData<
                          VersusData,
                          $VersusTable,
                          CombatRound
                        >(
                          currentTable: table,
                          referencedTable: $$VersusTableReferences
                              ._combatRoundsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$VersusTableReferences(
                                db,
                                table,
                                p0,
                              ).combatRoundsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.versusId == item.id,
                              ),
                          typedResults: items,
                        ),
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
        bool tournamentId,
        bool inscriptionAId,
        bool inscriptionBId,
        bool groupId,
        bool winnerInscriptionId,
        bool nextVsWinnerId,
        bool nextVsLoserId,
        bool combatRoundsRefs,
        bool scoreRefs,
      })
    >;
typedef $$CombatRoundsTableCreateCompanionBuilder =
    CombatRoundsCompanion Function({
      Value<int> id,
      required int versusId,
      required int roundNumber,
      Value<int> pointsA,
      Value<int> pointsB,
      Value<int?> winnerInscriptionId,
      Value<String> state,
      required DateTime startAt,
      Value<DateTime?> endAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });
typedef $$CombatRoundsTableUpdateCompanionBuilder =
    CombatRoundsCompanion Function({
      Value<int> id,
      Value<int> versusId,
      Value<int> roundNumber,
      Value<int> pointsA,
      Value<int> pointsB,
      Value<int?> winnerInscriptionId,
      Value<String> state,
      Value<DateTime> startAt,
      Value<DateTime?> endAt,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });

final class $$CombatRoundsTableReferences
    extends BaseReferences<_$AppDatabase, $CombatRoundsTable, CombatRound> {
  $$CombatRoundsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $VersusTable _versusIdTable(_$AppDatabase db) => db.versus.createAlias(
    $_aliasNameGenerator(db.combatRounds.versusId, db.versus.id),
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

  static $InscriptionTable _winnerInscriptionIdTable(_$AppDatabase db) =>
      db.inscription.createAlias(
        $_aliasNameGenerator(
          db.combatRounds.winnerInscriptionId,
          db.inscription.id,
        ),
      );

  $$InscriptionTableProcessedTableManager? get winnerInscriptionId {
    final $_column = $_itemColumn<int>('winner_inscription_id');
    if ($_column == null) return null;
    final manager = $$InscriptionTableTableManager(
      $_db,
      $_db.inscription,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_winnerInscriptionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$CombatEventsTable, List<CombatEvent>>
  _combatEventsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.combatEvents,
    aliasName: $_aliasNameGenerator(
      db.combatRounds.id,
      db.combatEvents.roundId,
    ),
  );

  $$CombatEventsTableProcessedTableManager get combatEventsRefs {
    final manager = $$CombatEventsTableTableManager(
      $_db,
      $_db.combatEvents,
    ).filter((f) => f.roundId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_combatEventsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CombatRoundsTableFilterComposer
    extends Composer<_$AppDatabase, $CombatRoundsTable> {
  $$CombatRoundsTableFilterComposer({
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

  ColumnFilters<int> get roundNumber => $composableBuilder(
    column: $table.roundNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pointsA => $composableBuilder(
    column: $table.pointsA,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pointsB => $composableBuilder(
    column: $table.pointsB,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startAt => $composableBuilder(
    column: $table.startAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endAt => $composableBuilder(
    column: $table.endAt,
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

  $$InscriptionTableFilterComposer get winnerInscriptionId {
    final $$InscriptionTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.winnerInscriptionId,
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

  Expression<bool> combatEventsRefs(
    Expression<bool> Function($$CombatEventsTableFilterComposer f) f,
  ) {
    final $$CombatEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.combatEvents,
      getReferencedColumn: (t) => t.roundId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CombatEventsTableFilterComposer(
            $db: $db,
            $table: $db.combatEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CombatRoundsTableOrderingComposer
    extends Composer<_$AppDatabase, $CombatRoundsTable> {
  $$CombatRoundsTableOrderingComposer({
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

  ColumnOrderings<int> get roundNumber => $composableBuilder(
    column: $table.roundNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pointsA => $composableBuilder(
    column: $table.pointsA,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pointsB => $composableBuilder(
    column: $table.pointsB,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startAt => $composableBuilder(
    column: $table.startAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endAt => $composableBuilder(
    column: $table.endAt,
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

  $$InscriptionTableOrderingComposer get winnerInscriptionId {
    final $$InscriptionTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.winnerInscriptionId,
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
}

class $$CombatRoundsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CombatRoundsTable> {
  $$CombatRoundsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get roundNumber => $composableBuilder(
    column: $table.roundNumber,
    builder: (column) => column,
  );

  GeneratedColumn<int> get pointsA =>
      $composableBuilder(column: $table.pointsA, builder: (column) => column);

  GeneratedColumn<int> get pointsB =>
      $composableBuilder(column: $table.pointsB, builder: (column) => column);

  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<DateTime> get startAt =>
      $composableBuilder(column: $table.startAt, builder: (column) => column);

  GeneratedColumn<DateTime> get endAt =>
      $composableBuilder(column: $table.endAt, builder: (column) => column);

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

  $$InscriptionTableAnnotationComposer get winnerInscriptionId {
    final $$InscriptionTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.winnerInscriptionId,
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

  Expression<T> combatEventsRefs<T extends Object>(
    Expression<T> Function($$CombatEventsTableAnnotationComposer a) f,
  ) {
    final $$CombatEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.combatEvents,
      getReferencedColumn: (t) => t.roundId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CombatEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.combatEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CombatRoundsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CombatRoundsTable,
          CombatRound,
          $$CombatRoundsTableFilterComposer,
          $$CombatRoundsTableOrderingComposer,
          $$CombatRoundsTableAnnotationComposer,
          $$CombatRoundsTableCreateCompanionBuilder,
          $$CombatRoundsTableUpdateCompanionBuilder,
          (CombatRound, $$CombatRoundsTableReferences),
          CombatRound,
          PrefetchHooks Function({
            bool versusId,
            bool winnerInscriptionId,
            bool combatEventsRefs,
          })
        > {
  $$CombatRoundsTableTableManager(_$AppDatabase db, $CombatRoundsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CombatRoundsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CombatRoundsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CombatRoundsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> versusId = const Value.absent(),
                Value<int> roundNumber = const Value.absent(),
                Value<int> pointsA = const Value.absent(),
                Value<int> pointsB = const Value.absent(),
                Value<int?> winnerInscriptionId = const Value.absent(),
                Value<String> state = const Value.absent(),
                Value<DateTime> startAt = const Value.absent(),
                Value<DateTime?> endAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => CombatRoundsCompanion(
                id: id,
                versusId: versusId,
                roundNumber: roundNumber,
                pointsA: pointsA,
                pointsB: pointsB,
                winnerInscriptionId: winnerInscriptionId,
                state: state,
                startAt: startAt,
                endAt: endAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int versusId,
                required int roundNumber,
                Value<int> pointsA = const Value.absent(),
                Value<int> pointsB = const Value.absent(),
                Value<int?> winnerInscriptionId = const Value.absent(),
                Value<String> state = const Value.absent(),
                required DateTime startAt,
                Value<DateTime?> endAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => CombatRoundsCompanion.insert(
                id: id,
                versusId: versusId,
                roundNumber: roundNumber,
                pointsA: pointsA,
                pointsB: pointsB,
                winnerInscriptionId: winnerInscriptionId,
                state: state,
                startAt: startAt,
                endAt: endAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CombatRoundsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                versusId = false,
                winnerInscriptionId = false,
                combatEventsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (combatEventsRefs) db.combatEvents,
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
                        if (versusId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.versusId,
                                    referencedTable:
                                        $$CombatRoundsTableReferences
                                            ._versusIdTable(db),
                                    referencedColumn:
                                        $$CombatRoundsTableReferences
                                            ._versusIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (winnerInscriptionId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.winnerInscriptionId,
                                    referencedTable:
                                        $$CombatRoundsTableReferences
                                            ._winnerInscriptionIdTable(db),
                                    referencedColumn:
                                        $$CombatRoundsTableReferences
                                            ._winnerInscriptionIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (combatEventsRefs)
                        await $_getPrefetchedData<
                          CombatRound,
                          $CombatRoundsTable,
                          CombatEvent
                        >(
                          currentTable: table,
                          referencedTable: $$CombatRoundsTableReferences
                              ._combatEventsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CombatRoundsTableReferences(
                                db,
                                table,
                                p0,
                              ).combatEventsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.roundId == item.id,
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

typedef $$CombatRoundsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CombatRoundsTable,
      CombatRound,
      $$CombatRoundsTableFilterComposer,
      $$CombatRoundsTableOrderingComposer,
      $$CombatRoundsTableAnnotationComposer,
      $$CombatRoundsTableCreateCompanionBuilder,
      $$CombatRoundsTableUpdateCompanionBuilder,
      (CombatRound, $$CombatRoundsTableReferences),
      CombatRound,
      PrefetchHooks Function({
        bool versusId,
        bool winnerInscriptionId,
        bool combatEventsRefs,
      })
    >;
typedef $$CombatEventsTableCreateCompanionBuilder =
    CombatEventsCompanion Function({
      Value<int> id,
      required int roundId,
      required String pointType,
      required String targetParticipant,
      required double pointsDelta,
      Value<double?> matchSeconds,
      Value<int?> registeredByJudgeId,
      Value<int> isValid,
      Value<DateTime?> invalidatedAt,
      Value<String?> invalidationReason,
      Value<int?> replacesEventId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });
typedef $$CombatEventsTableUpdateCompanionBuilder =
    CombatEventsCompanion Function({
      Value<int> id,
      Value<int> roundId,
      Value<String> pointType,
      Value<String> targetParticipant,
      Value<double> pointsDelta,
      Value<double?> matchSeconds,
      Value<int?> registeredByJudgeId,
      Value<int> isValid,
      Value<DateTime?> invalidatedAt,
      Value<String?> invalidationReason,
      Value<int?> replacesEventId,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<int> synchronized,
      Value<int> isActive,
    });

final class $$CombatEventsTableReferences
    extends BaseReferences<_$AppDatabase, $CombatEventsTable, CombatEvent> {
  $$CombatEventsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CombatRoundsTable _roundIdTable(_$AppDatabase db) =>
      db.combatRounds.createAlias(
        $_aliasNameGenerator(db.combatEvents.roundId, db.combatRounds.id),
      );

  $$CombatRoundsTableProcessedTableManager get roundId {
    final $_column = $_itemColumn<int>('round_id')!;

    final manager = $$CombatRoundsTableTableManager(
      $_db,
      $_db.combatRounds,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roundIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $JudgeTable _registeredByJudgeIdTable(_$AppDatabase db) =>
      db.judge.createAlias(
        $_aliasNameGenerator(db.combatEvents.registeredByJudgeId, db.judge.id),
      );

  $$JudgeTableProcessedTableManager? get registeredByJudgeId {
    final $_column = $_itemColumn<int>('registered_by_judge_id');
    if ($_column == null) return null;
    final manager = $$JudgeTableTableManager(
      $_db,
      $_db.judge,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_registeredByJudgeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CombatEventsTable _replacesEventIdTable(_$AppDatabase db) =>
      db.combatEvents.createAlias(
        $_aliasNameGenerator(
          db.combatEvents.replacesEventId,
          db.combatEvents.id,
        ),
      );

  $$CombatEventsTableProcessedTableManager? get replacesEventId {
    final $_column = $_itemColumn<int>('replaces_event_id');
    if ($_column == null) return null;
    final manager = $$CombatEventsTableTableManager(
      $_db,
      $_db.combatEvents,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_replacesEventIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CombatEventsTableFilterComposer
    extends Composer<_$AppDatabase, $CombatEventsTable> {
  $$CombatEventsTableFilterComposer({
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

  ColumnFilters<String> get pointType => $composableBuilder(
    column: $table.pointType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get targetParticipant => $composableBuilder(
    column: $table.targetParticipant,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get pointsDelta => $composableBuilder(
    column: $table.pointsDelta,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get matchSeconds => $composableBuilder(
    column: $table.matchSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isValid => $composableBuilder(
    column: $table.isValid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get invalidatedAt => $composableBuilder(
    column: $table.invalidatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get invalidationReason => $composableBuilder(
    column: $table.invalidationReason,
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

  $$CombatRoundsTableFilterComposer get roundId {
    final $$CombatRoundsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roundId,
      referencedTable: $db.combatRounds,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CombatRoundsTableFilterComposer(
            $db: $db,
            $table: $db.combatRounds,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$JudgeTableFilterComposer get registeredByJudgeId {
    final $$JudgeTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.registeredByJudgeId,
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

  $$CombatEventsTableFilterComposer get replacesEventId {
    final $$CombatEventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.replacesEventId,
      referencedTable: $db.combatEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CombatEventsTableFilterComposer(
            $db: $db,
            $table: $db.combatEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CombatEventsTableOrderingComposer
    extends Composer<_$AppDatabase, $CombatEventsTable> {
  $$CombatEventsTableOrderingComposer({
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

  ColumnOrderings<String> get pointType => $composableBuilder(
    column: $table.pointType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get targetParticipant => $composableBuilder(
    column: $table.targetParticipant,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get pointsDelta => $composableBuilder(
    column: $table.pointsDelta,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get matchSeconds => $composableBuilder(
    column: $table.matchSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isValid => $composableBuilder(
    column: $table.isValid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get invalidatedAt => $composableBuilder(
    column: $table.invalidatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get invalidationReason => $composableBuilder(
    column: $table.invalidationReason,
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

  $$CombatRoundsTableOrderingComposer get roundId {
    final $$CombatRoundsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roundId,
      referencedTable: $db.combatRounds,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CombatRoundsTableOrderingComposer(
            $db: $db,
            $table: $db.combatRounds,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$JudgeTableOrderingComposer get registeredByJudgeId {
    final $$JudgeTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.registeredByJudgeId,
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

  $$CombatEventsTableOrderingComposer get replacesEventId {
    final $$CombatEventsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.replacesEventId,
      referencedTable: $db.combatEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CombatEventsTableOrderingComposer(
            $db: $db,
            $table: $db.combatEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CombatEventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CombatEventsTable> {
  $$CombatEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get pointType =>
      $composableBuilder(column: $table.pointType, builder: (column) => column);

  GeneratedColumn<String> get targetParticipant => $composableBuilder(
    column: $table.targetParticipant,
    builder: (column) => column,
  );

  GeneratedColumn<double> get pointsDelta => $composableBuilder(
    column: $table.pointsDelta,
    builder: (column) => column,
  );

  GeneratedColumn<double> get matchSeconds => $composableBuilder(
    column: $table.matchSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<int> get isValid =>
      $composableBuilder(column: $table.isValid, builder: (column) => column);

  GeneratedColumn<DateTime> get invalidatedAt => $composableBuilder(
    column: $table.invalidatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get invalidationReason => $composableBuilder(
    column: $table.invalidationReason,
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

  $$CombatRoundsTableAnnotationComposer get roundId {
    final $$CombatRoundsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roundId,
      referencedTable: $db.combatRounds,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CombatRoundsTableAnnotationComposer(
            $db: $db,
            $table: $db.combatRounds,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$JudgeTableAnnotationComposer get registeredByJudgeId {
    final $$JudgeTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.registeredByJudgeId,
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

  $$CombatEventsTableAnnotationComposer get replacesEventId {
    final $$CombatEventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.replacesEventId,
      referencedTable: $db.combatEvents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CombatEventsTableAnnotationComposer(
            $db: $db,
            $table: $db.combatEvents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CombatEventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CombatEventsTable,
          CombatEvent,
          $$CombatEventsTableFilterComposer,
          $$CombatEventsTableOrderingComposer,
          $$CombatEventsTableAnnotationComposer,
          $$CombatEventsTableCreateCompanionBuilder,
          $$CombatEventsTableUpdateCompanionBuilder,
          (CombatEvent, $$CombatEventsTableReferences),
          CombatEvent,
          PrefetchHooks Function({
            bool roundId,
            bool registeredByJudgeId,
            bool replacesEventId,
          })
        > {
  $$CombatEventsTableTableManager(_$AppDatabase db, $CombatEventsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CombatEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CombatEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CombatEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> roundId = const Value.absent(),
                Value<String> pointType = const Value.absent(),
                Value<String> targetParticipant = const Value.absent(),
                Value<double> pointsDelta = const Value.absent(),
                Value<double?> matchSeconds = const Value.absent(),
                Value<int?> registeredByJudgeId = const Value.absent(),
                Value<int> isValid = const Value.absent(),
                Value<DateTime?> invalidatedAt = const Value.absent(),
                Value<String?> invalidationReason = const Value.absent(),
                Value<int?> replacesEventId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => CombatEventsCompanion(
                id: id,
                roundId: roundId,
                pointType: pointType,
                targetParticipant: targetParticipant,
                pointsDelta: pointsDelta,
                matchSeconds: matchSeconds,
                registeredByJudgeId: registeredByJudgeId,
                isValid: isValid,
                invalidatedAt: invalidatedAt,
                invalidationReason: invalidationReason,
                replacesEventId: replacesEventId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int roundId,
                required String pointType,
                required String targetParticipant,
                required double pointsDelta,
                Value<double?> matchSeconds = const Value.absent(),
                Value<int?> registeredByJudgeId = const Value.absent(),
                Value<int> isValid = const Value.absent(),
                Value<DateTime?> invalidatedAt = const Value.absent(),
                Value<String?> invalidationReason = const Value.absent(),
                Value<int?> replacesEventId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> synchronized = const Value.absent(),
                Value<int> isActive = const Value.absent(),
              }) => CombatEventsCompanion.insert(
                id: id,
                roundId: roundId,
                pointType: pointType,
                targetParticipant: targetParticipant,
                pointsDelta: pointsDelta,
                matchSeconds: matchSeconds,
                registeredByJudgeId: registeredByJudgeId,
                isValid: isValid,
                invalidatedAt: invalidatedAt,
                invalidationReason: invalidationReason,
                replacesEventId: replacesEventId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                synchronized: synchronized,
                isActive: isActive,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CombatEventsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                roundId = false,
                registeredByJudgeId = false,
                replacesEventId = false,
              }) {
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
                        if (roundId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.roundId,
                                    referencedTable:
                                        $$CombatEventsTableReferences
                                            ._roundIdTable(db),
                                    referencedColumn:
                                        $$CombatEventsTableReferences
                                            ._roundIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (registeredByJudgeId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.registeredByJudgeId,
                                    referencedTable:
                                        $$CombatEventsTableReferences
                                            ._registeredByJudgeIdTable(db),
                                    referencedColumn:
                                        $$CombatEventsTableReferences
                                            ._registeredByJudgeIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (replacesEventId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.replacesEventId,
                                    referencedTable:
                                        $$CombatEventsTableReferences
                                            ._replacesEventIdTable(db),
                                    referencedColumn:
                                        $$CombatEventsTableReferences
                                            ._replacesEventIdTable(db)
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

typedef $$CombatEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CombatEventsTable,
      CombatEvent,
      $$CombatEventsTableFilterComposer,
      $$CombatEventsTableOrderingComposer,
      $$CombatEventsTableAnnotationComposer,
      $$CombatEventsTableCreateCompanionBuilder,
      $$CombatEventsTableUpdateCompanionBuilder,
      (CombatEvent, $$CombatEventsTableReferences),
      CombatEvent,
      PrefetchHooks Function({
        bool roundId,
        bool registeredByJudgeId,
        bool replacesEventId,
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
  $$BeltsTableTableManager get belts =>
      $$BeltsTableTableManager(_db, _db.belts);
  $$SogiBeltsTableTableManager get sogiBelts =>
      $$SogiBeltsTableTableManager(_db, _db.sogiBelts);
  $$StudentsTableTableManager get students =>
      $$StudentsTableTableManager(_db, _db.students);
  $$TournamentTableTableManager get tournament =>
      $$TournamentTableTableManager(_db, _db.tournament);
  $$CombatSettingsTableTableManager get combatSettings =>
      $$CombatSettingsTableTableManager(_db, _db.combatSettings);
  $$JudgeTableTableManager get judge =>
      $$JudgeTableTableManager(_db, _db.judge);
  $$JudgeTournamentTableTableManager get judgeTournament =>
      $$JudgeTournamentTableTableManager(_db, _db.judgeTournament);
  $$GroupsTableTableManager get groups =>
      $$GroupsTableTableManager(_db, _db.groups);
  $$InscriptionTableTableManager get inscription =>
      $$InscriptionTableTableManager(_db, _db.inscription);
  $$VersusTableTableManager get versus =>
      $$VersusTableTableManager(_db, _db.versus);
  $$CombatRoundsTableTableManager get combatRounds =>
      $$CombatRoundsTableTableManager(_db, _db.combatRounds);
  $$CombatEventsTableTableManager get combatEvents =>
      $$CombatEventsTableTableManager(_db, _db.combatEvents);
  $$ScoreTableTableManager get score =>
      $$ScoreTableTableManager(_db, _db.score);
  $$WinnerTableTableManager get winner =>
      $$WinnerTableTableManager(_db, _db.winner);
}
