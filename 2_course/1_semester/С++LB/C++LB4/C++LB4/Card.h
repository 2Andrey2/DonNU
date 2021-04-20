// Blackjack
// ������ ���������� ������ ���� Blackjack : �� ������ �� ���� �������
#pragma once
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <ctime>

class Card
{
public:
	enum rank {��� = 1,TWO, THREE,FOUR,FIVE,SIX,SEVEN,EIGHT,NINE,TEN,JACK,QUEEN,KING};
	enum suit { CLUBS,DIAMONDS,HEARTS,SPADES };
	// ����������� ��������, ����� ����� ���� ��������� ������
	// ���� Card � ����������� ����� ������
	friend std::ostream& operator<<(std::ostream& os, const Card& aCard);
	Card(rank r = ���,suit s = SPADES, bool ifu = true);
	// ���������� �������� �����.�� 1 �� 11
	int GetValue() const;
	// �������������� ����� : �����.������� ����� �����.
	// ���������������� ����� ���� � ��������
	void Flip();
private:
	rank m_Rank;
	suit m_Suit;
	bool m_IsFaceUp;
};