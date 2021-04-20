#include "Card.h"
#include <windows.h>

Card::Card(rank r, suit s, bool ifu) : m_Rank(r), m_Suit(s), m_IsFaceUp(ifu)
{}
int Card::GetValue() const
{
	// ���� ����� ����������� ����� ����.�� �������� ����� �
	int value = 0;
	if (m_IsFaceUp)
	{
		// �������� - ��� �����.��������� �� �����
		value = m_Rank;
		// �������� ����� 10 ��� �������� ����
		if (value > 10)
		{
			value = 10;
		}
	}
	return value;
}
void Card::Flip()
{
	m_IsFaceUp = !(m_IsFaceUp);
}

std::ostream& operator<<(std::ostream& os, const Card& aCard)
{
	SetConsoleCP(866);
	SetConsoleOutputCP(866);
	const std::string RANKS[] = { "�", "�", "2", "�", "4", "5", "6", "7", "8", "9",
	"10", "J", "�", "�" };
	int SUI�S[] = { 3, 4, 5, 6 };
	if (aCard.m_IsFaceUp)
	{
		os << RANKS[aCard.m_Rank] << (char)SUI�S[aCard.m_Suit];
	}
	else
	{
		os << "��";
	}
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	return os;
}
