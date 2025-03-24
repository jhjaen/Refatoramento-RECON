create or replace view vw_lkm_consolidado_darf_x75 as
select distinct decode(d.cod_empresa, '001', '1000', '002', '2000', '000')                                nome_empresa,
                to_char(a.data_apuracao, 'DDMMYYYY')                                                      data_documento,
                to_char(a.data_apuracao, 'DDMMYYYY')                                                      data_lancamento,
                to_char(a.data_apuracao,'YYYY')                                                           exercicio_ano,
                to_char(a.data_apuracao,'MM')                                                             mes_competencia,
                'DARF'                                                                                    dsc_imposto,
               (select distinct max(aa.cod_fis_jur)
                from x04_pessoa_fis_jur aa
               where aa.razao_social like upper('%ministerio%')
                 and aa.cidade in
                     (select distinct c.cidade
                        from dwt_docto_fiscal a, x04_pessoa_fis_jur b, estabelecimento c
                       where a.cod_empresa    = c.cod_empresa
                         and a.cod_estab      = c.cod_estab
                         and a.ident_fis_jur  = b.ident_fis_jur
                         and a.cod_estab      = a.cod_estab))                                             dsc_fornecedor,
                substr(c.cod_darf, 1, 4)                                                                  cod_receita,
                decode(d.cod_empresa, '001', '1001', '002', '2001', '000')                                filial_pagto,
                trim(replace(replace(to_char(sum(nvl(a.vlr_principal,0) +
                                                 nvl(a.vlr_multa,0)     +
                                                 nvl(a.vlr_juros,0)),
                                                 '0000000000.99'),'.',''),',',''))                        montante,
                trim(replace(replace(to_char(sum(nvl(a.vlr_multa,0)),'0000000000.99'),'.',''),',',''))    multa,
                trim(replace(replace(to_char(sum(nvl(a.vlr_juros,0)),'0000000000.99'),'.',''),',',''))    juros,
                trim(replace(replace(to_char(0,'0000000000.99'),'.',''),',',''))                          outras_entidades,
                trim(replace(replace(to_char(sum(nvl(a.vlr_principal,0)),'0000000000.99'),'.',''),',',''))vlrtrib,
                trim(a.nro_referencia)                                                                    numdocfis
  from x75_dctf a, x2019_cod_darf c, empresa d, estabelecimento e
 where a.ident_darf = c.ident_darf
   and a.cod_empresa = d.cod_empresa
   and a.cod_empresa = e.cod_empresa
   and a.cod_estab = e.cod_estab
/*   and to_date(a.data_apuracao,'DD/MM/RRRR') between to_date('01/12/2018', 'dd/mm/yyyy') and to_date('31/12/2018', 'dd/mm/yyyy')
   and a.cod_empresa = '001'
*/ group by
                decode(d.cod_empresa, '001', '1000', '002', '2000', '000')   ,
                to_char(a.data_apuracao, 'DDMMYYYY')                         ,
                to_char(a.data_apuracao,'YYYY')                              ,
                to_char(a.data_apuracao,'MM')                                ,
                substr(c.cod_darf, 1, 4)                                     ,
                decode(d.cod_empresa, '001', '1001', '002', '2001', '000')   ,
                a.nro_referencia;
