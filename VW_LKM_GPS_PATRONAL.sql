CREATE OR REPLACE VIEW VW_LKM_GPS_PATRONAL AS
with LKM_AUTONOMOS as (
--------------2100
SELECT DISTINCT
               X.COD_FIS_JUR||'-'||x.cod_empresa||'-'||x.cod_estab||'-'||x.cod_retencao          CHAVE,
               x.cod_fis_jur                                                      fornec,
               DECODE(X.COD_EMPRESA, '001', '1000', '002', '2000', '000')         BURKS, -- NOME_EMPRESA
               TO_CHAR(X.DAT_EMISSAO, 'DDMMYYYY')                                 BLDAT, -- DATA_DOCUMENTO
               TO_CHAR(sysdate, 'DDMMYYYY')                                       BUDAT, -- DATA_LANCAMENTO        --<Alterado atfl - 15/08/2019
               TO_CHAR(sysdate,'YYYY')                                            GJARH, -- EXERCICIO_ANO
               TO_CHAR(sysdate,'MM')                                              MONAT, -- MES_COMPETENCIA        --<Alterado atfl - 15/08/2019
               'GPS'                                                              BKTXT, -- DSC_IMPOSTO
               '100000347'                                                        LIFNR, -- COD_PREVIDENCIA SOCIAL --<(Ajuste conforme e-mail anderson dia 29.04.2019)
               X.COD_RETENCAO                                                     XBLNR, -- COD_RECEITA
               CASE WHEN X.COD_RETENCAO = '2658'
                    THEN DWT07.COD_ESTAB||DWT07.COD_CEI
                        WHEN X.COD_RETENCAO = '2631'
                          THEN DWT07.COD_ESTAB||X04.CPF_CGC                                                        --<Alterado atfl - 12/07/2019

                    ELSE
                X.COD_ESTAB
                END                                                               LOCAL_NEGO,
                NVL(TRIM(REPLACE(REPLACE(TO_CHAR(SUM(NVL(X.VLR_INSS_RETIDO,0) + NVL(W.VLR_MULTA,0) + NVL(W.VLR_JUROS,0) + NVL(X.VLR_OUTRAS_ENTID,0)),'0000000000D99'),'.',''),',','')),'000000000000') VL_BRUTO,   --MONTANTE,
                NVL(TRIM(REPLACE(REPLACE(TO_CHAR(SUM(NVL(W.VLR_MULTA,0)),'0000000000D99'),'.',''),',','')),'000000000000')                                                        MULTA,      --MULTA
                NVL(TRIM(REPLACE(REPLACE(TO_CHAR(SUM(NVL(W.VLR_JUROS,0)),'0000000000D99'),'.',''),',','')),'000000000000')                                                        JUROS,      --JURUS
                NVL(TRIM(REPLACE(REPLACE(TO_CHAR(SUM(NVL(X.VLR_OUTRAS_ENTID,0)),'0000000000D99'),'.',''),',','')),'000000000000')                                                 ENTIDADES,  --OUTRAS_ENTIDADES,
                NVL(TRIM(REPLACE(REPLACE(TO_CHAR((NVL(X.VLR_INSS_RETIDO,0)),'0000000000D99'),'.',''),',','')),'000000000000')                                                  VL_TRIB,    --VLRTRIB,
                TRIM(DECODE(X.SERIE_DOCFIS,' ',TO_CHAR(TO_NUMBER(X.NUM_DOCFIS)),TO_CHAR(TO_NUMBER(X.NUM_DOCFIS))||'-'||X.SERIE_DOCFIS))                                    ZUONR,      --NUMDOCFIS,
                TO_DATE(X.DAT_EMISSAO,'DD/MM/RRRR')                                                                                                                        DATA_FISCAL,--BLDAT Alterado atfl - 29/08/2019
                X.COD_EMPRESA                                                                                                                                              COD_EMPRESA,
                X.COD_ESTAB                                                                                                                                                COD_ESTAB,
                X.COD_FIS_JUR -- atfl - 13/09/2019
                --,X.Vlr_Aliq_Inss Vlr_Aliq_Inss
         FROM IRT_RET_INSS_DF    X
               LEFT JOIN IRT_GPS W                  ON  X.COD_EMPRESA      = W.COD_EMPRESA
                                                    AND X.COD_ESTAB        = W.COD_ESTAB
                                                    AND X.GRUPO_FIS_JUR    = W.GRUPO_FIS_JUR
                                                    AND X.IND_FIS_JUR      = W.IND_FIS_JUR
                                                    AND X.COD_FIS_JUR      = W.COD_FIS_JUR
                                                    AND X.DAT_FISCAL       = W.DAT_FISCAL
               LEFT JOIN DWT_docto_fiscal  DWT07    ON  X.COD_EMPRESA      = DWT07.COD_EMPRESA
                                                    AND X.COD_ESTAB        = DWT07.COD_ESTAB
                                                    AND X.DAT_FISCAL       = DWT07.DATA_FISCAL
                                                    AND x.NUM_DOCFIS       = DWT07.NUM_DOCFIS
                                                    --AND X.SERIE_DOCFIS     = DWT07.SERIE_DOCFIS         --atfl - 04/11/2019
                                                    AND X.SUB_SERIE_DOCFIS = DWT07.SUB_SERIE_DOCFIS       --atfl - 18/09/2019
                                                    AND X.DAT_EMISSAO      = DWT07.DATA_EMISSAO           --atfl - 11/10/2019
                                                    AND X.NUM_CONTROLE_DOCTO = DWT07.NUM_CONTROLE_DOCTO   --atfl - 11/10/2019
               LEFT JOIN ESTABELECIMENTO ESTAB      ON DWT07.COD_EMPRESA   = ESTAB.COD_EMPRESA
                                                    AND DWT07.COD_ESTAB    = ESTAB.COD_ESTAB
               LEFT JOIN X04_PESSOA_FIS_JUR X04     ON DWT07.IDENT_FIS_JUR = X04.IDENT_FIS_JUR            -- atfl - 12/07/2019

          WHERE X.COD_RETENCAO IN ('2100')
           /* -- Teste de validacao autonomos
             and X.COD_ESTAB = '1002'
             and TO_DATE(X.DAT_EMISSAO,'DD/MM/RRRR') between to_date('01/02/2020','dd/mm/yyyy')
             and to_date('29/02/2020','dd/mm/yyyy')
             and TRIM(DECODE(X.SERIE_DOCFIS,' ',TO_CHAR(TO_NUMBER(X.NUM_DOCFIS)),TO_CHAR(TO_NUMBER(X.NUM_DOCFIS))||'-'||X.SERIE_DOCFIS)) = '1'
            */

          AND DWT07.SITUACAO <> 'S'
          AND X.Vlr_Aliq_Inss <> '20'

GROUP BY       DECODE(X.COD_EMPRESA, '001', '1000', '002', '2000', '000')
               ,TO_CHAR(X.DAT_EMISSAO, 'DDMMYYYY')
               ,TO_CHAR(X.DAT_FISCAL, 'DDMMYYYY')
               ,TO_CHAR(X.DAT_EMISSAO,'YYYY')
               ,TO_CHAR(X.DAT_EMISSAO,'MM')
               ,X.COD_RETENCAO
               ,CASE WHEN X.COD_RETENCAO = '2631'
                          THEN X04.COD_FIS_JUR
                     ELSE
                          '100000347'
               END
               ,CASE WHEN X.COD_RETENCAO = '2658'
                          THEN DWT07.COD_ESTAB||DWT07.COD_CEI
                     WHEN X.COD_RETENCAO = '2631'
                          THEN DWT07.COD_ESTAB||X04.CPF_CGC
                     ELSE
                          X.COD_ESTAB
               END,
               TRIM(DECODE(X.SERIE_DOCFIS,' ',TO_CHAR(TO_NUMBER(X.NUM_DOCFIS)),TO_CHAR(TO_NUMBER(X.NUM_DOCFIS))||'-'||X.SERIE_DOCFIS)),
               TO_DATE(''),
               TO_DATE(X.DAT_EMISSAO,'DD/MM/RRRR'),
               X.COD_EMPRESA,
               X.COD_ESTAB,
               X.COD_FIS_JUR-- atfl - 13/09/2019
               ,X.VLR_INSS_RETIDO -- atfl - 13/09/2019;
               --,X.Vlr_Aliq_Inss
                ),


