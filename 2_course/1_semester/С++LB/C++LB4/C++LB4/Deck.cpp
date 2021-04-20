#include "Deck.h"

Deck::Deck()
{
	m_Cards.reserve(52);
	Populate();
}
Deck::~Deck()
{}
void Deck::Populate()
{
	//Clear();
	// ������� ����������� ������
	for (int s = Card::CLUBS; s <= Card::SPADES; ++s)
	{
		for (int r = Card::���; r <= Card::KING; ++r)
		{
			Add(new Card(static_cast<Card::rank>(r), static_cast<Card::suit>(s)));
		}
	}
}
void Deck::Shuffl�()
{
	random_shuffle(m_Cards.begin(), m_Cards.end());
}
void Deck::Deal(Hand& aHand)
{
	if (!m_Cards.empty())
	{
		aHand.Add(m_Cards.back());
		m_Cards.pop_back();
	}
	else
	{
		std::cout << "��� ����. ���������� ����������. ";
	}
}
void Deck::AdditionalCards(GenericPlayer& aGenericPlayer)
{
	std::cout << std::endl;
	// ���������� ��������� ����� �� ��� ���.���� � ������ �� ���������
	// ������� ��� ���� �� ����� ����� ��� ���� �����
	if (aGenericPlayer.GetTotal() == 21) { goto metka1; }
	while (!(aGenericPlayer.IsBusted()) && aGenericPlayer.IsHitting())
	{
		if (aGenericPlayer.cardsInhand != 6)
		{
			Deal(aGenericPlayer);
			std::cout << aGenericPlayer << std::endl;

			if (aGenericPlayer.IsBusted())
				aGenericPlayer.Bust();
			if (aGenericPlayer.GetTotal() == 21)
			{
				metka1:
				aGenericPlayer.Blackjack_P = true;
				std::cout <<"� ��� Blackjack �� ��������!" << std::endl;
				return;
			}
			aGenericPlayer.cardsInhand++;
		}
		else
		{
			std::cout << "������ ����� ������!";
			return;
		}
	}
}
