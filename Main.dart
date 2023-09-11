class Conta {
  String titular;
  double saldo;

  // Construtor
  Conta(this.titular, this.saldo);

  // Função para sacar dinheiro
  bool sacar(double valor) {
    if (valor > 0 && valor <= saldo) {
      saldo -= valor;
      return true;
    } else {
      print("Saldo insuficiente.");
      return false;
    }
  }

  // Função para depositar dinheiro
  void depositar(double valor) {
    if (valor > 0) {
      saldo += valor;
      print("Depósito de $valor realizado com sucesso.");
    } else {
      print("Valor inválido para depósito.");
    }
  }

  // Função para transferir dinheiro para outra conta
  bool transferir(double valor, Conta destino) {
    if (valor > 0 && valor <= saldo) {
      saldo -= valor;
      destino.depositar(valor);
      print("Transferência de $valor para a conta de ${destino.titular} realizada com sucesso.");
      return true;
    } else {
      print("Saldo insuficiente para realizar a transferência.");
      return false;
    }
  }

  // Função para mostrar o saldo da conta
  void mostrarSaldo() {
    print("Saldo da conta de $titular: R\$ $saldo");
  }
}

void main() {
  // Exemplo de uso da classe Conta
  Conta conta1 = Conta("João", 1000.0);
  Conta conta2 = Conta("Maria", 500.0);

  conta1.mostrarSaldo();
  conta2.mostrarSaldo();

  conta1.depositar(200.0);
  conta1.mostrarSaldo();

  conta1.sacar(300.0);
  conta1.mostrarSaldo();

  conta1.transferir(400.0, conta2);
  conta1.mostrarSaldo();
  conta2.mostrarSaldo();
}
