CREATE OR REPLACE VIEW VW_LKM_DARF_A AS
SELECT DISTINCT DECODE(A.COD_EMPRESA, '001', '1000', '002', '2000', '000')                     BURKS, --NOME_EMPRESA,
               TO_CHAR(A.DATA_FATOR_GERADOR,'DDMMYYYY')                                        BLDAT, --DATA_DOCUMENTO,
               --NVL(TO_CHAR(A.DATA_MOVTO,'DDMMYYYY'),' ')                                       BUDAT, --DATA_LANCAMENTO,
               NVL(TO_CHAR(SYSDATE,'DDMMYYYY'),' ')                                       BUDAT, --DATA_LANCAMENTO,
               --TO_CHAR(A.DATA_FATOR_GERADOR,'YYYY')                                            GJARH, --EXERCICIO_ANO,
               TO_CHAR(SYSDATE,'YYYY')                                            GJARH, --EXERCICIO_ANO,
               --TO_CHAR(A.DATA_FATOR_GERADOR,'MM')                                              MONAT, --MES_COMPETENCIA,
               TO_CHAR(SYSDATE,'MM')                                              MONAT, --MES_COMPETENCIA,
               'DARF'                                                                          BKTXT, --DSC_IMPOSTO,--IMPOSTO A SER PAGO
