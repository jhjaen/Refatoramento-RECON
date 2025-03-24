create or replace view vw_lkm_fbl3n_teste as
With LKM as (

--- 20280
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
                to_char('ISS') TIPO

  from x01_contabil a
       left join x2002_plano_contas x2
             on a.ident_conta = x2.ident_conta
            and decode(a.cod_empresa,'001','SESI','002','SENAI') = x2.grupo_conta
            and regexp_substr(replace(a.txt_histcompl,'','-'),'[^,[:space:]]+',1,3) = 'ISS'
  left join dwt_docto_fiscal dwt
    on a.cod_empresa = dwt.cod_empresa
   and a.data_lancto = dwt.data_fiscal
   --and a.ident_conta = dwt.ident_conta

   --and dwt.vlr_iss_retido <> '0'
  and LPAD(NVL(regexp_substr(replace(a.txt_histcompl,'','-'),'[^,[:space:]]+',1,6),0),9,0)
  ||'-'||
  LPAD(NVL(regexp_substr(replace(a.txt_histcompl,'','-'),'[^,[:space:]]+',1,7),0),3,0) =
  trim(lpad(NVL(dwt.num_docfis,0),9,0) || '-' || lpad(NVL(trim(dwt.serie_docfis),0),3,0))

 where a.cod_empresa = '001'
   and a.Ident_histpadrao = '16'
   and to_char(a.data_lancto, 'mm/yyyy') = '08/2020'
   and x2.cod_conta in ('23611','20280')
  -- and trim(lpad(NVL(dwt.num_docfis,0),9,0) || '-' || lpad(NVL(trim(dwt.serie_docfis),0),3,0))  = '000002377-001'


UNION ALL

--- '20470'
select  to_char(trim(lpad(NVL(dwt.num_docfis,0),9,0) || '-' || lpad(NVL(trim(dwt.serie_docfis),0),3,0))) atrib,
    to_char(LPAD(NVL(regexp_substr(replace(a.txt_histcompl,'','-'),'[^,[:space:]]+',1,7),0),9,0)
  ||'-'||
  LPAD(NVL(regexp_substr(replace(a.txt_histcompl,'','-'),'[^,[:space:]]+',1,8),0),3,0)) NUM_DOCFIS_01 ,
                to_char(a.num_lancamento) num_docto,
                to_char('') tipo_docto,
                to_char(a.data_lancto,'DD/MM/YYYY') data_docto,
                to_char(a.tipo_lancto) chav_lancto,
                to_char(a.vlr_lancto) montante,
                to_char(a.txt_histcompl) texto,
                to_char(x2.cod_conta) conta,
                to_char(dwt.cod_estab) cod_estab,
                to_char('INSS_PJ') TIPO

  from x01_contabil a
       left join x2002_plano_contas x2
             on a.ident_conta = x2.ident_conta
            and decode(a.cod_empresa,'001','SESI','002','SENAI') = x2.grupo_conta
            and regexp_substr(replace(a.txt_histcompl,'','-'),'[^,[:space:]]+',1,3) = 'INSS'
  left join dwt_docto_fiscal dwt
    on a.cod_empresa = dwt.cod_empresa
   and a.data_lancto = dwt.data_fiscal
   --and a.ident_conta = dwt.ident_conta
   and a.vlr_lancto = dwt.vlr_inss_retido

   --and dwt.vlr_iss_retido <> '0'
  and LPAD(NVL(regexp_substr(replace(a.txt_histcompl,'','-'),'[^,[:space:]]+',1,7),0),9,0)
  ||'-'||
  LPAD(NVL(regexp_substr(replace(a.txt_histcompl,'','-'),'[^,[:space:]]+',1,8),0),3,0) =
  trim(lpad(NVL(dwt.num_docfis,0),9,0) || '-' || lpad(NVL(trim(dwt.serie_docfis),0),3,0))

 where a.cod_empresa = '001'
   and a.Ident_histpadrao = '16'
   and to_char(a.data_lancto, 'mm/yyyy') = '08/2020'
   and x2.cod_conta in ('23611','20470')
  -- and trim(lpad(NVL(dwt.num_docfis,0),9,0) || '-' || lpad(NVL(trim(dwt.serie_docfis),0),3,0))  = '000002377-001'


UNION ALL
   --,'20471'

select  to_char(trim(lpad(NVL(dwt.num_docfis,0),9,0) || '-' || lpad(NVL(trim(dwt.serie_docfis),0),3,0))) atrib,
    to_char(LPAD(NVL(regexp_substr(replace(a.txt_histcompl,'','-'),'[^,[:space:]]+',1,7),0),9,0)
  ||'-'||
  LPAD(NVL(regexp_substr(replace(a.txt_histcompl,'','-'),'[^,[:space:]]+',1,8),0),3,0)) NUM_DOCFIS_01 ,
                to_char(a.num_lancamento) num_docto,
                to_char('') tipo_docto,
                to_char(a.data_lancto) data_docto,
                to_char(a.data_lancto,'DD/MM/YYYY') chav_lancto,
                to_char(a.vlr_lancto) montante,
                to_char(a.txt_histcompl) texto,
                to_char(x2.cod_conta) conta,
                to_char(dwt.cod_estab) cod_estab,
                to_char('INSS_PF') TIPO

  from x01_contabil a
       left join x2002_plano_contas x2
             on a.ident_conta = x2.ident_conta
            and decode(a.cod_empresa,'001','SESI','002','SENAI') = x2.grupo_conta
            and regexp_substr(replace(a.txt_histcompl,'','-'),'[^,[:space:]]+',1,3) = 'INSS'
  left join dwt_docto_fiscal dwt
    on a.cod_empresa = dwt.cod_empresa
   and a.data_lancto = dwt.data_fiscal
   and a.vlr_lancto = dwt.vlr_inss_retido

   --and dwt.vlr_iss_retido <> '0'
  and LPAD(NVL(regexp_substr(replace(a.txt_histcompl,'','-'),'[^,[:space:]]+',1,7),0),9,0)
  ||'-'||
  LPAD(NVL(regexp_substr(replace(a.txt_histcompl,'','-'),'[^,[:space:]]+',1,8),0),3,0) =
  trim(lpad(NVL(dwt.num_docfis,0),9,0) || '-' || lpad(NVL(trim(dwt.serie_docfis),0),3,0))

 where a.cod_empresa = '001'
   and a.Ident_histpadrao = '16'
   and to_char(a.data_lancto, 'mm/yyyy') = '08/2020'
   and x2.cod_conta in ('23611','20471')
  -- and trim(lpad(NVL(dwt.num_docfis,0),9,0) || '-' || lpad(NVL(trim(dwt.serie_docfis),0),3,0))  = '000002377-001'


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
                to_char('PCC') TIPO

  from x01_contabil a
       left join x2002_plano_contas x2
             on a.ident_conta = x2.ident_conta
            and decode(a.cod_empresa,'001','SESI','002','SENAI') = x2.grupo_conta
            and regexp_substr(replace(a.txt_histcompl,'','-'),'[^,[:space:]]+',1,4) = 'PIS'
  left join X53_RETENCAO_IRRF dwt
    on a.cod_empresa = dwt.cod_empresa
     and a.vlr_lancto = dwt.vlr_ir_retido
   --and a.data_lancto = dwt.data_fiscal
   --and a.ident_conta = dwt.ident_conta

   --and dwt.vlr_iss_retido <> '0'
  and LPAD(NVL(regexp_substr(replace(a.txt_histcompl,'','-'),'[^,[:space:]]+',1,8),0),9,0)
  ||'-'||
  LPAD(NVL(regexp_substr(replace(a.txt_histcompl,'','-'),'[^,[:space:]]+',1,9),0),3,0) =
  trim(lpad(NVL(dwt.num_docfis,0),9,0) || '-' || lpad(NVL(trim(dwt.serie_docfis),0),3,0))

 where a.cod_empresa = '001'
   and a.Ident_histpadrao = '103'
   --and to_char(A.DATA_LANCTO, 'mm/yyyy') = '05/2020'
   and x2.cod_conta in ('23611','20353')
   AND DWT.COD_RECEITA = '595207'
  -- and trim(lpad(NVL(dwt.num_docfis,0),9,0) || '-' || lpad(NVL(trim(dwt.serie_docfis),0),3,0))  = '000002377-001'

   UNION ALL
   -- ,'20240' -- problema
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
                to_char('IRRF') TIPO


  from x01_contabil a
       left join x2002_plano_contas x2
             on a.ident_conta = x2.ident_conta
            and decode(a.cod_empresa,'001','SESI','002','SENAI') = x2.grupo_conta
  left join X53_RETENCAO_IRRF dwt
    on a.cod_empresa = dwt.cod_empresa
   and a.vlr_lancto = dwt.vlr_ir_retido
   and to_char(a.data_lancto,'MM/YYYY') = to_char(dwt.data_movto,'MM/YYYY')
 where a.cod_empresa = '001'
   and x2.cod_conta in ('23611','20240')
   and a.Ident_histpadrao = '37'
   and DWT.COD_RECEITA = '170806'

    )


   select  case when  TIPO in ('ISS','INSS','PCC','IRRF') then
               atrib end atrib
               ,NUM_DOCFIS_01
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
            from LKM
             where atrib = '000000000-000';
