import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../lib/database/db_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  DbInterface? dbInterface;

  setUp(() async {
    dbInterface = await DbInterface.getInstance();
  });

  tearDown(() async {
    await dbInterface?.close();
  });

  test('setValue and value', () async {
    if (dbInterface == null) {
      dbInterface = await DbInterface.getInstance();
    }
    const key = 'testKey';
    const value = 'testValue';

    // Set value
    await dbInterface?.setValue(key: key, value: value);

    // Get value
    final retrievedValue = await dbInterface?.value(key);
    expect(retrievedValue, value);
  });

  test('getOneObject', () async {
    if (dbInterface == null) {
      dbInterface = await DbInterface.getInstance();
    }
    const key = 'testKey';
    const value = 'testValue';

    // Set value
    await dbInterface?.setValue(key: key, value: value);

    // Get one object
    final query =
        'SELECT * FROM ${DbInterface.keyValueTableName} WHERE ${DbInterface.keyColumnName} = ?';
    final result = await dbInterface?.getOneObject(query, [key]);

    expect(result, isNotNull);
    expect(result![DbInterface.keyColumnName], key);
    expect(result[DbInterface.valueColumnName], value);
  });

  test('getObjects', () async {
    if (dbInterface == null) {
      dbInterface = await DbInterface.getInstance();
    }
    const key1 = 'testKey1';
    const value1 = 'testValue1';
    const key2 = 'testKey2';
    const value2 = 'testValue2';

    // Set values
    await dbInterface?.setValue(key: key1, value: value1);
    await dbInterface?.setValue(key: key2, value: value2);

    // Get objects
    final query = 'SELECT * FROM ${DbInterface.keyValueTableName}';
    final results = await dbInterface!.getObjects(query);

    expect(results, isNotEmpty);
    expect(results.length, 2);
    expect(
        results.any((item) =>
            item[DbInterface.keyColumnName] == key1 &&
            item[DbInterface.valueColumnName] == value1),
        isTrue);
    expect(
        results.any((item) =>
            item[DbInterface.keyColumnName] == key2 &&
            item[DbInterface.valueColumnName] == value2),
        isTrue);
  });

  test('countObject', () async {
    if (dbInterface == null) {
      dbInterface = await DbInterface.getInstance();
    }
    const key1 = 'testKey1';
    const value1 = 'testValue1';
    const key2 = 'testKey2';
    const value2 = 'testValue2';

    // Set values
    await dbInterface?.setValue(key: key1, value: value1);
    await dbInterface?.setValue(key: key2, value: value2);

    // Count objects
    final query = 'SELECT COUNT(*) FROM ${DbInterface.keyValueTableName}';
    final count = await dbInterface?.countObject(query);

    expect(count, 2);
  });

  test('execute', () async {
    if (dbInterface == null) {
      dbInterface = await DbInterface.getInstance();
    }
    const key = 'testKey';
    const value = 'testValue';

    // Execute insert
    final sql =
        'INSERT INTO ${DbInterface.keyValueTableName} (${DbInterface.keyColumnName}, ${DbInterface.valueColumnName}) VALUES (?, ?)';
    await dbInterface?.execute(sql, [key, value]);

    // Get value
    final retrievedValue = await dbInterface?.value(key);
    expect(retrievedValue, value);
  });

  test('rawAddObject', () async {
    if (dbInterface == null) {
      dbInterface = await DbInterface.getInstance();
    }
    const key = 'testKey';
    const value = 'testValue';

    // Raw add object
    final sql =
        'INSERT INTO ${DbInterface.keyValueTableName} (${DbInterface.keyColumnName}, ${DbInterface.valueColumnName}) VALUES (?, ?)';
    await dbInterface?.rawAddObject(sql, [key, value]);

    // Get value
    final retrievedValue = await dbInterface?.value(key);
    expect(retrievedValue, value);
  });

  test('addObject', () async {
    if (dbInterface == null) {
      dbInterface = await DbInterface.getInstance();
    }
    const table = 'testTable';
    final keyValues = {
      'key1': 'value1',
      'key2': 2,
    };

    // Create test table
    await dbInterface?.execute('CREATE TABLE $table (key1 TEXT, key2 INTEGER)');

    // Add object
    await dbInterface?.addObject(table: table, keyValues: keyValues);

    // Get objects
    final query = 'SELECT * FROM $table';
    final results = await dbInterface!.getObjects(query);

    expect(results, isNotEmpty);
    expect(results.length, 1);
    expect(results.first['key1'], 'value1');
    expect(results.first['key2'], 2);
  });

  test('rawUpdate', () async {
    if (dbInterface == null) {
      dbInterface = await DbInterface.getInstance();
    }
    const key = 'testKey';
    const value = 'testValue';
    const newValue = 'newValue';

    // Set value
    await dbInterface?.setValue(key: key, value: value);

    // Raw update
    final sql =
        'UPDATE ${DbInterface.keyValueTableName} SET ${DbInterface.valueColumnName} = ? WHERE ${DbInterface.keyColumnName} = ?';
    await dbInterface?.rawUpdate(sql, [newValue, key]);

    // Get value
    final retrievedValue = await dbInterface?.value(key);
    expect(retrievedValue, newValue);
  });

  test('update', () async {
    if (dbInterface == null) {
      dbInterface = await DbInterface.getInstance();
    }
    const key = 'testKey';
    const value = 'testValue';
    const newValue = 'newValue';
    const rawId = 1;

    // Set value
    await dbInterface?.setValue(key: key, value: value);

    // Update
    await dbInterface?.update(
        table: DbInterface.keyValueTableName,
        rawId: rawId,
        keyValues: {DbInterface.valueColumnName: newValue});

    // Get value
    final retrievedValue = await dbInterface?.value(key);
    expect(retrievedValue, newValue);
  });

  test('rawDelete', () async {
    if (dbInterface == null) {
      dbInterface = await DbInterface.getInstance();
    }
    const key = 'testKey';
    const value = 'testValue';

    // Set value
    await dbInterface?.setValue(key: key, value: value);

    // Raw delete
    final sql =
        'DELETE FROM ${DbInterface.keyValueTableName} WHERE ${DbInterface.keyColumnName} = ?';
    await dbInterface?.rawDelete(sql, [key]);

    // Get value
    final retrievedValue = await dbInterface?.value(key);
    expect(retrievedValue, isNull);
  });

  test('deleteById', () async {
    if (dbInterface == null) {
      dbInterface = await DbInterface.getInstance();
    }
    const key = 'testKey';
    const value = 'testValue';
    const rawId = 1;

    // Set value
    await dbInterface?.setValue(key: key, value: value);

    // Delete by id
    await dbInterface?.deleteById(
        table: DbInterface.keyValueTableName, rawId: rawId);

    // Get value
    final retrievedValue = await dbInterface?.value(key);
    expect(retrievedValue, isNull);
  });

  test('delete', () async {
    if (dbInterface == null) {
      dbInterface = await DbInterface.getInstance();
    }
    const key = 'testKey';
    const value = 'testValue';

    // Set value
    await dbInterface?.setValue(key: key, value: value);

    // Delete
    await dbInterface?.delete(
        table: DbInterface.keyValueTableName,
        keyValues: {DbInterface.keyColumnName: key});

    // Get value
    final retrievedValue = await dbInterface?.value(key);
    expect(retrievedValue, isNull);
  });
}
