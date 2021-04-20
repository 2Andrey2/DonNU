#pragma once
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <ctime>
#include "Hand.h"

class GenericPlayer : public Hand
{
	friend std::ostream& operator<<(std::ostream& os, const GenericPlayer& aGenericPlayer);
public:
	GenericPlayer() {};
	GenericPlayer(const std::string& name, const int& Rates);
	virtual ~GenericPlayer();
	//������ ������
	void betAnnouncement();
	//����������.����� �� ����� ���������� ����� �����
	virtual bool IsHitting() const = 0;
	//���������� ��������.���� ����� ����� ������� - 11 ����� �����.������� 21
	bool IsBusted() const;
	// ���������.��� ����� ����� �������
	void Bust() const;
	// ��������� �������
	void Vin(int);
	// ������� ������ � �������
	void Money();
	// �������� - � ������ "��������"
	bool Blackjack_P = 0;
	// ������
	int Rate;
	// ���� �� �����
	int cardsInhand = 0;
	// ��������� ����������� ������ � ������
	bool Split(Hand& aHand);
	// ��� ������ ������, ���������� ��� ������������ ������
	std::string m_Name_Father1 = "";
	std::string m_Name;
protected:
	int Rate_now;
};


