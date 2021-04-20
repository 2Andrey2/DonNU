#include <iostream>
#include <ctime>
#include <iomanip>
#include <cstring>
#include "Vector.h"

Vector::Vector(int str1, int stolb1, int longg1)
{
	longg = longg1;
	str = str1;
	stolb = stolb1;
	mass1 = new double* [str];
	rez = new double[longg];
}
Vector::~Vector()
{
	for (int count = 0; count < str; count++)
		delete mass1[count];
	delete mass1;
	delete rez;
}
void Vector::Error()
{
	std::cout << "�� ����� �������� ������" << std::endl;
}
void Vector::initializeArray()
{
	for (int count = 0; count < longg; count++)
		rez[count] = sin(count) + cos(count);
}
void Vector::printArray1D()
{
	for (int i = 0; i < longg; i++)
	{
		std::cout << i[rez] << " ";
	}
	std::cout << std::endl;
}
void Vector::makeArray2D()
{
	for (size_t i = 0; i < str; ++i)
	{
		*(mass1 + i) = new double[stolb];
	}
	for (size_t i = 0; i < str; ++i)
	{
		for (size_t j = 0; j < stolb; ++j)
		{
			*(*(mass1 + i) + j) = *(rez + i * stolb + j);
		}
	}
}
void Vector::printArray2D()
{
	for (int count_row = 0; count_row < str; count_row++)
	{
		for (int count_column = 0; count_column < stolb; count_column++)
			std::cout << std::setw(10) << std::setprecision(10) << mass1[count_row][count_column] << "     ";
		std::cout << std::endl;
	}
}
void Vector::operator[] (int a) {

}
Vector& Vector::operator++()
{
	// ���� ��������� ���������� m_number �������� 8, �� ��������� ����� �� 0
	if (m_number == 8)
		m_number = 0;
	// � ��������� ������, ������ ����������� m_number �� �������
	else
		++m_number;

	return *this;
}

Vector& Vector::operator--()
{
	// ���� ��������� ���������� m_number �������� 0, �� ����������� m_number �������� 8
	if (m_number == 0)
		m_number = 8;
	// � ��������� ������, ������ ��������� m_number �� �������
	else
		--m_number;

	return *this;
}

Vector Vector::operator++(int)
{
	// ������� ��������� ������ ������ Number � ������� ��������� ���������� m_number
	Vector temp(m_number);

	// ���������� �������� ���������� ������ ������� ��� ���������� ���������� ��������� ���������� ������ ��������
	++(*this); // ���������� ����������

	// ���������� ��������� ������
	return temp;
}

Vector Vector::operator--(int)
{
	Vector temp(m_number);
	--(*this);
	return temp;
}

