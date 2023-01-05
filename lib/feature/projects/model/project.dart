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
      oid: map['oid'] != null ? map['oid'] as String : null,
      firmaKullaniciID: map['firmaKullaniciID'] != null ? map['firmaKullaniciID'] as String : null,
      firmaID: map['firmaID'] != null ? map['firmaID'] as String : null,
      projeAdi: map['projeAdi'] != null ? map['projeAdi'] as String : null,
      kaydeden: map['kaydeden'] != null ? map['kaydeden'] as String : null,
      kayitZamani: map['kayitZamani'] != null ? map['kayitZamani'] as String : null,
      projeNot: map['projeNot'] != null ? map['projeNot'] as String : null,
      etiket: map['etiket'] != null ? map['etiket'] as String : null,
      projeResim: map['projeResim'] != null ? map['projeResim'] as String : null,
      musteriID: map['musteriID'] != null ? map['musteriID'] as String : null,
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
