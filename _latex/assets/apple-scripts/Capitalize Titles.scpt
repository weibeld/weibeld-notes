FasdUAS 1.101.10   ��   ��    k             l      �� ��   XR
This script capitalizes the titles of the selected publications 
in Bibdesk using smart capitalization. I.e., 'small' words 
such as the, a, in, for, from, about, ..., are not capitalized, 
unless at the beginning of a sentence, and capitalization is 
supressed between matching braces {}. 
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
   0 *Library:ScriptingAdditions:Capitalize.scpt   ��  ��  ��  ��    o      ���� 0 capitalizelib capitalizeLib��        l     ��  ��     . ( load the Error Reporting script library      ! " ! l   % #�� # r    % $ % $ l   # &�� & I   #�� '��
�� .sysoloadscpt        alis ' 4    �� (
�� 
file ( l 	   )�� ) l    *�� * b     + , + l    -�� - I   �� . /
�� .earsffdralis        afdr . m    ��
�� afdrcusr / �� 0��
�� 
rtyp 0 m    ��
�� 
TEXT��  ��   , m     1 1 5 /Library:ScriptingAdditions:Error Reporting.scpt   ��  ��  ��  ��   % o      ���� 0 errorlib errorLib��   "  2 3 2 l     �� 4��   4 + % we only report all errors at the end    3  5 6 5 l  & 6 7�� 7 O   & 6 8 9 8 k   * 5 : :  ; < ; I   * /�������� &0 delayreporterrors delayReportErrors��  ��   <  =�� = r   0 5 > ? > m   0 1 @ @  BibdeskScriptErrors    ? n      A B A o   2 4���� ,0 defaulterrorfilename defaultErrorFileName B  g   1 2��   9 o   & '���� 0 errorlib errorLib��   6  C D C l     ������  ��   D  E F E l  7 � G H G O   7 � I J I k   ; � K K  L M L I  ; @������
�� .miscactvnull��� ��� null��  ��   M  N O N l  A A������  ��   O  P Q P l  A A�� R��   R @ : without document, there is no selection, so nothing to do    Q  S T S Z   A p U V���� U =   A J W X W l  A H Y�� Y I  A H�� Z��
�� .corecnte****       **** Z 2  A D��
�� 
docu��  ��   X m   H I����   V k   M l [ [  \ ] \ I  M R������
�� .sysobeepnull��� ��� long��  ��   ]  ^�� ^ I  S l�� _ `
�� .sysodlogaskr        TEXT _ m   S V a a  No documents found.    ` �� b c
�� 
btns b J   Y ^ d d  e�� e m   Y \ f f  �   ��   c �� g h
�� 
dflt g m   a b����  h �� i��
�� 
givu i m   e f���� ��  ��  ��  ��   T  j k j r   q } l m l l  q y n�� n n   q y o p o 1   u y��
�� 
sele p 4   q u�� q
�� 
docu q m   s t���� ��   m o      ���� "0 thepublications thePublications k  r s r l  ~ ~������  ��   s  t u t l  ~ � v w v O   ~ � x y x k   � � z z  { | { l  � ��� }��   } ) # protect chars between balanced {}     |  ~  ~ r   � � � � � m   � � � �  {    � n      � � � o   � ����� $0 startprotectchar startProtectChar �  g   � �   � � � r   � � � � � m   � � � �  }    � n      � � � o   � �����  0 endprotectchar endProtectChar �  g   � � �  � � � l  � �������  ��   �  � � � X   � � ��� � � Q   � � � � � � r   � � � � � I   � ��� ����� 0 
capitalize   �  ��� � n   � � � � � 1   � ���
�� 
titl � o   � ����� 0 thepub thePub��  ��   � n       � � � 1   � ���
�� 
titl � o   � ����� 0 thepub thePub � R      �� � �
�� .ascrerr ****      � **** � o      ���� 0 errormessage errorMessage � �� ���
�� 
errn � o      ���� 0 errornumber errorNumber��   � O  � � � � � I   � ��� ����� 0 reporterror reportError �  � � � o   � ����� 0 errormessage errorMessage �  ��� � o   � ����� 0 errornumber errorNumber��  ��   � o   � ����� 0 errorlib errorLib�� 0 thepub thePub � o   � ����� "0 thepublications thePublications �  ��� � l  � �������  ��  ��   y o   ~ ���� 0 capitalizelib capitalizeLib w   capitalizeLib    u  � � � l  � �������  ��   �  � � � r   � � � � � o   � ����� "0 thepublications thePublications � n       � � � 1   � ���
�� 
sele � 4   � ��� �
�� 
docu � m   � �����  �  ��� � l  � �������  ��  ��   J m   7 8 � ��null     ߀��  �BibDesk.app�0� ��Lid� 2����@   �����Q����P�Lk��`(  �����  BDSK   alis    P  Macintosh HD               ��+GH+    �BibDesk.app                                                     Quɾ��        ����  	                Applications    ��'      ��c�      �  %Macintosh HD:Applications:BibDesk.app     B i b D e s k . a p p    M a c i n t o s h   H D  Applications/BibDesk.app  / ��   H   Bibdesk    F  � � � l     ������  ��   �  � � � l     �� ���   �   see if we had any errors    �  � � � l  � � ��� � O  � � � � � I   � ���������  0 checkforerrors checkForErrors��  ��   � o   � ����� 0 errorlib errorLib��   �  � � � l     ������  ��   �  � � � l     �� ���   �   we're done!    �  � � � l  � � ��� � I  � ������
�� .sysobeepnull��� ��� long��  �  ��   �  � � � l  �" ��~ � I  �"�} � �
�} .sysodlogaskr        TEXT � b   � � � � b   � � � � m   �  � �  Changed     � l   ��| � I  �{ ��z
�{ .corecnte****       **** � o   �y�y "0 thepublications thePublications�z  �|   � m   � �   publications.    � �x � �
�x 
btns � J   � �  ��w � m   � �  �   �w   � �v � �
�v 
dflt � m  �u�u  � �t ��s
�t 
givu � m  �r�r �s  �~   �  ��q � l     �p�o�p  �o  �q       �n � ��n   � �m
�m .aevtoappnull  �   � **** � �l ��k�j � ��i
�l .aevtoappnull  �   � **** � k    " � �   � �  ! � �  5 � �  E � �  � � �  � � �  ��h�h  �k  �j   � �g�f�e�g 0 thepub thePub�f 0 errormessage errorMessage�e 0 errornumber errorNumber � *�d�c�b�a�` �_�^ 1�]�\ @�[ ��Z�Y�X�W a�V f�U�T�S�R�Q�P ��O ��N�M�L�K�J�I ��H�G � � �
�d 
file
�c afdrcusr
�b 
rtyp
�a 
TEXT
�` .earsffdralis        afdr
�_ .sysoloadscpt        alis�^ 0 capitalizelib capitalizeLib�] 0 errorlib errorLib�\ &0 delayreporterrors delayReportErrors�[ ,0 defaulterrorfilename defaultErrorFileName
�Z .miscactvnull��� ��� null
�Y 
docu
�X .corecnte****       ****
�W .sysobeepnull��� ��� long
�V 
btns
�U 
dflt
�T 
givu�S 
�R .sysodlogaskr        TEXT
�Q 
sele�P "0 thepublications thePublications�O $0 startprotectchar startProtectChar�N  0 endprotectchar endProtectChar
�M 
kocl
�L 
cobj
�K 
titl�J 0 
capitalize  �I 0 errormessage errorMessage � �F�E�D
�F 
errn�E 0 errornumber errorNumber�D  �H 0 reporterror reportError�G  0 checkforerrors checkForErrors�i#*����l �%/j E�O*����l �%/j E�O� *j+ 
O�*�,FUO� �*j O*�-j j  $*j Oa a a kva ka ma  Y hO*�k/a ,E` O� Za *a ,FOa *a ,FO A_ [a a  l kh   *�a !,k+ "�a !,FW X # $� 	*��l+ %U[OY��OPUO_ *�k/a ,FOPUO� *j+ &UO*j Oa '_ j %a (%a a )kva ka ma  ascr  ��ޭ