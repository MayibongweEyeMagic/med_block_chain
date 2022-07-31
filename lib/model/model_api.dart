
class Block {
  String? sId;
  int? index;
  String? timestamp;
  String? data;
  int? nonce;
  String? previousHash;

  Block(this.sId,
        this.index,
        this.timestamp,
        this.data,
        this.nonce,
        this.previousHash);

  // Block.fromJson(Map<String, dynamic> json) {
  //   sId = json['_id'];
  //   index = json['Index'];
  //   timestamp = json['Timestamp'];
  //   data = json['Data'];
  //   nonce = json['Nonce'];
  //   previousHash = json['Previous_hash'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['_id'] = this.sId;
  //   data['Index'] = this.index;
  //   data['Timestamp'] = this.timestamp;
  //   data['Data'] = this.data;
  //   data['Nonce'] = this.nonce;
  //   data['Previous_hash'] = this.previousHash;
  //   return data;
  // }
}