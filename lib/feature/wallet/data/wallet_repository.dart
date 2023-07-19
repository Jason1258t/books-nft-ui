class WalletRepository {
  bool _haveWallet = false;

  set _setHaveWallet(bool val) => _haveWallet = val;

  void createWallet() => _setHaveWallet = true;

  bool get haveWallet => _haveWallet;
}
