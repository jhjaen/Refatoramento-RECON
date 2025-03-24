create or replace view vw_lkm_darf_x53aber as
select distinct a.cod_empresa                                                          BUKRS,
               substr(d.cnpj,1,16)                                                             BRANCH,
               substr(a.cod_estab,1,4)                                                         GSBER,
               to_char(a.data_fator_gerador,'DDMMYYYY')                                        FATGER,
               nvl(to_char(a.data_movto,'DDMMYYYY'),' ')                                       BUDAT,
               substr(c.cod_darf,1,4)                                                          CODREC,
               substr(b.razao_social,1,40)                                                     NAME1,
               substr(b.cpf_cgc,1,16)                                                          CNPJ_CPF,
               substr(a.num_docfis,1,16)                                                       XBLNR,
               trim(replace(replace(to_char(a.vlr_bruto,'0000000000.99'),'.',''),',',''))      VLRTRIB,
               trim(replace(replace(to_char(a.aliquota,'000.99'),'.',''),',',''))              ALIQ,
               trim(replace(replace(to_char(a.vlr_ir_retido,'0000000000.99'),'.',''),',',''))  VLRET,
               3                                                                               TIPO,
               SYSDATE                                                                         GERACAO,
               NULL                                                                            VRENTID,
               a.data_fator_gerador                                                            DATEF
          from x53_retencao_irrf  a,
               x04_pessoa_fis_jur b,
               x2019_cod_darf     c,
               empresa            d
         where a.ident_fis_jur    = b.ident_fis_jur
           and a.ident_darf       = c.ident_darf
           and a.cod_empresa      = d.cod_empresa
           and a.vlr_ir_retido    > 0
           and c.cod_darf in ('1798','0588','3208','3280','8045','9385','5960','5979','5987','5952')
         union all
        select distinct x.cod_empresa                                                          BUKRS,
               substr(w.cgc, 1, 16)                                                            BRANCH,
               substr(x.cod_estab, 1, 4)                                                       GSBER,
               to_char(x.dat_fiscal, 'DDMMYYYY')                                               FATGER,
               to_char(x.dat_fiscal, 'DDMMYYYY')                                               BUDAT,
               substr(x.cod_pagto, 1, 4)                                                       CODREC,
               substr(y.razao_social, 1, 40)                                                   NAME1,
               substr(y.cpf_cgc, 1, 16)                                                        CNPJ_CPF,
               substr('0000000000000000', 1, 16)                                               XBLNR,
               trim(replace(replace(to_char(x.vlr_inss,'0000000000.99'),'.',''),',',''))       VLRTRIB,
               trim(replace(replace(to_char('00000','000.99'),'.',''),',',''))                 ALIQ,
               trim(replace(replace(to_char(x.vlr_tot_recolh,'0000000000.99'),'.',''),',','')) VLRET,
               2                                                                               TIPO,
               SYSDATE                                                                         GERACAO,
               trim(replace(replace(to_char(x.VLR_OUTRAS_ENTID,'0000000000.99'),'.',''),',',''))VRENTID,
               to_date(X.MES_COMPETENCIA,'DD/MM/YYYY')                                           DATEF

          from irt_gps            x,
               x04_pessoa_fis_jur y,
               estabelecimento    w
         where x.cod_fis_jur      = y.cod_fis_jur
           and x.ind_fis_jur      = y.ind_fis_jur
           and x.grupo_fis_jur    = y.grupo_fis_jur
           and x.cod_empresa      = w.cod_empresa
           and x.cod_estab        = w.cod_estab
           and x.cod_pagto in ('2100','2607')
         union all
        select distinct a.cod_empresa                                                          BUKRS,
               substr(d.cnpj,1,16)                                                             BRANCH,
               substr(a.cod_estab,1,4)                                                         GSBER,
               nvl(to_char(e.data_emissao,'DDMMYYYY'),' ')                                     FATGER,
               to_char(a.data_fator_gerador,'DDMMYYYY')                                        BUDAT,
               substr(c.cod_darf,1,4)                                                          CODREC,
               substr(b.razao_social,1,40)                                                     NAME1,
               substr(b.cpf_cgc,1,16)                                                          CNPJ_CPF,
               substr(a.num_docfis,1,16)                                                       XBLNR,
               trim(replace(replace(to_char(a.vlr_bruto,'0000000000.99'),'.',''),',',''))      VLRTRIB,
               trim(replace(replace(to_char(a.aliquota,'000.99'),'.',''),',',''))              ALIQ,
               trim(replace(replace(to_char(a.vlr_ir_retido,'0000000000.99'),'.',''),',',''))  VLRET,
               3                                                                               TIPO,
               SYSDATE                                                                         GERACAO,
               NULL                                                                            VRENTID,
               A.Data_Fator_Gerador                                                            DATEF
          from x53_retencao_irrf  a,
               x04_pessoa_fis_jur b,
               x2019_cod_darf     c,
               empresa            d,
               x07_docto_fiscal   e
         where a.ident_fis_jur    = b.ident_fis_jur
           and a.ident_darf       = c.ident_darf
           and a.cod_empresa      = d.cod_empresa
           and a.cod_empresa      = e.cod_empresa
           and a.cod_estab        = e.cod_estab
           and a.ident_fis_jur    = e.ident_fis_jur
           and trunc(a.num_docfis)= trunc(e.num_docfis)
           and a.serie_docfis     = e.serie_docfis
           and a.sub_serie_docfis = a.sub_serie_docfis
           and a.ident_docto      = e.ident_docto
           and a.vlr_ir_retido    > 0
           and c.cod_darf = '1708'
         union all
        select distinct x.cod_empresa                                                          BUKRS,
               substr(w.cgc, 1, 16)                                                            BRANCH,
               substr(x.cod_estab, 1, 4)                                                       GSBER,
               to_char(x.dat_emissao, 'DDMMYYYY')                                              FATGER,
               to_char(x.dat_fiscal, 'DDMMYYYY')                                               BUDAT,
               substr(x.cod_retencao, 1, 4)                                                    CODREC,
               substr(y.razao_social, 1, 40)                                                   NAME1,
               substr(y.cpf_cgc, 1, 16)                                                        CNPJ_CPF,
               substr(x.num_docfis, 1, 16)                                                     XBLNR,
               trim(replace(replace(to_char(x.vlr_servicos,'0000000000.99'),'.',''),',',''))   VLRTRIB,
               trim(replace(replace(to_char(x.vlr_aliq_inss,'000.99'),'.',''),',',''))         ALIQ,
               trim(replace(replace(to_char(x.vlr_inss_retido,'0000000000.99'),'.',''),',',''))VLRET,
               2                                                                               TIPO,
               SYSDATE                                                                         GERACAO,
               NULL                                                                            VRENTID,
               to_date(x.mes_competencia,'DD/MM/YYYY')                                          DATEF
          from IRT_RET_INSS_DF    x,
               x04_pessoa_fis_jur y,
               estabelecimento    w
         where x.cod_fis_jur      = y.cod_fis_jur
           and x.ind_fis_jur      = y.ind_fis_jur
           and x.grupo_fis_jur    = y.grupo_fis_jur
           and x.cod_empresa      = w.cod_empresa
           and x.cod_estab        = w.cod_estab
           and x.cod_retencao in ('2631');