LKM_GPS  as (SELECT DISTINCT
               X.COD_FIS_JUR||'-'||x.cod_empresa||'-'||x.cod_estab||'-'||x.cod_retencao          CHAVE,
               x.cod_fis_jur                                                      fornec,
               DECODE(X.COD_EMPRESA, '001', '1000', '002', '2000', '000')         BURKS, -- NOME_EMPRESA
               TO_CHAR(X.DAT_EMISSAO, 'DDMMYYYY')                                 BLDAT, -- DATA_DOCUMENTO
               TO_CHAR(sysdate, 'DDMMYYYY')                                       BUDAT, -- DATA_LANCAMENTO        --<Alterado atfl - 15/08/2019
               TO_CHAR(sysdate,'YYYY')                                      GJARH, -- EXERCICIO_ANO
               TO_CHAR(sysdate,'MM')                                              MONAT, -- MES_COMPETENCIA        --<Alterado atfl - 15/08/2019
               'GPS'                                                              BKTXT, -- DSC_IMPOSTO
               '100000347'                                                        LIFNR, -- COD_PREVIDENCIA SOCIAL --<(Ajuste conforme e-mail anderson dia 29.04.2019)
               X.COD_RETENCAO                                                     XBLNR, -- COD_RECEITA
               CASE WHEN X.COD_RETENCAO = '2658'
                    THEN DWT07.COD_ESTAB||DWT07.COD_CEI
                        WHEN X.COD_RETENCAO = '2631'
                          THEN DWT07.COD_ESTAB||X04.CPF_CGC                                                        --<Alterado atfl - 12/07/2019

                    ELSE
                X.COD_ESTAB
                END                                                               LOCAL_NEGO,
                NVL(TRIM(REPLACE(REPLACE(TO_CHAR(SUM(NVL(X.VLR_INSS_RETIDO,0) + NVL(W.VLR_MULTA,0) + NVL(W.VLR_JUROS,0) + NVL(X.VLR_OUTRAS_ENTID,0)),'0000000000D99'),'.',''),',','')),'000000000000') VL_BRUTO,   --MONTANTE,
                NVL(TRIM(REPLACE(REPLACE(TO_CHAR(SUM(NVL(W.VLR_MULTA,0)),'0000000000D99'),'.',''),',','')),'000000000000')                                                        MULTA,      --MULTA
                NVL(TRIM(REPLACE(REPLACE(TO_CHAR(SUM(NVL(W.VLR_JUROS,0)),'0000000000D99'),'.',''),',','')),'000000000000')                                                        JUROS,      --JURUS
                NVL(TRIM(REPLACE(REPLACE(TO_CHAR(SUM(NVL(X.VLR_OUTRAS_ENTID,0)),'0000000000D99'),'.',''),',','')),'000000000000')                                                 ENTIDADES,  --OUTRAS_ENTIDADES,
                NVL(TRIM(REPLACE(REPLACE(TO_CHAR((NVL(X.VLR_INSS_RETIDO,0)),'0000000000D99'),'.',''),',','')),'000000000000')                                                  VL_TRIB,    --VLRTRIB,
                TRIM(DECODE(X.SERIE_DOCFIS,' ',TO_CHAR(TO_NUMBER(X.NUM_DOCFIS)),TO_CHAR(TO_NUMBER(X.NUM_DOCFIS))||'-'||X.SERIE_DOCFIS))                                    ZUONR,      --NUMDOCFIS,
                TO_DATE(X.DAT_EMISSAO,'DD/MM/RRRR')                                                                                                                        DATA_FISCAL,--BLDAT Alterado atfl - 29/08/2019
                X.COD_EMPRESA                                                                                                                                              COD_EMPRESA,
                X.COD_ESTAB                                                                                                                                                COD_ESTAB,
                X.COD_FIS_JUR -- atfl - 13/09/2019
               -- ,0 vlr_aliq_inss
         FROM IRT_RET_INSS_DF    X
               LEFT JOIN IRT_GPS W                  ON  X.COD_EMPRESA      = W.COD_EMPRESA
                                                    AND X.COD_ESTAB        = W.COD_ESTAB
                                                    AND X.GRUPO_FIS_JUR    = W.GRUPO_FIS_JUR
                                                    AND X.IND_FIS_JUR      = W.IND_FIS_JUR
                                                    AND X.COD_FIS_JUR      = W.COD_FIS_JUR
                                                    AND X.DAT_FISCAL       = W.DAT_FISCAL
               LEFT JOIN DWT_docto_fiscal  DWT07    ON  X.COD_EMPRESA      = DWT07.COD_EMPRESA
                                                    AND X.COD_ESTAB        = DWT07.COD_ESTAB
                                                    AND X.DAT_FISCAL       = DWT07.DATA_FISCAL
                                                    AND x.NUM_DOCFIS       = DWT07.NUM_DOCFIS
                                                    --AND X.SERIE_DOCFIS     = DWT07.SERIE_DOCFIS         --atfl - 04/11/2019
                                                    AND X.SUB_SERIE_DOCFIS = DWT07.SUB_SERIE_DOCFIS       --atfl - 18/09/2019
                                                    AND X.DAT_EMISSAO      = DWT07.DATA_EMISSAO           --atfl - 11/10/2019
                                                    AND X.NUM_CONTROLE_DOCTO = DWT07.NUM_CONTROLE_DOCTO   --atfl - 11/10/2019
               LEFT JOIN ESTABELECIMENTO ESTAB      ON DWT07.COD_EMPRESA   = ESTAB.COD_EMPRESA
                                                    AND DWT07.COD_ESTAB    = ESTAB.COD_ESTAB
               LEFT JOIN X04_PESSOA_FIS_JUR X04     ON DWT07.IDENT_FIS_JUR = X04.IDENT_FIS_JUR            -- atfl - 12/07/2019

          WHERE X.COD_RETENCAO IN ('2631','2658')
          AND DWT07.SITUACAO <> 'S'

GROUP BY       DECODE(X.COD_EMPRESA, '001', '1000', '002', '2000', '000')
               ,TO_CHAR(X.DAT_EMISSAO, 'DDMMYYYY')
               ,TO_CHAR(X.DAT_FISCAL, 'DDMMYYYY')
               ,TO_CHAR(X.DAT_EMISSAO,'YYYY')
               ,TO_CHAR(X.DAT_EMISSAO,'MM')
               ,X.COD_RETENCAO
               ,CASE WHEN X.COD_RETENCAO = '2631'
                          THEN X04.COD_FIS_JUR
                     ELSE
                          '100000347'
               END
               ,CASE WHEN X.COD_RETENCAO = '2658'
                          THEN DWT07.COD_ESTAB||DWT07.COD_CEI
                     WHEN X.COD_RETENCAO = '2631'
                          THEN DWT07.COD_ESTAB||X04.CPF_CGC
                     ELSE
                          X.COD_ESTAB
               END,
               TRIM(DECODE(X.SERIE_DOCFIS,' ',TO_CHAR(TO_NUMBER(X.NUM_DOCFIS)),TO_CHAR(TO_NUMBER(X.NUM_DOCFIS))||'-'||X.SERIE_DOCFIS)),
               TO_DATE(''),
               TO_DATE(X.DAT_EMISSAO,'DD/MM/RRRR'),
               X.COD_EMPRESA,
               X.COD_ESTAB,
               X.COD_FIS_JUR-- atfl - 13/09/2019
               ,X.VLR_INSS_RETIDO -- atfl - 13/09/2019;
              --  ,X.Vlr_Aliq_Inss
              )

               select CHAVE
                    , FORNEC
                    , BURKS
                    , BLDAT
                    , BUDAT
                    , GJARH
                    , MONAT
                    , BKTXT
                    , LIFNR
                    , XBLNR
                    , LOCAL_NEGO
                    , NVL(TRIM(REPLACE(REPLACE(TO_CHAR(SUM(VL_BRUTO),'000000000099'),'.',''),',','')),'000000000000') VL_BRUTO
                    , NVL(TRIM(REPLACE(REPLACE(TO_CHAR(SUM(MULTA),'000000000099'),'.',''),',','')),'000000000000')   MULTA
                    , NVL(TRIM(REPLACE(REPLACE(TO_CHAR(SUM(JUROS),'000000000099'),'.',''),',','')),'000000000000')   JUROS
                    , NVL(TRIM(REPLACE(REPLACE(TO_CHAR(SUM(ENTIDADES),'000000000099'),'.',''),',','')),'000000000000')    ENTIDADES
                    , NVL(TRIM(REPLACE(REPLACE(TO_CHAR(SUM(VL_TRIB),'000000000099'),'.',''),',','')),'000000000000')         VL_TRIB
                    , ZUONR
                    , DATA_FISCAL
                    , COD_EMPRESA
                    , COD_ESTAB
                    , COD_FIS_JUR
                   -- , Vlr_Aliq_Inss
                                   from LKM_AUTONOMOS

                   Group By
                          CHAVE
                    , FORNEC
                    , BURKS
                    , BLDAT
                    , BUDAT
                    , GJARH
                    , MONAT
                    , BKTXT
                    , LIFNR
                    , XBLNR
                    , LOCAL_NEGO
                    , ZUONR
                    , DATA_FISCAL
                    , COD_EMPRESA
                    , COD_ESTAB
                    , COD_FIS_JUR
                   -- , Vlr_Aliq_Inss

           Union all
               Select  CHAVE
                    , FORNEC
                    , BURKS
                    , BLDAT
                    , BUDAT
                    , GJARH
                    , MONAT
                    , BKTXT
                    , LIFNR
                    , XBLNR
                    , LOCAL_NEGO
                    , VL_BRUTO
                    , MULTA
                    , JUROS
                    , ENTIDADES
                    , VL_TRIB
                    , ZUONR
                    , DATA_FISCAL
                    , COD_EMPRESA
                    , COD_ESTAB
                    , COD_FIS_JUR
                   -- , Vlr_Aliq_Inss
                   from LKM_GPS;
