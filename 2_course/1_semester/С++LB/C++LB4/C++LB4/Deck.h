#pragma once
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <ctime>
#include "Hand.h"
#include "Card.h"
#include "GenericPlayer.h"

class Deck : public Hand
{
public:
	Deck();
	virtual ~Deck();
	// ������� ����������� ������ �� 52 ����
	void Populate();
	// ������ �����
	void Shuffl�();
	// ������� ���� ����� � ����
	void Deal(Hand& aHand);
	// ���� �������������� ����� ������
	void AdditionalCards(GenericPlayer& aGenericPlayer);
};
