#pragma once

#include "ILoggable.h"

class ExpressionEvaluator:ILoggable
{
protected:
	int number; // ���������� ���������
	double* massOret; // ������ ��������� � ������������ ������� (���������� � ������������)
	int masssize;
public:
	ExpressionEvaluator(); // ��������� ������ ��� 20
	ExpressionEvaluator(int); // ��������� ������ ��� n ���������
	virtual double calculate() = 0; // ����� ����������� �������/�����
	void logToScreen(); // ��������������� �� ����������� ������
	void logToFile(const std::string& filename); // ��������������� �� ����������� ������
	void setOperand(size_t pos, double value) { massOret[pos] = value; }; // ��������� ������ �������
	void setOperands(double ops[], size_t n); // ��������� ������ �������� (���������� � cpp) 
	virtual ~ExpressionEvaluator(); // ���������� �����������
};

