PGDMP  2                    |           Project3    16.1    16.1     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    17315    Project3    DATABASE     �   CREATE DATABASE "Project3" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "Project3";
                postgres    false            �            1259    17321    cleaned_census_data    TABLE     �  CREATE TABLE public.cleaned_census_data (
    "STATE_CODE" integer NOT NULL,
    "COUNTY_CODE" integer NOT NULL,
    "COUNTY_ID" integer NOT NULL,
    "COUNTY_NAME" character varying(50) NOT NULL,
    "POPULATION_25+" integer NOT NULL,
    "MEDIAN_HOUSEHOLD_INCOME" integer NOT NULL,
    "HIGH_SCHOOL" integer NOT NULL,
    "BACHELOR" integer NOT NULL,
    "MASTERS" integer NOT NULL,
    "DOCTORATE" integer NOT NULL,
    "PROFESSIONAL" integer NOT NULL,
    "HIGH_SCHOOL_PERCENTAGE" numeric NOT NULL,
    "BACHELOR_PERCENTAGE" numeric NOT NULL,
    "MASTERS_PERCENTAGE" numeric NOT NULL,
    "DOCTORATE_PERCENTAGE" numeric NOT NULL,
    "PROFESSIONAL_PERCENTAGE" numeric NOT NULL,
    "TOTAL_BACHELOR+_PERCENTAGE" numeric NOT NULL
);
 '   DROP TABLE public.cleaned_census_data;
       public         heap    postgres    false            �            1259    17370    county_boundaries_of_nj    TABLE     �  CREATE TABLE public.county_boundaries_of_nj (
    "OBJECTID" integer NOT NULL,
    "COUNTY" character varying(50) NOT NULL,
    "COUNTY_ID" integer NOT NULL,
    "COUNTY_LABEL" character varying(50) NOT NULL,
    "CO" character varying(5) NOT NULL,
    "GNIS_NAME" character varying(50) NOT NULL,
    "GNIS" integer NOT NULL,
    "FIPSSTCO" integer NOT NULL,
    "FIPSCO" integer NOT NULL,
    "ACRES" double precision NOT NULL,
    "SQ_MILES" double precision NOT NULL,
    "POP2020" integer NOT NULL,
    "POP2010" integer NOT NULL,
    "POP2000" integer NOT NULL,
    "POP1990" integer NOT NULL,
    "POP1980" integer NOT NULL,
    "POPDEN2020" integer NOT NULL,
    "POPDEN2010" integer NOT NULL,
    "POPDEN2000" integer NOT NULL,
    "POPDEN1990" integer NOT NULL,
    "POPDEN1980" integer NOT NULL,
    "REGION" character varying(100) NOT NULL,
    "Shape_Length" double precision NOT NULL,
    "Shape_Area" double precision NOT NULL
);
 +   DROP TABLE public.county_boundaries_of_nj;
       public         heap    postgres    false            �            1259    17316 	   county_id    TABLE     m   CREATE TABLE public.county_id (
    county_id integer NOT NULL,
    county character varying(50) NOT NULL
);
    DROP TABLE public.county_id;
       public         heap    postgres    false            �            1259    17364 
   crime_data    TABLE     �  CREATE TABLE public.crime_data (
    record_id integer NOT NULL,
    county_id integer NOT NULL,
    county character varying(50) NOT NULL,
    agency character varying(100) NOT NULL,
    murder_count integer NOT NULL,
    rape_count integer NOT NULL,
    robbery_count integer NOT NULL,
    assualt_count integer NOT NULL,
    burglary_count integer NOT NULL,
    larceny_count integer NOT NULL,
    auto_theft_count integer NOT NULL,
    year smallint NOT NULL
);
    DROP TABLE public.crime_data;
       public         heap    postgres    false            �          0    17321    cleaned_census_data 
   TABLE DATA           n  COPY public.cleaned_census_data ("STATE_CODE", "COUNTY_CODE", "COUNTY_ID", "COUNTY_NAME", "POPULATION_25+", "MEDIAN_HOUSEHOLD_INCOME", "HIGH_SCHOOL", "BACHELOR", "MASTERS", "DOCTORATE", "PROFESSIONAL", "HIGH_SCHOOL_PERCENTAGE", "BACHELOR_PERCENTAGE", "MASTERS_PERCENTAGE", "DOCTORATE_PERCENTAGE", "PROFESSIONAL_PERCENTAGE", "TOTAL_BACHELOR+_PERCENTAGE") FROM stdin;
    public          postgres    false    216   G       �          0    17370    county_boundaries_of_nj 
   TABLE DATA           O  COPY public.county_boundaries_of_nj ("OBJECTID", "COUNTY", "COUNTY_ID", "COUNTY_LABEL", "CO", "GNIS_NAME", "GNIS", "FIPSSTCO", "FIPSCO", "ACRES", "SQ_MILES", "POP2020", "POP2010", "POP2000", "POP1990", "POP1980", "POPDEN2020", "POPDEN2010", "POPDEN2000", "POPDEN1990", "POPDEN1980", "REGION", "Shape_Length", "Shape_Area") FROM stdin;
    public          postgres    false    218   I"       �          0    17316 	   county_id 
   TABLE DATA           6   COPY public.county_id (county_id, county) FROM stdin;
    public          postgres    false    215   �)       �          0    17364 
   crime_data 
   TABLE DATA           �   COPY public.crime_data (record_id, county_id, county, agency, murder_count, rape_count, robbery_count, assualt_count, burglary_count, larceny_count, auto_theft_count, year) FROM stdin;
    public          postgres    false    217   �*       b           2606    17374 2   county_boundaries_of_nj pk_County_Boundaries_of_NJ 
   CONSTRAINT     {   ALTER TABLE ONLY public.county_boundaries_of_nj
    ADD CONSTRAINT "pk_County_Boundaries_of_NJ" PRIMARY KEY ("COUNTY_ID");
 ^   ALTER TABLE ONLY public.county_boundaries_of_nj DROP CONSTRAINT "pk_County_Boundaries_of_NJ";
       public            postgres    false    218            `           2606    17368    crime_data pk_Crime_Data 
   CONSTRAINT     p   ALTER TABLE ONLY public.crime_data
    ADD CONSTRAINT "pk_Crime_Data" PRIMARY KEY (record_id, county_id, year);
 D   ALTER TABLE ONLY public.crime_data DROP CONSTRAINT "pk_Crime_Data";
       public            postgres    false    217    217    217            ^           2606    17327 *   cleaned_census_data pk_cleaned_census_data 
   CONSTRAINT     q   ALTER TABLE ONLY public.cleaned_census_data
    ADD CONSTRAINT pk_cleaned_census_data PRIMARY KEY ("COUNTY_ID");
 T   ALTER TABLE ONLY public.cleaned_census_data DROP CONSTRAINT pk_cleaned_census_data;
       public            postgres    false    216            \           2606    17320    county_id pk_county_id 
   CONSTRAINT     [   ALTER TABLE ONLY public.county_id
    ADD CONSTRAINT pk_county_id PRIMARY KEY (county_id);
 @   ALTER TABLE ONLY public.county_id DROP CONSTRAINT pk_county_id;
       public            postgres    false    215            c           2606    17338 4   cleaned_census_data fk_cleaned_census_data_COUNTY_ID    FK CONSTRAINT     �   ALTER TABLE ONLY public.cleaned_census_data
    ADD CONSTRAINT "fk_cleaned_census_data_COUNTY_ID" FOREIGN KEY ("COUNTY_ID") REFERENCES public.county_id(county_id);
 `   ALTER TABLE ONLY public.cleaned_census_data DROP CONSTRAINT "fk_cleaned_census_data_COUNTY_ID";
       public          postgres    false    4700    216    215            �   �  x�%��j�7����u��ev	ɍI`	�ɍc�alC���Zf��3󏺺��Z��lھ\��//-|�M���ߜ��v�͇{��j��!|�u˳�����b:��)b#Ě�-�F�f}xX��l>zDN��o��ݼ}�������-�Ji�s95$�����f�@��t��1R<�=ל	6>�-ak�ї�6�>�.q0�9����*.�V��������~�RS'��\�-�<�E�q��kΕAe:},>�1d�5�VC!@t�XRWz�:28��]�Ji���}���9G�ѶF�&;ڞ��m�t�1yaĮg�9��>H�!�#��8�������@�� �}�^ߨ�"�{���@u+8&WUv�&{�M#�lj����QJ�0ӱN]ᬍt�T0ՙİ�ޙ�0����^�owO��f6�Z���j&y�ٖ@��M���֙����B\n�\���c�J�ob`C%��e��YG�������ST𷽵�M�i8A����l�� �JZ� <4#�{!��ۚj���=8�f(?3Lw89�ߏ�Ow/��M�919��4�'tC���f�3����Aw@7#ώwV$s��хe��`��e�J�U=�/קǗ��E s��SwK<��Ee|!����НZGokL �G���Ƃ!��S��:x.��R�d �v+C�B!@���!D�x̖�#0P�a��I+Q�Z�{e����;,@VACضMe���oi�T�6���K��H�iѾ~<�u�2�&��}V��`.d�#��x�Z&堑�{�)V��I��K5�S����8�"9� � '����.�2�E�ܽ<�T�t+'���v1��(�P���Q
@�x؂!W�lK�9�S�kG��D����>@v����ؒ�Im��<F(g�;���]F���<S��(�afe�H�YeDe�2H��1r|DeЮ�k�0����X;�>4��cg�~�[�QÙ�%�=k��:C6��A!D�Ru�?�I&z��jHH�2��`��v����t9ӈ��:"p M�6[�c��d�HF@^l�:�@ )�q򘬇��p��$�+�[FRs��j��up�%�_�_?����<SE]93 �l ��
�U[����A�}��>{/�ل(������/b
f,;��8>Q�ڎ��_�^�x��́{@m��Xk-�;l�(,\@�U*�*�}�"��]T.3xR�d+�U�#�1�:�,Σ�v��vG0ra��|��Ҡ�1�� pE�R��Q���d`��Awn��%{��MC  ��q�q������2�ڷ������N�Q�!�N��{E�yN��xJ�kOr|9�4�|F����hT��q�>��Aꑎ�B�;FQ�O
�|���d�T�T����,2|�>�qo$5P��v�n9���EH���I��j3����s�Jp�V,�W\�R�<g��?�W�9���K�ZRˈ�B;�0b����n,*X:�M�P�����\dR It���Ύk�����������r�	�      �   �  x�]��N#I���O���y�6V7�[6V�J{�6�$#����Y�] �+]UF��p�n~s=_�\-\p�ׇۧ����緧�lɍ�^<���}թ�X�K���U�yi��?H�R\������Xb)�w%U>K(.?��̑;�����f~���u%5��I�o!�br_�ۯ˵�����������ڈ5t��%����A$ "�A�Ju����k�� \�CP����榙���j�.�
w,ͥ��[o�7ߖ�^n�.產!F'|��&��}�o���_o6k`|y;>�?�z}>�� Z7���'����5z��AAD5y�J�sL��/ �XrtE�+�����F>�n�9��j�e���[TZ��[���|uI��[�>ޝ���	�qmĚ:������f�u�-���-�v�P��Q��ؘ�\��50+Ƣ�I��p+zn}B��jCՔ��i[�0���ˋ��?kq���bu�������v�m�B,�g������j�Ԑ�@� !yV3�t"Z�S�9�P�g˪'2J!y�¹ڪ4	"e�[�W�^:��=��pDew'��e>����=0�ANr|����6t��9 �PD�n�bI}a-�;pӫ����������9�0��|ӆ�}�n��-���˗����x99�ۗF�ҡ�C�&��P`
u�"Bg�<��4����V����}�1G�hN���R�G	��d@�lL�V�Yl���f�Xڧ����o?/���;x�'����j��)Q(�"�dΒd�x�:���h���	���������l�]�+&�6)v��R"6皙Lœt������a�}{�{9��'�ǵ�v�HԱiD�H ��FD��v ��cz_J�qm�ި�!���ΛK�^?՜(u�Z$.�WIq�׬_�=���wS���/�-�qܐ�M�1��2d�6DmX�����ᄂi���dwp1&��b��ٚ()7�Fz���f�W���������̐Շ��F���F��2,I�LE���Y3� �io�@b�-jk��~U�7����Y�|�	qF95X�*\��u�GW���Xd�Z=?=>���y¼��}�P��C���jJ{ ��R�4!��'�ѪGwŬY�.�7�6�0%�,E���+���*~X������DL���m���4��y�=���}i��Xfz�$5��b5��qA���s(b�gj�e�f*6V8U����T��+-�yf5xjl�+�aV����%q�o_^nσ+��;�ԣ%��ix��3T}��E�M�69¶����N�'z5�Q, �L#qgU�x��f���O!r6%������˕�����������}i�܃��"��V�YQK�#��E����s�3?F��P�=G��Z|�lN���	E���ꑁ	��-o���=?�/����4	�WG�=�i�
���3q>��Z��tM]p��k�1�b�n���Mt����@*g� H�B7|��B�aF���=	���49?E�v
��Ð���x>��dU�bQm�ˡ�qCӎ�"��bV#m�5;�Ma�Ï��Fn�6d1�q�����a4�__aѻ���ُ9;AܗF�}��2^!��N��̈ڰ"�ߙ%$ɖ ���H�.����dP�o��1:W�4A�ay��6�]-���������~���Y����ڈ�g��Z�C�H<��8�={�1Ҥ�!�/� �4u~�.D���<}�2Su�������0㙫�v{������x�r��1��F�������Kʦ!Xg���&7�iS��.� ���l��/�GT��>�7͟��⃒��,?!!�����V�����^vJ������0a5�S���#�1O�Hp�J
z�>���My�TQ��1��;!�	�!�Ym��Xϻ	�L�����o�|w��T��7��g�f�ٿ?�I�      �   �   x��KjADץS�����	�f�a�dәNC����G��T�C��֢�-�4� z�LK�Ɛ��dZ�蒷vm�&/����=���i��Z�N;|��g�M��8u_煥l��Qt�����(��KN��_�e�P��8�����ju��[L.J"�a*I�J#�c�O�a������r�f��JD�x�D�      �      x���[�;����+���tz�wr�B�!e�2#r"2���y9�ul���v��l��/��鑡2I�Ǭ�pwAħvj��ǟ��?��_������t�t�������n��۩��v��ݩ�Ӌ^�MB�O����]�J��N)�S.�3i���D�f.z�ty8��|��˧O�/_����J��#<�|ʯ��z:��������+��� o��U����z�)K~�x;��9�=�U�?~g�i�M_�~z؟?��C��]ؙ,��(�b��/ e�D~����A�L$��žN��U(?!�~O�!���&!�p������k�&e�TڹegR���MG����JG,�g&�u��$jВ�����t�:b�7���FF��t:~}9�_{k��xЅ������P��AIZ������x���HUGR�~�/�����t�_'��3��H`������5�������U�����0�����|��rz<��J�<�r��D�6�����$fC~;s7������F��z����v|�������jv�l=�����5wHU�<jy���i_^tm������o�e�<��O>�	��t@������>�
�RSۛ~>���`:n����k�nw�/�S9/�E�0:��m��N_O�{�Afgݮ���c�����ty�߿v%�3}t���?�w�<��ڟ�U�bs��)��ϛ�K�.��sP\�Ś��˷���&�U�Ϥ�lx�y�.�|t�a\����F�Qx]�����<w^?��^��|9�KW4���L�acz��zx߷oTh-�n�T.�o�X���$�Dc��R�e�/Ɔ� ���=|��Fð�<�>���`�aEc�_��f�	a/�Z���K��*
fٸ~�?�?=�ߏU	tT��+E��<��׉��I�>�lt��~:����s���4�`{6�_���l��};\>�5�Կ�"�'���3�TU��*�W�6ع�����zq���%UCg�H?����=��d��sY��?__(p������8�������%.�ϧ������ׇ��h�tJ\�V���9�*l��|��f:��4��l�N���ކw�
��:6�O���qϭN��P�ӱ�}z|}�/��p>���}~�����slT�N��թР��jTOl��������\	�lUQ��T�m6������_��Zf���z���i�]	[籁|~��K�w�\�=C0j���`#t����������Pg+tM��"x6��<K�w�- �z�/��꛲�D'�S^F���\B�#w��C䍐�.Vg���z;��}H��|�V�F��F}x_~����y6��<�_�//�#�k��g�x:���0ՙ�k?���e��x��/��/u8�(8�lN�eާ�hWE�j~-�LeX��y�\g�L����5�������,�:�<El`�_l�Y���Uy���l�h}�\��NeF����u��B} w���4tS��Mѷ�T�3?�w����><��߅�Ӱ6��l��r�p@w���8��RgcH���'0��Uo_fz��.�¹�d�E�Ȇ9+�}~��0�������J�>���]۳ᾜ�+}8r������;���W:�MP~��
����o�2٨���C}L�7{�yE3��Eϣ���/O?M;��1�7���v=�)HdC����i�i��Sm�D6������G�<���jF�2�*����{顤x��Ci?,N0-�}�`c����qq���4[�؀CCt(������dG�_��Q��UuIl���}�{(��`��X't�������O�����r��A��{E� w1G���P�Ey#yz?A4�hԋX��W�����AJB��5����$ԯS˲-�w��6�jQW~�U}�y�g��ϔO	]e��RUCy�4�f�;@��C胖��B��x�??پG�*��Ӹ�in��������E�p@�CU������H^L|`�@B�W�?��~����U��#�[�բuf�8Vm�6e��<�y�������*a�_��,\	���t:��N�GAg��]�	-yz{�f]t	:�����(%t�y�!�����Ɣ�b/����/qTU4$OH1��%Jh���WS�.!�)?�b]�2�)��]J(J��!Pqzo��3�0�G,J�<Y?=���"!�)�G������|x�o��0�'�̓`�D�BI���O���yJ�|�B��TВ�X�Ou�����9���i�1�,/��eR�q����n������E��{���)Ny߼M�����@?����Lu��@ `j-=�p�
3:W��/
�
�ʰ����W �Z����Y���@������m�&��>|��ݯ�#�^���>�p�����$=����/�ۦZ�Ql�?��J_鳈�F��gO�y�~f�?�\�4(�xs�h6�gYƴ�-�(0�9��
}%4������`EѺ3��w����
O�>k"=�O�J5I��$a���#a3��۔�4�ko[6��7���z��o�U�M`^@��[=H^���MYB�j��)�����p���u�\�a�pwB��t/F�~O�"�p�Ԥ�yߟ�� b���]:�霃�|����3�����X�ỻG�,ӏ�O��;t�w�T������S�悀�Ew�ٝO=�,Ӑ����>�FE�:�/r�J��:x�\�zNI�ἣ<B�Yd�`�����1O�}��Yk��W񶀡_�ޏ�FY0��o��)�۝�"�G\�@���2��0�Ț�g���EHT��湑�6:�� 9������U�����Q��a*�|8�=�3��B	��J0mx~��O������=�= �h�1N%M�F4}��L	^��e�����`�P�R�����=�c!<�1��mp��B�; ������y���1��v oʁ�Q����_�)�`~����ZJc�s��A+���7�)f]�<�aYo�,�
���.{޿��:�<2����L�gg��}b�@a� \i������u�ꀶ�dӆ���{:�s���m��9)�*�4�pֺ#yÞ�--R�l��~��������g-X9`�gi0\�n�r������*���\��u7��_�i��T�N�֫���� p��+��)���
��<?b����R��M4nU�-���mBv�EBLihɲ&��%Ow��Q8T�؎�TT\�r�z�䗔y�3�"�Z�2�4�m]�����rh�KH�x�S����?p;���^ح�Z��1w|�����Q�#�Q�=�#;�T������R}� &v�Ͽ���~���#d;�=��4��s�8�d%�0��G:?1��r�W>μP�t�xΫ˨���@�YV� �B�(I���J��@����� �)�HG2�}�KZ=�2`�x �� �,DU�$dm������e� -bv��jq]��tzn~�>]$��^D|���v;+݈�f�WBo|�ߟ?}=���2��:�bk�	���HAd���df���YT�s*�.v���gRt�e-;�¡�ރ�ӓ���@+��A��L-ľ�N���Q$��7�=$S�d �{�ͻP��ģo��o���K�H�h;ft����s��BH�}{׃�G���6|�@�k֙^�.`����YD��M��� ���ۙE��]��ڼ+���=A�Jݹa.��(Ւ;�Z&4oW�nM[I�g�(�������qf�����-˟�|z=�=d����n��´���Od�-�.^������5�p�>��W�[�������5�K��A����%��Zu�8��>�3a܆@p�Lm�u�O]̑��Ϋ��U��N�|�'�l�n/��������	'?��m�[��tt�ߌ\�nxv>ktT���S|�6��u�stW���?մ]U�R�W�G�� r ��p} ��W���b�nv5��T�`������_�������*���nz�_~�Oq� ��ܿWt�Z��|t�%�B�� �����7��wb���<�P!��m<X��l��c��6F�d�ҔM�Q������-}    �����V�s��a�ۗ����)�F�X�,��ٙ�f�\
��.��
Fs׷����Fl/��]-�H�7����۞?^"Ȇ���2�
�O�ag�ʹ�Q����rܿ>���$"�eI�](�&[��������{���iZX|?��V�����3O4�X��ϰB/Χ�=O������҃0�l_A�P���Q�x<v�d�N6n��f����'����CFr:��Аy�Bv7#�1��j�~8��f)��2���>["iɚ�A(߳C�@{%�<iZ�:�-�A[�(��dw��p��B�<:�$��UJ'�t�qj%��6��=����?��w8���8�-�G^�`w
����8�Рww�oRS)ۛ}{}=!ק/�	��Z�^;�ۏz�'t��A�����K�>���58�y8��?�=�L���"s*����_>]�[V��<�8���6����5���l��y,��,��k����~;���v��N��&o�}�P�z{��J�Y`U�t@�4�6?�3�,����>� �Σ�<׎� L��s����j<4��X��K˩՞i�`|Z׶ g�I���E���U��N�&��'����R5&+��\�&�t��pxؿ;4E�$5��P�W#�����ǩ�vjpN<���+��7q�<��yN�Ra�O�_J���Q�	ɄE�dW�jK<�2�zMP2��kcZ�J=ʴ�.v�C�8��Q����y<�]0hڡ�V�L���A�{�:���� L̏b��I��r�]B.�a���oW�����O�іҕ߸�E�)O{L���m���W���t��?���q�7�/�}�*{!�w�IQu,
}9��\_h��ǥ��D�0¦�.j�L�Ƹ��G�?���o\�EZ���I��S}��;9��`���� ������6e%� ֶ���<F&�Bw���p�H�4�zbR���?��e�S��5��ץ�f��<V�������QLf}�\�A`�E^ެC�4�D�[��gt7/���r�^�*~s��3	�	Ey\�HB@��ds'2��~]LJ�]]��3)8�]ma����{���S5��OL'9^��_ɕ��v���ۑ���=ώK�$#._�$~N:Ϗ�r�M���z�;�O�gL����eV?�x�7�×��ç��/���M���j���]��i*��\%����s�k�Ϟ�u� �"�sA��n;�`;����f�Т^�B�O�?g���/({����?�^��Y�fqCW~q�0�����N1g+Pp�}+פ2��7�g��b��!�`5���Y����*aq4~��k���$���?������xڽdEa_�8<�)RJHe�am��ĥEp���B�o�Dr`n	FER��m�j�@K���v�`b?�0�ӱ�	Z8��=��e�<���n�R��|8<=^�;�%ә�{�>�Rq�� �zB��{�L���,�mG��O��@~����K�K���k
��"x������5pkBbz��Fq�ַe��VWdo�����Ǯ��F�?=�:~qWP-�E�Z��V!�*�Pt��[�U�I)d'���:ߵP����*^24�f�jG<F'���O�ƒ�a�B�^x�����G}&ta�,�����z![�zy���_��0�*��6x`����V/O�l�Q��P�S�v���R<'�.,�j�d�
U���W��w�p��_V���X-�����v�΄&f��9Y�zSܸ�8v�;��,Dl�&���0�4e)�6��Jty9�^��J�b��F�θα�ʒ��p���D�4�� t
�?0IK�O����׿����v����?�"'t�+�[�V�2z��%���.�0T3b�Z`�-&EmBv��P]>P���O��y�`��:c�(Yk��5�2>Rw���Q��������>~���y���46b��ڸ?�y���ϥ��16����{L<��XD]�Т��&!�xx�WDu����[D���f�M�`�Q#r�W8��z�'�B�Q!��'�Ÿ��Ge8�_OǾ�b����s�.@���˥+�u �E<����8�[�c��|8<����x�?Bb2d�V3��\�-6X�À� #�ȍJ��O��w�8�!��-��`��f��Ơ'8==���$��X���h?�O��j��oL o���&q �M����adN�8+����[!�J�l4���xo���|Z��i�6~T�R����$���>�=iԀ���#�|z;�����i��B��5/��c5
��A�Z^}j
Əj�������kZ_���t�	�J������ ��������3)wT �"[�
Zȁ3$"�݇�:�r���M)���mT��>�c1�QE�����K����OL�p3J�����֑�0��1?!���TKn�bAHS)fi`��ĥ��1q�ʃ����3��U��Z���0�`Zt��QS·lr��zFQr��T폣��ߞWg͐��>d�Xɡ�ëT���ѭ�>�5����qT�����^��netU�qT��AWۇ3�z �T����۱
Sq��1����R8Ɇ�v�٤Q^��˾%�a&$SՏL�*�Q������Ĩ
P��+��y�Wm2iT����n��V@��e�}������ϧ���.7C\�7i�x��+b%� i��rvђ5�����p�z�*��bK97b]I�x?fI�QL� %X�R�k�e��xVd.�]�?�+@T����,vѼ�����br֬��[*VZc�K��U�����8ír��> ��VD�.|�W�K}��*�]� r�g��!X�U>�8|�B�,\�N� ���|{<�n	9An�O�#��x̾�,�7.z�����</GV��Z��y/�~0��o�b���?復���Դ�L$D�b2l�*���]��"��>�Xۊ��c� |�RU�R�<"�X�#�ΧI>L�?�Yg�TvU����X��rp��	VҶ#w����PT�z��V+	~�����l����B��רh�}=���k���t�B����f��R�V�����z����w�Ј�٥M���䁹<Bɯ���Ot���)B����ՠj�/�ԏ���I��׊� ޟ�^V�X�f[�s}�����G���W�$�1N��m��0j&�^���~�=��<K�h$B[@��j |6;�:ʴ��\fI�vG��m��p]x�6_**:`,

IUY�O��ۯX�x��Ͼ
�� 7,���D�]��zO��|0���x8�ח�Пk�,@�LJ�A����.�����	0��(.r�v�pW�ib��!�Q����y����B|r0\����t�<$�!���\f=���v���RU/\^�g�k]�����p��'-p���$�L��wC/����t�*�\�ہ�c��?��WEj����>���ݞ�][���E�����p�d� ��1(!�u����t#��K�0](�Hq�x���0Mx�^�0t$豌E���B���ӷGa��ƯN�4����9* 5U��ӥ\�X>�u^ʭ����uA��
��<W�/�S��oz���L!^����� �#��۽�t���.���{>�$�2r֫m���XK9��d=S��Kǒ�6B���Qz���n�F'_��F�b`~�����I����%�S:v�"Y�/��,U�iC^ƾ���� ���ևA�/}UY�����qL7.o�/�k�8�u~x��[j�Huc�9�ƶ��60�x}��&k)��׷]ח_���_�A �C�FeĎi�G6h.u��ށ� �s�,��.B�=���j���$�Ե6ر�;d,�� tbw��U�y�n�G�E<���؛�|���m��˼�/�=�&n�c!n��ے�f�/p����V�����-�q�^[�q����Ny���p��둽������tԬ7�\�+y6:}�r�{%+���P�8������@�mrK^���2����l�ұa�As^Oy���e݅.gE��K��������v>*N�V���0��8�K��8[Ӿk�����5�7��v��AE�h�dʠ�(8    e�i��kӠ.X��e����7�Y�0�����dv?��q'��aNi/%a�L<	A��:lf�_�o}y<���TT�� F��\�B���:p��,ָ��iw`�v�����̐��Y�X��w[�"�l��Ơ@�r%|�1IIʽܗ!ը�P�9���+�=�b��e���H�)�[�b�J]�y��Mm�nA��������G���C��U��A�E� �9H�����E�$H�)�n�S�!�Z^�� ��F����,3�u��t�e0��g�C���>t� �[�Q�c
��r`H�q���?�����@�����a�@T,N�		�e�˫cgP��,-��Q��&�/V��{wD�(p*L�95*Gނ��B�
�O�Ԩ��
՚~�~w��(&6*�27�*�b�{�
�85���a�����|}��S16�Utjԑz���~"��G� ����'l�Sq�'6�X�tZK���{�Ӌ����R�:���ӣʌ���6[��OT�Qo����A\|FW����2�woǯ�Rxc��00�p�'^�@�zjq|jj�>�8�|-O�.x�}Ϛ�9:z�0�������'����6qh{��qi�V���B�8D�M\��=��HB�^�m�����m/��`Z��V�������E~���0��6��	�df�-����y����H���cc��oc�DKM��Z-���Dn���O�?^��`wɬ���]D;���p�����o,�8a��M޺��{S�����=:᰸Km��;���=lh�/c!������?���Q��T�5%��bU��T�����Qr[(�Q�^u*���ϫ:��*���P�-.`��� V��X��k0א$\��ԬIJqy��v�s���C��]��cW1\�� �$�U�f��Cfk�F�pu�v=��e��v�6А���{n���M���c>.�Ն]<=��E���3F��� =?�a���*X?m��m�:3 <h=H���d�3j�����D:j�F�rwz�{X��x���Dlܧ��k�`<�k#������n�)�C*�sL.o�Ϗ������B�u����ӵ�����ʹ4k}���D���+)Ƀwx�
���b�.�t��CR{�ꊨ�:N�������$�>/=Vy����	4���taU��w����̔� � �4��9��4@E�PPU&0�i���X잊�L�/��R&}-eV��$���M��xg�l�v���=�&�Լ��,xa��(&3�T��w�����?e5���:|���/`�_�K�F�]B��6����C�qjé_�������8�C���~���
M����T�w!�A��ܮ��˸��R���^��A��3�./��=�U�Bjw�\jV�uElU�����[��(������20gGvp�*����w����  D5(���)>��xX�����ܜ`A��K}K��k�0&dD<p�IQl�Ϯ/�S]� ��VQ�6ȥe��.iښh`���3���p3ʌ��IXa�Z�4(�@	#���"횰�H^��E�-�PdЂLs=ݽE�AV4�8��'��++"
� q�K���n�����A<�	�r�uS��Qro�1Vkj��eЃ(l�߃%�&� ��6Qx��(����/b��JK���9�0JOy�+k]K�Y�%W0bV�;�
5R4%8�x�
k�GJ"6eL�VX�O0_l�!��p��Z�e1#S4c�U�-l'�h�|*��Zk6�k�0A�Mm�9�.\=!��Z_X�q�҅�����V�Hř�k�p��������gxa]�wZ ;Jq(������0��0
�ͪ�j�%~�'é0�c�[�!�ar	 d��;
�e���_�yP@SuP4�4\���}L���h�k�aLܴ�Ly��aE��rcl�4K�N��Sޘi����#�Qd
�r����eD�&oxٵ��s���0D}7S3�"�k�)����0���^�Ƨ��P��5nn������b�VUA4&��%���;y�(������S<���B�#�p5�4.��fW���Z\V� �xJ���r���>��L�i�K�p�?د��?�4��֜->CFZW���K
V�3�:�9d|� ����,楪��/�}��b2��R���g�X��Z�9�԰a[6�s�U�$;e��l�T�0=��$b�����JM$h���kq�a�5�F�E�v�ש���0b��dbsA8d|F��ַľ|p����Ƌ5I�w8�#��|*s[�� �R[UM
��`<cZ�i����ר�ݡ�r���%N���W���C>��lp�-��������4�����ݮ�|P�㌷�����կ�ML���r��h�8�\��qZHTo �_�������5<��7T�Ӏ�������5�X� �Z֗���0:i��V>#k����y�SDq)��sj�d7�nR9�|)�<�IڦWA�#%��<�.�7�
�m��)�l���[����L7cA�פ���"�i�9�P�oBÏ�k���P��3��cv7{�7����|@�mT��Ղ�('�U�)bl�ꢜ@�N`�$�}��k��y�PǣX�Q̪�Qh�VL�nJs/J����j�@�ؕ"JԱ�;"�2�5
eڂ�E(I��
VvM�T�%'�(Zqᨀ�S%	=��4rƵgr+̱�c^�u������$�x�+6T��=n�r<ܢRx�8�ELb�W�bZǠk�ǭ8ǂX�G��S+�bS���,��s,#yպd���P�Mhq��łd�_���<�J
����K
;"�1�:�B���@���&�uz�p���S��	P��r7s�U�a��dem�K
��Dk���u��3�8^��R�w�
͑ž(Ҏ�K��,v��<ܾ�������b����z����r\�!%�֌_)�Ŵ��Z��sı@W�W
u��@8�⒟EW2�֐���-�����Kh�+�\el��H�?G-F�)�x#ѲOPk�1�:r1�|l�pT	��,�PLs��[��{�(��m��#�x�S�Mc�[�K�A�Sn1����z��c�-&�If���S����Xd�z.h�$l1FB�x�!�klq��c2���Pn�;fwQց�����"S�+�bd��I�רc^����]�92+Ա �:U�O�����zW+�(S�-n�� e%3��'��
Qo�>��'��ݸ���il�.NG���R��{���ѧ�b�S�!�'ϸ�x�γ�fj���ۻiM3}�>�k<��5	N
"�B� ����A�<X/
H���b�a
0@��:M�����&��֘���p�
Z�k�1Ӈ�#�?�/��ٻ���5��}vX���Ӄ���%ԡ���#�'�bS#=�w7Kh1Nl����業}���+h1��}Al=�k��bt~ �V_���d1�����l`�o_t�&���N]u�9�x�,6\p��
d1��j��R}=t�v�,Ɣ'������fq!h*�L��w,�����k"~ oP��چ�~�u|�Z�: �Oe��/��[\�E�*8���X��+�y��b�ir#�x[�W��z_)�y�(���h�,J���‛�{|���IA<�yn1��U��f2^�'A���R1T	wדvmW� �-�t|��!M �a�/	2c�-� '
|����h�m9���Z����긱���X���<�t'���U�CG���Ͳ�ol=l�(�kp1���Vi�9�\L�ʞ�&&�&Ȉ�?s�e'��5N�!�z�\=���o��u�[Q"���Y�����9]��i2*�&=vM��b�K�H��Z�Z0��)O`��`zus�bWI.6���D������A�����u,�Ÿ@F�m9�!2�1G+B�a��J�vmOg��	��k.�ԇ�&x���
LuXӔ<���81��9��
/�T�$���� �Vg����x/�<0EWB���bb��F���}�� ϡ��	��E��Ś^���3�H�[�b�    7<4*ngFD�ы1p ]eZ>f`4���b*b����P�^\�i1�ȸ�zq�d�4���1�
�Hg*�$H��;.T���%����w��t����-3���q��-~q��"�<�>~�&b����t����	�K�j(��Scl��
|��c�u������@���i�ח֨�v�0&�;�A	�c���\�F%tG"�ɚ�V�
�)	>(-%�� 灦E���B�k~�^�C)	>�=_-}TB]Vc,ʈ�W��[R���&��-��P�M�q��)H���B%�Ƭb(�I���c*�k��%y�0�G&Q��gi�n���kZ�5J��
a�g�m�%L}a�_��*Bsģĩc�� ���2�$���%���� �n�"��[ ��m�J��`�ʱ
�׆1n���4� �E�E_��a|�	¸܊iWb�a<�5Ø��Bh�7@�����D���T�h8��S�ˮ�L�/���p4{�/@��7� ��a,[	16���c�Ǆ�4(N�d �C�)�YA���b`ˠ�bLU�T'�:HyѵM���Gc��w� nu��eZ2R�M�y�{�	��{|�b\��v�� @��b��lY(�2�Ya��������&WŘ	��#Of6�
� >c���Zd�t����G+`���n^�D�0�e��"� �8�eG��w�:ȸO������J�1J���do��U{E��_��.&��cE���$ Y��ծ�nh"�}�� c��k0�L���2�NT�_D/f
2ƍ};�^��d�����2~<c�ҶT���\'+�	��9��`�M@)�B�(c�kQ�I�XƦ�����9�t�2�r!�9�t�2.�y�V:շN~� �� <���������0c,6`�Z �ܰ�8MUWhƦ�@ڡ[�xN3.��&2 3G�u�)pz�g����i�1��8�����s&�f��v35�)����P��=\2�o����L��ƪg�Ƹ��#иFcz�Y�\������a��#ϘV(��O-Y-�9 y�3���a�����+�8��j���^Mpƣ
�-��f�Q���u3�$���wƅa���f��fLG^ �z�,
�$����_�����R;u��36xj���k��-���"��ڑZ�WL��bgˆ@LV4xrF�G:c�R�K��e�P JtEտO�G�1�D���c%I`G%˸���:iL�<�����лo��,a�m�7&-��cyiQW~�c�+-+�H3�Úآxi���	͘*Ɩ���,+�1/j�(=骴d!�i����<�"�:��С5�XS|x�y������B��]L�4����eh��$�ϘJ��� O�^�(�Θ<�H	�/H���3ƌpG��v�1I�$�b	�K�ks$�`@c��X����o���5�m~`��-�1z?��fZ�H�(��8���E���Ⱦ"�$��T'Ib��hL�'M�'�f_��5���u��3�\���iU�U��/I��Ƹ�T�	y�G��KZ��G�1��B:p�B>-hțLcr�{
$Z��4Vt?���PC�4&ʹ��L҂�<'�;�ރ��ȫ�-5TߚK��U�q� 3��r���bF]y��<�)��@���C���4��<���T?ތ�?�ے�F����/����nYK�Bf�]��t��D3�;��`�T���5И���� d�3�H�����t\�i��s��fo&��[P��K��.�ƚ*�2��[&�F�����O�i���Ϩ�%%��\)�B�c��%m�y0��ƪgPT�%�7�yC���Id�ט���@�آ(��llvd�.m'�G���ѥ�L=�*�%AG�p��%�$��k�~=>#��A	B��XVN �k�?�MF��㡪Io@���f��� u�5�xA[�1��=oCnV
��՗���EnԔ��T�w4�%�ڰ���S偈�����'#�آE���%T0��Pc�4R�%�xD�����<B��p��?]R�kbh��$��T���0b�M���+�`�_���ˮ@���GM�a�-n���K� �O��XA�U�H��.��KYL�����Ϲ�U/B� I�c��*JZbd
3��ԥB�0p��XcS�7(���3�1�K���C
3��J��a
#yk�,G����#(�^$�	6.�� �Z�ظތěy�m#G]���|�,]#�+h�_�"��Sl9A��G{�C�����#�����jGE��ض1�|�'hcU�$5M�|��hc��+0�5ڸVs�݅N|�WhcU>j�&>�[`clSf���9Wq�u;�Ӆ�nz��kL6�K��M��&���H���(9"oa���5��'X��o��4���X�lȺ�T��C�Xc�b��^�YdЉ�X�e8�̢z%*�Ɣ9�gx�Ll�C���BfW)�'k�1t4��c�J��6�9�*7�ẁF^��%��z~Y�+ǚn\n�.���2y�7)6`y�oL�,M��3±.��t�*��	���{��+��Z�˰B�Y���,q\s�<��>r��UC1��-�c����%�Z"���<g��g	NGނC��.!���ژ�Ք9�1z�c/��Mz�,�j�x�a��h@���eb���cͻ[3�U�1M�.�H��z\����~r���B�c����yh(y�=&s�i'�)����@�	�pYKd�>h�k�1>Ȳ��m�q��;6���3���~��Y�iŚ~lvt�
���M�1K
�BL+~
�L�3|����Y����P���\�W�B_L�)�2�%�B��<� �5��m��_� ײ��$W-���	BFaG�-�'�E��l��˝DeU���>#!����_���7Q�(�F�3ַX�T�Rۮ����!c:`�lX��U�X�������u�C�e�0�I�3�*_@�kz-�,�a�"2u?���[n "�bt���&yAĮ��`�=մ��\�Ɗ,`����d�Q\��?�CYYd�����R�;�,���8�*�/�e�����td��-���ۛ,<e+��z٘�A4�ÓB����*wB2$��5 G��}���Ag�B1p���:��V&S���j�������l�R�]��.oB?�W�mr�r�_��&�{�,�`�"O53�~��Lθ��ܦw��e*gU��s~�lw%Hf�:��-WnC$#�<%{^C-��ɋ����4l��USSf��ǰ��A]�'q��/o�a���&f԰��B\^J
��*�U�2I��e�1�љM�TrI���m�e�Q��{��,�td���J��6]�HH��.kBs�U&��]�c�,[��M�e�	0G?^%/׊h�d��xzY�[�kZf���u��؉FY���0�u��-�Hc";��5+��� �� �>hI� `���Z|�d0�bx)��|�`&��l[����f�˳B:��չ���-O���i۬{5�g����T橥��g�	�y��B/p�-fI��7��X-�]}RX;�g�ʺ�R�^�*�_�WJ ��\e��P���pL��\��g�deRSG��8�w�V�Id��d8�w�V. ���I���ʅ㬙��f�x庡Y*E��s�W^�����=.�W�e�ګ˚�
m姈er>�Қ"�6d�s*ڝ�_0�?�Y&�9����7`WA�8y}d]�`�s�2M�T�~,�1l+�-[���L��d恶��C�;(�Q�p9������Bs,��\h��K�e2t��֘1ZW�eL�d}������`�>�hl߭�w�\��}ۣ��i���_�
|]�4#�v��|��9����l���e��L�*��f>�.�"��<�l��u� �]��7@y��o�2l�u�?��@H`c��.����2z"S�jx����k���2l�'�eME)������yIkM��4e3�|���4_����f�_�SzpO#��#}�d ,<F�8����    �$=�7��cP�����@�r�
P͈pj���\yTK�
0�xI��ў�g���a0��{����خ ��:��V�Ȳ�,Bb��Dhe�����H�%��؃8�w�b�iF��8�w������[���k00�#�g&�`��B��&�6��ҍ:�)��r)�9\�1/d����Z���*�YӟKu���+���I~�s�ůp#�y��v�gK*,gv�ȬːG�P��d.E1��
�Z�,�7��́�a��0$�դ�\�&&3����v(3�̀�S�!h��و2#ɹc�K����rj=�{�\f��Pڱ\�E�-�3㷔{.y�@�UJ�Eف�;3G�|�UNJR�r�Wޒ���	�-w�MP"�9��2���\I)�0�D3��N�V���Y����,�%��T:	��a�9����T �ڰ�3��Y`�5�ĄϬpZCG'�@�A+քf<æ�D����u� ���&xUWC(:ҝ7�K9Elr�F0H3/�E%fO����Lʀ5���EśwJs-[Li��-��$�ŧ�珬8J��cq��R��G;7Ps�ŖC�m_nBj�k���T��� �����Ł��h�%p�{�ԑ��G\si��!��$�Q_�ڂ��Ll�Gf����}b�>�6SQmE��U����\|t�kZ�\�s�g�f�WX3ܖ�1�qܳ7û�-F��+�f�Wm��M��ŉ��jxb�<��^l�t3!,h���.��
o�/�����h��fC����	�R%��_�7/T��?���7/5�\A�R�͏�M����斨�͙��J�1�4P-�R����&�9��Ӝ�~�����͙�+�s���1>K���#�����8����='�s�s�^��6f�.Iε{���еQs�{G9�vo+
[s���r�Z�T�"6	6ڒ�5�!�?u�9�]М��H��6���ι�֐>Jp ��c�X��< �u�f�=(�A�+���+�I]���7���Q���8�	�Y��y5��Ck�%���!Tg4�7��9z�u.IM8�} ;۲�buؘ��dg�ӤPx��溡J�K���@�fpg�L'J�S#�#Z���D��^��>�i��|WNq��;C������
��g��bd��X�5๝�@���K�3��;ǿiŃ�Du<�ρ�3�3yz!�"#zJxf�D�Ph��u�>\3��a�3�s����q��U\��4����m̳�\ܦ���!�㳱�"�@�K��A�PbL5�Ђ����Ps���{4{)��P�8�]�5���XϸG�O��C��Y��s�3�u%�<���\J#�q��D�9﹬���'ï��T",0��S�W�g�,� �����5�Y���3��������Y��b�4s(��E��Ϫ8^X ���d���3Ƙ}q���7r��w�6?�'�`��Ub�=��F�3*����%4Z���Q��i/Ȯ+��!wom~�51z�?��Z�a��5�?���ոQPr�7���!��g_UZң% z)u'�F�nؽЫ�]�D	�^!�Y�e�Й��&�
�� �e��.ul�2���zٕ*)X4V�r%%;z��V��1�6��ýKgD�w�"����dFc9XA�;Z@���K�qȦ����0������B�{Gh�&�� ���Gos�=% 4Q��� ��$奫���o��1tc��K8�MV�b�,�9�P/Xд��[Y%�~�K<��	��88�i��fO"�?�A+�L��s`��Y?�A�0��;Ir�G�BX������a!�0hK1�*�f�h���hJ�T��K�K=���G 4��D�iߞ�� Bk�Ԙ;h�̚"=�E�b�j�(Jp���6X�,�_��$ŧH�i��L?3�ے3*���e�q���9�O�|H�&=�B���$Se���u.4U���O�s�m�ى���z�]S!-��,K7!fa��;��Z�[����w.nT�..���⦒�)
l�L+�I=B��Ϻ��%����»�O�T�Y��y4��6]����1��X�����C�)�Buc8n~Jy.��`F�&�i�kγ.���a ������x����A�Iz��/��gI�Yώ�;ᬶ�)��_ў��r?ҮS�5��A��Yȅ%�%I����B��#��AIH||!N�_�A`xl��Λ��|��ؓ�:���`�E�]`:p���O�a�OMN��B�E�|Ϡ09�������cQ��$��>�1Ѫ�)U�Gq��OHєۂ�iS$Λ�hLG��d�O3�9lb�0-aі�����12xJ�ƮfN�11x�����^f1}�zl�&qzc����3s����<�Ue?cY��zv ���T}��ߢz�� oaF�[p��M����P�D��x��)6���ymO�#l�#n4�Ϛ�}Wq+�ӛ�h�5�R��i�<��k��:�$�4��9�Ŏ�?�C��=tΝ�%��8�|3��oѣ	���P�)���
�����Ɵ�J�޼R�A��4� q��"�z����-�@EMI��_,� ��4dB�4X�]3ڮFG�tIp�X����0����.��p����t��=%��X3��!��i�� ��i��DY��ƬP���(�<ǰra�����.
O(�;�5 �j���k�%M��9^2�W,i܌�o�;��Ik\�Q=�`���&]KyK�K�]%�4���02dEh�����]-$Rc�T���r�E�nP�m�4C��]C-��X��4ǟ�(�+M	�?Cb���1Pf���p�ݎ.��7���M\i
�V�	~#L���t,��؏{L��%&y�`���,$gRG2_��Ƥ����22'�A�9\Z�~N�J_�w�`��!g������X��K����3�`ڒ��t:�$����Ć��a8��R�L}3]��S�����i�}���OP�m���S��Qx��Z	�gH�6�J�ʱP YIg�TSk��Ԉ6�I�k�h��>	���i�2��@0��S�5��o�HVЦM=,�Ծ����
R�Ӹi����ꏮI�/$I��߶���"&	(�8���<�� ���c)Ȟ�}�LB���i0oX߳�I�U=�t4%��}w�A�R%���mG&I\�
<]�izo���T>��pc��p��U7�t��mX�-	�dOc��f�'��E��|�6Ⱥ�If���iҘ��v� �}�>Xi&#te�hQ��z�֛�
�E��%�]|��+`�@�)��,�7�v�𫇐��w�=bɭ�j����cnPe� ֫4W<�1m��e�~Z[a���հ�q���J� ��E �Ua��5���RJ<����*�
z�U�J�5Y��8�9����^_�a�xw"[�<˂��n#Jp|��B���"�o� a�K5v8��x7��P��˦	3�5R��>@Z��My�F��Dj�EX��6sEN3�I�	�ʮY�fdRS�*f��t/�j���J�#�V@돨��]��@V3M��Xy�f�ɖ֯��L���3��q����d��R�(z��l-�Y���-,��nZ��W\j��nד1�ނY�;�����4�?S�u�	����%����!k$�z�Mm@�[W��z�N=��D�m<u�4�%%�Z�K�;p�F2�P�?r�r}��2Bm6�u��/��t���No���Z�<J5�nF6�P�S](�@��@��sSM����Z��B�6(��|���B���j�;W���f�(յ̨�L�3gg���~}�i�3N�����*���z�TS�?<�0����[8�X^��;H��"ȵm�rTM
���j���-��V_E�pk��"��.���kT5���48��U1$�H��s��Ɩs�W��Y����f��]��׭��Ҫ�*U@�G\5�R�k��\������L3<W&���v³Td�܊�.Ee �A�������rf�~�+�ul56ߢ\n�³;Ȏ�l9�\�8�4�`�H-�����I�+Ҝ\] �  ��¦�g[/ء]��xPc���Ҍ����)��i�\߆����/�q]D�f����R���L_z��_�jMe=Xsl{v��n��Q@�%��4o(�3�m��`]S�n2�3+�tEo���\{=AX�])�d_oA�y�\#`�!���:�`��^c���tI� �r��c`�D�P�ʚxЖ��p=��(�F��ނY�I���9�)�W~A(Ԛf]N�z�AhҶ�Q�%p֘�k�T�9s��49J��g�k���j('�
K��h]LJ���7l:�Ŵ�t���'��rI�5&b�A��${�Vt��8�(6eaO�:��by�6M��k�5�;��&1ӝ�Tlv�̐�4B��I�%ښ<$'�IҰ?`[��wn�!tj�^�[��<�����U|��1՚���\m����S1�,7�y(�- ��o�v}��A�צ����h~�3�>�E��7���Pd�x�m�5^W�Mn�\r�5��a��C�P`�ε*F��v���@׵�U�{�E�����ى�[F�Y׮t\Ī�Ԩ#�Z���x�
A��r���d��R��-y�D���O��0'^+~A�)�^#�&�g'��F�6H���K�X���Yy�A�-y��efSQ	N�L�q�l��#�3�)���.,{3I�7��Zܻ�~+��Q��kǜ�Gu�k*N7�M7�NKPv�^��:xq�[�f�2̰׍�&���-�5F��	Z�G�k�@������A�(���=#�G�X���{�#�g	6N���|]20��$$*[��ў:k��JxT��{��3�-�ץ�9\75��;#�����ǵA3�����fhO=�(�7���R�Ųj&;*��M��	3�{_����p��;2(vjY���[셎�1�Ȧ9f����QQ�~���Qg8�n�^.z�5�
v� a�I�?Ǝ���f�Ԯ�ٜ�]jjڶ�tV��W0�rx4�t���a�s���vv�=x����.k'��w�}�3$v��(�|E;*�
�]
�4�]7jƚ���s�{l�9�ހb�=���A;ǹ�+*6*m�wr��A�E�ީ�o6��g`�V�m"�����6{�M[ĵ0��i�s8������p����m�G�J86�5=5��eN�&���K>�]pp�sR�����=����|l���1���_=E���E�VE?2�'���Ҵ��|�W��&�����~��.&��χN���C/\�� �^c�k�ϰ��(e�ɦ�����W�-N�m�Q�Uef)� O����!�~�#8y�ʦI�A5V�ͅ���s�l��9l��СS����M�Fbr�6/PO��W�̄�-��jD��]�������#H.�q��ȅ�j%*�٪.^�m㊳=f#�Qu)�-k`�^�ι�5�
0ۖSEؔ��^y9׀٥G`����c�.6�"��ٳ8P���l<4f��8�g�l���uŔ�=d�R&�g�E��AJ ���+Ŷ����`6U����$�[�lD2������Й�c�@bp��lV�ҥe{8�F:gb.iۛ��(u���l�����$l�������3P�%0�SmU(Գ��D�,��Jb�Ev	`�1M��r��1��?��r7�٪�ႌ�+��tre� .iz0�/L'2ە�s~��a~ �3d6��G����Qs<B�
�F�����&f���?�����m�F��R��	0�>���WL+��lU#X�)�R��&0[��xbJ�s�l���7o&�"m�j7��z%��+`6m�YD�+�S`�����8e{�.����(^q��`v��v�=�6R�(��{�Td��&��$:��A�Z��?����Kjؾ�˶��R���˦ҁ�/�^s��
�]��������#c�*.[��ջ���G\�d��i�/;��<x	�;��=�mo�^}�o8`p7�ٵ7Y�o�`��,|$qCo�555�h�^6����^���l���� �n4"y��VX�,2�՛�<�e����f@#�,/a��}�Ǜ)l�,�@�¼@�Hҋ͖��f�l��]8��P>~vl���}��ͷU�*���F9̐`�r�g��Mbᾶ��h�:��̦8nry;h���l�c���$���r%D�~���A����3�$�ޯ�͐٘�
�*�ihG�����W����I�!�i����ۑ��A�.���^,�5^6c��`���wj��G��$z7е��lZg�9ؾ���X0�;���lCi�O�L/�$l�D�~���8F��9T6J�@۷�&�bl�ދX0�C�~P�'k_!e�x%����zϴc��]��$��Rv�T��z	�^���3�{���9_[T�B'�g�z/�ڒ��o���t�)(��>Y�d�%_{��N�+el���GX��d�;
�}� k��-��I`U`��ׇm�$O@��a�}_ ��!*ۣ�5��F=Q٠�N���l^{����ԟ5���]� WH�
�>��2��i��&i5�A��۰�[�D�p�Y����t��=eӉY�&)����G=��lUOAxn��J��l� /��h��i�SR�FSئT�eʮ�-�\�ӕW�l�f��V�ȉ�+Pv���z�jo��� 45�4
�m	ʦyg�٬���A���,b��֚c�%(�]���Ӳ	ʦ���aU��&(��XUh�W{��hY���u�i m�'���[fo�
1�d�	�=��'F՝s��Q���B[>��2LvM��O����lMٹ����l��Bm�N�W�u�P�u�Ȯ)�@����fA���##�Nu�$j��uXVy�ȶ���oa��##ې���Z�aa<���FW,�=պ�����F|��.�)5	6�ۈl�C�X�A�KG߀'7����nRl�;"��L�~CiS�0(6�kB6���s��$�D����9�̠ۗ(6�>6�t�vgAq��V�o*Y��=��8V�*[��ϊ��[�	F�@�֚)����E���)N�F�Ԍ�}�"�Z�C���nfvxS��)Ŕ����{�L)$ �6���s� ���4���,e�.�8�e6聨=d����+hNPި��K:�NM^��'؁�4�Ӓ�|l]��a��i�>v�7��gjo��d���*�Fkj{u��M�����.jrW[�K�yv�p%� �]��Y�N�$��|��	��Ƕ��c��j�������ۿ�����I�     