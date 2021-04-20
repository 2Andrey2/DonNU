#pragma once
#include <windows.h>
#include "Game.h"

// ��������� �������
std::ostream& operator<<(std::ostream & os, const Card & aCard);
std::ostream& operator<<(std::ostream & os, const GenericPlayer & aGenericPlayer);
int main()
{
	setlocale(LC_ALL, "Russian");
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	std::cout << "\t\t����� ���������� � Blackjack!\n\n";
	int numPlayers = 0;
	while (numPlayers < 1 || numPlayers > 7)
	{
		std::cout << "������� �������? (1 - 7): ";
		std::cin >> numPlayers;
	}
	std::vector<int> Rates;
	int Rate = 0;
	std::vector<std::string> names;
	std::string name;
	for (int i = 0; i < numPlayers; ++i)
	{
		std::cout << "������� ��� ������: ";
		std::cin >> name;
		names.push_back(name);
		std::cout << "������� ��������� ����� ����� � ������: ";
		std::cin >> Rate;
		Rates.push_back(Rate);
	}
	std::cout << std::endl;
	// ������� ����
	Game aGame(names,Rates);
	char again = '�';
	while (again != 'n' && again != 'N')
	{
		aGame.Pl��();
		if (aGame.isTheremoney == 1)
		{
			std::cout << "\n������ ������� �����? (Y/N): ";
			std::cin >> again;
		}
		else
		{
			std::cout << "� ������� ��������� ������";
			break;
			throw 1;
		}
	}
	return 0;
}