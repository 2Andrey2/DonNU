#pragma once
class Fraction
{
private:
    static int counter; // �� ������� ����������� �������
    int num, den;
    void normalize();
    int gcf(int a, int b);
    int lcm(int a, int b);
public:
    Fraction() { }
    void counter1(int i) { counter = i; } // ������� ��������� ������
    void set(int n, int d) { num = n; den = d; normalize(); }
    int getNum() { return num; } //num
    int getDen() { return den; } //den
    Fraction Drobb1(Fraction other);
    Fraction Drobb2(Fraction other);
    void printAsFraction(Fraction, int); // ����� ����������� ������, ��� ��������
    void printAsFraction(Fraction, size_t);
    Fraction operator* (Fraction); // ���������� ��� �������� � .cpp ����� ����������.
    Fraction operator-(Fraction);
    Fraction operator+(Fraction);
    Fraction operator/(Fraction);
};

