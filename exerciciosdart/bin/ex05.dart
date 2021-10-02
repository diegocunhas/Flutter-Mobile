// Importing dart:io file
import 'dart:io';

void main()
{
  List listaProdutos = [];
  for(int i=1; i<=5;i++)
  {
    print('Entre com o valor do ${i}º produto');
    double valorProduto = double.parse(stdin.readLineSync()!);
    listaProdutos.add(valorProduto);
  }

print('Entre com o valor pago');
double pagamento = double.parse(stdin.readLineSync()!);

double troco = pagamento - (listaProdutos[1]+listaProdutos[2]+listaProdutos[3]+listaProdutos[4]+listaProdutos[0]);
print('O troco é de ${troco} reais.');
}
