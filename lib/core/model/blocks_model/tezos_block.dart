class TezosBlockModel {
  int? _cycle;
  int? _level;
  String? _hash;
  String? _timestamp;
  int? _proto;
  int? _payloadRound;
  int? _blockRound;
  int? _validations;
  int? _deposit;
  int? _rewardDelegated;
  int? _rewardStakedOwn;
  int? _rewardStakedEdge;
  int? _rewardStakedShared;
  int? _bonusDelegated;
  int? _bonusStakedOwn;
  int? _bonusStakedEdge;
  int? _bonusStakedShared;
  int? _fees;
  bool? _nonceRevealed;
  int? _lbToggleEma;
  int? _aiToggleEma;
  int? _rewardLiquid;
  int? _bonusLiquid;
  int? _reward;
  int? _bonus;
  int? _priority;
  bool? _lbEscapeVote;
  int? _lbEscapeEma;

  TezosBlockModel(
      {int? cycle,
      int? level,
      String? hash,
      String? timestamp,
      int? proto,
      int? payloadRound,
      int? blockRound,
      int? validations,
      int? deposit,
      int? rewardDelegated,
      int? rewardStakedOwn,
      int? rewardStakedEdge,
      int? rewardStakedShared,
      int? bonusDelegated,
      int? bonusStakedOwn,
      int? bonusStakedEdge,
      int? bonusStakedShared,
      int? fees,
      bool? nonceRevealed,
      int? lbToggleEma,
      int? aiToggleEma,
      int? rewardLiquid,
      int? bonusLiquid,
      int? reward,
      int? bonus,
      int? priority,
      bool? lbEscapeVote,
      int? lbEscapeEma}) {
    _cycle = cycle;
    _level = level;
    _hash = hash;
    _timestamp = timestamp;
    _proto = proto;
    _payloadRound = payloadRound;
    _blockRound = blockRound;
    _validations = validations;
    _deposit = deposit;
    _rewardDelegated = rewardDelegated;
    _rewardStakedOwn = rewardStakedOwn;
    _rewardStakedEdge = rewardStakedEdge;
    _rewardStakedShared = rewardStakedShared;
    _bonusDelegated = bonusDelegated;
    _bonusStakedOwn = bonusStakedOwn;
    _bonusStakedEdge = bonusStakedEdge;
    _bonusStakedShared = bonusStakedShared;
    _fees = fees;
    _nonceRevealed = nonceRevealed;
    _lbToggleEma = lbToggleEma;
    _aiToggleEma = aiToggleEma;
    _rewardLiquid = rewardLiquid;
    _bonusLiquid = bonusLiquid;
    _reward = reward;
    _bonus = bonus;
    _priority = priority;
    _lbEscapeVote = lbEscapeVote;
    _lbEscapeEma = lbEscapeEma;
  }

  int? get cycle => _cycle;
  int? get level => _level;
  String? get hash => _hash;
  String? get timestamp => _timestamp;
  int? get proto => _proto;
  int? get payloadRound => _payloadRound;
  int? get blockRound => _blockRound;
  int? get validations => _validations;
  int? get deposit => _deposit;
  int? get rewardDelegated => _rewardDelegated;
  int? get rewardStakedOwn => _rewardStakedOwn;
  int? get rewardStakedEdge => _rewardStakedEdge;
  int? get rewardStakedShared => _rewardStakedShared;
  int? get bonusDelegated => _bonusDelegated;
  int? get bonusStakedOwn => _bonusStakedOwn;
  int? get bonusStakedEdge => _bonusStakedEdge;
  int? get bonusStakedShared => _bonusStakedShared;
  int? get fees => _fees;
  bool? get nonceRevealed => _nonceRevealed;
  int? get lbToggleEma => _lbToggleEma;
  int? get aiToggleEma => _aiToggleEma;
  int? get rewardLiquid => _rewardLiquid;
  int? get bonusLiquid => _bonusLiquid;
  int? get reward => _reward;
  int? get bonus => _bonus;
  int? get priority => _priority;
  bool? get lbEscapeVote => _lbEscapeVote;
  int? get lbEscapeEma => _lbEscapeEma;

  TezosBlockModel.fromJson(Map<String, dynamic> json) {
    _cycle = json['cycle'];
    _level = json['level'];
    _hash = json['hash'];
    _timestamp = json['timestamp'];
    _proto = json['proto'];
    _payloadRound = json['payloadRound'];
    _blockRound = json['blockRound'];
    _validations = json['validations'];
    _deposit = json['deposit'];
    _rewardDelegated = json['rewardDelegated'];
    _rewardStakedOwn = json['rewardStakedOwn'];
    _rewardStakedEdge = json['rewardStakedEdge'];
    _rewardStakedShared = json['rewardStakedShared'];
    _bonusDelegated = json['bonusDelegated'];
    _bonusStakedOwn = json['bonusStakedOwn'];
    _bonusStakedEdge = json['bonusStakedEdge'];
    _bonusStakedShared = json['bonusStakedShared'];
    _fees = json['fees'];
    _nonceRevealed = json['nonceRevealed'];
    _lbToggleEma = json['lbToggleEma'];
    _aiToggleEma = json['aiToggleEma'];
    _rewardLiquid = json['rewardLiquid'];
    _bonusLiquid = json['bonusLiquid'];
    _reward = json['reward'];
    _bonus = json['bonus'];
    _priority = json['priority'];
    _lbEscapeVote = json['lbEscapeVote'];
    _lbEscapeEma = json['lbEscapeEma'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['cycle'] = _cycle;
    data['level'] = _level;
    data['hash'] = _hash;
    data['timestamp'] = _timestamp;
    data['proto'] = _proto;
    data['payloadRound'] = _payloadRound;
    data['blockRound'] = _blockRound;
    data['validations'] = _validations;
    data['deposit'] = _deposit;
    data['rewardDelegated'] = _rewardDelegated;
    data['rewardStakedOwn'] = _rewardStakedOwn;
    data['rewardStakedEdge'] = _rewardStakedEdge;
    data['rewardStakedShared'] = _rewardStakedShared;
    data['bonusDelegated'] = _bonusDelegated;
    data['bonusStakedOwn'] = _bonusStakedOwn;
    data['bonusStakedEdge'] = _bonusStakedEdge;
    data['bonusStakedShared'] = _bonusStakedShared;
    data['fees'] = _fees;
    data['nonceRevealed'] = _nonceRevealed;
    data['lbToggleEma'] = _lbToggleEma;
    data['aiToggleEma'] = _aiToggleEma;
    data['rewardLiquid'] = _rewardLiquid;
    data['bonusLiquid'] = _bonusLiquid;
    data['reward'] = _reward;
    data['bonus'] = _bonus;
    data['priority'] = _priority;
    data['lbEscapeVote'] = _lbEscapeVote;
    data['lbEscapeEma'] = _lbEscapeEma;
    return data;
  }
}
