#pragma once
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <ctime>
#include "GenericPlayer.h"

class Player : public GenericPlayer
{
public:
	Player() {};
	Player(const std::string& name, const int& Rates);
	virtual ~Player();
	//����������.����� �� ����� ���������� ����� �����
	virtual bool IsHitting() const;
	// ���������.��� ����� �������
	void Win() const;
	// ���������.��� ����� ��������
	void Lose() const;
	// ��������� �����
	void Push() const;
	std::vector<Player>::iterator m_Name_Father;
};