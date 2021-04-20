#pragma once
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <ctime>
#include "GenericPlayer.h"

class House : public GenericPlayer
{
public:
	House() {};
	House(const std::string& name, int);
		virtual ~House();
	// ����������.����� �� ����� ���������� ����� �����
		virtual bool IsHitting() const;
	// �������������� ������ �����
	void FlipFirstCard();
	// ���� �� �����
	int cardsInhand = 0;
	// �������� - � ����� "��������"
	bool Blackjack_P = 0;
};

