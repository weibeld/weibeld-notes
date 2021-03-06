FasdUAS 1.101.10   ��   ��    k             l      �� ��   ��
This script capitalizes the titles of the selected publications 
in Bibdesk using smart capitalization. I.e., 'small' words 
such as the, a, in, for, from, about, ..., are not capitalized, 
unless at the beginning of a sentence, and capitalization is 
supressed between matching braces {}. Before capitalization, 
it protects the titles by adding apropriate braces, 
and removes newlines from the titles. 
This script requires Bibdesk 0.97 or higher. 
       	  l     ������  ��   	  
  
 l     �� ��    1 + load the script library for capitalization         l     ��  r         l     ��  I    �� ��
�� .sysoloadscpt        alis  4     �� 
�� 
file  l 	   ��  l    ��  b        l   	 ��  I   	��  
�� .earsffdralis        afdr  m    ��
�� afdrcusr  �� ��
�� 
rtyp  m    ��
�� 
TEXT��  ��    m   	 
   0 *Library:ScriptingAdditions:Capitalize.scpt   ��  ��  ��  ��    o      ���� 0 capitalizelib capitalizeLib��        l     ��  ��     1 + load the script library for capitalization      ! " ! l   % #�� # r    % $ % $ l   # &�� & I   #�� '��
