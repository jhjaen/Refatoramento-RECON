CREATE OR REPLACE VIEW VW_LKM_DAM_BKP AS
SELECT DISTINCT DECODE(X.COD_EMPRESA, '001', '1000', '002', '2000', '000')                            BURKS,--NOME_EMPRESA,
               TO_CHAR(X.DATA_EMISSAO, 'DDMMYYYY')                                                    BLDAT,--DATA_DOCUMENTO,
               TO_CHAR(X.DATA_FISCAL, 'DDMMYYYY')                                                     BUDAT,--DATA_LANCAMENTO,
               TO_CHAR(X.DATA_FISCAL,'YYYY')                                                          GJARH,--EXERCICIO_ANO,
               TO_CHAR(X.DATA_FISCAL,'MM')                                                            MONAT,--MES_COMPETENCIA,
               'DAM'                                                                                  BKTXT,--DSC_IMPOSTO,
              -- B.COD_FIS_JUR                                                                          LIFNR, --COD_FIS_JUR
               P.COD_FIS_JUR                                                                                LIFNR, -- COD_PREFEITURAS
               'DAM'                                                                                        XBLNR,--COD_RECEITA,
               DECODE(X.COD_EMPRESA, '001', '1001', '002', '2001', '000')                                   LOCAL_NEGO, --FILIAL_PAGTO,



              TRIM(REPLACE(REPLACE(TO_CHAR(SUM(NVL(Y.VLR_TOT,0) +
                                                NVL(I.VLR_MULTA,0)      +
                                                NVL(I.VLR_JUROS,0)      +
                                                NVL(I.VLR_EXTRAS,0)),'0000000000.99'),'.',''),',',''))            VL_BRUTO, --MONTANTE,

                                                                                                                  --CONTA-- VERIFICAR
               TRIM(REPLACE(REPLACE(TO_CHAR(SUM(NVL(I.VLR_MULTA,0)),'0000000000.99'),'.',''),',',''))             MULTA, --MULTA,
               TRIM(REPLACE(REPLACE(TO_CHAR(SUM(NVL(I.VLR_JUROS,0)),'0000000000.99'),'.',''),',',''))             JUROS, --JUROS,
               TRIM(REPLACE(REPLACE(TO_CHAR(SUM(NVL(I.VLR_EXTRAS,0)),'0000000000.99'),'.',''),',',''))            ENTIDADES, --OUTRAS_ENTIDADES,
               TRIM(REPLACE(REPLACE(TO_CHAR(SUM(NVL(Y.VLR_ISS_RETIDO,0)),'0000000000.99'),'.',''),',',''))        VL_TRIB, --VLRTRIB,
               Y.VLR_ISS_RETIDO,
              TRIM(DECODE(X.SERIE_DOCFIS,' ',TO_CHAR(X.NUM_DOCFIS),TO_CHAR(X.NUM_DOCFIS)||'-'||X.SERIE_DOCFIS))   ZUONR, --NUMDOCFIS,
              X.DATA_FISCAL                                                                                       DATA_FISCAL,
              X.COD_EMPRESA                                                                                       COD_EMPRESA
         FROM DWT_DOCTO_FISCAL     X

             LEFT JOIN   DWT_ITENS_SERV      Y on x.ident_docto_fiscal = y.ident_docto_fiscal
             LEFT JOIN   ESTABELECIMENTO     E on x.cod_empresa = e.cod_empresa
                                              and x.cod_estab   = e.cod_estab
             LEFT JOIN   IST_GUIA_RECOLH     I on x.cod_empresa = i.cod_empresa
                                               and x.cod_estab  = i.cod_estab
         ----ajuste 13.06 atfl
          LEFT JOIN RELAC_TAB_GRUPO       R on x.cod_empresa = r.cod_empresa
                                               and x.cod_estab = r.cod_estab
          ----------
             ,X04_PESSOA_FIS_JUR  P


         WHERE X.MOVTO_E_S        = 1
           AND I.DAT_APURACAO IS NOT NULL
           AND P.COD_FIS_JUR in (select Q.COD_FIS_JUR from x04_pessoa_fis_jur Q where Q.Ident_Fis_Jur = P.Ident_Fis_Jur
                                                                                and q.ind_fis_jur = 1
                                                                                and   Q.razao_social like 'SECRETARIA%MUNICIPAL%FAZENDA%')
          AND P.Valid_Fis_Jur = (select max(valid_fis_jur) from x04_pessoa_fis_jur X04B where x04B.Cod_Fis_Jur = P.cod_fis_jur and X04B.Grupo_Fis_Jur = P.Grupo_Fis_Jur)
          AND P.Cod_Municipio = E.Cod_Municipio
          -- ajuste 13.06 atfl
          AND P.Ind_Fis_Jur = 1
          AND P.Grupo_Fis_Jur = r.grupo_estab
          --
          AND Y.VLR_ISS_RETIDO != '0'


GROUP BY
DECODE(X.COD_EMPRESA, '001', '1000', '002', '2000', '000'),
               TO_CHAR(X.DATA_EMISSAO, 'DDMMYYYY')        ,
               TO_CHAR(X.DATA_FISCAL, 'DDMMYYYY')         ,
               TO_CHAR(X.DATA_FISCAL,'YYYY')              ,
               TO_CHAR(X.DATA_FISCAL,'MM')                ,
               P.COD_FIS_JUR                              ,
               X.COD_ESTAB                                ,
               TRIM(DECODE(X.SERIE_DOCFIS,' ',TO_CHAR(X.NUM_DOCFIS),TO_CHAR(X.NUM_DOCFIS)||'-'||X.SERIE_DOCFIS)),
               X.COD_EMPRESA,
               X.DATA_FISCAL
               ,Y.VLR_ISS_RETIDO;
