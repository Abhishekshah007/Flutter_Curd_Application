// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $InternTableTable extends InternTable
    with TableInfo<$InternTableTable, InternTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InternTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 5, maxTextLength: 20),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<String> number = GeneratedColumn<String>(
      'number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _designationMeta =
      const VerificationMeta('designation');
  @override
  late final GeneratedColumn<String> designation = GeneratedColumn<String>(
      'designation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<String> age = GeneratedColumn<String>(
      'age', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _domainMeta = const VerificationMeta('domain');
  @override
  late final GeneratedColumn<String> domain = GeneratedColumn<String>(
      'domain', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, number, designation, age, domain];
  @override
  String get aliasedName => _alias ?? 'intern_table';
  @override
  String get actualTableName => 'intern_table';
  @override
  VerificationContext validateIntegrity(Insertable<InternTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('designation')) {
      context.handle(
          _designationMeta,
          designation.isAcceptableOrUnknown(
              data['designation']!, _designationMeta));
    } else if (isInserting) {
      context.missing(_designationMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('domain')) {
      context.handle(_domainMeta,
          domain.isAcceptableOrUnknown(data['domain']!, _domainMeta));
    } else if (isInserting) {
      context.missing(_domainMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InternTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InternTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      number: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}number'])!,
      designation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}designation'])!,
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}age'])!,
      domain: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}domain'])!,
    );
  }

  @override
  $InternTableTable createAlias(String alias) {
    return $InternTableTable(attachedDatabase, alias);
  }
}

class InternTableData extends DataClass implements Insertable<InternTableData> {
  final int id;
  final String name;
  final String number;
  final String designation;
  final String age;
  final String domain;
  const InternTableData(
      {required this.id,
      required this.name,
      required this.number,
      required this.designation,
      required this.age,
      required this.domain});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['number'] = Variable<String>(number);
    map['designation'] = Variable<String>(designation);
    map['age'] = Variable<String>(age);
    map['domain'] = Variable<String>(domain);
    return map;
  }

  InternTableCompanion toCompanion(bool nullToAbsent) {
    return InternTableCompanion(
      id: Value(id),
      name: Value(name),
      number: Value(number),
      designation: Value(designation),
      age: Value(age),
      domain: Value(domain),
    );
  }

  factory InternTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InternTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      number: serializer.fromJson<String>(json['number']),
      designation: serializer.fromJson<String>(json['designation']),
      age: serializer.fromJson<String>(json['age']),
      domain: serializer.fromJson<String>(json['domain']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'number': serializer.toJson<String>(number),
      'designation': serializer.toJson<String>(designation),
      'age': serializer.toJson<String>(age),
      'domain': serializer.toJson<String>(domain),
    };
  }

  InternTableData copyWith(
          {int? id,
          String? name,
          String? number,
          String? designation,
          String? age,
          String? domain}) =>
      InternTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        number: number ?? this.number,
        designation: designation ?? this.designation,
        age: age ?? this.age,
        domain: domain ?? this.domain,
      );
  @override
  String toString() {
    return (StringBuffer('InternTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('number: $number, ')
          ..write('designation: $designation, ')
          ..write('age: $age, ')
          ..write('domain: $domain')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, number, designation, age, domain);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InternTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.number == this.number &&
          other.designation == this.designation &&
          other.age == this.age &&
          other.domain == this.domain);
}

class InternTableCompanion extends UpdateCompanion<InternTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> number;
  final Value<String> designation;
  final Value<String> age;
  final Value<String> domain;
  const InternTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.number = const Value.absent(),
    this.designation = const Value.absent(),
    this.age = const Value.absent(),
    this.domain = const Value.absent(),
  });
  InternTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String number,
    required String designation,
    required String age,
    required String domain,
  })  : name = Value(name),
        number = Value(number),
        designation = Value(designation),
        age = Value(age),
        domain = Value(domain);
  static Insertable<InternTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? number,
    Expression<String>? designation,
    Expression<String>? age,
    Expression<String>? domain,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (number != null) 'number': number,
      if (designation != null) 'designation': designation,
      if (age != null) 'age': age,
      if (domain != null) 'domain': domain,
    });
  }

  InternTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? number,
      Value<String>? designation,
      Value<String>? age,
      Value<String>? domain}) {
    return InternTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      number: number ?? this.number,
      designation: designation ?? this.designation,
      age: age ?? this.age,
      domain: domain ?? this.domain,
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
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (designation.present) {
      map['designation'] = Variable<String>(designation.value);
    }
    if (age.present) {
      map['age'] = Variable<String>(age.value);
    }
    if (domain.present) {
      map['domain'] = Variable<String>(domain.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InternTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('number: $number, ')
          ..write('designation: $designation, ')
          ..write('age: $age, ')
          ..write('domain: $domain')
          ..write(')'))
        .toString();
  }
}

abstract class _$InternDatabase extends GeneratedDatabase {
  _$InternDatabase(QueryExecutor e) : super(e);
  late final $InternTableTable internTable = $InternTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [internTable];
}
