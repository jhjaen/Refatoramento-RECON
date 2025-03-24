create or replace view vw_lkm_fbl3n_estorno as
(select distinct to_char(LPAD(NVL(regexp_substr(replace(a.txt_histcompl,
                                                       '',
                                                       '-'),
                                               '[^,[:space:]]+',
                                               1,
                                               6),
                                 0),
                             9,
                             0)) || '-' ||
                LPAD(NVL(regexp_substr(replace(a.txt_histcompl, '', '-'),
                                       '[^,[:space:]]+',
                                       1,
                                       7),
                         0),
                     3,
                     0) doc_x01
  from x01_contabil a
  left join x2002_plano_contas x2
    on a.ident_conta = x2.ident_conta
 where a.cod_empresa = '001'
   and a.Ident_histpadrao in (16)
   and to_char(a.data_lancto, 'dd/mm/yyyy') = '01/08/2020'
   and x2.cod_conta in ('23611', '20280')
   group by to_char(LPAD(NVL(regexp_substr(replace(a.txt_histcompl,
                                                       '',
                                                       '-'),
                                               '[^,[:space:]]+',
                                               1,
                                               6),
                                 0),
                             9,
                             0)) || '-' ||
                LPAD(NVL(regexp_substr(replace(a.txt_histcompl, '', '-'),
                                       '[^,[:space:]]+',
                                       1,
                                       7),
                         0),
                     3,
                     0))
minus
--union all

(select distinct to_char(LPAD(NVL(regexp_substr(replace(a.txt_histcompl,
                                                       '',
                                                       '-'),
                                               '[^,[:space:]]+',
                                               1,
                                               7),
                                 0),
                             9,
                             0)) || '-' ||
                LPAD(NVL(regexp_substr(replace(a.txt_histcompl, '', '-'),
                                       '[^,[:space:]]+',
                                       1,
                                       8),
                         0),
                     3,
                     0) doc_x01
  from x01_contabil a
  left join x2002_plano_contas x2
    on a.ident_conta = x2.ident_conta
 where a.cod_empresa = '001'
   and a.Ident_histpadrao in (14)
   and to_char(a.data_lancto, 'dd/mm/yyyy') = '01/08/2020'
   and x2.cod_conta in ('23611', '20280')
   group by to_char(LPAD(NVL(regexp_substr(replace(a.txt_histcompl,
                                                       '',
                                                       '-'),
                                               '[^,[:space:]]+',
                                               1,
                                               7),
                                 0),
                             9,
                             0)) || '-' ||
                LPAD(NVL(regexp_substr(replace(a.txt_histcompl, '', '-'),
                                       '[^,[:space:]]+',
                                       1,
                                       8),
                         0),
                     3,
                     0));
