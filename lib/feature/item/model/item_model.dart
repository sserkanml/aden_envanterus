// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ItemModel {
  String? oid;
  String? kod;
  String? barkod;
  String? adi;
  String? birim;
  num? minimumStok;
  String? firma;
  String? kaydeden;
  String? kayitZamani;
  String? musteriID;
  String? projeID;
  num? sayimLog;
  String? sayimTarih;
  String? qrKod;
  ItemModel({
    this.oid,
    this.kod,
    this.barkod,
    this.adi,
    this.birim,
    this.minimumStok,
    this.firma,
    this.kaydeden,
    this.kayitZamani,
    this.musteriID,
    this.projeID,
    this.sayimLog,
    this.sayimTarih,
    this.qrKod,
  });

  ItemModel copyWith({
    String? oid,
    String? kod,
    String? barkod,
    String? adi,
    String? birim,
    num? minimumStok,
    String? firma,
    String? kaydeden,
    String? kayitZamani,
    String? musteriID,
    String? projeID,
    num? sayimLog,
    String? sayimTarih,
    String? qrKod,
  }) {
    return ItemModel(
      oid: oid ?? this.oid,
      kod: kod ?? this.kod,
      barkod: barkod ?? this.barkod,
      adi: adi ?? this.adi,
      birim: birim ?? this.birim,
      minimumStok: minimumStok ?? this.minimumStok,
      firma: firma ?? this.firma,
      kaydeden: kaydeden ?? this.kaydeden,
      kayitZamani: kayitZamani ?? this.kayitZamani,
      musteriID: musteriID ?? this.musteriID,
      projeID: projeID ?? this.projeID,
      sayimLog: sayimLog ?? this.sayimLog,
      sayimTarih: sayimTarih ?? this.sayimTarih,
      qrKod: qrKod ?? this.qrKod,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Oid': oid,
      'Kod': kod,
      'Barkod': barkod,
      'Adi': adi,
      'Birim': birim,
      'MinimumStok': minimumStok,
      'Firma': firma,
      'Kaydeden': kaydeden,
      'Kayit_Zamani': kayitZamani,
      'Musteri_ID': musteriID,
      'Proje_ID': projeID,
      'Sayim_Log': sayimLog,
      'Sayim_Tarih': sayimTarih,
      'QrKod': qrKod,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      oid: map['Oid'] != null ? map['Oid'] as String : null,
      kod: map['Kod'] != null ? map['Kod'] as String : null,
      barkod: map['Barkod'] != null ? map['Barkod'] as String : null,
      adi: map['Adi'] != null ? map['Adi'] as String : null,
      birim: map['Birim'] != null ? map['Birim'] as String : null,
      minimumStok:
          map['MinimumStok'] != null ? map['MinimumStok'] as num : null,
      firma: map['Firma'] != null ? map['Firma'] as String : null,
      kaydeden: map['Kaydeden'] != null ? map['Kaydeden'] as String : null,
      kayitZamani:
          map['Kayit_Zamani'] != null ? map['Kayit_Zamani'] as String : null,
      musteriID: map['Musteri_ID'] != null ? map['Musteri_ID'] as String : null,
      projeID: map['Proje_ID'] != null ? map['Proje_ID'] as String : null,
      sayimLog: map['Sayim_Log'] != null ? map['Sayim_Log'] as num : null,
      sayimTarih:
          map['Sayim_Tarih'] != null ? map['Sayim_Tarih'] as String : null,
      qrKod: map['QrKod'] != null ? map['QrKod'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ItemModel(oid: $oid, kod: $kod, barkod: $barkod, adi: $adi, birim: $birim, minimumStok: $minimumStok, firma: $firma, kaydeden: $kaydeden, kayitZamani: $kayitZamani, musteriID: $musteriID, projeID: $projeID, sayimLog: $sayimLog, sayimTarih: $sayimTarih, qrKod: $qrKod)';
  }

  @override
  bool operator ==(covariant ItemModel other) {
    if (identical(this, other)) return true;

    return other.oid == oid &&
        other.kod == kod &&
        other.barkod == barkod &&
        other.adi == adi &&
        other.birim == birim &&
        other.minimumStok == minimumStok &&
        other.firma == firma &&
        other.kaydeden == kaydeden &&
        other.kayitZamani == kayitZamani &&
        other.musteriID == musteriID &&
        other.projeID == projeID &&
        other.sayimLog == sayimLog &&
        other.sayimTarih == sayimTarih &&
        other.qrKod == qrKod;
  }

  @override
  int get hashCode {
    return oid.hashCode ^
        kod.hashCode ^
        barkod.hashCode ^
        adi.hashCode ^
        birim.hashCode ^
        minimumStok.hashCode ^
        firma.hashCode ^
        kaydeden.hashCode ^
        kayitZamani.hashCode ^
        musteriID.hashCode ^
        projeID.hashCode ^
        sayimLog.hashCode ^
        sayimTarih.hashCode ^
        qrKod.hashCode;
  }
}
