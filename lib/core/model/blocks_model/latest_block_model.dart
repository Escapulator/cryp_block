class LatestBlockModel {
  String? _hash;
  int? _ver;
  String? _prevBlock;
  String? _mrklRoot;
  int? _time;
  int? _bits;
  int? _nonce;
  int? _nTx;
  int? _size;
  int? _blockIndex;
  bool? _mainChain;
  int? _height;
  int? _receivedTime;
  String? _relayedBy;
  List<String>? _tx;

  LatestBlockModel(
      {String? hash,
      int? ver,
      String? prevBlock,
      String? mrklRoot,
      int? time,
      int? bits,
      int? nonce,
      int? nTx,
      int? size,
      int? blockIndex,
      bool? mainChain,
      int? height,
      int? receivedTime,
      String? relayedBy,
      List<String>? tx}) {
    _hash = hash;
    _ver = ver;
    _prevBlock = prevBlock;
    _mrklRoot = mrklRoot;
    _time = time;
    _bits = bits;
    _nonce = nonce;
    _nTx = nTx;
    _size = size;
    _blockIndex = blockIndex;
    _mainChain = mainChain;
    _height = height;
    _receivedTime = receivedTime;
    _relayedBy = relayedBy;
    _tx = tx;
  }

  String? get hash => _hash;
  int? get ver => _ver;
  String? get prevBlock => _prevBlock;
  String? get mrklRoot => _mrklRoot;
  int? get time => _time;
  int? get bits => _bits;
  int? get nonce => _nonce;
  int? get nTx => _nTx;
  int? get size => _size;
  int? get blockIndex => _blockIndex;
  bool? get mainChain => _mainChain;
  int? get height => _height;
  int? get receivedTime => _receivedTime;
  String? get relayedBy => _relayedBy;
  List<String>? get tx => _tx;

  LatestBlockModel.fromJson(Map<String, dynamic> json) {
    _hash = json['hash'];
    _ver = json['ver'];
    _prevBlock = json['prev_block'];
    _mrklRoot = json['mrkl_root'];
    _time = json['time'];
    _bits = json['bits'];
    _nonce = json['nonce'];
    _nTx = json['n_tx'];
    _size = json['size'];
    _blockIndex = json['block_index'];
    _mainChain = json['main_chain'];
    _height = json['height'];
    _receivedTime = json['received_time'];
    _relayedBy = json['relayed_by'];
    //_tx = json['tx'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['hash'] = _hash;
    data['ver'] = _ver;
    data['prev_block'] = _prevBlock;
    data['mrkl_root'] = _mrklRoot;
    data['time'] = _time;
    data['bits'] = _bits;
    data['nonce'] = _nonce;
    data['n_tx'] = _nTx;
    data['size'] = _size;
    data['block_index'] = _blockIndex;
    data['main_chain'] = _mainChain;
    data['height'] = _height;
    data['received_time'] = _receivedTime;
    data['relayed_by'] = _relayedBy;
    data['tx'] = _tx;
    return data;
  }
}
