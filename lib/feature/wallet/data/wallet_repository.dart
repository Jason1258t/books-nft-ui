class WalletRepository {
  bool _haveWallet = false;

  set _setHaveWallet(bool val) => _haveWallet = val;

  void createWallet() => _setHaveWallet = true;

  void deleteWallet() => _setHaveWallet = false;

  bool get haveWallet => _haveWallet;
}
