// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Project {
  String? oid;
  String? firmaKullaniciID;
  String? firmaID;
  String? projeAdi;
  String? kaydeden;
  String? kayitZamani;
  String? projeNot;
  String? etiket;
  String? projeResim;
  String? musteriID;
  Project({
    this.oid,
    this.firmaKullaniciID,
    this.firmaID,
    this.projeAdi,
    this.kaydeden,
    this.kayitZamani,
    this.projeNot,
    this.etiket,
    this.projeResim,
    this.musteriID,
  });

  

  Project copyWith({
    String? oid,
    String? firmaKullaniciID,
    String? firmaID,
    String? projeAdi,
    String? kaydeden,
    String? kayitZamani,
    String? projeNot,
    String? etiket,
    String? projeResim,
    String? musteriID,
  }) {
    return Project(
      oid: oid ?? this.oid,
      firmaKullaniciID: firmaKullaniciID ?? this.firmaKullaniciID,
      firmaID: firmaID ?? this.firmaID,
      projeAdi: projeAdi ?? this.projeAdi,
      kaydeden: kaydeden ?? this.kaydeden,
      kayitZamani: kayitZamani ?? this.kayitZamani,
      projeNot: projeNot ?? this.projeNot,
      etiket: etiket ?? this.etiket,
      projeResim: projeResim ?? this.projeResim,
      musteriID: musteriID ?? this.musteriID,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'oid': oid,
      'firmaKullaniciID': firmaKullaniciID,
      'firmaID': firmaID,
      'projeAdi': projeAdi,
      'kaydeden': kaydeden,
      'kayitZamani': kayitZamani,
      'projeNot': projeNot,
      'etiket': etiket,
      'projeResim': projeResim,
      'musteriID': musteriID,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      oid: map['Oid'] != null ? map['Oid'] as String : null,
      firmaKullaniciID: map['FirmaKullaniciID'] != null ? map['FirmaKullaniciID'] as String : null,
      firmaID: map['FirmaID'] != null ? map['FirmaID'] as String : null,
      projeAdi: map['Proje_Adi'] != null ? map['Proje_Adi'] as String : null,
      kaydeden: map['Kaydeden'] != null ? map['Kaydeden'] as String : null,
      kayitZamani: map['Kayit_Zamani'] != null ? map['Kayit_Zamani'] as String : null,
      projeNot: map['Proje_Not'] != null ? map['Proje_Not'] as String : null,
      etiket: map['Etiket'] != null ? map['Etiket'] as String : null,
      projeResim: map['Proje_Resim'] != null ? map['Proje_Resim'] as String : null,
      musteriID: map['Musteri_ID'] != null ? map['Musteri_ID'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(String source) => Project.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Project(oid: $oid, firmaKullaniciID: $firmaKullaniciID, firmaID: $firmaID, projeAdi: $projeAdi, kaydeden: $kaydeden, kayitZamani: $kayitZamani, projeNot: $projeNot, etiket: $etiket, projeResim: $projeResim, musteriID: $musteriID)';
  }

  @override
  bool operator ==(covariant Project other) {
    if (identical(this, other)) return true;
  
    return 
      other.oid == oid &&
      other.firmaKullaniciID == firmaKullaniciID &&
      other.firmaID == firmaID &&
      other.projeAdi == projeAdi &&
      other.kaydeden == kaydeden &&
      other.kayitZamani == kayitZamani &&
      other.projeNot == projeNot &&
      other.etiket == etiket &&
      other.projeResim == projeResim &&
      other.musteriID == musteriID;
  }

  @override
  int get hashCode {
    return oid.hashCode ^
      firmaKullaniciID.hashCode ^
      firmaID.hashCode ^
      projeAdi.hashCode ^
      kaydeden.hashCode ^
      kayitZamani.hashCode ^
      projeNot.hashCode ^
      etiket.hashCode ^
      projeResim.hashCode ^
      musteriID.hashCode;
  }
}
