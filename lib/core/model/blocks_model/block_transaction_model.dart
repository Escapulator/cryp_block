class BlockTransactionModel {
  String? _hash;
  List<Tx>? _tx;

  BlockTransactionModel({String? hash, List<Tx>? tx}) {
    _hash = hash;
    _tx = tx;
  }

  String? get hash => _hash;
  List<Tx>? get tx => _tx;

  BlockTransactionModel.fromJson(Map<String, dynamic> json) {
    _hash = json['hash'];
    if (json['tx'] != null) {
      _tx = <Tx>[];
      json['tx'].forEach((v) {
        _tx!.add(Tx.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['hash'] = _hash;
    if (_tx != null) {
      data['tx'] = _tx!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tx {
  String? _hash;
  int? _ver;
  int? _vinSz;
  int? _voutSz;
  int? _size;
  int? _weight;
  int? _fee;
  String? _relayedBy;
  int? _lockTime;
  int? _txIndex;
  bool? _doubleSpend;
  int? _time;
  int? _blockIndex;
  int? _blockHeight;
  List<Inputs>? _inputs;
  List<Out>? _out;

  Tx(
      {String? hash,
      int? ver,
      int? vinSz,
      int? voutSz,
      int? size,
      int? weight,
      int? fee,
      String? relayedBy,
      int? lockTime,
      int? txIndex,
      bool? doubleSpend,
      int? time,
      int? blockIndex,
      int? blockHeight,
      List<Inputs>? inputs,
      List<Out>? out}) {
    _hash = hash;
    _ver = ver;
    _vinSz = vinSz;
    _voutSz = voutSz;
    _size = size;
    _weight = weight;
    _fee = fee;
    _relayedBy = relayedBy;
    _lockTime = lockTime;
    _txIndex = txIndex;
    _doubleSpend = doubleSpend;
    _time = time;
    _blockIndex = blockIndex;
    _blockHeight = blockHeight;
    _inputs = inputs;
    _out = out;
  }

  String? get hash => _hash;
  int? get ver => _ver;
  int? get vinSz => _vinSz;
  int? get voutSz => _voutSz;
  int? get size => _size;
  int? get weight => _weight;
  int? get fee => _fee;
  String? get relayedBy => _relayedBy;
  int? get lockTime => _lockTime;
  int? get txIndex => _txIndex;
  bool? get doubleSpend => _doubleSpend;
  int? get time => _time;
  int? get blockIndex => _blockIndex;
  int? get blockHeight => _blockHeight;
  List<Inputs>? get inputs => _inputs;
  List<Out>? get out => _out;

  Tx.fromJson(Map<String, dynamic> json) {
    _hash = json['hash'];
    _ver = json['ver'];
    _vinSz = json['vin_sz'];
    _voutSz = json['vout_sz'];
    _size = json['size'];
    _weight = json['weight'];
    _fee = json['fee'];
    _relayedBy = json['relayed_by'];
    _lockTime = json['lock_time'];
    _txIndex = json['tx_index'];
    _doubleSpend = json['double_spend'];
    _time = json['time'];
    _blockIndex = json['block_index'];
    _blockHeight = json['block_height'];
    if (json['inputs'] != null) {
      _inputs = <Inputs>[];
      json['inputs'].forEach((v) {
        _inputs!.add(Inputs.fromJson(v));
      });
    }
    if (json['out'] != null) {
      _out = <Out>[];
      json['out'].forEach((v) {
        _out!.add(Out.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['hash'] = _hash;
    data['ver'] = _ver;
    data['vin_sz'] = _vinSz;
    data['vout_sz'] = _voutSz;
    data['size'] = _size;
    data['weight'] = _weight;
    data['fee'] = _fee;
    data['relayed_by'] = _relayedBy;
    data['lock_time'] = _lockTime;
    data['tx_index'] = _txIndex;
    data['double_spend'] = _doubleSpend;
    data['time'] = _time;
    data['block_index'] = _blockIndex;
    data['block_height'] = _blockHeight;
    if (_inputs != null) {
      data['inputs'] = _inputs!.map((v) => v.toJson()).toList();
    }
    if (_out != null) {
      data['out'] = _out!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Inputs {
  int? _sequence;
  String? _witness;
  String? _script;
  int? _index;
  PrevOut? _prevOut;

  Inputs(
      {int? sequence,
      String? witness,
      String? script,
      int? index,
      PrevOut? prevOut}) {
    _sequence = sequence;
    _witness = witness;
    _script = script;
    _index = index;
    _prevOut = prevOut;
  }

  int? get sequence => _sequence;
  String? get witness => _witness;
  String? get script => _script;
  int? get index => _index;
  PrevOut? get prevOut => _prevOut;

  Inputs.fromJson(Map<String, dynamic> json) {
    _sequence = json['sequence'];
    _witness = json['witness'];
    _script = json['script'];
    _index = json['index'];
    _prevOut =
        json['prev_out'] != null ? PrevOut.fromJson(json['prev_out']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['sequence'] = _sequence;
    data['witness'] = _witness;
    data['script'] = _script;
    data['index'] = _index;
    if (_prevOut != null) {
      data['prev_out'] = _prevOut!.toJson();
    }
    return data;
  }
}

class PrevOut {
  int? _type;
  bool? _spent;
  int? _value;
  List<SpendingOutpoints>? _spendingOutpoints;
  int? _n;
  int? _txIndex;
  String? _script;

  PrevOut(
      {int? type,
      bool? spent,
      int? value,
      List<SpendingOutpoints>? spendingOutpoints,
      int? n,
      int? txIndex,
      String? script}) {
    _type = type;
    _spent = spent;
    _value = value;
    _spendingOutpoints = spendingOutpoints;
    _n = n;
    _txIndex = txIndex;
    _script = script;
  }

  int? get type => _type;
  bool? get spent => _spent;
  int? get value => _value;
  List<SpendingOutpoints>? get spendingOutpoints => _spendingOutpoints;
  int? get n => _n;
  int? get txIndex => _txIndex;
  String? get script => _script;

  PrevOut.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _spent = json['spent'];
    _value = json['value'];
    if (json['spending_outpoints'] != null) {
      _spendingOutpoints = <SpendingOutpoints>[];
      json['spending_outpoints'].forEach((v) {
        _spendingOutpoints!.add(SpendingOutpoints.fromJson(v));
      });
    }
    _n = json['n'];
    _txIndex = json['tx_index'];
    _script = json['script'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['type'] = _type;
    data['spent'] = _spent;
    data['value'] = _value;
    if (_spendingOutpoints != null) {
      data['spending_outpoints'] =
          _spendingOutpoints!.map((v) => v.toJson()).toList();
    }
    data['n'] = _n;
    data['tx_index'] = _txIndex;
    data['script'] = _script;
    return data;
  }
}

class SpendingOutpoints {
  int? _txIndex;
  int? _n;

  SpendingOutpoints({int? txIndex, int? n}) {
    _txIndex = txIndex;
    _n = n;
  }

  int? get txIndex => _txIndex;
  int? get n => _n;

  SpendingOutpoints.fromJson(Map<String, dynamic> json) {
    _txIndex = json['tx_index'];
    _n = json['n'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['tx_index'] = _txIndex;
    data['n'] = _n;
    return data;
  }
}

class Out {
  int? _type;
  bool? _spent;
  int? _value;
  int? _n;
  int? _txIndex;
  String? _script;
  String? _addr;

  Out(
      {int? type,
      bool? spent,
      int? value,
      int? n,
      int? txIndex,
      String? script,
      String? addr}) {
    _type = type;
    _spent = spent;
    _value = value;
    _n = n;
    _txIndex = txIndex;
    _script = script;
    _addr = addr;
  }

  int? get type => _type;
  bool? get spent => _spent;
  int? get value => _value;
  int? get n => _n;
  int? get txIndex => _txIndex;
  String? get script => _script;
  String? get addr => _addr;

  Out.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _spent = json['spent'];
    _value = json['value'];
    _n = json['n'];
    _txIndex = json['tx_index'];
    _script = json['script'];
    _addr = json['addr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['type'] = _type;
    data['spent'] = _spent;
    data['value'] = _value;
    data['n'] = _n;
    data['tx_index'] = _txIndex;
    data['script'] = _script;
    data['addr'] = _addr;
    return data;
  }
}
