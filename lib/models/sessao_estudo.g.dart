// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sessao_estudo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SessaoEstudoAdapter extends TypeAdapter<SessaoEstudo> {
  @override
  final int typeId = 0;

  @override
  SessaoEstudo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SessaoEstudo(
      materia: fields[0] as String,
      topico: fields[1] as String,
      duracao: fields[2] as String,
      anotacoes: fields[3] as String,
      dataEstudo: fields[4] as DateTime,
      concluida: fields[5] as bool,
      revisoes: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SessaoEstudo obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.materia)
      ..writeByte(1)
      ..write(obj.topico)
      ..writeByte(2)
      ..write(obj.duracao)
      ..writeByte(3)
      ..write(obj.anotacoes)
      ..writeByte(4)
      ..write(obj.dataEstudo)
      ..writeByte(5)
      ..write(obj.concluida)
      ..writeByte(6)
      ..write(obj.revisoes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessaoEstudoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
