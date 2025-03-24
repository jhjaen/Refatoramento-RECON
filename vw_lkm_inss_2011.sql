create or replace view vw_lkm_inss_2011 as
select distinct decode(x.cod_empresa, '001', '1000', '002', '2000', '000')                    nome_empresa,
               to_char(x.dat_emissao, 'DDMMYYYY')                                                     data_documento,
               to_char(x.dat_fiscal, 'DDMMYYYY')                                                      data_lancamento,
               to_char(x.dat_emissao,'YYYY')                                                          exercicio_ano,
               to_char(x.dat_emissao,'MM')                                                            mes_competencia,
               'GPS'                                                                                  dsc_imposto,
                (select distinct max(aa.cod_fis_jur)
                from x04_pessoa_fis_jur aa
               where aa.razao_social like upper('%ministerio%')
                 and aa.cidade in
                     (select distinct c.cidade
                        from dwt_docto_fiscal a, x04_pessoa_fis_jur b, estabelecimento c
                       where a.cod_empresa    = c.cod_empresa
                         and a.cod_estab      = c.cod_estab
                         and a.ident_fis_jur  = b.ident_fis_jur
                         ))                                                                           dsc_fornecedor,
               x.cod_retencao                                                                         cod_receita,
               decode(x.cod_empresa, '001', '1001', '002', '2001', '000')                             filial_pagto,
               trim(replace(replace(to_char(sum(x.vlr_inss_retido +
                                                w.vlr_multa    +
                                                w.vlr_juros    +
                                                x.vlr_outras_entid)
                                                ,'0000000000.99'),'.',''),',',''))                    montante,
               trim(replace(replace(to_char(sum(w.vlr_multa),'0000000000.99'),'.',''),',',''))        multa,
               trim(replace(replace(to_char(sum(w.vlr_juros),'0000000000.99'),'.',''),',',''))        juros,
               trim(replace(replace(to_char(sum(x.vlr_outras_entid),'0000000000.99'),'.',''),',','')) outras_entidades,
               trim(replace(replace(to_char(sum(x.vlr_inss_retido),'0000000000.99'),'.',''),',',''))  vlrtrib,
               trim(decode(x.serie_docfis,' ',to_number(x.num_docfis),to_number(x.num_docfis)||'-'||x.serie_docfis))        numdocfis
          from IRT_RET_INSS_DF    x,
               x04_pessoa_fis_jur y,
               irt_gps            w
         where x.cod_fis_jur      = y.cod_fis_jur
           and x.ind_fis_jur      = y.ind_fis_jur
           and x.grupo_fis_jur    = y.grupo_fis_jur
           and x.cod_fis_jur      = w.cod_fis_jur
           and x.ind_fis_jur      = w.ind_fis_jur
           and x.grupo_fis_jur    = w.grupo_fis_jur
           and x.cod_retencao in ('2631','2100')
group by       decode(x.cod_empresa, '001', '1000', '002', '2000', '000')
               ,to_char(x.dat_emissao, 'DDMMYYYY')
               ,to_char(x.dat_fiscal, 'DDMMYYYY')
               ,to_char(x.dat_emissao,'YYYY')
               ,to_char(x.dat_emissao,'MM')
               ,x.cod_fis_jur
               ,x.cod_retencao
               ,decode(x.cod_empresa, '001', '1001', '002', '2001', '000')
               ,trim(decode(x.serie_docfis,' ',to_number(x.num_docfis),to_number(x.num_docfis)||'-'||x.serie_docfis));
