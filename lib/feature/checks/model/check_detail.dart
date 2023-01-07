// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CheckDetail {
  String? oid;
  String? baslamaTarihi;
  String? bitisTarihi;
  String? onayTarihi;
  String? sayimDurumData;
  String? aciklama;
  String? detayAciklama;
  String? firma;
  String? firmaLokasyon;
  String? kaydeden;
  String? kayitZamani;
  String? projeID;
  String? malzeme;
  String? musteriID;
  int? onayDurum;
  CheckDetail({
    this.oid,
    this.baslamaTarihi,
    this.bitisTarihi,
    this.onayTarihi,
    this.sayimDurumData,
    this.aciklama,
    this.detayAciklama,
    this.firma,
    this.firmaLokasyon,
    this.kaydeden,
    this.kayitZamani,
    this.projeID,
    this.malzeme,
    this.musteriID,
    this.onayDurum,
  });

  CheckDetail copyWith({
    String? oid,
    String? baslamaTarihi,
    String? bitisTarihi,
    String? onayTarihi,
    String? sayimDurumData,
    String? aciklama,
    String? detayAciklama,
    String? firma,
    String? firmaLokasyon,
    String? kaydeden,
    String? kayitZamani,
    String? projeID,
    String? malzeme,
    String? musteriID,
    int? onayDurum,
  }) {
    return CheckDetail(
      oid: oid ?? this.oid,
      baslamaTarihi: baslamaTarihi ?? this.baslamaTarihi,
      bitisTarihi: bitisTarihi ?? this.bitisTarihi,
      onayTarihi: onayTarihi ?? this.onayTarihi,
      sayimDurumData: sayimDurumData ?? this.sayimDurumData,
      aciklama: aciklama ?? this.aciklama,
      detayAciklama: detayAciklama ?? this.detayAciklama,
      firma: firma ?? this.firma,
      firmaLokasyon: firmaLokasyon ?? this.firmaLokasyon,
      kaydeden: kaydeden ?? this.kaydeden,
      kayitZamani: kayitZamani ?? this.kayitZamani,
      projeID: projeID ?? this.projeID,
      malzeme: malzeme ?? this.malzeme,
      musteriID: musteriID ?? this.musteriID,
      onayDurum: onayDurum ?? this.onayDurum,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'oid': oid,
      'baslamaTarihi': baslamaTarihi,
      'bitisTarihi': bitisTarihi,
      'onayTarihi': onayTarihi,
      'sayimDurumData': sayimDurumData,
      'aciklama': aciklama,
      'detayAciklama': detayAciklama,
      'firma': firma,
      'firmaLokasyon': firmaLokasyon,
      'kaydeden': kaydeden,
      'kayitZamani': kayitZamani,
      'projeID': projeID,
      'malzeme': malzeme,
      'musteriID': musteriID,
      'onayDurum': onayDurum,
    };
  }

  factory CheckDetail.fromMap(Map<String, dynamic> map) {
    return CheckDetail(
      oid: map['Oid'] != null ? map['Oid'] as String : null,
      baslamaTarihi: map['Baslama_Tarihi'] != null
          ? map['Baslama_Tarihi'] as String
          : null,
      bitisTarihi:
          map['Bitis_Tarihi'] != null ? map['Bitis_Tarihi'] as String : null,
      onayTarihi:
          map['Onay_Tarihi'] != null ? map['Onay_Tarihi'] as String : null,
      sayimDurumData: map['Sayim_Durum_Data'] != null
          ? map['Sayim_Durum_Data'] as String
          : null,
      aciklama: map['Aciklama'] != null ? map['Aciklama'] as String : null,
      detayAciklama: map['Detay_Aciklama'] != null
          ? map['Detay_Aciklama'] as String
          : null,
      firma: map['Firma'] != null ? map['Firma'] as String : null,
      firmaLokasyon: map['Firma_Lokasyon'] != null
          ? map['Firma_Lokasyon'] as String
          : null,
      kaydeden: map['Kaydeden'] != null ? map['Kaydeden'] as String : null,
      kayitZamani:
          map['Kayit_Zamani'] != null ? map['Kayit_Zamani'] as String : null,
      projeID: map['Proje_ID'] != null ? map['Proje_ID'] as String : null,
      malzeme: map['Malzeme'] != null ? map['Malzeme'] as String : null,
      musteriID: map['Musteri_ID'] != null ? map['Musteri_ID'] as String : null,
      onayDurum: map['Onay_Durum'] != null ? map['Onay_Durum'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckDetail.fromJson(String source) =>
      CheckDetail.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CheckDetail(oid: $oid, baslamaTarihi: $baslamaTarihi, bitisTarihi: $bitisTarihi, onayTarihi: $onayTarihi, sayimDurumData: $sayimDurumData, aciklama: $aciklama, detayAciklama: $detayAciklama, firma: $firma, firmaLokasyon: $firmaLokasyon, kaydeden: $kaydeden, kayitZamani: $kayitZamani, projeID: $projeID, malzeme: $malzeme, musteriID: $musteriID, onayDurum: $onayDurum)';
  }

  @override
  bool operator ==(covariant CheckDetail other) {
    if (identical(this, other)) return true;

    return other.oid == oid &&
        other.baslamaTarihi == baslamaTarihi &&
        other.bitisTarihi == bitisTarihi &&
        other.onayTarihi == onayTarihi &&
        other.sayimDurumData == sayimDurumData &&
        other.aciklama == aciklama &&
        other.detayAciklama == detayAciklama &&
        other.firma == firma &&
        other.firmaLokasyon == firmaLokasyon &&
        other.kaydeden == kaydeden &&
        other.kayitZamani == kayitZamani &&
        other.projeID == projeID &&
        other.malzeme == malzeme &&
        other.musteriID == musteriID &&
        other.onayDurum == onayDurum;
  }

  @override
  int get hashCode {
    return oid.hashCode ^
        baslamaTarihi.hashCode ^
        bitisTarihi.hashCode ^
        onayTarihi.hashCode ^
        sayimDurumData.hashCode ^
        aciklama.hashCode ^
        detayAciklama.hashCode ^
        firma.hashCode ^
        firmaLokasyon.hashCode ^
        kaydeden.hashCode ^
        kayitZamani.hashCode ^
        projeID.hashCode ^
        malzeme.hashCode ^
        musteriID.hashCode ^
        onayDurum.hashCode;
  }
}
