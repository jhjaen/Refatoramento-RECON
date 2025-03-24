create or replace view vw_lkm_fbl3n as
(select distinct dwt.num_docfis || '-' || dwt.serie_docfis atrib,
                a.num_lancamento num_docto,
                '' tipo_docto,
                a.data_lancto data_docto,
                a.tipo_lancto chav_lancto,
                a.vlr_lancto montante,
                a.txt_histcompl texto,
                x2.cod_conta conta,
                dwt.cod_estab
  from x01_contabil a
  left join x2002_plano_contas x2
    on a.ident_conta = x2.ident_conta
  left join dwt_docto_fiscal dwt
    on a.cod_empresa = dwt.cod_empresa
   and a.data_lancto = dwt.data_fiscal
   and a.ident_conta = dwt.ident_conta
 where a.cod_empresa = '001'
   and a.cod_estab = '1001'
   and to_char(a.data_lancto, 'mm/yyyy') = '08/2020'
   and a.num_lancamento = '5100055227'
   and x2.cod_conta = '23611'

UNION ALL

select distinct dwt.num_docfis || '-' || dwt.serie_docfis atrib,
                a.num_lancamento num_docto,
                '' tipo_docto,
                a.data_lancto data_docto,
                a.tipo_lancto chav_lancto,
                a.vlr_lancto montante,
                a.txt_histcompl texto,
                x2.cod_conta conta,
                dwt.cod_estab
  from x01_contabil a
  left join x2002_plano_contas x2
    on a.ident_conta = x2.ident_conta
  left join dwt_docto_fiscal dwt
    on a.cod_empresa = dwt.cod_empresa
   and a.data_lancto = dwt.data_fiscal
   and a.ident_conta = dwt.ident_conta
 where a.cod_empresa = '001'
   and a.cod_estab = '1001'
   and to_char(a.data_lancto, 'mm/yyyy') = '08/2020'
   and a.num_lancamento = '5100055227'
   and x2.cod_conta = '20280');
