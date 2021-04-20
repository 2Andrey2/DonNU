#pragma once
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <ctime>
#include "Card.h"

class Hand
{
public:
	Hand();
	virtual ~Hand();
	//��������� ����� � ����
	void Add(Card* pCard);
	//������� ���� �� ����
	void Clear();
	//�������� ����� ����� ���� � ����.���������� ����
	//�������� 1 ��� 11 � ����������� �� ��������
	int GetTotal() const;
	std::vector<Card*> m_Cards;
};