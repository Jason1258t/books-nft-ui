import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/wallet_repository.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  final WalletRepository walletRepository;

  WalletCubit({required this.walletRepository}) : super(WalletInitial()) {
    emit(NoWallet());
  }

  creteWallet() {
    walletRepository.createWallet();
    emit(HasWallet());
  }

  deleteWallet() {
    walletRepository.deleteWallet();
    emit(NoWallet());
  }

  importWallet() => creteWallet();
}
