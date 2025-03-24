CREATE OR REPLACE VIEW VW_LKM_DAM_PAGTO AS
SELECT DISTINCT DECODE(X.Cod_Empresa, '001', '1000', '002', '2000', '000')                                      BURKS,      -- NOME_EMPRESA,
               TO_CHAR(X.DT_PAGTO_NF, 'DDMMYYYY')                                                              BLDAT,      -- DATA_DOCUMENTO,
               TO_CHAR(SYSDATE, 'DDMMYYYY')                                                                     BUDAT,      -- DATA_LANCAMENTO,
               TO_CHAR(SYSDATE,'YYYY')                                                                          GJARH,      -- EXERCICIO_ANO,
               TO_CHAR(SYSDATE,'MM')                                                                            MONAT,      -- MES_COMPETENCIA,
               'DAM'                                                                                            BKTXT,      -- DSC_IMPOSTO,
               E.COMPL_ENDERECO_EFD                                                                             LIFNR,      -- COD_PREFEITURAS
               'DAM'                                                                                            XBLNR,      -- COD_RECEITA,
               DECODE(X.COD_EMPRESA, '001', '1001', '002', '2001', '000')                                       LOCAL_NEGO, -- FILIAL_PAGTO,
               X.COD_ESTAB                                                                                      COD_ESTAB,
               ------------ajuste temporario tratamento de multas e juros -------------------------------------------------------------------------------
               TRIM(REPLACE(REPLACE(TO_CHAR(NVL(X.VLR_ISS_RETIDO,0) + NVL(X.VLR_MULTA_INSS,0) + NVL(X.VLR_JUROS_INSS,0) + NVL(I.VLR_EXTRAS,0),'0000000000d99'),'.',''),',','')) VL_BRUTO, --MONTANTE,
               --TRIM(REPLACE(REPLACE(TO_CHAR(NVL(I.VLR_MULTA,0),'0000000000.99'),'.',''),',',''))                 MULTA, --MULTA,
               TRIM(REPLACE(REPLACE(TO_CHAR(NVL(X.VLR_MULTA_INSS,0),'0000000000d99'),'.',''),',',''))                 MULTA, --MULTA,
               --TRIM(REPLACE(REPLACE(TO_CHAR(NVL(I.VLR_JUROS,0),'0000000000d99'),'.',''),',',''))                 JUROS, --JUROS,
               TRIM(REPLACE(REPLACE(TO_CHAR(NVL(X.VLR_JUROS_INSS,0),'0000000000d99'),'.',''),',',''))                 JUROS, --JUROS,
               ------------ajuste temporario tratamento de multas e juros -------------------------------------------------------------------------------
               TRIM(REPLACE(REPLACE(TO_CHAR(NVL(I.VLR_EXTRAS,0),'0000000000d99'),'.',''),',',''))                ENTIDADES, --OUTRAS_ENTIDADES,
               TRIM(REPLACE(REPLACE(TO_CHAR(NVL(X.VLR_ISS_RETIDO,0),'0000000000d99'),'.',''),',',''))            VL_TRIB, --VLRTRIB,
               TRIM(DECODE(X.SERIE_DOCFIS,' ',TO_CHAR(TO_NUMBER(X.NUM_DOCFIS)),TO_CHAR(TO_NUMBER(X.NUM_DOCFIS))||'-'||X.SERIE_DOCFIS)) ZUONR, --NUMDOCFIS,
               TO_DATE(X.DT_PAGTO_NF, 'DD/MM/RRRR')                                                             DATA_FISCAL,
               X.COD_EMPRESA                                                                                     COD_EMPRESA
               ,x.ident_fis_jur
               ,TRIM(REPLACE(REPLACE(TO_CHAR(NVL(sum(y.vlr_servico),0),'0000000000d99'),'.',''),',','')) VLR_SERVICO
          FROM DWT_DOCTO_FISCAL     X
               LEFT JOIN   DWT_ITENS_SERV      Y ON X.IDENT_DOCTO_FISCAL = Y.IDENT_DOCTO_FISCAL
               LEFT JOIN   ESTABELECIMENTO     E ON X.COD_EMPRESA        = E.COD_EMPRESA
                                                AND X.COD_ESTAB          = E.COD_ESTAB
               LEFT JOIN   IST_GUIA_RECOLH     I ON X.COD_EMPRESA        = I.COD_EMPRESA
                                                AND X.COD_ESTAB          = I.COD_ESTAB
               LEFT JOIN RELAC_TAB_GRUPO       R ON X.COD_EMPRESA        = R.COD_EMPRESA
                                                AND X.COD_ESTAB          = R.COD_ESTAB

          WHERE X.MOVTO_E_S = 1
          AND X.SITUACAO <> 'S'
            --AND X.Cod_Estab IN ('1003')
            AND NVL(X.VLR_ISS_RETIDO,0) <> '0'
            and TO_CHAR(X.DT_PAGTO_NF, 'DDMMYYYY')  is not null


            GROUP BY

               DECODE(X.COD_EMPRESA, '001', '1000', '002', '2000', '000')
               ,TO_CHAR(X.DT_PAGTO_NF, 'DDMMYYYY')
               ,TO_CHAR(SYSDATE, 'DDMMYYYY')
               ,TO_CHAR(SYSDATE,'YYYY')
               ,TO_CHAR(SYSDATE,'MM')
               ,'DAM'
               ,E.COMPL_ENDERECO_EFD
               ,'DAM'
               ,DECODE(X.COD_EMPRESA, '001', '1001', '002', '2001', '000')
               ,X.COD_ESTAB
               ,TRIM(REPLACE(REPLACE(TO_CHAR(NVL(X.VLR_ISS_RETIDO,0) + NVL(X.VLR_MULTA_INSS,0) + NVL(X.VLR_JUROS_INSS,0) + NVL(I.VLR_EXTRAS,0),'0000000000d99'),'.',''),',',''))
               ,TRIM(REPLACE(REPLACE(TO_CHAR(NVL(X.VLR_MULTA_INSS,0),'0000000000d99'),'.',''),',',''))
               ,TRIM(REPLACE(REPLACE(TO_CHAR(NVL(X.VLR_JUROS_INSS,0),'0000000000d99'),'.',''),',',''))
               ,TRIM(REPLACE(REPLACE(TO_CHAR(NVL(I.VLR_EXTRAS,0),'0000000000d99'),'.',''),',',''))
               ,TRIM(REPLACE(REPLACE(TO_CHAR(NVL(X.VLR_ISS_RETIDO,0),'0000000000d99'),'.',''),',',''))
               ,TRIM(DECODE(X.SERIE_DOCFIS,' ',TO_CHAR(TO_NUMBER(X.NUM_DOCFIS)),TO_CHAR(TO_NUMBER(X.NUM_DOCFIS))||'-'||X.SERIE_DOCFIS))
               ,TO_DATE(X.DT_PAGTO_NF, 'DD/MM/RRRR')
               ,X.COD_EMPRESA
               ,x.ident_fis_jur;
