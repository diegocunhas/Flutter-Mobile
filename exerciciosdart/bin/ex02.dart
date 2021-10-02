// Importing dart:io file
import 'dart:io';

void main()
{
print('Entre com o primeiro numero');
double n1 = double.parse(stdin.readLineSync()!);
print('Entre com o segundoo numero');
double n2 = double.parse(stdin.readLineSync()!);
print('Entre com o terceiiro numero');
double n3 = double.parse(stdin.readLineSync()!);
print('Entre com o quarto numero');
double n4 = double.parse(stdin.readLineSync()!);
double media = (n1+n2+n3+n4)/4;
print('A média aritmetica de ${n1}, ${n2}, ${n3} e ${n4} vale ${media}');
}
