   M S B A M L   `   `   `  ����?  ;Lab4, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:Lab4Lab4  5   	       
Lab4.Task4   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   $localclr-namespace:Lab4     5   	     � Title$  Task2��5      $	��575��6   $	��800��6*    � 	Resources 5	         MyButton �� 
TargetType �� Property �� Value �� 
TargetType �� Triggers P� Property P� Value��%�  &	        �� 5
   
   " ��6!   .�5      ��  �@�OverridesDefaultStyle$
 True��66   �� 5       �@�Cursor$
 Hand��6'   �� 5       � �� 5      �� 5      " ��6&   .R�5      �� $��border��6!   $��0q�6/   
���   �#��z��6W   ._�5      �� $��Center=�6/   $��Center=�6L   5       5      P� 5       �@J�IsMouseOver$
 True��6=   . �5   "   ��  �@J�Opacity$	 0.5Q�6<   5      5      5      5      5      .��5      � $��0,0,-26,-16q�6   	 � RowDefinitions	 5   
   �� 5      $	��350 �6   6+   �� 5       $
��116* �6   6-   �� 5!      $	��300 �6   6+   �� 5"      $	��18* �6   .+�5$   
   �� $��348,24,0,291q�6   $
��Left=�6*   
����i��$��TASK 4��5%   *   $��30(�68   $��Gotic)�6F   6[   �� 5&   
   -   5        $��15(�5&      ���#ececec
����i��$��1��5'   &   $��40��5(      $��40��6   $
��Left=�5)      $��32,23,0,287q�5*      
������ #��[  5,       5-      ��%`   '��       �� 5.      " ��6   .�5/      ��  �@��CornerRadius$	 100��65   50      51      52      �� 53   
   -   5        $��15(�53      ���#ececec
����i��$��2��54   &   $��40��55      $��40��6   $
��Left=�56      $��99,23,0,287q�57      
������ #��[  59       5:      ��%`   '��       �� 5;      " ��6   .�5<      ��  �@��CornerRadius$	 100��65   5=      5>      5?      �� 5@   
   -   5        $��15(�5@      ���#ececec
����i��$��3��5A   "   $��40��5B      $��40��6   $
��Left=�5C      $��166,23,0,287q�5D      
������  5G      ��%`   '��       �� 5H      " ��6   .�5I      ��  �@��CornerRadius$	 100��65   5J      5K      ��5L      �� 5M      
 �� ResourceKey$
 MyButton��6!   5O      �� 5P   
   -   5        $��15(�5P      ���#ececec
����p��$��	CALCULATE��5Q   +   $��2��6?   
������ $��321,100,349,150q�5S      $��50��6*    5U      ��%_   '��       �� 5V      " ��6   .�5W      ��  �@��CornerRadius$ 20��65   5X      5Y      ��5Z      �� 5[      $
 MyButton��6!   5]      �� 5^   
   -   5         ��Name$ 	Farengate��5^      $	��Top=�6'   $
��Left=�6?   
����i��$��Arial)�6o   $��186,302,0,0q�6�   $��20(�6�   $��Medium"�6�   �� 5_   
   $��Center=�6   $	��Top=�61   ���#30475e$��Arial)�6^    �� TextAlignment$ Center=�6q   $����Урожай яблок  в 1990 году составил 20 тонн. 
Далее каждые два года урожай уменьшался  на 20%.  
Начиная с какого года, будет собрано менее 2 тонн?��5`      $��25(�5a   O   $��Medium"�6]   $	��130��6q   $	��626��6~    J� RenderTransformOrigin$ 
0.48,0.493&�6�   $��	0,153,0,0q�6�   5b      5c      