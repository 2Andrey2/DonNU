#include "ZAD1.h"

void ZAD1::maimzad()
{
	DataManager<int> manager;
	manager.push(-9); // ��� � ������ 1 �������
	int a[60] = { 0 };
	manager.push(a, 60); // ��� � ������ 61 �������
	int x = manager.peek(); // ������ ��������� ������� (��� ����������)
	for (int i = 1; i < 15; ++i)
	{
		manager.push(i); // ����� �� ��������� �������� ������
	} // ��������� �������� 64 ��������� � ���� dump.dat
	x = manager.pop(); // ������ � ������ 11 ���������
	// ����� ���() ����� 10
	DataManager<char> char_manager; // ����� ������������� ������� ��� char
	char_manager.push('h');
	char_manager.push('e');
	char_manager.push('l');
	char_manager.push('l');
	char_manager.push('o');
	char ch = char_manager.popUpper('f'); // ���� ����� ���� ������ ��� char
	std::cout << ch << std::endl;
}