�� .sysoloadscpt        alis ' 4    �� (
�� 
file ( l 	   )�� ) l    *�� * b     + , + l    -�� - I   �� . /
�� .earsffdralis        afdr . m    ��
�� afdrcusr / �� 0��
�� 
rtyp 0 m    ��
�� 
TEXT��  ��   , m     1 1 J DLibrary:Application Support:BibDesk:Scripts:Add Protect Strings.scpt   ��  ��  ��  ��   % o      ���� 0 
protectlib 
protectLib��   "  2 3 2 l     �� 4��   4 . ( load the Error Reporting script library    3  5 6 5 l  & 8 7�� 7 r   & 8 8 9 8 l  & 6 :�� : I  & 6�� ;��
�� .sysoloadscpt        alis ; 4   & 2�� <
�� 
file < l 	 ( 1 =�� = l  ( 1 >�� > b   ( 1 ? @ ? l  ( / A�� A I  ( /�� B C
�� .earsffdralis        afdr B m   ( )��
�� afdrcusr C �� D��
�� 
rtyp D m   * +��
�� 
TEXT��  ��   @ m   / 0 E E 5 /Library:ScriptingAdditions:Error Reporting.scpt   ��  ��  ��  ��   9 o      ���� 0 errorlib errorLib��   6  F G F l     �� H��   H + % we only report all errors at the end    G  I J I l  9 I K�� K O   9 I L M L k   = H N N  O P O I   = B�������� &0 delayreporterrors delayReportErrors��  ��   P  Q�� Q r   C H R S R m   C D T T  BibdeskScriptErrors    S n      U V U o   E G���� ,0 defaulterrorfilename defaultErrorFileName V  g   D E��   M o   9 :���� 0 errorlib errorLib��   J  W X W l     ������  ��   X  Y Z Y l  J9 [ \ [ O   J9 ] ^ ] k   N8 _ _  ` a ` I  N S������
�� .miscactvnull��� ��� null��  ��   a  b c b l  T T������  ��   c  d e d l  T T�� f��   f @ : without document, there is no selection, so nothing to do    e  g h g Z   T � i j���� i =   T _ k l k l  T ] m�� m I  T ]�� n��
�� .corecnte****       **** n 2  T Y��
�� 
docu��  ��   l m   ] ^����   j k   b � o o  p q p I  b g������
�� .sysobeepnull��� ��� long��  ��   q  r�� r I  h ��� s t
�� .sysodlogaskr        TEXT s m   h k u u  No documents found.    t �� v w
�� 
btns v J   n s x x  y�� y m   n q z z  �   ��   w �� { |
�� 
dflt { m   v w����  | �� }��
�� 
givu } m   z {���� ��  ��  ��  ��   h  ~  ~ r   � � � � � l  � � ��� � n   � � � � � 1   � ���
�� 
sele � 4   � ��� �
�� 
docu � m   � ����� ��   � o      ���� "0 thepublications thePublications   � � � l  � �������  ��   �  � � � l  � ��� ���   � ) # protect chars between balanced {}     �  � � � r   � � � � � m   � � � �  {    � n      � � � o   � ����� $0 startprotectchar startProtectChar � o   � ����� 0 capitalizelib capitalizeLib �  � � � r   � � � � � m   � � � �  }    � n      � � � o   � �����  0 endprotectchar endProtectChar � o   � ����� 0 capitalizelib capitalizeLib �  � � � r   � � � � � m   � � � �  {    � n      � � � o   � ����� $0 startprotectchar startProtectChar � o   � ����� 0 
protectlib 
protectLib �  � � � r   � � � � � m   � � � �  }    � n      � � � o   � �����  0 endprotectchar endProtectChar � o   � ����� 0 
protectlib 
protectLib �  � � � l  � �������  ��   �  � � � X   �' ��� � � Q   �" � � � � k   � � �  � � � r   � � � � � n   � � � � � 1   � ���
�� 
titl � o   � ����� 0 thepub thePub � o      ���� 0 thetitle theTitle �  � � � Z  � � � ����� � E   � � � � � o   � ����� 0 thetitle theTitle � o   � ���
�� 
ret  � l 	 � � ��� � r   � � � � � n  � � � � � I   � ��� �����  0 removenewlines removeNewlines �  ��� � o   � ����� 0 thetitle theTitle��  ��   �  f   � � � o      ���� 0 thetitle theTitle��  ��  ��   �  ��� � r   � � � � n  � � � � I   ��� ����� 0 
capitalize   �  ��� � n  � � � � I   ��� ����� 0 protectstring protectString �  ��� � o   � ���� 0 thetitle theTitle��  ��   � o   � ����� 0 
protectlib 
protectLib��  ��   � o   � ����� 0 capitalizelib capitalizeLib � n       � � � 1  	��
�� 
titl � o  	���� 0 thepub thePub��   � R      � � �
� .ascrerr ****      � **** � o      �~�~ 0 errormessage errorMessage � �} ��|
�} 
errn � o      �{�{ 0 errornumber errorNumber�|   � O " � � � I  !�z ��y�z 0 reporterror reportError �  � � � o  �x�x 0 errormessage errorMessage �  ��w � o  �v�v 0 errornumber errorNumber�w  �y   � o  �u�u 0 errorlib errorLib�� 0 thepub thePub � o   � ��t�t "0 thepublications thePublications �  � � � l ((�s�r�s  �r   �  � � � r  (6 � � � o  (+�q�q "0 thepublications thePublications � n       � � � 1  15�p
�p 
sele � 4  +1�o �
�o 
docu � m  /0�n�n  �  ��m � l 77�l�k�l  �k  �m   ^ m   J K � ��null     ߀��  �BibDesk.app�0� ��Lid� 2����@   �����Q����P�Lk��`(  �����  BDSK   alis    P  Macintosh HD               ��+GH+    �BibDesk.app                                                     Quɾ��        ����  	                Applications    ��'      ��c�      �  %Macintosh HD:Applications:BibDesk.app     B i b D e s k . a p p    M a c i n t o s h   H D  Applications/BibDesk.app  / ��   \   Bibdesk    Z  � � � l     �j�i�j  �i   �  � � � l     �h ��h   �   see if we had any errors    �  � � � l :D ��g � O :D � � � I  >C�f�e�d�f  0 checkforerrors checkForErrors�e  �d   � o  :;�c�c 0 errorlib errorLib�g   �  � � � l     �b�a�b  �a   �  � � � l     �` ��`   �   we're done!    �  � � � l EJ ��_ � I EJ�^�]�\
�^ .sysobeepnull��� ��� long�]  �\  �_   �  � � � l Kp ��[ � I Kp�Z � �
�Z .sysodlogaskr        TEXT � b  KZ � � � b  KV � � � m  KN    Changed     � l NU�Y I NU�X�W
�X .corecnte****       **** o  NQ�V�V "0 thepublications thePublications�W  �Y   � m  VY   publications.    � �U
�U 
btns J  ]b �T m  ]`  �   �T   �S	

�S 
dflt	 m  ef�R�R 
 �Q�P
�Q 
givu m  ij�O�O �P  �[   �  l     �N�M�N  �M    i      I      �L�K�L  0 removenewlines removeNewlines �J o      �I�I 0 	thestring 	theString�J  �K   k     s  Z     %�H�G E      o     �F�F 0 	thestring 	theString b     o    �E
�E 
ret  1    �D
�D 
spac k    !  r     !  b    "#" o    	�C
�C 
ret # 1   	 
�B
�B 
spac! n     $%$ 1    �A
�A 
txdl% 1    �@
�@ 
ascr &'& r    ()( n    *+* 2   �?
�? 
citm+ o    �>�> 0 	thestring 	theString) o      �=�= 	0 parts  ' ,-, r    ./. 1    �<
�< 
spac/ n     010 1    �;
�; 
txdl1 1    �:
�: 
ascr- 2�92 r    !343 c    565 o    �8�8 	0 parts  6 m    �7
�7 
TEXT4 o      �6�6 0 	thestring 	theString�9  �H  �G   787 Z   & G9:�5�49 E   & );<; o   & '�3�3 0 	thestring 	theString< o   ' (�2
�2 
ret : k   , C== >?> r   , 1@A@ o   , -�1
�1 
ret A n     BCB 1   . 0�0
�0 
txdlC 1   - .�/
�/ 
ascr? DED r   2 7FGF n   2 5HIH 2  3 5�.
�. 
citmI o   2 3�-�- 0 	thestring 	theStringG o      �,�, 	0 parts  E JKJ r   8 =LML 1   8 9�+
�+ 
spacM n     NON 1   : <�*
�* 
txdlO 1   9 :�)
�) 
ascrK P�(P r   > CQRQ c   > ASTS o   > ?�'�' 	0 parts  T m   ? @�&
�& 
TEXTR o      �%�% 0 	thestring 	theString�(  �5  �4  8 UVU V   H pWXW k   R kYY Z[Z r   R Y\]\ b   R U^_^ 1   R S�$
�$ 
spac_ 1   S T�#
�# 
spac] n     `a` 1   V X�"
�" 
txdla 1   U V�!
�! 
ascr[ bcb r   Z _ded n   Z ]fgf 2  [ ]� 
�  
citmg o   Z [�� 0 	thestring 	theStringe o      �� 	0 parts  c hih r   ` ejkj 1   ` a�
� 
spack n     lml 1   b d�
� 
txdlm 1   a b�
� 
ascri n�n r   f kopo c   f iqrq o   f g�� 	0 parts  r m   g h�
� 
TEXTp o      �� 0 	thestring 	theString�  X E   L Qsts o   L M�� 0 	thestring 	theStringt b   M Puvu 1   M N�
� 
spacv 1   N O�
� 
spacV w�w L   q sxx o   q r�� 0 	thestring 	theString�   y�y l     ���  �  �       �z{|�  z ���  0 removenewlines removeNewlines
� .aevtoappnull  �   � ****{ ��
�	}~��  0 removenewlines removeNewlines�
 ��   �� 0 	thestring 	theString�	  } ��� 0 	thestring 	theString� 	0 parts  ~ ���� ����
� 
ret 
� 
spac
� 
ascr
�  
txdl
�� 
citm
�� 
TEXT� t���% ��%��,FO��-E�O���,FO��&E�Y hO�� ���,FO��-E�O���,FO��&E�Y hO 'h���%��%��,FO��-E�O���,FO��&E�[OY��O�| �����������
�� .aevtoappnull  �   � ****� k    p��  ��  !��  5��  I��  Y��  ���  ���  �����  ��  ��  � �������� 0 thepub thePub�� 0 errormessage errorMessage�� 0 errornumber errorNumber� 2���������� ���� 1�� E���� T�� ��������� u�� z������������ ��� ��� � ������������������������ 
�� 
file
�� afdrcusr
�� 
rtyp
�� 
TEXT
�� .earsffdralis        afdr
�� .sysoloadscpt        alis�� 0 capitalizelib capitalizeLib�� 0 
protectlib 
protectLib�� 0 errorlib errorLib�� &0 delayreporterrors delayReportErrors�� ,0 defaulterrorfilename defaultErrorFileName
�� .miscactvnull��� ��� null
�� 
docu
�� .corecnte****       ****
�� .sysobeepnull��� ��� long
�� 
btns
�� 
dflt
�� 
givu�� 
�� .sysodlogaskr        TEXT
�� 
sele�� "0 thepublications thePublications�� $0 startprotectchar startProtectChar��  0 endprotectchar endProtectChar
�� 
kocl
�� 
cobj
�� 
titl�� 0 thetitle theTitle
�� 
ret ��  0 removenewlines removeNewlines�� 0 protectstring protectString�� 0 
capitalize  �� 0 errormessage errorMessage� ������
�� 
errn�� 0 errornumber errorNumber��  �� 0 reporterror reportError��  0 checkforerrors checkForErrors��q*����l �%/j E�O*����l �%/j E�O*����l �%/j E�O� *j+ O�*�,FUO� �*j O*a -j j  $*j Oa a a kva ka ma  Y hO*a k/a ,E` Oa �a ,FOa �a  ,FOa !�a ,FOa "�a  ,FO i_ [a #a $l kh   =�a %,E` &O_ &_ ' )_ &k+ (E` &Y hO��_ &k+ )k+ *�a %,FW X + ,� 	*��l+ -U[OY��O_ *a k/a ,FOPUO� *j+ .UO*j Oa /_ j %a 0%a a 1kva ka ma  ascr  ��ޭ