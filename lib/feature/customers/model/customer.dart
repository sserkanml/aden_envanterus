// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Customer {
  String? oid;
  String? musteriFirmaAdi;
  String? musteriYetkili;
  String? musteriTelefon;
  String? musteriEmail;
  String? musteriAdres;
  String? musteriVergiNo;
  String? musteriVergiDaire;
  String? kaytar;
  String? firmaId;
  int? aktifPasif;
  String? projeID;
  Customer({
    this.oid,
    this.musteriFirmaAdi,
    this.musteriYetkili,
    this.musteriTelefon,
    this.musteriEmail,
    this.musteriAdres,
    this.musteriVergiNo,
    this.musteriVergiDaire,
    this.kaytar,
    this.firmaId,
    this.aktifPasif,
    this.projeID,
  });

  

  Customer copyWith({
    String? oid,
    String? musteriFirmaAdi,
    String? musteriYetkili,
    String? musteriTelefon,
    String? musteriEmail,
    String? musteriAdres,
    String? musteriVergiNo,
    String? musteriVergiDaire,
    String? kaytar,
    String? firmaId,
    int? aktifPasif,
    String? projeID,
  }) {
    return Customer(
      oid: oid ?? this.oid,
      musteriFirmaAdi: musteriFirmaAdi ?? this.musteriFirmaAdi,
      musteriYetkili: musteriYetkili ?? this.musteriYetkili,
      musteriTelefon: musteriTelefon ?? this.musteriTelefon,
      musteriEmail: musteriEmail ?? this.musteriEmail,
      musteriAdres: musteriAdres ?? this.musteriAdres,
      musteriVergiNo: musteriVergiNo ?? this.musteriVergiNo,
      musteriVergiDaire: musteriVergiDaire ?? this.musteriVergiDaire,
      kaytar: kaytar ?? this.kaytar,
      firmaId: firmaId ?? this.firmaId,
      aktifPasif: aktifPasif ?? this.aktifPasif,
      projeID: projeID ?? this.projeID,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'oid': oid,
      'musteriFirmaAdi': musteriFirmaAdi,
      'musteriYetkili': musteriYetkili,
      'musteriTelefon': musteriTelefon,
      'musteriEmail': musteriEmail,
      'musteriAdres': musteriAdres,
      'musteriVergiNo': musteriVergiNo,
      'musteriVergiDaire': musteriVergiDaire,
      'kaytar': kaytar,
      'firmaId': firmaId,
      'aktifPasif': aktifPasif,
      'projeID': projeID,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      oid: map['oid'] != null ? map['oid'] as String : null,
      musteriFirmaAdi: map['musteriFirmaAdi'] != null ? map['musteriFirmaAdi'] as String : null,
      musteriYetkili: map['musteriYetkili'] != null ? map['musteriYetkili'] as String : null,
      musteriTelefon: map['musteriTelefon'] != null ? map['musteriTelefon'] as String : null,
      musteriEmail: map['musteriEmail'] != null ? map['musteriEmail'] as String : null,
      musteriAdres: map['musteriAdres'] != null ? map['musteriAdres'] as String : null,
      musteriVergiNo: map['musteriVergiNo'] != null ? map['musteriVergiNo'] as String : null,
      musteriVergiDaire: map['musteriVergiDaire'] != null ? map['musteriVergiDaire'] as String : null,
      kaytar: map['kaytar'] != null ? map['kaytar'] as String : null,
      firmaId: map['firmaId'] != null ? map['firmaId'] as String : null,
      aktifPasif: map['aktifPasif'] != null ? map['aktifPasif'] as int : null,
      projeID: map['projeID'] != null ? map['projeID'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) => Customer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Customer(oid: $oid, musteriFirmaAdi: $musteriFirmaAdi, musteriYetkili: $musteriYetkili, musteriTelefon: $musteriTelefon, musteriEmail: $musteriEmail, musteriAdres: $musteriAdres, musteriVergiNo: $musteriVergiNo, musteriVergiDaire: $musteriVergiDaire, kaytar: $kaytar, firmaId: $firmaId, aktifPasif: $aktifPasif, projeID: $projeID)';
  }

  @override
  bool operator ==(covariant Customer other) {
    if (identical(this, other)) return true;
  
    return 
      other.oid == oid &&
      other.musteriFirmaAdi == musteriFirmaAdi &&
      other.musteriYetkili == musteriYetkili &&
      other.musteriTelefon == musteriTelefon &&
      other.musteriEmail == musteriEmail &&
      other.musteriAdres == musteriAdres &&
      other.musteriVergiNo == musteriVergiNo &&
      other.musteriVergiDaire == musteriVergiDaire &&
      other.kaytar == kaytar &&
      other.firmaId == firmaId &&
      other.aktifPasif == aktifPasif &&
      other.projeID == projeID;
  }

  @override
  int get hashCode {
    return oid.hashCode ^
      musteriFirmaAdi.hashCode ^
      musteriYetkili.hashCode ^
      musteriTelefon.hashCode ^
      musteriEmail.hashCode ^
      musteriAdres.hashCode ^
      musteriVergiNo.hashCode ^
      musteriVergiDaire.hashCode ^
      kaytar.hashCode ^
      firmaId.hashCode ^
      aktifPasif.hashCode ^
      projeID.hashCode;
  }
}
