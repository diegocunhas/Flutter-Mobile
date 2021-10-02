// Importing dart:io file
import 'dart:io';

void main()
{
print('Entre com a cotação do dolar');
double cot = double.parse(stdin.readLineSync()!);
print('Entre com o montante de dolares que deseja converter');
double dolar = double.parse(stdin.readLineSync()!);

double real = dolar*cot ;
print('${dolar} dolares a uma cotação de ${cot} dolares/real equivale a ${real} reais');
}
