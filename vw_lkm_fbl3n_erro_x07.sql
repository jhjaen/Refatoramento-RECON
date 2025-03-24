create or replace view vw_lkm_fbl3n_erro_x07 as
With LKM as (

--- 20280
select to_char(trim(lpad(NVL(dwt.num_docfis, 0), 9, 0) || '-' ||
                    lpad(NVL(trim(dwt.serie_docfis), 0), 3, 0))) atrib,
       to_char(LPAD(NVL(regexp_substr(replace(a.txt_histcompl, '', '-'),
                                      '[^,[:space:]]+',
                                      1,
                                      6),
                        0),
                    9,
                    0) || '-' ||
               LPAD(NVL(regexp_substr(replace(a.txt_histcompl, '', '-'),
                                      '[^,[:space:]]+',
                                      1,
                                      7),
                        0),
                    3,
                    0)) NUM_DOCFIS_01,
       to_char(a.num_lancamento) num_docto,
       to_char('') tipo_docto,
       to_char(a.data_lancto, 'DD/MM/YYYY') data_docto,
       to_char(a.tipo_lancto) chav_lancto,
       to_char(a.vlr_lancto) montante,
       to_char(a.txt_histcompl) texto,
       to_char(x2.cod_conta) conta,
       to_char(dwt.cod_estab) cod_estab,
       to_char('ISS') TIPO,
       to_char(a.cod_empresa) cod_empresa,
       to_char(dwt.aliq_tributo_iss) aliq,
       a.rowid NUM_CONTROLE

  from dwt_docto_fiscal dwt
   left join x01_contabil a on dwt.cod_empresa = a.cod_empresa
        and to_char(dwt.data_fiscal, 'mm/yyyy') =
            to_char(a.data_lancto, 'mm/yyyy')
        and dwt.movto_e_s = '1'
        and dwt.situacao = 'N'
        and dwt.vlr_iss_retido <> 0
        and trim(lpad(NVL(dwt.num_docfis, 0), 9, 0) || '-' ||
                      lpad(NVL(trim(dwt.serie_docfis), 0), 3, 0))
                      =
                      LPAD(NVL(regexp_substr(replace(a.txt_histcompl, '', '-'),
                              '[^,[:space:]]+',
                              1,
                              6),
                0),
            9,
            0) || '-' ||
       LPAD(NVL(regexp_substr(replace(a.txt_histcompl, '', '-'),
                              '[^,[:space:]]+',
                              1,
                              7),
                0),
            3,
            0)


  left join x2002_plano_contas x2
    on a.ident_conta = x2.ident_conta
   and decode(a.cod_empresa, '001', 'SESI', '002', 'SENAI') =
       x2.grupo_conta
   and regexp_substr(replace(a.txt_histcompl, '', '-'),
                     '[^,[:space:]]+',
                     1,
                     3) = 'ISS'

 where a.cod_empresa = '001'
   and a.Ident_histpadrao = '16'
   and to_char(a.data_lancto, 'mm/yyyy') = '08/2020'
   and x2.cod_conta in ('23611','20280')


UNION ALL

--- '20470'
select to_char(trim(lpad(NVL(dwt.num_docfis, 0), 9, 0) || '-' ||
                    lpad(NVL(trim(dwt.serie_docfis), 0), 3, 0))) atrib,
       to_char(LPAD(NVL(regexp_substr(replace(a.txt_histcompl, '', '-'),
                                      '[^,[:space:]]+',
                                      1,
                                     7),
                        0),
                    9,
                    0) || '-' ||
               LPAD(NVL(regexp_substr(replace(a.txt_histcompl, '', '-'),
                                      '[^,[:space:]]+',
                                      1,
                                      8),
                        0),
                    3,
                    0)) NUM_DOCFIS_01,
       to_char(a.num_lancamento) num_docto,
       to_char('') tipo_docto,
       to_char(a.data_lancto, 'DD/MM/YYYY') data_docto,
       to_char(a.tipo_lancto) chav_lancto,
       to_char(a.vlr_lancto) montante,
       to_char(a.txt_histcompl) texto,
       to_char(x2.cod_conta) conta,
       to_char(dwt.cod_estab) cod_estab,
       to_char('INSS_PJ') TIPO,
       to_char(a.cod_empresa) cod_empresa,
       to_char(dwt.vlr_aliq_inss) aliq,
       a.rowid NUM_CONTROLE

  from dwt_docto_fiscal dwt
   left join x01_contabil a on dwt.cod_empresa = a.cod_empresa
        and to_char(dwt.data_fiscal, 'mm/yyyy') =
            to_char(a.data_lancto, 'mm/yyyy')
        and dwt.movto_e_s = '1'
        and dwt.situacao = 'N'
        and dwt.vlr_inss_retido <> 0
        and trim(lpad(NVL(dwt.num_docfis, 0), 9, 0) || '-' ||
                      lpad(NVL(trim(dwt.serie_docfis), 0), 3, 0))
                      =
                      LPAD(NVL(regexp_substr(replace(a.txt_histcompl, '', '-'),
                              '[^,[:space:]]+',
                              1,
                              7),
                0),
            9,
            0) || '-' ||
       LPAD(NVL(regexp_substr(replace(a.txt_histcompl, '', '-'),
                              '[^,[:space:]]+',
                              1,
                              8),
                0),
            3,
            0)


  left join x2002_plano_contas x2
    on a.ident_conta = x2.ident_conta
   and decode(a.cod_empresa, '001', 'SESI', '002', 'SENAI') =
       x2.grupo_conta
   and regexp_substr(replace(a.txt_histcompl, '', '-'),
                     '[^,[:space:]]+',
                     1,
                     3) = 'INSS'

 where a.cod_empresa = '001'
   and a.Ident_histpadrao = '16'
   and to_char(a.data_lancto, 'mm/yyyy') = '08/2020'
   and x2.cod_conta in ('23611','2470')


UNION ALL
   --,'20471'
select to_char(trim(lpad(NVL(dwt.num_docfis, 0), 9, 0) || '-' ||
                    lpad(NVL(trim(dwt.serie_docfis), 0), 3, 0))) atrib,
       to_char(LPAD(NVL(regexp_substr(replace(a.txt_histcompl, '', '-'),
                                      '[^,[:space:]]+',
                                      1,
                                     7),
                        0),
                    9,
                    0) || '-' ||
               LPAD(NVL(regexp_substr(replace(a.txt_histcompl, '', '-'),
                                      '[^,[:space:]]+',
                                      1,
                                      8),
                        0),
                    3,
                    0)) NUM_DOCFIS_01,
       to_char(a.num_lancamento) num_docto,
       to_char('') tipo_docto,
       to_char(a.data_lancto, 'DD/MM/YYYY') data_docto,
       to_char(a.tipo_lancto) chav_lancto,
       to_char(a.vlr_lancto) montante,
       to_char(a.txt_histcompl) texto,
       to_char(x2.cod_conta) conta,
       to_char(dwt.cod_estab) cod_estab,
       to_char('INSS_PF') TIPO,
       to_char(a.cod_empresa) cod_empresa,
       to_char(dwt.vlr_aliq_inss) aliq,
       a.rowid NUM_CONTROLE

  from dwt_docto_fiscal dwt
   left join x01_contabil a on dwt.cod_empresa = a.cod_empresa
        and to_char(dwt.data_fiscal, 'mm/yyyy') =
            to_char(a.data_lancto, 'mm/yyyy')
        and dwt.movto_e_s = '1'
        and dwt.situacao = 'N'
        and dwt.vlr_inss_retido <> 0
        and trim(lpad(NVL(dwt.num_docfis, 0), 9, 0) || '-' ||
                      lpad(NVL(trim(dwt.serie_docfis), 0), 3, 0))
                      =
                      LPAD(NVL(regexp_substr(replace(a.txt_histcompl, '', '-'),
                              '[^,[:space:]]+',
                              1,
                              7),
                0),
            9,
            0) || '-' ||
       LPAD(NVL(regexp_substr(replace(a.txt_histcompl, '', '-'),
                              '[^,[:space:]]+',
                              1,
                              8),
                0),
            3,
            0)


  left join x2002_plano_contas x2
    on a.ident_conta = x2.ident_conta
   and decode(a.cod_empresa, '001', 'SESI', '002', 'SENAI') =
       x2.grupo_conta
   and regexp_substr(replace(a.txt_histcompl, '', '-'),
                     '[^,[:space:]]+',
                     1,
                     3) = 'INSS'

 where a.cod_empresa = '001'
   and a.Ident_histpadrao = '16'
   and to_char(a.data_lancto, 'mm/yyyy') = '08/2020'
   and x2.cod_conta in ('23611','2471')


UNION ALL
--,'20353'

select  to_char(trim(lpad(NVL(dwt.num_docfis,0),9,0) || '-' || lpad(NVL(trim(dwt.serie_docfis),0),3,0))) atrib,
   to_char(LPAD(NVL(regexp_substr(replace(a.txt_histcompl,'','-'),'[^,[:space:]]+',1,8),0),9,0)
  ||'-'||
  LPAD(NVL(regexp_substr(replace(a.txt_histcompl,'','-'),'[^,[:space:]]+',1,9),0),3,0)) NUM_DOCFIS_01 ,
                to_char(a.num_lancamento) num_docto,
                to_char('') tipo_docto,
                to_char(a.data_lancto,'DD/MM/YYYY') data_docto,
                to_char(a.tipo_lancto) chav_lancto,
                to_char(a.vlr_lancto) montante,
                to_char(a.txt_histcompl) texto,
                to_char(x2.cod_conta) conta,
                to_char(dwt.cod_estab) cod_estab,
                to_char('PCC') TIPO,
                to_char(a.cod_empresa) cod_empresa,
                to_char(dwt.aliquota) aliq,
                a.rowid NUM_CONTROLE

  from X53_RETENCAO_IRRF dwt
   left join x01_contabil a
    on dwt.cod_empresa = dwt.cod_empresa
     and dwt.vlr_ir_retido = a.vlr_lancto
     and trim(lpad(NVL(dwt.num_docfis,0),9,0) || '-' || lpad(NVL(trim(dwt.serie_docfis),0),3,0)) =
     LPAD(NVL(regexp_substr(replace(a.txt_histcompl,'','-'),'[^,[:space:]]+',1,8),0),9,0)
  ||'-'||
  LPAD(NVL(regexp_substr(replace(a.txt_histcompl,'','-'),'[^,[:space:]]+',1,9),0),3,0)

       left join x2002_plano_contas x2
             on a.ident_conta = x2.ident_conta
            and decode(a.cod_empresa,'001','SESI','002','SENAI') = x2.grupo_conta
            and regexp_substr(replace(a.txt_histcompl,'','-'),'[^,[:space:]]+',1,4) = 'PIS'

 where dwt.cod_empresa = '001'
   and a.Ident_histpadrao = '103'
   and x2.cod_conta in ('23611','20353')
   AND DWT.COD_RECEITA = '595207'

   UNION ALL

   -- ,'20230'
  select  to_char(trim(lpad(NVL(dwt.num_docfis,0),9,0) || '-' || lpad(NVL(trim(dwt.serie_docfis),0),3,0))) atrib,
   to_char(LPAD(NVL(regexp_substr(replace(a.txt_histcompl,'','-'),'[^,[:space:]]+',1,6),0),9,0)
  ||'-'||
  LPAD(NVL(regexp_substr(replace(a.txt_histcompl,'','-'),'[^,[:space:]]+',1,7),0),3,0)) NUM_DOCFIS_01 ,
                to_char(a.num_lancamento) num_docto,
                to_char('') tipo_docto,
                to_char(a.data_lancto,'DD/MM/YYYY') data_docto,
                to_char(a.tipo_lancto) chav_lancto,
                to_char(a.vlr_lancto) montante,
                to_char(a.txt_histcompl) texto,
                to_char(x2.cod_conta) conta,
                to_char(dwt.cod_estab) cod_estab,
                to_char('IRRF') TIPO,
                to_char(a.cod_empresa) cod_empresa,
                to_char(dwt.aliquota) aliq,
                a.rowid NUM_CONTROLE


  from X53_RETENCAO_IRRF dwt
     left join x01_contabil a
       on dwt.cod_empresa = a.cod_empresa
   and dwt.vlr_ir_retido = a.vlr_lancto
   and to_char(dwt.data_movto,'MM/YYYY') = to_char(a.data_lancto,'MM/YYYY')

       left join x2002_plano_contas x2
             on a.ident_conta = x2.ident_conta
            and decode(a.cod_empresa,'001','SESI','002','SENAI') = x2.grupo_conta
            and regexp_substr(replace(a.txt_histcompl,'','-'),'[^,[:space:]]+',1,3) = 'IR'

 where a.cod_empresa = '001'
   and x2.cod_conta in ('23611','20230')
   and a.Ident_histpadrao = '16'
   and DWT.COD_RECEITA = '170806'

)

   select  case when  TIPO in ('ISS','INSS','PCC','IRRF') then
               atrib end NUM_DOCFIS_X07
               ,NUM_DOCFIS_01 NUM_DOCFIS_X01
          ,num_docto
          ,tipo_docto
          ,data_docto
          ,chav_lancto
          ,montante
          ,texto
          ,TIPO
          ,case when  TIPO = 'ISS' then
                '20280'
                when  TIPO = 'INSS' then
                '20470'
                when  TIPO = 'INSS'  then
                '20471'
                when  TIPO = 'PCC' then
                '20353'
                when  TIPO = 'IRRF' then
                '20240'
                 end  conta
          ,case when TIPO in ('ISS','INSS','PCC','IRRF') then
            cod_estab end cod_estab
            , cod_empresa
            , aliq
            , NUM_CONTROLE
            from LKM
             where NUM_DOCFIS_01 = '000000000-000';
