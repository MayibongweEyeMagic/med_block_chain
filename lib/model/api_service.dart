import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:med_block_chain/model/model_api.dart';
class ApiService {

   Future fetchUsers() async {
    var request = await http.get(Uri.parse("http://127.0.0.1:8000/blockchain"));
    var block =[];

    for (var u in jsonDecode(request.body)){
      block.add(Block(u['id'], u['index'], u['timestamp'],
          u['data'], u['nonce'], u['previous_hash']));
    }
    print(block);
    return block;
  }
}