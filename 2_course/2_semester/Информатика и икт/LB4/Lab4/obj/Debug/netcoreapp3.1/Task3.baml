   M S B A M L   `   `   `  ����?  ;Lab4, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:Lab4Lab4  5   	       
Lab4.Task3   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   $localclr-namespace:Lab4     5   	     � Title$  Task2��5      $	��575��6   $	��800��6+    � 	Resources 5	         MyButton �� 
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
����i��$��TASK 3��5%   *   $��30(�68   $��Gotic)�6F   6[   �� 5&   
   -   5        $��15(�5&      ���#ececec
����i��$��1��5'   &   $��40��5(      $��40��6   $
��Left=�5)      $��32,23,0,287q�5*      
������ #��[  5,       5-      ��%`   '��       �� 5.      " ��6   .�5/      ��  �@��CornerRadius$	 100��65   50      51      52      �� 53   
   -   5        $��15(�53      ���#ececec
����i��$��2��54   &   $��40��55      $��40��6   $
��Left=�56      $��99,23,0,287q�57      
������ #��[  59       5:      ��%`   '��       �� 5;      " ��6   .�5<      ��  �@��CornerRadius$	 100��65   5=      5>      5?      �� 5@   
   -   5        $��15(�5@      ���#ececec
����i��$��4��5A   "   $��40��5B      $��40��6   $
��Left=�5C      $��166,23,0,287q�5D      
������  5G      ��%`   '��       �� 5H      " ��6   .�5I      ��  �@��CornerRadius$	 100��65   5J      5K      ��5L      �� 5M      
 �� ResourceKey$
 MyButton��6!   5O      �� 5P   
   -   5        $��15(�5P      ���#ececec
����p��$��	CALCULATE��5Q   +   $��2��6?   
������ $��322,100,348,150q�5S      $��50��6*    5U      ��%_   '��       �� 5V      " ��6   .�5W      ��  �@��CornerRadius$ 20��65   5X      5Y      ��5Z      �� 5[      $
 MyButton��6!   5]      �� 5^   
   
����i��$��Arial)�6)   $��Number:��6<   $��250,179,483,142q�6K   $��20(�6d   $��Medium"�6r   �� 5_   
   -   5         ��Name$ textbox1��5_   &   $��0q�6   $��Arial)�6c   $	��Top=�6v   $��5q�6�   $��22(�6�    �� TextAlignment$ Center=�6�   $��348,175,310,0q�6�   $��37��6�   ]� 5`   
   
����i��$
��Left=�6)   $��2��6D   $��False��6O   $��348,209,0,0q�6e   $	��Top=�6z   $	��168��6�   �� 5a   
   -   5         ��Name$ Formula��5a      $��Center=�6%   $��Center=�6@   
����i��$��Arial)�6r   $��0,296,27,249q�6�   $��35(�6�   $��Medium"�6�   $��3��6�   5b      5c      