--               SUBSTR(B.RAZAO_SOCIAL,1,40)                                                   --DSC_FORNECEDOR,
               /*(SELECT DISTINCT MAX(AA.COD_FIS_JUR)
                FROM X04_PESSOA_FIS_JUR AA
               WHERE AA.RAZAO_SOCIAL LIKE UPPER('%MINISTERIO%')
                 AND AA.CIDADE IN
                     (SELECT DISTINCT C.CIDADE
                        FROM DWT_DOCTO_FISCAL A, X04_PESSOA_FIS_JUR B, ESTABELECIMENTO C
                       WHERE A.COD_EMPRESA    = C.COD_EMPRESA
                         AND A.COD_ESTAB      = C.COD_ESTAB
                         AND A.IDENT_FIS_JUR  = B.IDENT_FIS_JUR
                         ))                                                                    LIFNR, --FORNECEDOR GOVERNO*/
               '100000346'                                                                     LIFNR,
               SUBSTR(C.COD_DARF,1,4)                                                          XBLNR, --COD_RECEITA,
               DECODE(A.COD_EMPRESA, '001', '1001', '002', '2001', '000')                      LOCAL_NEGO,--FILIAL_PAGTO,
               TRIM(REPLACE(REPLACE(TO_CHAR(SUM(NVL(A.VLR_BRUTO,0) +
                                                 NVL(F.VLR_MULTA,0)     +
                                                 NVL(F.VLR_JUROS,0)),
                                                 '0000000000.99'),'.',''),',',''))                                VL_BRUTO, --MONTANTE,
                                                                                                                  --CONTA-- VERIFICAR
                TRIM(REPLACE(REPLACE(TO_CHAR(SUM(NVL(F.VLR_MULTA,0)),'0000000000.99'),'.',''),',',''))            MULTA, --MULTA,
                TRIM(REPLACE(REPLACE(TO_CHAR(SUM(NVL(F.VLR_JUROS,0)),'0000000000.99'),'.',''),',',''))            JUROS, --JUROS,
                TRIM(REPLACE(REPLACE(TO_CHAR(0,'0000000000.99'),'.',''),',',''))                                  ENTIDADES, --OUTRAS_ENTIDADES,
      --         TRIM(REPLACE(REPLACE(TO_CHAR(A.VLR_BRUTO,'0000000000.99'),'.',''),',',''))                         VL_TRIB,--VLRTRIB,
         --      A.VLR_BRUTO                                                                                         VL_TRIB,--VLRTRIB
              TRIM(REPLACE(REPLACE(TO_CHAR(A.VLR_IR_RETIDO,'0000000000D00'),'.',''),',',''))                         VL_TRIB,
             -- TRIM(REPLACE(REPLACE(TO_CHAR(SUM(NVL(A.VLR_BRUTO,0)),'0000000000D00'),'.',''),',',''))                         VL_TRIB,--VLRTRIB,
              TRIM(DECODE( A.SERIE_DOCFIS,' ',TO_CHAR(TO_NUMBER(REPLACE(REPLACE(A.NUM_DOCFIS, '-'),'/'))),TO_CHAR(TO_NUMBER(A.NUM_DOCFIS))||'-'||A.SERIE_DOCFIS)) ZUONR, --NUMDOCFIS,
               TO_DATE(A.DATA_FATOR_GERADOR)                                                                      DATA_FISCAL,
               A.COD_EMPRESA                                                                                     COD_EMPRESA,
               A.COD_EMPRESA||'-'||A.COD_ESTAB||'-'||B.Cod_Fis_Jur||'-'||TRIM(DECODE( A.SERIE_DOCFIS,' ',TO_CHAR(A.NUM_DOCFIS),TO_CHAR(A.NUM_DOCFIS)||'-'||A.SERIE_DOCFIS))||'-'||TO_CHAR(A.DATA_FATOR_GERADOR,'DDMMYYYY')||'-'||SUBSTR(C.COD_DARF,1,4)
               AS CKEY


               FROM X53_RETENCAO_IRRF A
          LEFT JOIN X04_PESSOA_FIS_JUR B ON A.IDENT_FIS_JUR = B.IDENT_FIS_JUR
          LEFT JOIN X2019_COD_DARF     C ON A.IDENT_DARF = C.IDENT_DARF
          LEFT JOIN EMPRESA            D ON A.COD_EMPRESA      = D.COD_EMPRESA
          LEFT JOIN ESTABELECIMENTO    E ON A.COD_EMPRESA      = E.COD_EMPRESA
                                        AND A.COD_ESTAB        = E.COD_ESTAB
          LEFT JOIN X75_DCTF           F ON A.COD_EMPRESA      = F.COD_EMPRESA
                                        AND A.DATA_INI_COMPET  = F.DT_INI_APURACAO -- NEW
                                        AND A.DATA_FIM_COMPET  = F.DATA_APURACAO  -- NEW



         WHERE 1=1
     --      AND A.COD_ESTAB        = F.COD_EMPRESA
     --      AND A.IDENT_DARF       = F.IDENT_DARF
           AND A.VLR_IR_RETIDO    > 0

     --Validacao
     --  AND SUBSTR(C.COD_DARF,1,4) = 5952
     --  AND  A.COD_EMPRESA = '001'
     --  AND  TO_DATE(A.DATA_FATOR_GERADOR)  BETWEEN TO_DATE('01/11/2019','DD/MM/YYYY') AND TO_DATE('30/11/2019','DD/MM/YYYY')
     --  AND  TRIM(DECODE( A.SERIE_DOCFIS,' ',TO_CHAR(A.NUM_DOCFIS),TO_CHAR(A.NUM_DOCFIS)||'-'||A.SERIE_DOCFIS)) ='000008271'
     --VALIDACAO

        GROUP BY
        (D.COD_EMPRESA,'001','SESI','002','SENAI','000'),
         TO_CHAR(A.DATA_FATOR_GERADOR,'DDMMYYYY'),
               NVL(TO_CHAR(A.DATA_MOVTO,'DDMMYYYY'),' '),
               TO_CHAR(A.DATA_FATOR_GERADOR,'YYYY'),
               TO_CHAR(A.DATA_FATOR_GERADOR,'MM'),
               SUBSTR(B.RAZAO_SOCIAL,1,40),
               SUBSTR(C.COD_DARF,1,4),
               E.RAZAO_SOCIAL,

            -- TRIM(REPLACE(REPLACE(TO_CHAR(A.VLR_BRUTO,'0000000000.99'),'.',''),',','')),
              --  A.VLR_BRUTO                                                                                     ,--VLRTRIB,
              TRIM(REPLACE(REPLACE(TO_CHAR(A.VLR_IR_RETIDO,'0000000000D00'),'.',''),',',''))                         ,--VLRTRIB,
              TRIM(TO_CHAR(F.NRO_REFERENCIA)),
              -- TRIM(REPLACE(REPLACE(TO_CHAR(A.VLR_IR_RETIDO,'0000000000.99'),'.',''),',','')),

               TRIM(DECODE( A.SERIE_DOCFIS,' ',TO_CHAR(A.NUM_DOCFIS),TO_CHAR(A.NUM_DOCFIS)||'-'||A.SERIE_DOCFIS)),
               TRIM(DECODE( A.SERIE_DOCFIS,' ',TO_CHAR(TO_NUMBER(REPLACE(REPLACE(A.NUM_DOCFIS, '-'),'/'))),TO_CHAR(TO_NUMBER(A.NUM_DOCFIS))||'-'||A.SERIE_DOCFIS)),
               TO_DATE(A.DATA_FATOR_GERADOR),
               A.COD_EMPRESA,
               A.COD_ESTAB,
               b.cod_fis_jur;
