// Importing dart:io file
import 'dart:io';

void main()
{
print('Entre com a temperatura em Celsius');
double Celsius = double.parse(stdin.readLineSync()!);

double Farenheit = Celsius*1.8 +32 ;
print('${Celsius} graus em Celsius é igual a ${Farenheit} raus em Farenheit');
}
