FasdUAS 1.101.10   ��   ��    k             l      �� ��   @:
This script protects the titles of the selected publications 
in Bibdesk by putting braces around substrings to be protected. 
This can be used in conjunction with the capitalize script library, 
which can use this protection to prevent changing case of 
substrings.
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
   J DLibrary:Application Support:BibDesk:Scripts:Add Protect Strings.scpt   ��  ��  ��  ��    o      ���� 0 
protectlib 
protectLib��        l     ��  ��     . ( load the Error Reporting script library      ! " ! l   % #�� # r    % $ % $ l   # &�� & I   #�� '��
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
docu q m   s t���� ��   m o      ���� "0 thepublications thePublications k  r s r l  ~ ~������  ��   s  t u t l  ~ � v w v O   ~ � x y x k   � � z z  { | { l  � ��� }��   } ) # protect chars between balanced {}     |  ~  ~ r   � � � � � m   � � � �  {    � n      � � � o   � ����� $0 startprotectchar startProtectChar �  g   � �   � � � r   � � � � � m   � � � �  }    � n      � � � o   � �����  0 endprotectchar endProtectChar �  g   � � �  � � � l  � �������  ��   �  � � � X   � � ��� � � Q   � � � � � � k   � � � �  � � � r   � � � � � I   � ��� ����� 0 protectstring protectString �  ��� � n   � � � � � 1   � ���
�� 
titl � o   � ����� 0 thepub thePub��  ��   � n       � � � 1   � ���
�� 
titl � o   � ����� 0 thepub thePub �  ��� � l  � �������  ��  ��   � R      �� � �
�� .ascrerr ****      � **** � o      ���� 0 errormessage errorMessage � �� ���
�� 
errn � o      ���� 0 errornumber errorNumber��   � O  � � � � � I   � ��� ����� 0 reporterror reportError �  � � � o   � ����� 0 errormessage errorMessage �  ��� � o   � ����� 0 errornumber errorNumber��  ��   � o   � ����� 0 errorlib errorLib�� 0 thepub thePub � o   � ����� "0 thepublications thePublications �  ��� � l  � �������  ��  ��   y o   ~ ���� 0 
protectlib 
protectLib w   protectLib    u  � � � l  � �������  ��   �  � � � r   � � � � � o   � ����� "0 thepublications thePublications � n       � � � 1   � ���
�� 
sele � 4   � ��� �
�� 
docu � m   � �����  �  ��� � l  � �������  ��  ��   J m   7 8 � ��null     ߀��  �BibDesk.app�0� ��Lid� 2����@   �����Q����P�Lk��`(  �����  BDSK   alis    P  Macintosh HD               ��+GH+    �BibDesk.app                                                     Quɾ��        ����  	                Applications    ��'      ��c�      �  %Macintosh HD:Applications:BibDesk.app     B i b D e s k . a p p    M a c i n t o s h   H D  Applications/BibDesk.app  / ��   H   Bibdesk    F  � � � l     ������  ��   �  � � � l     �� ���   �   see if we had any errors    �  � � � l  � � ��� � O  � � � � � I   � ���������  0 checkforerrors checkForErrors��  ��   � o   � ����� 0 errorlib errorLib��   �  � � � l     ������  ��   �  � � � l     �� ���   �   we're done!    �  � � � l  � � �� � I  � ��~�}�|
�~ .sysobeepnull��� ��� long�}  �|  �   �  � � � l  �$ ��{ � I  �$�z � �
�z .sysodlogaskr        TEXT � b   � � � � b   �
 � � � m   � � �  Changed     � l 	 ��y � I 	�x ��w
�x .corecnte****       **** � o  �v�v "0 thepublications thePublications�w  �y   � m  
 � �   publications.    � �u � �
�u 
btns � J   � �  ��t � m   � �  �   �t   � �s � �
�s 
dflt � m  �r�r  � �q ��p
�q 
givu � m  �o�o �p  �{   �  ��n � l     �m�l�m  �l  �n       �k � ��k   � �j
�j .aevtoappnull  �   � **** � �i ��h�g � ��f
�i .aevtoappnull  �   � **** � k    $ � �   � �  ! � �  5 � �  E � �  � � �  � � �  ��e�e  �h  �g   � �d�c�b�d 0 thepub thePub�c 0 errormessage errorMessage�b 0 errornumber errorNumber � *�a�`�_�^�] �\�[ 1�Z�Y @�X ��W�V�U�T a�S f�R�Q�P�O�N�M ��L ��K�J�I�H�G�F ��E�D � � �
�a 
file
�` afdrcusr
�_ 
rtyp
�^ 
TEXT
�] .earsffdralis        afdr
�\ .sysoloadscpt        alis�[ 0 
protectlib 
protectLib�Z 0 errorlib errorLib�Y &0 delayreporterrors delayReportErrors�X ,0 defaulterrorfilename defaultErrorFileName
�W .miscactvnull��� ��� null
�V 
docu
�U .corecnte****       ****
�T .sysobeepnull��� ��� long
�S 
btns
�R 
dflt
�Q 
givu�P 
�O .sysodlogaskr        TEXT
�N 
sele�M "0 thepublications thePublications�L $0 startprotectchar startProtectChar�K  0 endprotectchar endProtectChar
�J 
kocl
�I 
cobj
�H 
titl�G 0 protectstring protectString�F 0 errormessage errorMessage � �C�B�A
�C 
errn�B 0 errornumber errorNumber�A  �E 0 reporterror reportError�D  0 checkforerrors checkForErrors�f%*����l �%/j E�O*����l �%/j E�O� *j+ 
O�*�,FUO� �*j O*�-j j  $*j Oa a a kva ka ma  Y hO*�k/a ,E` O� \a *a ,FOa *a ,FO C_ [a a  l kh   *�a !,k+ "�a !,FOPW X # $� 	*��l+ %U[OY��OPUO_ *�k/a ,FOPUO� *j+ &UO*j Oa '_ j %a (%a a )kva ka ma  ascr  ��ޭ