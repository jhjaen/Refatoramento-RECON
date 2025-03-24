CREATE OR REPLACE PACKAGE LKM_RECON3_CPROC IS


  FUNCTION PARAMETROS RETURN VARCHAR2;
  FUNCTION NOME RETURN VARCHAR2;
  FUNCTION TIPO RETURN VARCHAR2;
  FUNCTION VERSAO RETURN VARCHAR2;
  FUNCTION DESCRICAO RETURN VARCHAR2;
  FUNCTION MODULO RETURN VARCHAR2;
  FUNCTION CLASSIFICACAO RETURN VARCHAR2;
  FUNCTION explode(delimitador IN VARCHAR2, exp_string IN VARCHAR2)
    RETURN lista;

  FUNCTION EXECUTAR(PS_EMPRESA    VARCHAR2,
                    PS_ESTAB      VARCHAR2,
                    P_FINALIDADE  VARCHAR2,
                    PS_RELATORIO  VARCHAR2,
                    PS_FBL3N      VARCHAR2,
                    PS_Export     VARCHAR2,
                    P_LIMINAR     VARCHAR2,
                    P_MJE         VARCHAR2,
                    PS_NUM_DOCFIS VARCHAR2,
                    PS_SERIE      VARCHAR2,
                    PS_RETENCAO   VARCHAR2,
                    PS_COD_FISJUR VARCHAR2,
                    PS_VLR_MULTA  VARCHAR2,
                    PS_VLR_JUROS  VARCHAR2,
                    -- PS_VLR_ENTIDADES VARCHAR2,
                    PS_DATA_INICIAL DATE,
                    PS_DATA_FINAL   DATE) RETURN INTEGER;

  PROCEDURE LKM_INSERT_DARF(PS_EMPRESA      VARCHAR2,
                           PS_DATA_INICIAL DATE,
                           PS_DATA_FINAL   DATE);

  PROCEDURE LKM_INSERT_DAM(PS_EMPRESA      VARCHAR2,
                          PS_ESTAB        VARCHAR2,
                          P_FINALIDADE  VARCHAR2,
                          PS_DATA_INICIAL DATE,
                          PS_DATA_FINAL   DATE);

  PROCEDURE LKM_INSERT_GPS(PS_EMPRESA      VARCHAR2,
                          PS_ESTAB        VARCHAR2,
                          P_LIMINAR     VARCHAR2,
                          PS_DATA_INICIAL DATE,
                          PS_DATA_FINAL   DATE);

  PROCEDURE LKM_INSERT_REINF(PS_EMPRESA      VARCHAR2,
                          PS_ESTAB        VARCHAR2,
                          P_LIMINAR     VARCHAR2,
                          PS_DATA_INICIAL DATE,
                          PS_DATA_FINAL   DATE);

  PROCEDURE LKM_PLOAD(PS_EMPRESA      VARCHAR2,
                      PS_ESTAB        VARCHAR2,
                      P_FINALIDADE    VARCHAR2,
                      PS_DATA_INICIAL DATE,
                      PS_DATA_FINAL   DATE);


  PROCEDURE RELATORIO;

  PROCEDURE CABECALHO(PS_EMPRESA VARCHAR2,
                      --PS_ESTAB         VARCHAR2,
                      --P_FINALIDADE     VARCHAR2,
                      --PS_RELATORIO     VARCHAR2,
                      --P_MJE            VARCHAR2,
                      --PS_NUM_DOCFIS    VARCHAR2,
                      --PS_SERIE         VARCHAR2,
                      --PS_RETENCAO      VARCHAR2,
                      --PS_COD_FISJUR    VARCHAR2,
                      PS_DATA_INICIAL DATE,
                      PS_DATA_FINAL   DATE);

  PROCEDURE T_CABECALHO(PS_EMPRESA VARCHAR2,
                        --PS_ESTAB         VARCHAR2,
                        --P_FINALIDADE     VARCHAR2,
                        --PS_RELATORIO     VARCHAR2,
                        --P_MJE            VARCHAR2,
                        --PS_NUM_DOCFIS    VARCHAR2,
                        --PS_SERIE         VARCHAR2,
                        --PS_RETENCAO      VARCHAR2,
                        --PS_COD_FISJUR    VARCHAR2,
                        PS_DATA_INICIAL DATE,
                        PS_DATA_FINAL   DATE);

  PROCEDURE CORPO(PS_EMPRESA VARCHAR2,
                  PS_ESTAB   VARCHAR2,
                  --P_FINALIDADE     VARCHAR2,
                  --PS_RELATORIO     VARCHAR2,
                  --P_MJE            VARCHAR2,
                  PS_EXPORT       VARCHAR2,
                  PS_NUM_DOCFIS   VARCHAR2,
                  PS_SERIE        VARCHAR2,
                  PS_RETENCAO     VARCHAR2,
                  PS_COD_FISJUR   VARCHAR2,
                  PS_DATA_INICIAL DATE,
                  PS_DATA_FINAL   DATE);

  PROCEDURE SOMA_CORPO(PS_EMPRESA VARCHAR2,
                       PS_ESTAB   VARCHAR2,
                       --P_FINALIDADE     VARCHAR2,
                       --PS_RELATORIO     VARCHAR2,
                       --P_MJE            VARCHAR2,
                       PS_NUM_DOCFIS   VARCHAR2,
                       PS_SERIE        VARCHAR2,
                       PS_RETENCAO     VARCHAR2,
                       PS_COD_FISJUR   VARCHAR2,
                       PS_DATA_INICIAL DATE,
                       PS_DATA_FINAL   DATE);

  PROCEDURE LKM_PLOAD_FBL3N(PS_EMPRESA VARCHAR2,
                            --PS_ESTAB   VARCHAR2,
                            --    P_FINALIDADE2   VARCHAR2,
                            PS_DATA_INICIAL DATE,
                            PS_DATA_FINAL   DATE);

  PROCEDURE LKM_PLOAD_MJE(PS_EMPRESA    VARCHAR2,
                          PS_ESTAB      VARCHAR2,
                          P_FINALIDADE  VARCHAR2,
                          P_MJE         VARCHAR2,
                          PS_NUM_DOCFIS VARCHAR2,
                          PS_SERIE      VARCHAR2,
                          PS_RETENCAO   VARCHAR2,
                          PS_COD_FISJUR VARCHAR2,
                          PS_VLR_MULTA  VARCHAR2,
                          PS_VLR_JUROS  VARCHAR2,
                          -- PS_VLR_ENTIDADES VARCHAR2,
                          PS_DATA_INICIAL DATE,
                          PS_DATA_FINAL   DATE);

END LKM_RECON3_CPROC;

/*
create table LKM_SAIDA_GPS_DARF_CAPA
(
  cabecalho      CHAR(1),
  datalanc       VARCHAR2(8),
  exercicio      VARCHAR2(4),
  periodo        VARCHAR2(2),
  linha          VARCHAR2(255),
  cod_fis_jur    VARCHAR2(14),
  num_doc_fis    VARCHAR2(40),
  empresa        VARCHAR2(4),
  datadoc        VARCHAR2(8),
  ordem          CHAR(1),
  codigo_receita VARCHAR2(255),
  localnegocio   VARCHAR2(255)
);
create table LKM_SAIDA_GPS_DARF_ITEM1
(
  item           CHAR(1),
  fornecedor     VARCHAR2(14),
  localnegocio   VARCHAR2(255),
  vlrtrib        VARCHAR2(14),
  linha          VARCHAR2(255),
  cod_fis_jur    VARCHAR2(14),
  num_doc_fis    VARCHAR2(40),
  empresa        VARCHAR2(4),
  datadoc        VARCHAR2(8),
  ordem          CHAR(1),
  codigo_receita VARCHAR2(255)
);
create table LKM_SAIDA_GPS_DARF_ITEM2
(
  item                      CHAR(1),
  contalocalizadapelocodigo VARCHAR2(4),
  localnegocio              VARCHAR2(255),
  valor                     VARCHAR2(14),
  notafiscal                VARCHAR2(42),
  linha                     VARCHAR2(255),
  cod_fis_jur               VARCHAR2(14),
  num_doc_fis               VARCHAR2(40),
  empresa                   VARCHAR2(4),
  datadoc                   VARCHAR2(8),
  ordem                     CHAR(1),
  codigo_receita            VARCHAR2(255)
);
create table LKM_SAIDA_GPS_DARF_ITEM2
(
  item                      CHAR(1),
  contalocalizadapelocodigo VARCHAR2(4),
  localnegocio              VARCHAR2(255),
  valor                     VARCHAR2(14),
  notafiscal                VARCHAR2(42),
  linha                     VARCHAR2(255),
  cod_fis_jur               VARCHAR2(14),
  num_doc_fis               VARCHAR2(40),
  empresa                   VARCHAR2(4),
  datadoc                   VARCHAR2(8),
  ordem                     CHAR(1),
  codigo_receita            VARCHAR2(255)
);
create table LKM_SAIDA_GPS_DARF_ITEM4_J
(
  item           CHAR(1),
  multa          CHAR(5),
  localnegocio   VARCHAR2(255),
  valor          VARCHAR2(14),
  linha          VARCHAR2(255),
  cod_fis_jur    VARCHAR2(14),
  num_doc_fis    VARCHAR2(40),
  empresa        VARCHAR2(4),
  datadoc        VARCHAR2(8),
  ordem          CHAR(1),
  codigo_receita VARCHAR2(255)
);
create table LKM_SAIDA_GPS_DARF_ITEM5_E
(
  item           CHAR(1),
  multa          CHAR(9),
  localnegocio   VARCHAR2(255),
  valor          VARCHAR2(14),
  linha          VARCHAR2(255),
  cod_fis_jur    VARCHAR2(14),
  num_doc_fis    VARCHAR2(40),
  empresa        VARCHAR2(4),
  datadoc        VARCHAR2(8),
  ordem          CHAR(1),
  codigo_receita VARCHAR2(255)
);
*/

/*
--------- VW --------------------------
CREATE OR REPLACE VIEW VW_LKM_DARF_A AS
SELECT DISTINCT DECODE(A.COD_EMPRESA, '001', '1000', '002', '2000', '000')                     BURKS, --NOME_EMPRESA,
               TO_CHAR(A.DATA_FATOR_GERADOR,'DDMMYYYY')                                        BLDAT, --DATA_DOCUMENTO,
               NVL(TO_CHAR(A.DATA_MOVTO,'DDMMYYYY'),' ')                                       BUDAT, --DATA_LANCAMENTO,
               TO_CHAR(A.DATA_FATOR_GERADOR,'YYYY')                                            GJARH, --EXERCICIO_ANO,
               TO_CHAR(A.DATA_FATOR_GERADOR,'MM')                                              MONAT, --MES_COMPETENCIA,
               'DARF'                                                                          BKTXT, --DSC_IMPOSTO,--IMPOSTO A SER PAGO
--               SUBSTR(B.RAZAO_SOCIAL,1,40)                                                   --DSC_FORNECEDOR,
               (SELECT DISTINCT MAX(AA.COD_FIS_JUR)
                FROM X04_PESSOA_FIS_JUR AA
               WHERE AA.RAZAO_SOCIAL LIKE UPPER('%MINISTERIO%')
                 AND AA.CIDADE IN
                     (SELECT DISTINCT C.CIDADE
                        FROM DWT_DOCTO_FISCAL A, X04_PESSOA_FIS_JUR B, ESTABELECIMENTO C
                       WHERE A.COD_EMPRESA    = C.COD_EMPRESA
                         AND A.COD_ESTAB      = C.COD_ESTAB
                         AND A.IDENT_FIS_JUR  = B.IDENT_FIS_JUR
                         ))                                                                    LIFNR, --FORNECEDOR GOVERNO
               SUBSTR(C.COD_DARF,1,4)                                                          XBLNR, --COD_RECEITA,
               DECODE(A.COD_EMPRESA, '001', '1001', '002', '2001', '000')                      LOCAL_NEGO,--FILIAL_PAGTO,
               TRIM(REPLACE(REPLACE(TO_CHAR(SUM(NVL(F.VLR_PRINCIPAL,0) +
                                                 NVL(F.VLR_MULTA,0)     +
                                                 NVL(F.VLR_JUROS,0)),
                                                 '0000000000.99'),'.',''),',',''))                                VL_BRUTO, --MONTANTE,
                                                                                                                  --CONTA-- VERIFICAR
                TRIM(REPLACE(REPLACE(TO_CHAR(SUM(NVL(F.VLR_MULTA,0)),'0000000000.99'),'.',''),',',''))            MULTA, --MULTA,
                TRIM(REPLACE(REPLACE(TO_CHAR(SUM(NVL(F.VLR_JUROS,0)),'0000000000.99'),'.',''),',',''))            JUROS, --JUROS,
                TRIM(REPLACE(REPLACE(TO_CHAR(0,'0000000000.99'),'.',''),',',''))                                  ENTIDADES, --OUTRAS_ENTIDADES,
      --         TRIM(REPLACE(REPLACE(TO_CHAR(A.VLR_BRUTO,'0000000000.99'),'.',''),',',''))                         VL_TRIB,--VLRTRIB,
         --      A.VLR_BRUTO                                                                                         VL_TRIB,--VLRTRIB,
              TRIM(REPLACE(REPLACE(TO_CHAR(A.VLR_BRUTO,'0000000000D00'),'.',''),',',''))                         VL_TRIB,--VLRTRIB,
              TRIM(DECODE( A.SERIE_DOCFIS,' ',TO_CHAR(A.NUM_DOCFIS),TO_CHAR(A.NUM_DOCFIS)||'-'||A.SERIE_DOCFIS)) ZUONR,--        NUMDOCFIS,
               TO_DATE(A.DATA_FATOR_GERADOR)                                                                      DATA_FISCAL,
               A.COD_EMPRESA                                                                                      COD_EMPRESA


          FROM X53_RETENCAO_IRRF  A,
               X04_PESSOA_FIS_JUR B,
               X2019_COD_DARF     C,
               EMPRESA            D,
               ESTABELECIMENTO    E,
               X75_DCTF           F
         WHERE A.IDENT_FIS_JUR    = B.IDENT_FIS_JUR
           AND A.IDENT_DARF       = C.IDENT_DARF
           AND A.COD_EMPRESA      = D.COD_EMPRESA
           AND A.COD_EMPRESA      = E.COD_EMPRESA
           AND A.COD_ESTAB        = E.COD_ESTAB
           AND A.COD_EMPRESA      = F.COD_EMPRESA
     --      AND A.COD_ESTAB        = F.COD_EMPRESA
     --      AND A.IDENT_DARF       = F.IDENT_DARF
           AND A.VLR_IR_RETIDO    > 0

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
              TRIM(REPLACE(REPLACE(TO_CHAR(A.VLR_BRUTO,'0000000000D00'),'.',''),',',''))                         ,--VLRTRIB,
              TRIM(TO_CHAR(F.NRO_REFERENCIA)),
               TRIM(REPLACE(REPLACE(TO_CHAR(A.VLR_IR_RETIDO,'0000000000.99'),'.',''),',','')),
               TRIM(DECODE( A.SERIE_DOCFIS,' ',TO_CHAR(A.NUM_DOCFIS),TO_CHAR(A.NUM_DOCFIS)||'-'||A.SERIE_DOCFIS)),
               TO_DATE(A.DATA_FATOR_GERADOR),
               A.COD_EMPRESA;


------------

CREATE OR REPLACE VIEW VW_LKM_GPS AS
SELECT DISTINCT DECODE(X.COD_EMPRESA, '001', '1000', '002', '2000', '000')                            BURKS, --NOME_EMPRESA,
               TO_CHAR(X.DAT_EMISSAO, 'DDMMYYYY')                                                     BLDAT, --DATA_DOCUMENTO,
               TO_CHAR(X.DAT_FISCAL, 'DDMMYYYY')                                                      BUDAT, --DATA_LANCAMENTO,
               TO_CHAR(X.DAT_EMISSAO,'YYYY')                                                          GJARH, --EXERCICIO_ANO,
               TO_CHAR(X.DAT_EMISSAO,'MM')                                                            MONAT, --MES_COMPETENCIA,
               'GPS'                                                                                  BKTXT, --DSC_IMPOSTO,

               '120000001'                                                                            LIFNR, -- COD_PREVIDENCIA SOCIAL -- Definir regra
               X.COD_RETENCAO                                                                         XBLNR, --COD_RECEITA,
--
--               CASE WHEN X.COD_RETENCAO = '2658' then DWT07.Cod_Cei
--                 else
--               DECODE(X.COD_EMPRESA, '001', '1001', '002', '2001', '000')
--               end          LOCAL_NEGO, --FILIAL_PAGTO, ---------------- AJUSTE CNO porem n?o sera utilizado ate definic?o do FI
               DECODE(X.COD_EMPRESA, '001', '1001', '002', '2001', '000')                              LOCAL_NEGO,
               NVL(TRIM(REPLACE(REPLACE(TO_CHAR(SUM(X.VLR_INSS_RETIDO +
                                                W.VLR_MULTA    +
                                                W.VLR_JUROS    +
                                                X.VLR_OUTRAS_ENTID)
                                                ,'0000000000.99'),'.',''),',','')),'000000000000')                        VL_BRUTO,--MONTANTE,
                                                                                                                          --CONTA-- VERIFICAR
               NVL(TRIM(REPLACE(REPLACE(TO_CHAR(SUM(W.VLR_MULTA),'0000000000D99'),'.',''),',','')),'000000000000')        MULTA, --MULTA
               NVL(TRIM(REPLACE(REPLACE(TO_CHAR(SUM(W.VLR_JUROS),'0000000000D99'),'.',''),',','')),'000000000000')       JUROS, --JURUS
               NVL(TRIM(REPLACE(REPLACE(TO_CHAR(SUM(X.VLR_OUTRAS_ENTID),'0000000000D99'),'.',''),',','')),'000000000000') ENTIDADES,--OUTRAS_ENTIDADES,
               NVL(TRIM(REPLACE(REPLACE(TO_CHAR(SUM(X.VLR_INSS_RETIDO),'0000000000D99'),'.',''),',','')),'000000000000') VL_TRIB, --VLRTRIB,

               TRIM(DECODE(X.SERIE_DOCFIS,' ',TO_CHAR(X.NUM_DOCFIS),TO_CHAR(X.NUM_DOCFIS)||'-'||X.SERIE_DOCFIS))      ZUONR,--NUMDOCFIS,
               TO_DATE(X.DAT_FISCAL,'DD/MM/RRRR')                                                                         DATA_FISCAL,
               X.COD_EMPRESA                                                                                              COD_EMPRESA


         FROM IRT_RET_INSS_DF    X


               LEFT JOIN IRT_GPS W   ON x.cod_empresa = w.cod_empresa
                                     AND x.cod_estab = w.cod_estab
                                     and x.grupo_fis_jur = w.grupo_fis_jur
                                     and x.ind_fis_jur = w.ind_fis_jur
                                     and x.cod_fis_jur = w.cod_fis_jur
                                     and x.dat_fiscal = w.dat_fiscal


               LEFT JOIN DWT_docto_fiscal   DWT07   ON x.cod_empresa = DWT07.Cod_Empresa
                                                    and x.cod_estab   = DWT07.cod_estab
                                                    and x.dat_fiscal  = DWT07.Data_Fiscal
                                                    and x.num_docfis  = DWT07.Num_Docfis
                                                    and x.serie_docfis = DWT07.Serie_Docfis
                                                    and x.sub_serie_docfis = DWT07.Sub_Serie_Docfis



               LEFT JOIN ESTABELECIMENTO ESTAB ON DWT07.Cod_Empresa = ESTAB.Cod_Empresa
                                              and DWT07.Cod_Estab = ESTAB.COD_ESTAB





         WHERE X.COD_RETENCAO IN ('2631','2100','2658')




           --AND TRIM(DECODE(X.SERIE_DOCFIS,' ',TO_CHAR(X.NUM_DOCFIS),TO_CHAR(X.NUM_DOCFIS)||'-'||X.SERIE_DOCFIS)) =  '000000006-1'



GROUP BY       DECODE(X.COD_EMPRESA, '001', '1000', '002', '2000', '000')
               ,TO_CHAR(X.DAT_EMISSAO, 'DDMMYYYY')
               ,TO_CHAR(X.DAT_FISCAL, 'DDMMYYYY')
               ,TO_CHAR(X.DAT_EMISSAO,'YYYY')
               ,TO_CHAR(X.DAT_EMISSAO,'MM')
               ,X.COD_RETENCAO
             --  ,CASE WHEN X.COD_RETENCAO = '2658' then DWT07.Cod_Cei
             --    else
             --  DECODE(X.COD_EMPRESA, '001', '1001', '002', '2001', '000')
             --  end
               ,DECODE(X.COD_EMPRESA, '001', '1001', '002', '2001', '000')
               ,TRIM(DECODE(X.SERIE_DOCFIS,' ',TO_CHAR(X.NUM_DOCFIS),TO_CHAR(X.NUM_DOCFIS)||'-'||X.SERIE_DOCFIS)),
               TO_DATE(''),
               TO_DATE(X.DAT_FISCAL,'DD/MM/RRRR'),
               X.COD_EMPRESA;

-----------------------

CREATE OR REPLACE VIEW VW_LKM_DAM AS
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
              TRIM(DECODE(X.SERIE_DOCFIS,' ',TO_CHAR(X.NUM_DOCFIS),TO_CHAR(X.NUM_DOCFIS)||'-'||X.SERIE_DOCFIS))   ZUONR, --NUMDOCFIS,
              X.DATA_FISCAL                                                                                       DATA_FISCAL,
              X.COD_EMPRESA                                                                                       COD_EMPRESA
         FROM DWT_DOCTO_FISCAL     X

             LEFT JOIN   DWT_ITENS_SERV      Y on x.ident_docto_fiscal = y.ident_docto_fiscal
             LEFT JOIN   ESTABELECIMENTO     E on x.cod_empresa = e.cod_empresa
                                              and x.cod_estab   = e.cod_estab
             LEFT JOIN   IST_GUIA_RECOLH     I on x.cod_empresa = i.cod_empresa
             ,X04_PESSOA_FIS_JUR  P


         WHERE X.MOVTO_E_S        != 9
           AND I.DAT_APURACAO IS NOT NULL
           AND P.COD_FIS_JUR in (select Q.COD_FIS_JUR from x04_pessoa_fis_jur Q where Q.Ident_Fis_Jur = P.Ident_Fis_Jur
                                                                               and   Q.razao_social like '%PREF%')
          AND P.Valid_Fis_Jur = (select max(valid_fis_jur) from x04_pessoa_fis_jur X04B where x04B.Cod_Fis_Jur = P.cod_fis_jur and X04B.Grupo_Fis_Jur = P.Grupo_Fis_Jur)
          AND P.Cod_Municipio = E.Cod_Municipio
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
               X.DATA_FISCAL;


--- INDEX
CREATE INDEX LKM_SAIDA_CAPA
ON LKM_SAIDA_GPS_DARF_CAPA
(CABECALHO
,DATALANC
,EXERCICIO
,PERIODO
,LINHA
,COD_FIS_JUR
,NUM_DOC_FIS
,EMPRESA
,DATADOC
,ORDEM
,CODIGO_RECEITA
,LOCALNEGOCIO);

CREATE INDEX LKM_SAIDA_ITEM1
ON LKM_SAIDA_GPS_DARF_ITEM1
(ITEM
,FORNECEDOR
,LOCALNEGOCIO
,VLRTRIB
,LINHA
,COD_FIS_JUR
,NUM_DOC_FIS
,EMPRESA
,DATADOC
,ORDEM
,CODIGO_RECEITA);

CREATE INDEX LKM_SAIDA_ITEM2
ON LKM_SAIDA_GPS_DARF_ITEM2
(ITEM
,CONTALOCALIZADAPELOCODIGO
,LOCALNEGOCIO
,VALOR
,NOTAFISCAL
,LINHA
,COD_FIS_JUR
,NUM_DOC_FIS
,EMPRESA
,DATADOC
,ORDEM
,CODIGO_RECEITA);

CREATE INDEX LKM_SAIDA_ITEM3_M
ON LKM_SAIDA_GPS_DARF_ITEM3_M
(ITEM
,MULTA
,LOCALNEGOCIO
,VALOR
,LINHA
,COD_FIS_JUR
,NUM_DOC_FIS
,EMPRESA
,DATADOC
,ORDEM
,CODIGO_RECEITA);

CREATE INDEX LKM_SAIDAF_ITEM4_J
ON LKM_SAIDA_GPS_DARF_ITEM4_J
(ITEM
,MULTA
,LOCALNEGOCIO
,VALOR
,LINHA
,COD_FIS_JUR
,NUM_DOC_FIS
,EMPRESA
,DATADOC
,ORDEM
,CODIGO_RECEITA);

CREATE INDEX LKM_SAIDA_ITEM5_E
ON LKM_SAIDA_GPS_DARF_ITEM5_E
(ITEM
,MULTA
,LOCALNEGOCIO
,VALOR
,LINHA
,COD_FIS_JUR
,NUM_DOC_FIS
,EMPRESA
,DATADOC
,ORDEM
,CODIGO_RECEITA);



*/
/
CREATE OR REPLACE PACKAGE BODY LKM_RECON3_CPROC IS
  MPROC_ID INTEGER;
  --
  MCOD_ESTAB   ESTABELECIMENTO.COD_ESTAB%TYPE;
  MCOD_EMPRESA EMPRESA.COD_EMPRESA%TYPE;
  MUSUARIO     USUARIO_ESTAB.COD_USUARIO%TYPE;
  VS_MLINHA    VARCHAR2(2000) := '';
  VN_LINHA     INTEGER := 48;
  VN_PAGINA    NUMBER := 1;
  VVERSAO      VARCHAR2(256) := '';

  FUNCTION PARAMETROS RETURN VARCHAR2 IS
    PSTR VARCHAR2(5000);
  BEGIN
    --
    MCOD_EMPRESA := LIB_PARAMETROS.RECUPERAR('EMPRESA');
    MCOD_ESTAB   := NVL(LIB_PARAMETROS.RECUPERAR('ESTABELECIMENTO'), '');
    MUSUARIO     := LIB_PARAMETROS.RECUPERAR('USUARIO');

    FOR VERSAO IN (select VERSAO
                     from LKM_CONTR_VER A
                    where OBJETO_NOME = 'LKM_RECON3_CPROC'
                      and data_atualizacao in
                          (select MAX(data_atualizacao)
                             from LKM_CONTR_VER B
                            where B.OBJETO_NOME = A.Objeto_Nome)) LOOP

      VVERSAO := VERSAO.VERSAO;
    END LOOP;

    --PS_EMPRESA
    --001
    LIB_PROC.ADD_PARAM(PSTR,
                       'EMPRESA',
                       'VARCHAR2',
                       'COMBOBOX',
                       'S',
                       NULL,
                       NULL,
                       'SELECT E.COD_EMPRESA,E.COD_EMPRESA  || '' - '' || E.RAZAO_SOCIAL FROM EMPRESA E WHERE e.cod_empresa = ''' ||
                       MCOD_EMPRESA || ''' order by 1');

    --PS_ESTAB
    --002
    LIB_PROC.add_param(pstr,
                       'Estabelecimento: ',
                       'Varchar2',
                       'Combobox',
                       'S',
                       null,
                       null,
                       'select ''000000'',''000000 - Todos os Estabelecimentos'' ' ||
                       'from dual union all                                      ' ||
                       'SELECT DISTINCT est.cod_estab, est.cod_estab||'' - ''||cidade ' ||
                       '       FROM estabelecimento est                          ' ||
                       '  left join usuario_estab uest  on  est.cod_estab = uest.cod_estab ' ||
                       '      WHERE est.cod_empresa = ''' || MCOD_EMPRESA || '''
                              AND uest.cod_usuario = ''' ||
                       MUSUARIO || ''' order by 1');


    --P_FINALIDADE
    --003
    lib_proc.add_param(pparam      => pstr,
                       ptitulo     => 'Finalidade',
                       ptipo       => 'varchar2',
                       pcontrole   => 'radiobutton',
                       pmandatorio => 'S',
                       pdefault    => null,
                       pmascara    => null,
                       pvalores    => '0=Relatorio,1=Gera arquivo - DARF - Documentos de Arrecadacao de Receitas Federais,2=Gera arquivo - DAM  - Documento de Arrecadacao Municipal,3=Gera arquivo - GPS   - Guia da Previdencia Social - INSS,4=Gera arquivo - REINF ESOCIAL - Guia da Dctfweb,5=Gera arquivo - DAM  - Documento de Arrecadacao Municipal - Fato Gerador Pagamento');

    -- PS_RELATORIO
    --004
    LIB_PROC.ADD_PARAM(pparam      => PSTR,
                       ptitulo     => 'Relatorio de Conferencia',
                       ptipo       => 'VARCHAR2',
                       pcontrole   => 'CHECKBOX',
                       pmandatorio => 'S',
                       pdefault    => 'N',
                       pmascara    => NULL,
                       phabilita   => ':3 = ''0'' ');

    -- PS_FBL3N
    --005
    LIB_PROC.ADD_PARAM(pparam      => PSTR,
                       ptitulo     => 'Relatorio de Conferencia FBL3N',
                       ptipo       => 'VARCHAR2',
                       pcontrole   => 'CHECKBOX',
                       pmandatorio => 'S',
                       pdefault    => 'N',
                       pmascara    => NULL,
                       phabilita   => ':3 = ''0'' and :4 <> ''S'' ');


    --006 -- PS_Export
    lib_proc.add_param(pparam      => pstr,
                       ptitulo     => 'Tipo de Relatorio',
                       ptipo       => 'varchar2',
                       pcontrole   => 'radiobutton',
                       pmandatorio => 'N',
                       pdefault    => null,
                       pmascara    => null,
                       pvalores    => '0=Relatorio em Tela,1=Exportar Arquivo',
                       phabilita   => ':3 = ''0''');

    --007
    LIB_PROC.ADD_PARAM(PPARAM      => PSTR,
                       PTITULO     => LPAD(' ', 32, ' '),
                       PTIPO       => 'VARCHAR2',
                       PCONTROLE   => 'TEXT',
                       PMANDATORIO => 'N');

    -- P_LIMINAR
    --008
    lib_proc.add_param(pparam      => pstr,
                       ptitulo     => 'Habilita Liminar - Exclusao de INSS Patronal',
                       ptipo       => 'varchar2',
                       pcontrole   => 'CHECKBOX',
                       pmandatorio => 'N',
                       pdefault    => null,
                       pmascara    => null,
                       phabilita   => ':3 = ''3'' or :3 = ''4''');

    --P_MJE MULTA JUROS E ENTIDADE
    --009
    lib_proc.add_param(pparam      => pstr,
                       ptitulo     => 'Habilita Apoio - Relatorio e MJE',
                       ptipo       => 'varchar2',
                       pcontrole   => 'CHECKBOX',
                       pmandatorio => 'N',
                       pdefault    => null,
                       pmascara    => null --,
                       --phabilita   => ':3 <> ''0'''
                       );

    -- PS_NUM_DOCFIS
    LIB_PROC.ADD_PARAM(pparam      => PSTR,
                       ptitulo     => 'NUM_DOCFIS',
                       ptipo       => 'VARCHAR2',
                       pcontrole   => 'TEXTBOX',
                       pmandatorio => 'S',
                       pdefault    => '000000000',
                       pmascara    => '999999999',
                       phabilita   => ':4 = ''S'' AND :9 = ''S'' or :3 <> ''0'' and 9 = ''S'' ');

    -- PS_SERIE
    LIB_PROC.ADD_PARAM(pparam      => PSTR,
                       ptitulo     => 'SERIE',
                       ptipo       => 'VARCHAR2',
                       pcontrole   => 'TEXTBOX',
                       pmandatorio => 'N',
                       pdefault    => '000',
                       pmascara    => '999',
                       phabilita   => ':4 = ''S'' AND :9 = ''S'' or :3 <> ''0'' and :9 = ''S''  ');

    -- PS_RETENCAO
    LIB_PROC.ADD_PARAM(pparam      => PSTR,
                       ptitulo     => 'COD_RETENCAO:',
                       ptipo       => 'VARCHAR2',
                       pcontrole   => 'COMBOBOX',
                       pmandatorio => 'N',
                       pdefault    => 'Selecione uma Opcao',
                       phabilita   => ':4 = ''S'' AND :9 = ''S'' or :3 <> ''0'' and :9 = ''S''  ',
                       pvalores    => '  SELECT DISTINCT DARF.Cod_Darf, darf.Cod_Darf||'' - ''|| substr(DARF.Descricao,1,30)   ' ||
                                      '        FROM x2019_cod_darf DARF                                                        ' ||
                                      '          inner join  x75_dctf x75 on DARF.ident_darf = x75.IDENT_DARF                  ' ||
                                      '  UNION ALL                                                                             ' ||
                                      '                                                                                        ' ||
                                      '  SELECT ''2100'',''2100 - GPS - Empresas em Geral - CNPJ'' from dual                         ' ||
                                      '  UNION ALL                                                                             ' ||
                                      '  SELECT ''2631'',''2631 - GPS - Cont. Retida sobr NF/Fatura da Em Pr de Ser - CNPJ'' from dual    ' ||
                                      '  UNION ALL                                                                             ' ||
                                      '  SELECT ''2658'',''2658 - GPS - Cont. Retida sobr NF/Fatura da Em Pr de Ser - CEI'' from dual     ' ||
                                      '  UNION ALL                                                                             ' ||
                                      '  SELECT ''DAM'',''DAM   - Empresas em Geral - CNPJ'' from dual                               ' ||
                                      '  UNION ALL                                                                             ' ||
                                      '  SELECT ''DARF'',''DARF - TODOS os DARFs'' from dual                               ' ||
                                      '  UNION ALL                                                                             ' ||
                                      '  SELECT ''GPS'',''GPS   - TODAS as GPSs'' from dual                               ' ||

                                      '  order BY 1                                                                            '

                       );

    --PS_COD_FISJUR
    LIB_PROC.ADD_PARAM(pparam      => PSTR,
                       ptitulo     => 'COD_FISJUR',
                       ptipo       => 'VARCHAR2',
                       pcontrole   => 'TEXTBOX',
                       pmandatorio => 'N',
                       pdefault    => '000000000000',
                       pmascara    => '999999999999',
                       phabilita   => ':4 = ''S'' AND :9 = ''S'' or :3 <> ''0'' and :9 = ''S''  ');

    -- PS_VLR_MULTA
    LIB_PROC.ADD_PARAM(pparam      => PSTR,
                       ptitulo     => 'VLR_MULTA',
                       ptipo       => 'NUMBER',
                       pcontrole   => 'TEXTBOX',
                       pmandatorio => 'S',
                       pdefault    => '0,00',
                       pmascara    => NULL,
                       phabilita   => ':3 <> ''0'' and :9 = ''S''');

    -- PS_VLR_JUROS
    LIB_PROC.ADD_PARAM(pparam      => PSTR,
                       ptitulo     => 'VLR_JUROS',
                       ptipo       => 'NUMBER',
                       pcontrole   => 'TEXTBOX',
                       pmandatorio => 'S',
                       pdefault    => '0,00',
                       pmascara    => NULL,
                       phabilita   => ':3 <> ''0'' and :9 = ''S''');

    -- PS_VLR_ENTIDADES


    LIB_PROC.ADD_PARAM(PPARAM      => PSTR,
                       PTITULO     => LPAD(' ', 32, ' '),
                       PTIPO       => 'VARCHAR2',
                       PCONTROLE   => 'TEXT',
                       PMANDATORIO => 'N');

    --PS_DATA_INICIAL
    LIB_PROC.ADD_PARAM(PSTR,
                       'PERIODO INICIAL',
                       'DATE',
                       'TEXTBOX',
                       'N',
                       ADD_MONTHS(LAST_DAY(SYSDATE), -2) + 1,
                       'DD/MM/YYYY');


    --PS_DATA_FINAL
    LIB_PROC.ADD_PARAM(PSTR,
                       'PERIODO FINAL',
                       'DATE',
                       'TEXTBOX',
                       'N',
                       ADD_MONTHS(LAST_DAY(SYSDATE), -1),
                       'DD/MM/YYYY');

    LIB_PROC.ADD_PARAM(PPARAM      => PSTR,
                       PTITULO     => LPAD(' ', 32, ' '),
                       PTIPO       => 'VARCHAR2',
                       PCONTROLE   => 'TEXT',
                       PMANDATORIO => 'N');

    LIB_PROC.ADD_PARAM(PPARAM      => PSTR,
                       PTITULO     => LPAD(' ', 48, ' ') ||
                                      'DESENVOLVIDO POR LKM TECNOLOGIA  - 2019' ||
                                      ' - VERSAO: 2023 3.0' || VVERSAO,
                       PTIPO       => 'VARCHAR2',
                       PCONTROLE   => 'TEXT',
                       PMANDATORIO => 'N');

    RETURN PSTR;
  END;

  FUNCTION NOME RETURN VARCHAR2 IS
  BEGIN
    RETURN 'RELATORIO DE APOIO RECONCILIACAO - R E C O N (3.0) - 2023 - EM TESTE ( USAR O 2.0)';
  END;

  FUNCTION TIPO RETURN VARCHAR2 IS
  BEGIN
    RETURN 'RELATORIO';
  END;

  FUNCTION VERSAO RETURN VARCHAR2 IS
  BEGIN
    RETURN 'V2R01.0';
  END;

  FUNCTION DESCRICAO RETURN VARCHAR2 IS
  BEGIN
    RETURN 'RELATORIO DE APOIO RECONCILIACAO - R E C O N';
  END;

  FUNCTION MODULO RETURN VARCHAR2 IS
  BEGIN
    RETURN 'PROCESSOS CUSTOMIZADOS';
  END;

  FUNCTION CLASSIFICACAO RETURN VARCHAR2 IS
  BEGIN
    RETURN 'RELATORIOS';
  END;

  FUNCTION explode(delimitador IN VARCHAR2, exp_string IN VARCHAR2)
    RETURN lista AS
    l_string LONG DEFAULT exp_string || delimitador;
    l_data   lista := lista();
    cont     NUMBER;
  BEGIN
    LOOP
      EXIT WHEN l_string IS NULL;
      cont := INSTR(l_string, delimitador);
      l_data.EXTEND;
      l_data(l_data.COUNT) := LTRIM(RTRIM(SUBSTR(l_string, 1, cont - 1)));
      l_string := SUBSTR(l_string, cont + 1);
    END LOOP;
    RETURN l_data;
  END;

  FUNCTION EXECUTAR(PS_EMPRESA    VARCHAR2,
                    PS_ESTAB      VARCHAR2,
                    P_FINALIDADE  VARCHAR2,
                    PS_RELATORIO  VARCHAR2,
                    PS_FBL3N      VARCHAR2,
                    PS_EXPORT     VARCHAR2,
                    P_LIMINAR     VARCHAR2,
                    P_MJE         VARCHAR2,
                    PS_NUM_DOCFIS VARCHAR2,
                    PS_SERIE      VARCHAR2,
                    PS_RETENCAO   VARCHAR2,
                    PS_COD_FISJUR VARCHAR2,
                    PS_VLR_MULTA  VARCHAR2,
                    PS_VLR_JUROS  VARCHAR2,
                    -- PS_VLR_ENTIDADES VARCHAR2,
                    PS_DATA_INICIAL DATE,
                    PS_DATA_FINAL   DATE) RETURN INTEGER IS

    MPROC_ID INTEGER;

   -- EMP               VARCHAR(256) := null;
    --v_contadorLOG NUMBER;

    CNO_NOTA  varchar2(256) := 0;
    CNO_FORN  varchar2(256) := 0;
    CNO_DATA  varchar2(256) := 0;
    CNO_ESTAB varchar2(256) := 0;
    --GRUPO1   varchar2(30) := 0;
    --GRUPO10   varchar2(30) := 0;
    --GRUPO14   varchar2(30) := 0;
    --GRUPO15   varchar2(30) := 0;
    tempo varchar2(100) :='';





  BEGIN
    --v_contadorLOG := 0;

    MPROC_ID := LIB_PROC.NEW('LKM_RECON3_CPROC', 48, 150);
    EXECUTE IMMEDIATE 'ALTER SESSION SET NLS_LANGUAGE = ''BRAZILIAN PORTUGUESE'' ';
    EXECUTE IMMEDIATE ' ALTER SESSION SET NLS_DATE_FORMAT = ''DD/MM/YYYY''      ';


    BEGIN
      EXECUTE IMMEDIATE ('DELETE LKM_SAIDA_GPS_DARF_CAPA');
      commit;
      EXECUTE IMMEDIATE ('DELETE LKM_SAIDA_GPS_DARF_ITEM1');
      commit;
      EXECUTE IMMEDIATE ('DELETE LKM_SAIDA_GPS_DARF_ITEM2');
      commit;
      EXECUTE IMMEDIATE ('DELETE LKM_SAIDA_GPS_DARF_ITEM3_M');
      commit;
      EXECUTE IMMEDIATE ('DELETE LKM_SAIDA_GPS_DARF_ITEM4_J');
      commit;
      EXECUTE IMMEDIATE ('DELETE LKM_SAIDA_GPS_DARF_ITEM5_E');
      commit;

      -- REINF
      EXECUTE IMMEDIATE ('DELETE LKM_SAIDA_REINF_DARF_CAPA');
      commit;
      EXECUTE IMMEDIATE ('DELETE LKM_SAIDA_REINF_DARF_ITEM1');
      commit;
      EXECUTE IMMEDIATE ('DELETE LKM_SAIDA_REINF_DARF_ITEM2');
      commit;
      EXECUTE IMMEDIATE ('DELETE LKM_SAIDA_REINF_DARF_ITEM3_M');
      commit;
      EXECUTE IMMEDIATE ('DELETE LKM_SAIDA_REINF_DARF_ITEM4_J');
      commit;
      EXECUTE IMMEDIATE ('DELETE LKM_SAIDA_REINF_DARF_ITEM5_E');
      commit;
    END;


    -->Aquisi??o dos grupos do usu?rio:
    select LOCALTIMESTAMP
    into tempo
    from dual;
    --DBMS_OUTPUT.PUT_LINE('execucao inicio = ' || tempo);
    LIB_PROC.ADD_LOG('execucao inicio = ' || tempo, 1);

    /*select distinct USR.USR_LOGIN
    into GRUPO1
    from usuario_estab UEST
    left join pl_usr USR on USR.USR_LOGIN = UEST.COD_USUARIO
    left join pl_grp_usr GUSR on GUSR.USR_KEY = USR.USR_KEY
    WHERE uest.cod_usuario = MUSUARIO
    and GUSR.GRP_KEY = '1';

    select distinct USR.USR_LOGIN
    into GRUPO10
    from usuario_estab UEST
    left join pl_usr USR on USR.USR_LOGIN = UEST.COD_USUARIO
    left join pl_grp_usr GUSR on GUSR.USR_KEY = USR.USR_KEY
    WHERE uest.cod_usuario = MUSUARIO
    and GUSR.GRP_KEY = '10';

    select distinct USR.USR_LOGIN
    into GRUPO14
    from usuario_estab UEST
    left join pl_usr USR on USR.USR_LOGIN = UEST.COD_USUARIO
    left join pl_grp_usr GUSR on GUSR.USR_KEY = USR.USR_KEY
    WHERE uest.cod_usuario = MUSUARIO
    and GUSR.GRP_KEY = '14';

    select distinct USR.USR_LOGIN
    into grupo15
    from usuario_estab UEST
    left join pl_usr USR on USR.USR_LOGIN = UEST.COD_USUARIO
    left join pl_grp_usr GUSR on GUSR.USR_KEY = USR.USR_KEY
    WHERE uest.cod_usuario = MUSUARIO
    and GUSR.GRP_KEY = '15';*/

    -------------------------- DARF
    IF (P_FINALIDADE = '1') THEN
        --IF (GRUPO15 = MUSUARIO) THEN
            LKM_INSERT_DARF(PS_EMPRESA, PS_DATA_INICIAL, PS_DATA_FINAL);
            if (P_MJE = 'S') THEN
                LKM_PLOAD_MJE(PS_EMPRESA,
                                PS_ESTAB,
                                P_FINALIDADE,
                                P_MJE,
                                PS_NUM_DOCFIS,
                                PS_SERIE,
                                PS_RETENCAO,
                                PS_COD_FISJUR,
                                PS_VLR_MULTA,
                                PS_VLR_JUROS,
                                --PS_VLR_ENTIDADES,
                                PS_DATA_INICIAL,
                                PS_DATA_FINAL);
            else
                LKM_PLOAD(PS_EMPRESA,
                            PS_ESTAB,
                            P_FINALIDADE,
                            PS_DATA_INICIAL,
                            PS_DATA_FINAL);

            end if;

            --LIB_PROC.ADD_LOG('Usu?rio com permiss?o no grupo 15 - Recon_Geral_ADM - DARF sendo gerada!', 1);
        --ELSE
            --LIB_PROC.ADD_LOG('Usu?rio SEM permiss?o no grupo 15 - Recon_Geral_ADM - DARF N?O gerada!', 1);
        --END if;
    END if;

    ---------------------------- DAM
     IF (P_FINALIDADE = '2') or (P_FINALIDADE = 5) THEN
        --IF (GRUPO1 = MUSUARIO) or (GRUPO14 = MUSUARIO) THEN
            LKM_INSERT_DAM(PS_EMPRESA, PS_ESTAB, P_FINALIDADE, PS_DATA_INICIAL, PS_DATA_FINAL);
            if (P_MJE = 'S') THEN
                LKM_PLOAD_MJE(PS_EMPRESA,
                                PS_ESTAB,
                                P_FINALIDADE,
                                P_MJE,
                                PS_NUM_DOCFIS,
                                PS_SERIE,
                                PS_RETENCAO,
                                PS_COD_FISJUR,
                                PS_VLR_MULTA,
                                PS_VLR_JUROS,
                                --PS_VLR_ENTIDADES,
                                PS_DATA_INICIAL,
                                PS_DATA_FINAL);
            else
                LKM_PLOAD(PS_EMPRESA,
                            PS_ESTAB,
                            P_FINALIDADE,
                            PS_DATA_INICIAL,
                            PS_DATA_FINAL);

            end if;

            --LIB_PROC.ADD_LOG('Usu?rio com permiss?o no grupo 1 ou 14 - ADM ou Recon_DAM_Filiais - DAM sendo gerada!', 1);
        --ELSE
            --LIB_PROC.ADD_LOG('Usu?rio SEM permiss?o no grupo 1 ou 14 - ADM ou Recon_DAM_Filiais - DAM N?O gerada!', 1);
        --END if;
    END if;
    
    ---------------------------- GPS
    IF (P_FINALIDADE = '3') THEN
        --IF (GRUPO15 = MUSUARIO) THEN
            LKM_INSERT_GPS(PS_EMPRESA, PS_ESTAB, P_LIMINAR, PS_DATA_INICIAL, PS_DATA_FINAL);
            if (P_MJE = 'S') THEN
                LKM_PLOAD_MJE(PS_EMPRESA,
                                PS_ESTAB,
                                P_FINALIDADE,
                                P_MJE,
                                PS_NUM_DOCFIS,
                                PS_SERIE,
                                PS_RETENCAO,
                                PS_COD_FISJUR,
                                PS_VLR_MULTA,
                                PS_VLR_JUROS,
                                --PS_VLR_ENTIDADES,
                                PS_DATA_INICIAL,
                                PS_DATA_FINAL);
            else
                LKM_PLOAD(PS_EMPRESA,
                            PS_ESTAB,
                            P_FINALIDADE,
                            PS_DATA_INICIAL,
                            PS_DATA_FINAL);

            end if;

            --LIB_PROC.ADD_LOG('Usu?rio com permiss?o no grupo 15 - Recon_Geral_ADM - DARF sendo gerada!', 1);
        --ELSE
            --LIB_PROC.ADD_LOG('Usu?rio SEM permiss?o no grupo 15 - Recon_Geral_ADM - DARF N?O gerada!', 1);
        --END if;
    END if;
   
    ---------------------------- RECON
    IF (P_FINALIDADE = '4') THEN
        --IF (GRUPO15 = MUSUARIO) THEN
            LKM_INSERT_REINF(PS_EMPRESA, PS_ESTAB, P_LIMINAR, PS_DATA_INICIAL, PS_DATA_FINAL);
            if (P_MJE = 'S') THEN
                LKM_PLOAD_MJE(PS_EMPRESA,
                                PS_ESTAB,
                                P_FINALIDADE,
                                P_MJE,
                                PS_NUM_DOCFIS,
                                PS_SERIE,
                                PS_RETENCAO,
                                PS_COD_FISJUR,
                                PS_VLR_MULTA,
                                PS_VLR_JUROS,
                                --PS_VLR_ENTIDADES,
                                PS_DATA_INICIAL,
                                PS_DATA_FINAL);
            else
                LKM_PLOAD(PS_EMPRESA,
                            PS_ESTAB,
                            P_FINALIDADE,
                            PS_DATA_INICIAL,
                            PS_DATA_FINAL);

            end if;

            --LIB_PROC.ADD_LOG('Usuario com permiss?o no grupo 15 - Recon_Geral_ADM - REINF sendo gerada!', 1);
        --ELSE
            --LIB_PROC.ADD_LOG('Usuario SEM permiss?o no grupo 15 - Recon_Geral_ADM - REINF N?O gerada!', 1);
        --END if;
    END if;
   

    ---------------- RELATORIO

    IF (PS_RELATORIO = 'S') THEN
      LIB_PROC.ADD_TIPO(MPROC_ID,
                        1,
                        'RELATORIO RETENCOES RECON',
                        1,
                        NULL,
                        NULL,
                        8);
      CORPO(PS_EMPRESA,
            PS_ESTAB,
            --P_FINALIDADE,
            --PS_RELATORIO,
            --P_MJE,
            PS_EXPORT,
            PS_NUM_DOCFIS,
            PS_SERIE,
            PS_RETENCAO,
            PS_COD_FISJUR,
            PS_DATA_INICIAL,
            PS_DATA_FINAL);

      SOMA_CORPO(PS_EMPRESA,
                 PS_ESTAB,
                 --P_FINALIDADE,
                 --PS_RELATORIO,
                 --P_MJE,
                 PS_NUM_DOCFIS,
                 PS_SERIE,
                 PS_RETENCAO,
                 PS_COD_FISJUR,
                 PS_DATA_INICIAL,
                 PS_DATA_FINAL);

    END IF;

    IF (PS_FBL3N = 'S') THEN
      LKM_PLOAD_FBL3N(PS_EMPRESA,
                      --PS_ESTAB,
                      --  P_FINALIDADE2,
                      PS_DATA_INICIAL,
                      PS_DATA_FINAL);
    END IF;

    LIB_PROC.ADD_LOG('INICIO DO PROCESSAMENTO  - PROCESSO: ' || MPROC_ID,
                     1);
    LIB_PROC.ADD_LOG(' ', 1);
    LIB_PROC.ADD_LOG('PARAMETROS UTILIZADOS ', 1);

    LIB_PROC.ADD_LOG('CODIGO EMPRESA: ' || PS_EMPRESA, 1);

    LIB_PROC.ADD_LOG('TIPO DE RECONCILIACAO: ', 1);
    LIB_PROC.ADD_LOG('Tipo de Finalidade: ' || P_FINALIDADE ||
                     '  (0-Relatorio , 1-DARF , 2-DAM , 3-GPS)',
                     1);
    LIB_PROC.ADD_LOG('RELATORIO: ' || PS_RELATORIO, 1);

    LIB_PROC.ADD_LOG('PERIODO: ' || TO_CHAR(PS_DATA_INICIAL, 'DD/MM/YYYY') ||
                     ' a ' || TO_CHAR(PS_DATA_FINAL, 'DD/MM/YYYY'),
                     1);
    LIB_PROC.ADD_LOG(' ', 1);


        -- Begin para estrutura de log de erro
    BEGIN
      FOR CNO IN (select *
                    from vw_lkm_gps
                   where xblnr = '2658'
                     and LENGTH(TRIM(local_nego)) <= '4'
                     AND COD_EMPRESA = PS_EMPRESA
                    -- AND COD_ESTAB = PS_ESTAB
                     AND DATA_FISCAL BETWEEN PS_DATA_INICIAL AND
                         PS_DATA_FINAL) LOOP


        CNO_NOTA  := CNO.ZUONR;
        CNO_FORN  := CNO.FORNEC;
        CNO_DATA  := CNO.Data_Fiscal;
        CNO_ESTAB := CNO.Cod_Estab;


          if CNO_NOTA <>  '0' then
                       LIB_PROC.ADD_LOG(' ARQUIVO SEM O PREENCHIMENTO DO CNO - NOTA : ' ||
                       CNO_NOTA || ' | FORNECEDOR: ' || CNO_FORN ||
                       ' | Data: ' || CNO_DATA || ' | ESTAB: ' ||
                       CNO_ESTAB || ' |',
                       1);
    end if;

        CNO_NOTA  := 0;
        CNO_FORN  := 0;
        CNO_DATA  := 0;
        CNO_ESTAB := 0;

      END LOOP;

    END;

    VN_LINHA  := 48;
    VN_PAGINA := 1;

    LIB_PROC.CLOSE();

    RETURN MPROC_ID;

  END;

  ------------------------------------------------------------------------------------------------------------------------------->
  -------------------------------
  -- I N S E R T - T A B L E S ->
  -------------------------------
  --OK
  PROCEDURE LKM_INSERT_DARF(PS_EMPRESA      VARCHAR2,
                           PS_DATA_INICIAL DATE,
                           PS_DATA_FINAL   DATE) IS

    Script_DARF_executar_capa0 varchar(32767);
    Script_DARF_executar_Item1 varchar(32767);
    Script_DARF_executar_Item2 varchar(32767);
    Script_DARF_executar_Juros varchar(32767);
    Script_DARF_executar_Multa varchar(32767);
    Script_DARF_executar_Entid varchar(32767);

    v_contador1  NUMBER;
    qtd_mod      int;
    qtd_mod_base int;
    variacao     int;
    --divisao int;
    num_ROWNUM NUMBER;

  BEGIN

    qtd_mod      := 0;
    v_contador1  := 0;
    qtd_mod_base := 0;
    variacao     := 0;
    --num_ROWNUM   := 0;

    FOR MINST1 IN (SELECT DISTINCT BKTXT, xblnr
                     FROM VW_LKM_DARF_A
                    WHERE COD_EMPRESA = PS_EMPRESA
                      AND BLDAT BETWEEN PS_DATA_INICIAL AND PS_DATA_FINAL) LOOP
      IF MINST1.BKTXT = 'DARF' THEN

        EXECUTE IMMEDIATE ' ALTER SESSION SET NLS_DATE_FORMAT = ''DD/MM/YYYY''      ';

        -- teste   dbms_output.put_line(V_data_ini_A || '-' || PS_DATA_FINAL);

        -->> GERACAO DARF <<--

        --HEDER
        --1
        IF MINST1.XBlNR = '5952' THEN
          qtd_mod      := 0;
          v_contador1  := 0;
          qtd_mod_base := 0;
          variacao     := 0;
          num_ROWNUM   := 0;

          -- CAPA DARF -- 5952

          FOR H IN (SELECT ROUND(count(ROWNUM) / 500) + 2 ID_ROW
                      FROM VW_LKM_DARF_A
                     WHERE COD_EMPRESA = PS_EMPRESA
                       AND DATA_FISCAL BETWEEN PS_DATA_INICIAL AND
                           PS_DATA_FINAL
                       AND BKTXT = 'DARF'
                       AND XBLNR = '5952') LOOP

            FOR T IN (SELECT ROWNUM, ZUONR
                        FROM VW_LKM_DARF_A
                       WHERE COD_EMPRESA = PS_EMPRESA
                         AND DATA_FISCAL BETWEEN PS_DATA_INICIAL AND
                             PS_DATA_FINAL
                         AND BKTXT = 'DARF'
                         AND XBLNR = '5952'
                         AND ROWNUM < H.ID_ROW)

             LOOP

              IF T.ROWNUM = 0 THEN
                variacao := 1;

                --CONTROLA QUANTIDADE

              ELSIF T.ROWNUM >= 1 THEN
                variacao := variacao + 1;

              END IF;

              Script_DARF_executar_capa0 := 'INSERT INTO LKM_SAIDA_GPS_DARF_CAPA SELECT DISTINCT   ' || '''' ||
                                            variacao || '''' ||
                                            ' CABECALHO,                                          ' ||
                                            'to_char(LAST_DAY(BLDAT), ''DDMMYYYY'') DATALANC,     ' ||
                                            'GJARH EXERCICIO,                                     ' ||
                                            'MONAT PERIODO,                                       ' ||
                                           -- ' ''H;'' || BURKS || '';'' ||to_char(LAST_DAY(BLDAT), ''DDMMYYYY'') || '';'' ||to_date(BLDAT, ''DDMMYYYY'') || '';'' || GJARH || '';'' || ' ||
                                            ' ''H;'' || BURKS || '';'' ||to_char(LAST_DAY(BLDAT), ''DDMMYYYY'') || '';'' ||to_char(SYSDATE, ''DDMMYYYY'') || '';'' || GJARH || '';'' || ' ||
                                            'MONAT || '';'' || XBLNR || '';'' AS LINHA,           ' ||
                                            'LIFNR COD_FIS_JUR,                                   ' ||
                                            ' ''0'' NUM_DOC_FIS,                                  ' ||
                                            'BURKS EMPRESA,                                       ' ||
                                            'to_char(LAST_DAY(BLDAT), ''DDMMYYYY'') DATADOC,      ' ||
                                            ' ''1'' ORDEM,                                        ' ||
                                            'XBLNR CODIGORECEITA,                                 ' ||
                                            ' substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                ' ||
                                            ' '''' FORNEC                                       ' ||
                                            ' FROM VW_LKM_DARF_A                                  ' ||
                                            '  WHERE COD_EMPRESA =       ' || '''' ||
                                            PS_EMPRESA || '''' || '' ||
                                            'AND XBLNR = ''5952''  ' ||
                                            'AND DATA_FISCAL BETWEEN   ' || '''' ||
                                            PS_DATA_INICIAL || '''' || '' ||
                                            'AND                       ' || '''' ||
                                            PS_DATA_FINAL || '''' || '';
              commit;

              BEGIN
                --    ######### I N S E R T - C A P A  #############
                --          dbms_output.put_line(Script_DARF_executar_capa0);
                EXECUTE IMMEDIATE (Script_DARF_executar_capa0);
              END;

            END LOOP;
          END LOOP;

        ELSE

          --          Script_DARF_executar_capa0 := Null;
          Script_DARF_executar_capa0 := 'INSERT INTO LKM_SAIDA_GPS_DARF_CAPA SELECT DISTINCT ' ||
                                        'TO_CHAR(''H'') CABECALHO,                           ' ||
                                        'to_char(LAST_DAY(BLDAT), ''DDMMYYYY'') DATALANC,    ' ||
                                        'GJARH EXERCICIO,                                    ' ||
                                        'MONAT PERIODO,                                      ' ||
                                        ' ''H;'' || BURKS || '';'' ||to_char(LAST_DAY(BLDAT), ''DDMMYYYY'') || '';'' ||to_char(SYSDATE, ''DDMMYYYY'') || '';'' || GJARH || '';'' || ' ||
                                        'MONAT || '';'' || XBLNR || '';'' AS LINHA,          ' ||
                                        'LIFNR COD_FIS_JUR,                                  ' ||
                                        ' ''0'' NUM_DOC_FIS,                                 ' ||
                                        'BURKS EMPRESA,                                      ' ||
                                        'to_char(LAST_DAY(BLDAT), ''DDMMYYYY'') DATADOC,     ' ||
                                        ' ''1'' ORDEM,                                       ' ||
                                        'XBLNR CODIGORECEITA,                                ' ||
                                        ' substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,               ' ||
                                        ' '''' FORNEC                                      ' ||
                                        'FROM VW_LKM_DARF_A                                  ' ||
                                        'WHERE COD_EMPRESA =       ' || '''' ||
                                        PS_EMPRESA || '''' || '' ||
                                        'AND XBLNR != ''5952''  ' ||
                                        'AND DATA_FISCAL BETWEEN   ' || '''' ||
                                        PS_DATA_INICIAL || '''' || '' ||
                                        'AND                       ' || '''' ||
                                        PS_DATA_FINAL || '''' || '';
          commit;
          BEGIN
            --    ######### I N S E R T - C A P A  #############
            dbms_output.put_line(Script_DARF_executar_capa0);
            EXECUTE IMMEDIATE (Script_DARF_executar_capa0);
          END;

        END IF;
        --1
        --CAPA
        IF MINST1.XBlNR = '5952' THEN
          qtd_mod      := 0;
          v_contador1  := 0;
          qtd_mod_base := 0;
          variacao     := 0;
          num_ROWNUM   := 0;

          -- CAPA DARF -- 5952

          FOR H IN (SELECT ROUND(count(ROWNUM) / 500) + 2 ID_ROW
                      FROM VW_LKM_DARF_A
                     WHERE COD_EMPRESA = PS_EMPRESA
                       AND DATA_FISCAL BETWEEN PS_DATA_INICIAL AND
                           PS_DATA_FINAL
                       AND BKTXT = 'DARF'
                       AND XBLNR = '5952') LOOP

            FOR T IN (SELECT ROWNUM, ZUONR
                        FROM VW_LKM_DARF_A
                       WHERE COD_EMPRESA = PS_EMPRESA
                         AND DATA_FISCAL BETWEEN PS_DATA_INICIAL AND
                             PS_DATA_FINAL
                         AND BKTXT = 'DARF'
                         AND XBLNR = '5952'
                         AND ROWNUM < H.ID_ROW)

             LOOP

              IF T.ROWNUM = 0 THEN
                v_contador1 := v_contador1 + 1;
                variacao    := 1;
                --CONTROLA QUANTIDADE

              ELSIF T.ROWNUM = 1 THEN
                qtd_mod      := 0;
                qtd_mod_base := 500;
                variacao     := variacao + 1;
                v_contador1  := v_contador1 + 500;

              ELSIF t.ROWNUM = 2 THEN
                qtd_mod      := 501;
                qtd_mod_base := 1000;
                variacao     := variacao + 1;
                v_contador1  := v_contador1 + 500;

              ELSIF t.ROWNUM > 2 THEN
                qtd_mod      := qtd_mod + 500;
                qtd_mod_base := qtd_mod_base + 500;
                variacao     := variacao + 1;
              END IF;

              Script_DARF_executar_Item1 := 'INSERT INTO LKM_SAIDA_GPS_DARF_ITEM1 WITH LKM_INSERT_DARF_WITH as (SELECT          ' ||
                                            ' ROW_NUMBER() OVER(ORDER BY ZUONR ASC) AS ID_T,                                                      ' || '''' ||
                                            variacao || '''' ||
                                            ' ITEM,                            ' ||
                                            ' LIFNR FORNECEDOR,                                                                 ' ||
                                            ' LOCAL_NEGO LOCALNEGOCIO,                                                          ' ||
                                            ' TRIM(TO_CHAR(VL_TRIB,''000000000099'')) vlrtrib,                                  ' ||
                                            ' ''I;'' || LIFNR || '';'' || LOCAL_NEGO || '';'' || TRIM(TO_CHAR(VL_TRIB,''000000000099'')) || '';'' AS LINHA,     ' ||
                                            ' LIFNR COD_FIS_JUR,                                                                ' ||
                                            ' ''0'' NUM_DOC_FIS,                                                                ' || --ZUONR
                                            ' BURKS EMPRESA,                                                                    ' ||
                                            ' to_char(LAST_DAY(BLDAT),''DDMMYYYY'') DATADOC,                                    ' ||
                                            ' ''2'' ORDEM,                                                                      ' ||
                                            ' XBLNR CODIGORECEITA,                                                              ' ||
                                            ' CKEY FORNEC                                                                     ' ||
                                            '  FROM VW_LKM_DARF_A                                                               ' ||
                                            '  WHERE COD_EMPRESA =        ' || '''' ||
                                            PS_EMPRESA || '''' ||
                                            '              ' ||
                                            'AND DATA_FISCAL BETWEEN      ' || '''' ||
                                            PS_DATA_INICIAL || '''' ||
                                            '              ' ||
                                            'AND                          ' || '''' ||
                                            PS_DATA_FINAL || '''' ||
                                            '              ' ||
                                            'AND XBLNR = ''5952''  ' ||
                                            ' ORDER BY ZUONR ' ||
                                            '     )                                                                                      ' ||
                                            'SELECT ' || '''' || variacao || '''' ||
                                            '  ITEM                                               ' ||
                                            '     , M.FORNECEDOR                                                                         ' ||
                                            '     , M.LOCALNEGOCIO                                                                       ' ||
                                            '     , TRIM(TO_CHAR(SUM(VLRTRIB),''000000000099'')) vlrtrib                                 ' ||
                                            '     , SUBSTR(LINHA, 1, 17)||TRIM(TO_CHAR(SUM(VLRTRIB),''000000000099''))||'';'' LINHA      ' ||
                                            '     , COD_FIS_JUR                                                                          ' ||
                                            '     , NUM_DOC_FIS                                                                          ' ||
                                            '     , EMPRESA                                                                              ' ||
                                            '     , DATADOC                                                                              ' ||
                                            '     , ORDEM                                                                                ' ||
                                            '     , CODIGORECEITA, '''' FORNEC   FROM  LKM_INSERT_DARF_WITH M                                         ' ||
                                            '     WHERE ID_T >= ' || '''' ||
                                            qtd_mod || '''' ||
                                            '       AND ID_T <=' || '''' ||
                                            qtd_mod_base || '''' ||
                                            '     GROUP BY                                                                               ' ||
                                            '       M.ITEM                                                                               ' ||
                                            '       , M.FORNECEDOR                                                                       ' ||
                                            '       , M.LOCALNEGOCIO                                                                     ' ||
                                            '       , SUBSTR(LINHA, 1, 17)                                                               ' ||
                                            '       , COD_FIS_JUR                                                                        ' ||
                                            '       , NUM_DOC_FIS                                                                        ' ||
                                            '       , EMPRESA                                                                            ' ||
                                            '       , DATADOC                                                                            ' ||
                                            '       , ORDEM                                                                              ' ||
                                            '       , CODIGORECEITA                                                                              ' ||
                                            '       , ''''                                                                         ' || '';
              --  v_contador1 := v_contador1 +500;
              commit;
              BEGIN
                --######### I N S E R T - I T E M 1 ############
                dbms_output.put_line(Script_DARF_executar_Item1);
                EXECUTE IMMEDIATE (Script_DARF_executar_Item1);
              END;

            END LOOP;
          END LOOP;

        ELSE
          -- CAPA DARF
          Script_DARF_executar_Item1 := 'INSERT INTO LKM_SAIDA_GPS_DARF_ITEM1 WITH LKM_INSERT_DARF_WITH as (SELECT          ' ||
                                        ' ''I'' ITEM,                                                                       ' ||
                                        ' LIFNR FORNECEDOR,                                                                 ' ||
                                        ' LOCAL_NEGO LOCALNEGOCIO,                                                          ' ||
                                        ' TRIM(TO_CHAR(VL_TRIB,''000000000099'')) vlrtrib,                                                                  ' ||
                                        ' ''I;'' || LIFNR || '';'' || LOCAL_NEGO || '';'' || TRIM(TO_CHAR(VL_TRIB,''000000000099'')) || '';'' AS LINHA,     ' ||
                                        ' LIFNR COD_FIS_JUR,                                                                ' ||
                                        ' ''0'' NUM_DOC_FIS,                                                                ' || --ZUONR
                                        ' BURKS EMPRESA,                                                                    ' ||
                                        ' to_char(LAST_DAY(BLDAT),''DDMMYYYY'') DATADOC,                                    ' ||
                                        ' ''2'' ORDEM,                                                                      ' ||
                                        ' XBLNR CODIGORECEITA,                                                               ' ||
                                        ' '''' FORNEC                                                                     ' ||
                                        '  FROM VW_LKM_DARF_A                                                               ' ||
                                        '  WHERE COD_EMPRESA =        ' || '''' ||
                                        PS_EMPRESA || '''' ||
                                        '              ' ||
                                        'AND XBLNR != ''5952''  ' ||
                                        'AND DATA_FISCAL BETWEEN      ' || '''' ||
                                        PS_DATA_INICIAL || '''' ||
                                        '              ' ||
                                        'AND                          ' || '''' ||
                                        PS_DATA_FINAL || '''' ||
                                        '              ' ||
                                        'AND XBLNR != ''5952''  ' ||
                                       /*   'AND ZUONR IN (SELECT   ZUONR                           ' ||
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ' ||*/
                                        '     )                                                                                      ' ||
                                        'SELECT M.ITEM                                                                               ' ||
                                        '     , M.FORNECEDOR                                                                         ' ||
                                        '     , M.LOCALNEGOCIO                                                                       ' ||
                                        '     , TRIM(TO_CHAR(SUM(VLRTRIB),''000000000099'')) vlrtrib                                 ' ||
                                        '     , SUBSTR(LINHA, 1, 17)||TRIM(TO_CHAR(SUM(VLRTRIB),''000000000099''))||'';'' LINHA      ' ||
                                        '     , COD_FIS_JUR                                                                          ' ||
                                        '     , NUM_DOC_FIS                                                                          ' ||
                                        '     , EMPRESA                                                                              ' ||
                                        '     , DATADOC                                                                              ' ||
                                        '     , ORDEM                                                                                ' ||
                                        '     , CODIGORECEITA                                                                                ' ||
                                        '     , FORNEC   FROM  LKM_INSERT_DARF_WITH M                                         ' ||
                                        '     GROUP BY                                                                               ' ||
                                        '       M.ITEM                                                                               ' ||
                                        '       , M.FORNECEDOR                                                                       ' ||
                                        '       , M.LOCALNEGOCIO                                                                     ' ||
                                        '       , SUBSTR(LINHA, 1, 17)                                                               ' ||
                                        '       , COD_FIS_JUR                                                                        ' ||
                                        '       , NUM_DOC_FIS                                                                        ' ||
                                        '       , EMPRESA                                                                            ' ||
                                        '       , DATADOC                                                                            ' ||
                                        '       , ORDEM                                                                              ' ||
                                        '       , CODIGORECEITA                                                                                ' ||
                                        '       , FORNEC                                                                      ' || '';
          commit;
          BEGIN
            --######### I N S E R T - I T E M 1 ############
            --dbms_output.put_line(Script_DARF_executar_Item1);
            EXECUTE IMMEDIATE (Script_DARF_executar_Item1);
          END;

        END IF;

        --NOTA
        IF MINST1.XBlNR = '5952' THEN
          qtd_mod      := 0;
          v_contador1  := 0;
          qtd_mod_base := 0;
          variacao     := 0;
          num_ROWNUM   := 0;

          -- CAPA DARF -- 5952

          FOR H IN (SELECT ROUND(count(ROWNUM) / 500) + 2 ID_ROW
                      FROM VW_LKM_DARF_A
                     WHERE COD_EMPRESA = PS_EMPRESA
                       AND DATA_FISCAL BETWEEN PS_DATA_INICIAL AND
                           PS_DATA_FINAL
                       AND BKTXT = 'DARF'
                       AND XBLNR = '5952') LOOP

            FOR T IN (SELECT ROWNUM, ZUONR
                        FROM VW_LKM_DARF_A
                       WHERE COD_EMPRESA = PS_EMPRESA
                         AND DATA_FISCAL BETWEEN PS_DATA_INICIAL AND
                             PS_DATA_FINAL
                         AND BKTXT = 'DARF'
                         AND XBLNR = '5952'
                         AND ROWNUM < H.ID_ROW)

             LOOP

              IF T.ROWNUM = 0 THEN
                v_contador1 := v_contador1 + 1;
                variacao    := 1;
                --CONTROLA QUANTIDADE

              ELSIF T.ROWNUM = 1 THEN
                qtd_mod      := 0;
                qtd_mod_base := 500;
                variacao     := variacao + 1;
                v_contador1  := v_contador1 + 500;

              ELSIF t.ROWNUM = 2 THEN
                qtd_mod      := 501;
                qtd_mod_base := 1000;
                variacao     := variacao + 1;
                v_contador1  := v_contador1 + 500;

              ELSIF t.ROWNUM > 2 THEN
                qtd_mod      := qtd_mod + 500;
                qtd_mod_base := qtd_mod_base + 500;
                variacao     := variacao + 1;
              END IF;

              --ITEN2 DARF 5925

              Script_DARF_executar_Item2 := ' INSERT INTO LKM_SAIDA_GPS_DARF_ITEM2                              ' ||
                                            '   WITH a as (         ' ||
                                            'SELECT DISTINCT              ' ||
                                            '  ROW_NUMBER() OVER(ORDER BY ZUONR ASC) AS ID_T,                                                     ' || ' ' || '''' ||
                                            variacao || '''' ||
                                            ' ITEM,                            ' ||
                                            'XBLNR CONTALOCALIZADAPELOCODIGO,                                   ' ||
                                            'LOCAL_NEGO LOCALNEGOCIO,                                           ' ||
                                            'VL_TRIB VALOR,                                                     ' ||
                                            ' ''NF'' || ZUONR NOTAFISCAL,                                       ' ||
                                            ' ''I;'' || XBLNR || '';'' || LOCAL_NEGO || '';'' || VL_TRIB ||     ' ||
                                            ' '';'' || ZUONR || '';'' AS LINHA,                                 ' ||
                                            'LIFNR COD_FIS_JUR,                                                 ' ||
                                            'ZUONR NUM_DOC_FIS,                                                 ' ||
                                            'BURKS EMPRESA,                                                     ' ||
                                            'BLDAT DATADOC,                                                     ' ||
                                            ' ''3'' ORDEM,                                                      ' ||
                                            ' XBLNR CODIGORECEITA,                                               ' ||
                                            ' CKEY FORNEC                                                                     ' ||
                                            'FROM VW_LKM_DARF_A                                                 ' ||
                                            'WHERE COD_EMPRESA = ' || '''' ||
                                            PS_EMPRESA || '''' || '' ||
                                            'AND XBLNR = ''5952''  ' ||
                                            'AND DATA_FISCAL BETWEEN   ' || '''' ||
                                            PS_DATA_INICIAL || '''' || '' ||
                                            'AND                 ' || '''' ||
                                            PS_DATA_FINAL || '''' ||
                                            ' ORDER BY ZUONR ' ||
                                            ')    select        ITEM,                                   ' ||
                                            '                   CONTALOCALIZADAPELOCODIGO,              ' ||
                                            '                   LOCALNEGOCIO,                           ' ||
                                            '                   VALOR,                                  ' ||
                                            '                   NOTAFISCAL,                             ' ||
                                            '                   LINHA,                                  ' ||
                                            '                   COD_FIS_JUR,                            ' ||
                                            '                   NUM_DOC_FIS,                            ' ||
                                            '                   EMPRESA,                                ' ||
                                            '                   DATADOC,                                ' ||
                                            '                   ORDEM,                                  ' ||
                                            '                   CODIGORECEITA,                           ' ||
                                            '                    FORNEC                                  ' ||
--                                            '                   '''' FORNEC                                  ' ||
                                            '                from a                                     ' ||
                                            '  Where ID_T >= ' || '''' ||
                                            qtd_mod || '''' ||
                                            '  AND ID_T <=' || '''' ||
                                            qtd_mod_base || '''' ||
                                            '  ORDER BY ID_T                                         ' || '';

              commit;
              BEGIN
                --######### I N S E R T - I T E M 2 ############
                dbms_output.put_line(Script_DARF_executar_Item2);
                EXECUTE IMMEDIATE (Script_DARF_executar_Item2);
              END;

            END LOOP;
          END LOOP;
        ELSE
          --ITEN2 DARF

          Script_DARF_executar_Item2 := ' INSERT INTO LKM_SAIDA_GPS_DARF_ITEM2 SELECT DISTINCT   ' ||
                                        ' ''I'' ITEM,                                                       ' ||
                                        'XBLNR CONTALOCALIZADAPELOCODIGO,                                   ' ||
                                        'LOCAL_NEGO LOCALNEGOCIO,                                           ' ||
                                        'VL_TRIB VALOR,                                                     ' ||
                                        ' ''NF'' || ZUONR NOTAFISCAL,                                       ' ||
                                        ' ''I;'' || XBLNR || '';'' || LOCAL_NEGO || '';'' || VL_TRIB ||     ' ||
                                        ' '';'' || ZUONR || '';'' AS LINHA,                               ' ||
                                        'LIFNR COD_FIS_JUR,                                                 ' ||
                                        'ZUONR NUM_DOC_FIS,                                                 ' ||
                                        'BURKS EMPRESA,                                                     ' ||
                                        'BLDAT DATADOC,                                                     ' ||
                                        ' ''3'' ORDEM,                                                      ' ||
                                        ' XBLNR CODIGORECEITA,                                               ' ||
                                        ' CKEY FORNEC                                               ' ||
                                        'FROM VW_LKM_DARF_A                                                 ' ||
                                        'WHERE COD_EMPRESA = ' || '''' ||
                                        PS_EMPRESA || '''' || '' ||
                                        'AND XBLNR != ''5952''  ' ||
                                        'AND DATA_FISCAL BETWEEN   ' || '''' ||
                                        PS_DATA_INICIAL || '''' || '' ||
                                        'AND                 ' || '''' ||
                                        PS_DATA_FINAL || '''' || '';
          commit;
          BEGIN
            --######### I N S E R T - I T E M 2 ############
            --dbms_output.put_line(Script_DARF_executar_Item2);
            EXECUTE IMMEDIATE (Script_DARF_executar_Item2);
          END;

        END IF;

        --JURUS
        IF MINST1.XBlNR = '5952' THEN
          qtd_mod      := 0;
          v_contador1  := 0;
          qtd_mod_base := 0;
          variacao     := 0;
          num_ROWNUM   := 0;

          -- CAPA DARF -- 5952

          FOR H IN (SELECT ROUND(count(ROWNUM) / 500) + 2 ID_ROW
                      FROM VW_LKM_DARF_A
                     WHERE COD_EMPRESA = PS_EMPRESA
                       AND DATA_FISCAL BETWEEN PS_DATA_INICIAL AND
                           PS_DATA_FINAL
                       AND BKTXT = 'DARF'
                       AND XBLNR = '5952') LOOP

            FOR T IN (SELECT ROWNUM, ZUONR
                        FROM VW_LKM_DARF_A
                       WHERE COD_EMPRESA = PS_EMPRESA
                         AND DATA_FISCAL BETWEEN PS_DATA_INICIAL AND
                             PS_DATA_FINAL
                         AND BKTXT = 'DARF'
                         AND XBLNR = '5952'
                         AND ROWNUM < H.ID_ROW)

             LOOP

              IF T.ROWNUM = 0 THEN
                v_contador1 := v_contador1 + 1;
                variacao    := 1;
                --CONTROLA QUANTIDADE

              ELSIF T.ROWNUM = 1 THEN
                qtd_mod      := 0;
                qtd_mod_base := 500;
                variacao     := variacao + 1;
                v_contador1  := v_contador1 + 500;

              ELSIF t.ROWNUM = 2 THEN
                qtd_mod      := 501;
                qtd_mod_base := 1000;
                variacao     := variacao + 1;
                v_contador1  := v_contador1 + 500;

              ELSIF t.ROWNUM > 2 THEN
                qtd_mod      := qtd_mod + 500;
                qtd_mod_base := qtd_mod_base + 500;
                variacao     := variacao + 1;
              END IF;

              --MULTA DARF
              Script_DARF_executar_Multa := ' INSERT INTO LKM_SAIDA_GPS_DARF_ITEM3_M                               ' ||
                                            '   WITH a as (         ' ||
                                            'SELECT DISTINCT           ' ||
                                            '  ROW_NUMBER() OVER(ORDER BY ZUONR ASC) AS ID_T,                                                    ' || ' ' || '''' ||
                                            variacao || '''' ||
                                            ' ITEM,                           ' ||
                                            ' ''MULTA'' MULTA,                                                 ' ||
                                            'LOCAL_NEGO LOCALNEGOCIO,                                          ' ||
                                            'TRIM(TO_CHAR(SUM(MULTA),''000000000099'')) VALOR,                                                      ' ||
                                            ' ''I;MULTA;'' || LOCAL_NEGO || '';'' || TRIM(TO_CHAR(SUM(MULTA),''000000000099'')) || '';'' LINHA,     ' ||
                                            'LIFNR COD_FIS_JUR,                                                  ' ||
                                            ' ''999999993'' NUM_DOC_FIS,                                                 ' ||
                                            'BURKS EMPRESA,                                                      ' ||
                                            'to_char(LAST_DAY(BLDAT),''DDMMYYYY'') DATADOC,                      ' ||
                                            ' ''4'' ORDEM,                                                       ' ||
                                            ' XBLNR CODIGORECEITA,                                                 ' ||
                                            ' CKEY FORNEC                                               ' ||
                                            'FROM VW_LKM_DARF_A                                                   ' ||
                                            'WHERE COD_EMPRESA = ' || '''' ||
                                            PS_EMPRESA || '''' ||
                                            '             ' ||
                                            'AND XBLNR = ''5952''  ' ||
                                            'AND DATA_FISCAL BETWEEN   ' || '''' ||
                                            PS_DATA_INICIAL || '''' || '  ' ||
                                            'AND                 ' || '''' ||
                                            PS_DATA_FINAL ||
                                            '''                ' ||
                                            'group by rownum,                                           ' ||
                                            ' ''I'',                                                    ' ||
                                            ' ''MULTA'' ,                                               ' ||
                                            'LOCAL_NEGO,                                                ' ||
                                            ' ''I;MULTA;''|| LOCAL_NEGO || '';'' || '';'' ,             ' ||
                                            'LIFNR ,                                                    ' ||
                                            ' ''3'',                                                    ' ||
                                            'BURKS,                                                     ' ||
                                            'to_char(LAST_DAY(BLDAT),''DDMMYYYY''),                     ' ||
                                            ' ''4'',                                                    ' ||
                                            'XBLNR,                                                     ' ||
                                            ' CKEY ,                                              ' ||
                                            'ZUONR                                                      ' ||
                                            ')    select        ITEM,                                   ' ||
                                            '                   MULTA,              ' ||
                                            '                   LOCALNEGOCIO,                           ' ||
                                            '                   VALOR,                                  ' ||
                                            '                   LINHA,                             ' ||
                                            '                   COD_FIS_JUR,                                  ' ||
                                            '                   NUM_DOC_FIS,                            ' ||
                                            '                   EMPRESA,                            ' ||
                                            '                   DATADOC,                                ' ||
                                            '                   ORDEM,                                ' ||
                                            '                   CODIGORECEITA,                                  ' ||
                                            '                   '''' FORNEC                                  ' ||
                                            '                from a                                     ' ||
                                            '  Where ID_T >= ' || '''' ||
                                            qtd_mod || '''' ||
                                            '  AND ID_T <=' || '''' ||
                                            qtd_mod_base || '''' ||
                                            ' group by ITEM,                           ' ||
                                            ' MULTA,                                        ' ||
                                            'LOCALNEGOCIO,' || 'VALOR,' ||
                                            'LINHA,' || 'COD_FIS_JUR,' ||
                                            'NUM_DOC_FIS,' || 'EMPRESA,' ||
                                            'DATADOC,' || 'ORDEM,' ||
                                            'CODIGORECEITA,' || 'FORNEC' || '';
              commit;
              BEGIN
                --######### I N S E R T - M U L T A ############
                dbms_output.put_line(Script_DARF_executar_Multa);
                EXECUTE IMMEDIATE (Script_DARF_executar_Multa);
              END;

            END LOOP;
          END LOOP;

        ELSE
          --MULTA DARF
          Script_DARF_executar_Multa := ' INSERT INTO LKM_SAIDA_GPS_DARF_ITEM3_M SELECT DISTINCT            ' ||
                                        ' ''I'' ITEM,                                                      ' ||
                                        ' ''MULTA'' MULTA,                                                 ' ||
                                        'LOCAL_NEGO LOCALNEGOCIO,                                          ' ||
                                        'TRIM(TO_CHAR(SUM(MULTA),''000000000099'')) VALOR,                                                      ' ||
                                        ' ''I;MULTA;'' || LOCAL_NEGO || '';'' || TRIM(TO_CHAR(SUM(MULTA),''000000000099'')) || '';'' LINHA,     ' ||
                                        'LIFNR COD_FIS_JUR,                                                  ' ||
                                        ' ''999999993'' NUM_DOC_FIS,                                                 ' ||
                                        'BURKS EMPRESA,                                                      ' ||
                                        'to_char(LAST_DAY(BLDAT),''DDMMYYYY'') DATADOC,                      ' ||
                                        ' ''4'' ORDEM,                                                       ' ||
                                        ' XBLNR CODIGORECEITA,                                                 ' ||
                                        ' '''' FORNEC                                                 ' ||
                                        'FROM VW_LKM_DARF_A                                                   ' ||
                                        'WHERE COD_EMPRESA = ' || '''' ||
                                        PS_EMPRESA || '''' ||
                                        '             ' ||
                                        'AND XBLNR != ''5952''  ' ||
                                        'AND DATA_FISCAL BETWEEN   ' || '''' ||
                                        PS_DATA_INICIAL || '''' || '  ' ||
                                        'AND                 ' || '''' ||
                                        PS_DATA_FINAL ||
                                        '''                ' ||
                                        'group by  ''I'',                                                    ' ||
                                        ' ''MULTA'' ,                                               ' ||
                                        'LOCAL_NEGO,                                                ' ||
                                        ' ''I;MULTA;''|| LOCAL_NEGO || '';'' || '';'' ,             ' ||
                                        'LIFNR ,                                                    ' ||
                                        ' ''3'',                                                    ' ||
                                        'BURKS,                                                     ' ||
                                        'to_char(LAST_DAY(BLDAT),''DDMMYYYY''),                     ' ||
                                        ' ''4'',                                                    ' ||
                                        ' XBLNR,                                                    ' ||
                                        ' ''''                                                     ' || '';

          commit;
          BEGIN
            --######### I N S E R T - M U L T A ############
            --       dbms_output.put_line(Script_DARF_executar_Multa);
            EXECUTE IMMEDIATE (Script_DARF_executar_Multa);
          END;
        END IF;

        --MULTA
        IF MINST1.XBlNR = '5952' THEN
          qtd_mod      := 0;
          v_contador1  := 0;
          qtd_mod_base := 0;
          variacao     := 0;
          num_ROWNUM   := 0;

          -- CAPA DARF -- 5952

          FOR H IN (SELECT ROUND(count(ROWNUM) / 500) + 2 ID_ROW
                      FROM VW_LKM_DARF_A
                     WHERE COD_EMPRESA = PS_EMPRESA
                       AND DATA_FISCAL BETWEEN PS_DATA_INICIAL AND
                           PS_DATA_FINAL
                       AND BKTXT = 'DARF'
                       AND XBLNR = '5952') LOOP

            FOR T IN (SELECT ROWNUM, ZUONR
                        FROM VW_LKM_DARF_A
                       WHERE COD_EMPRESA = PS_EMPRESA
                         AND DATA_FISCAL BETWEEN PS_DATA_INICIAL AND
                             PS_DATA_FINAL
                         AND BKTXT = 'DARF'
                         AND XBLNR = '5952'
                         AND ROWNUM < H.ID_ROW)

             LOOP

              IF T.ROWNUM = 0 THEN
                v_contador1 := v_contador1 + 1;
                variacao    := 1;
                --CONTROLA QUANTIDADE

              ELSIF T.ROWNUM = 1 THEN
                qtd_mod      := 0;
                qtd_mod_base := 500;
                variacao     := variacao + 1;
                v_contador1  := v_contador1 + 500;

              ELSIF t.ROWNUM = 2 THEN
                qtd_mod      := 501;
                qtd_mod_base := 1000;
                variacao     := variacao + 1;
                v_contador1  := v_contador1 + 500;

              ELSIF t.ROWNUM > 2 THEN
                qtd_mod      := qtd_mod + 500;
                qtd_mod_base := qtd_mod_base + 500;
                variacao     := variacao + 1;
              END IF;

              --JUROS DARF
              Script_DARF_executar_Juros := ' INSERT INTO LKM_SAIDA_GPS_DARF_ITEM4_J                                ' ||
                                            '   WITH a as (         ' ||
                                            'SELECT DISTINCT                  ' ||
                                            '  ROW_NUMBER() OVER(ORDER BY ZUONR ASC) AS ID_T,                                                    ' || '''' ||
                                            variacao || '''' ||
                                            ' ITEM,                            ' ||
                                            '  ''JUROS'' MULTA,                                                            ' ||
                                            ' LOCAL_NEGO LOCALNEGOCIO,                                                     ' ||
                                            ' TRIM(TO_CHAR(SUM(JUROS),''000000000099'')) VALOR,                             ' ||
                                            '  ''I;JUROS;'' || LOCAL_NEGO || '';'' || TRIM(TO_CHAR(SUM(JUROS),''000000000099'')) || '';'' LINHA,' ||
                                            ' LIFNR COD_FIS_JUR,                                                           ' ||
                                            ' ''999999994'' NUM_DOC_FIS  ,                                                         ' ||
                                            ' BURKS EMPRESA,                                                               ' ||
                                            'to_char(LAST_DAY(BLDAT),''DDMMYYYY'') DATADOC,                                ' ||
                                            '  ''5'' ORDEM,                                                                ' ||
                                            ' XBLNR CODIGORECEITA,                                                          ' ||
                                            ' CKEY FORNEC                                                          ' ||
                                            'FROM VW_LKM_DARF_A                                                            ' ||
                                            'WHERE COD_EMPRESA = ' || '''' ||
                                            PS_EMPRESA || '''' ||
                                            '                       ' ||
                                            'AND XBLNR = ''5952''  ' ||
                                            'AND DATA_FISCAL BETWEEN   ' || '''' ||
                                            PS_DATA_INICIAL || '''' ||
                                            '            ' ||
                                            'AND                 ' || '''' ||
                                            PS_DATA_FINAL ||
                                            '''                          ' ||
                                            'group by ROWNUM, ' ||
                                            '''I'',                                                              ' ||
                                            ' ''JUROS'' ,                                                         ' ||
                                            'LOCAL_NEGO,                                                          ' ||
                                            ' ''I;JUROS;''|| LOCAL_NEGO || '';'' || '';'' ,                       ' ||
                                            'LIFNR ,                                                              ' ||
                                            ' ''3'',                                                              ' ||
                                            'BURKS,                                                               ' ||
                                            'to_char(LAST_DAY(BLDAT),''DDMMYYYY''),                               ' ||
                                            ' ''4'',                                                              ' ||
                                            'XBLNR,                                                                ' ||
                                            'CKEY,                                                                ' ||
                                            'ZUONR' ||
                                           --' ORDER BY ZUONR '||
                                            ')    select        ITEM,                                   ' ||
                                            '                   MULTA,              ' ||
                                            '                   LOCALNEGOCIO,                           ' ||
                                            '                   VALOR,                                  ' ||
                                            '                   LINHA,                             ' ||
                                            '                   COD_FIS_JUR,                                  ' ||
                                            '                   NUM_DOC_FIS,                            ' ||
                                            '                   EMPRESA,                            ' ||
                                            '                   DATADOC,                                ' ||
                                            '                   ORDEM,                                ' ||
                                            '                   CODIGORECEITA,                           ' ||
                                            '                   '''' FORNEC                           ' ||
                                            '                from a                                     ' ||
                                            '  Where ID_T >= ' || '''' ||
                                            qtd_mod || '''' ||
                                            '  AND ID_T <=' || '''' ||
                                            qtd_mod_base || '''' ||
                                            'group by     ITEM,                                   ' ||
                                            '                   MULTA,              ' ||
                                            '                   LOCALNEGOCIO,                           ' ||
                                            '                   VALOR,                                  ' ||
                                            '                   LINHA,                             ' ||
                                            '                   COD_FIS_JUR,                                  ' ||
                                            '                   NUM_DOC_FIS,                            ' ||
                                            '                   EMPRESA,                            ' ||
                                            '                   DATADOC,                                ' ||
                                            '                   ORDEM,                                ' ||
                                            '                   CODIGORECEITA,                                ' ||
                                            '                   FORNEC                           ' || '';
              commit;
              BEGIN
                --######### I N S E R T - J U R O S  ###########
                --    dbms_output.put_line(Script_DARF_executar_Juros);
                EXECUTE IMMEDIATE (Script_DARF_executar_Juros);
              END;

            END LOOP;
          END LOOP;

        ELSE

          Script_DARF_executar_Juros := ' INSERT INTO LKM_SAIDA_GPS_DARF_ITEM4_J  SELECT DISTINCT                      ' ||
                                        '  ''I'' ITEM,                                                                 ' ||
                                        '  ''JUROS'' MULTA,                                                            ' ||
                                        ' LOCAL_NEGO LOCALNEGOCIO,                                                     ' ||
                                        ' TRIM(TO_CHAR(SUM(JUROS),''000000000099'')) VALOR,                             ' ||
                                        '  ''I;JUROS;'' || LOCAL_NEGO || '';'' || TRIM(TO_CHAR(SUM(JUROS),''000000000099'')) || '';'' LINHA,' ||
                                        ' LIFNR COD_FIS_JUR,                                                           ' ||
                                        ' ''999999994'' NUM_DOC_FIS  ,                                                         ' ||
                                        ' BURKS EMPRESA,                                                               ' ||
                                        'to_char(LAST_DAY(BLDAT),''DDMMYYYY'') DATADOC,                                ' ||
                                        '  ''5'' ORDEM,                                                                ' ||
                                        ' XBLNR CODIGORECEITA,                                                          ' ||
                                        ' '''' FORNEC                                                          ' ||
                                        'FROM VW_LKM_DARF_A                                                            ' ||
                                        'WHERE COD_EMPRESA = ' || '''' ||
                                        PS_EMPRESA || '''' ||
                                        '                       ' ||
                                        'AND XBLNR != ''5952''  ' ||
                                        'AND DATA_FISCAL BETWEEN   ' || '''' ||
                                        PS_DATA_INICIAL || '''' ||
                                        '            ' ||
                                        'AND                 ' || '''' ||
                                        PS_DATA_FINAL ||
                                        '''                          ' ||
                                        'group by  ''I'',                                                              ' ||
                                        ' ''JUROS'' ,                                                         ' ||
                                        'LOCAL_NEGO,                                                          ' ||
                                        ' ''I;JUROS;''|| LOCAL_NEGO || '';'' || '';'' ,                       ' ||
                                        'LIFNR ,                                                              ' ||
                                        ' ''3'',                                                              ' ||
                                        'BURKS,                                                               ' ||
                                        'to_char(LAST_DAY(BLDAT),''DDMMYYYY''),                               ' ||
                                        ' ''4'',                                                              ' ||
                                        ' XBLNR,                                                              ' ||
                                        '''''                                                                ' || '';

          commit;
          BEGIN
            --######### I N S E R T - J U R O S  ###########
            --     dbms_output.put_line(Script_DARF_executar_Juros);
            EXECUTE IMMEDIATE (Script_DARF_executar_Juros);
          END;
        END IF;

        --ENTIDADES
        IF MINST1.XBlNR = '5952' THEN
          qtd_mod      := 0;
          v_contador1  := 0;
          qtd_mod_base := 0;
          variacao     := 0;
          num_ROWNUM   := 0;

          -- CAPA DARF -- 5952

          FOR H IN (SELECT ROUND(count(ROWNUM) / 500) + 2 ID_ROW
                      FROM VW_LKM_DARF_A
                     WHERE COD_EMPRESA = PS_EMPRESA
                       AND DATA_FISCAL BETWEEN PS_DATA_INICIAL AND
                           PS_DATA_FINAL
                       AND BKTXT = 'DARF'
                       AND XBLNR = '5952') LOOP

            FOR T IN (SELECT ROWNUM, ZUONR
                        FROM VW_LKM_DARF_A
                       WHERE COD_EMPRESA = PS_EMPRESA
                         AND DATA_FISCAL BETWEEN PS_DATA_INICIAL AND
                             PS_DATA_FINAL
                         AND BKTXT = 'DARF'
                         AND XBLNR = '5952'
                         AND ROWNUM < H.ID_ROW)

             LOOP

              IF T.ROWNUM = 0 THEN
                v_contador1 := v_contador1 + 1;
                variacao    := 1;
                --CONTROLA QUANTIDADE

              ELSIF T.ROWNUM = 1 THEN
                qtd_mod      := 0;
                qtd_mod_base := 500;
                variacao     := variacao + 1;
                v_contador1  := v_contador1 + 500;

              ELSIF t.ROWNUM = 2 THEN
                qtd_mod      := 501;
                qtd_mod_base := 1000;
                variacao     := variacao + 1;
                v_contador1  := v_contador1 + 500;

              ELSIF t.ROWNUM > 2 THEN
                qtd_mod      := qtd_mod + 500;
                qtd_mod_base := qtd_mod_base + 500;
                variacao     := variacao + 1;
              END IF;

              --ENTIDADES DARF
              Script_DARF_executar_Entid := ' INSERT INTO LKM_SAIDA_GPS_DARF_ITEM5_E                               ' ||
                                            '   WITH a as (         ' ||
                                            ' SELECT   DISTINCT            ' ||
                                            '  ROW_NUMBER() OVER(ORDER BY ZUONR ASC) AS ID_T,                                                    ' || '''' ||
                                            variacao || '''' ||
                                            ' ITEM,                            ' ||
                                            ' ''ENTIDADES'' MULTA,                                                        ' ||
                                            'LOCAL_NEGO LOCALNEGOCIO,                                                     ' ||
                                            'TRIM(TO_CHAR(sum(ENTIDADES),''000000000099'')) VALOR,                        ' ||
                                            ' ''I;ENTIDADES;'' || LOCAL_NEGO || '';'' || TRIM(TO_CHAR(sum(ENTIDADES),''000000000099'')) || '';'' LINHA,' ||
                                            'LIFNR COD_FIS_JUR,                                                           ' ||
                                            ' ''999999995'' NUM_DOC_FIS,                                                          ' ||
                                            'BURKS EMPRESA,                                                               ' ||
                                            'to_char(LAST_DAY(BLDAT),''DDMMYYYY'') DATADOC,                               ' ||
                                            ' ''6'' ORDEM,                                                                ' ||
                                            ' XBLNR CODIGORECEITA,                                                         ' ||
                                            ' CKEY FORNEC                                                         ' ||
                                            'FROM VW_LKM_DARF_A                                                           ' ||
                                            'WHERE COD_EMPRESA = ' || '''' ||
                                            PS_EMPRESA || '''' ||
                                            '                      ' ||
                                            'AND XBLNR = ''5952''  ' ||
                                            'AND DATA_FISCAL BETWEEN   ' || '''' ||
                                            PS_DATA_INICIAL || '''' ||
                                            '           ' ||
                                            'AND                 ' || '''' ||
                                            PS_DATA_FINAL ||
                                            '''                                                    ' ||
                                            'group by ROWNUM,                                      ' ||
                                            ' ''I'',                                               ' ||
                                            ' ''ENTIDADES'' ,                                      ' ||
                                            'LOCAL_NEGO,                                           ' ||
                                            ' ''I;ENTIDADES;''|| LOCAL_NEGO || '';'' || '';'' ,    ' ||
                                            'LIFNR ,                                               ' ||
                                            ' ''3'',                                               ' ||
                                            'BURKS,                                                ' ||
                                            'to_char(LAST_DAY(BLDAT),''DDMMYYYY''),                ' ||
                                            ' ''4'',                                               ' ||
                                            'XBLNR,                                                ' ||
                                            ' CKEY,                                                ' ||
                                            'ZUONR                                                 ' ||
                                           --' ORDER BY ZUONR                                      ' ||
                                            ' )    select       ITEM,                              ' ||
                                            '                   MULTA,                             ' ||
                                            '                   LOCALNEGOCIO,                      ' ||
                                            '                   VALOR,                             ' ||
                                            '                   LINHA,                             ' ||
                                            '                   COD_FIS_JUR,                       ' ||
                                            '                   NUM_DOC_FIS,                       ' ||
                                            '                   EMPRESA,                           ' ||
                                            '                   DATADOC,                           ' ||
                                            '                   ORDEM,                             ' ||
                                            '                   CODIGORECEITA,                     ' ||
                                            '                   '''' FORNEC                             ' ||
                                            '                from a                                ' ||
                                            '  Where ID_T >= ' || '''' ||
                                            qtd_mod || '''' ||
                                            '  AND ID_T <=' || '''' ||
                                            qtd_mod_base || '''' ||
                                            ' group by          ITEM,                           ' ||
                                            '                   MULTA,                          ' ||
                                            '                   LOCALNEGOCIO,                   ' ||
                                            '                   VALOR,                          ' ||
                                            '                   LINHA,                          ' ||
                                            '                   COD_FIS_JUR,                    ' ||
                                            '                   NUM_DOC_FIS,                    ' ||
                                            '                   EMPRESA,                        ' ||
                                            '                   DATADOC,                        ' ||
                                            '                   ORDEM,                          ' ||
                                            '                   CODIGORECEITA,                  ' ||
                                            '                   FORNEC                          ' || '';
              commit;

              BEGIN
                --######### I N S E R T - O. E N T I D A D E S #
                dbms_output.put_line(Script_DARF_executar_Entid);
                EXECUTE IMMEDIATE (Script_DARF_executar_Entid);
              END;

            END LOOP;
          END LOOP;

        ELSE

          --ENTIDADES DARF
          Script_DARF_executar_Entid := ' INSERT INTO LKM_SAIDA_GPS_DARF_ITEM5_E  SELECT   DISTINCT                   ' ||
                                        ' ''I'' ITEM,                                                                 ' ||
                                        ' ''ENTIDADES'' MULTA,                                                        ' ||
                                        'LOCAL_NEGO LOCALNEGOCIO,                                                     ' ||
                                        'TRIM(TO_CHAR(sum(ENTIDADES),''000000000099'')) VALOR,                        ' ||
                                        ' ''I;ENTIDADES;'' || LOCAL_NEGO || '';'' || TRIM(TO_CHAR(sum(ENTIDADES),''000000000099'')) || '';'' LINHA,' ||
                                        'LIFNR COD_FIS_JUR,                                                           ' ||
                                        ' ''999999995'' NUM_DOC_FIS,                                                          ' ||
                                        'BURKS EMPRESA,                                                               ' ||
                                        'to_char(LAST_DAY(BLDAT),''DDMMYYYY'') DATADOC,                               ' ||
                                        ' ''6'' ORDEM,                                                                ' ||
                                        ' XBLNR CODIGORECEITA,                                                         ' ||
                                        ' '''' FORNEC                                                          ' ||
                                        'FROM VW_LKM_DARF_A                                                           ' ||
                                        'WHERE COD_EMPRESA = ' || '''' ||
                                        PS_EMPRESA || '''' ||
                                        '                      ' ||
                                        'AND XBLNR != ''5952''  ' ||
                                        'AND DATA_FISCAL BETWEEN   ' || '''' ||
                                        PS_DATA_INICIAL || '''' ||
                                        '           ' ||
                                        'AND                 ' || '''' ||
                                        PS_DATA_FINAL ||
                                        '''                         ' ||
                                        'group by  ''I'',                                                             ' ||
                                        ' ''ENTIDADES'' ,                                                    ' ||
                                        'LOCAL_NEGO,                                                         ' ||
                                        ' ''I;ENTIDADES;''|| LOCAL_NEGO || '';'' || '';'' ,                  ' ||
                                        'LIFNR ,                                                             ' ||
                                        ' ''3'',                                                             ' ||
                                        'BURKS,                                                              ' ||
                                        'to_char(LAST_DAY(BLDAT),''DDMMYYYY''),                              ' ||
                                        ' ''4'',                                                             ' ||
                                        ' XBLNR,                                                             ' ||
                                        ' ''''                                                              ' || '';

          commit;

          BEGIN
            --######### I N S E R T - O. E N T I D A D E S #
            --   dbms_output.put_line(Script_DARF_executar_Entid);
            EXECUTE IMMEDIATE (Script_DARF_executar_Entid);
          END;
        END IF;

        -- V_data_ini_A := null;
        -- V_data_fim_A := null;

      END IF;
    END LOOP;
  END LKM_INSERT_DARF;

  PROCEDURE LKM_INSERT_DAM(PS_EMPRESA      VARCHAR2,
                          PS_ESTAB        VARCHAR2,
                          P_FINALIDADE  VARCHAR2,
                          PS_DATA_INICIAL DATE,
                          PS_DATA_FINAL   DATE) IS

    Script_DAM_executar_capa0 varchar(32000);
    Script_DAM_executar_Item1 varchar(32000);
    Script_DAM_executar_Item2 varchar(32000);
    Script_DAM_executar_Juros varchar(32000);
    Script_DAM_executar_Multa varchar(32000);
    Script_DAM_executar_Entid varchar(32000);
    V_NOME_TABELA  VARCHAR(255);

    --  V_Data_ini_B varchar(255);
    --  V_Data_fim_B varchar(255);

  BEGIN


  IF P_FINALIDADE  = '5' THEN

  V_NOME_TABELA  := 'VW_LKM_DAM_PAGTO';

  ELSIF  P_FINALIDADE  = '2' THEN

  V_NOME_TABELA  := 'VW_LKM_DAM';

  END IF;


    FOR MINST2 IN (SELECT DISTINCT BKTXT
                     FROM VW_LKM_DAM
                    WHERE COD_EMPRESA = PS_EMPRESA
                      AND BLDAT BETWEEN PS_DATA_INICIAL AND PS_DATA_FINAL) LOOP

      IF MINST2.BKTXT = 'DAM' THEN

        EXECUTE IMMEDIATE ' ALTER SESSION SET NLS_DATE_FORMAT = ''DD/MM/YYYY''      ';

        -- V_data_ini_B := to_date(PS_DATA_INICIAL ,'DD/MM/YYYY');
        -- V_data_fim_B := to_date(PS_DATA_FINAL ,'DD/MM/YYYY');

        -->> GERACAO DAM <<--

        Script_DAM_executar_capa0 := 'INSERT INTO LKM_SAIDA_GPS_DARF_CAPA SELECT DISTINCT             ' ||
                                     ' TO_CHAR(''H'') CABECALHO,                                      ' ||
                                     'BUDAT DATALANC,                                                 ' ||
                                     'GJARH EXERCICIO,                                                ' ||
                                     'MONAT PERIODO,                                                  ' ||
                                     '''H;'' || BURKS || '';'' || BLDAT || '' ;'' || BUDAT || '';'' || ' ||
                                     'GJARH || '';'' || MONAT || '';'' || ''DAM;'' AS LINHA,          ' ||
                                     'LIFNR COD_FIS_JUR,                                              ' ||
                                     'ZUONR NUM_DOC_FIS,                                              ' ||
                                     'BURKS EMPRESA,                                                  ' ||
                                     'BLDAT DATADOC,                                                  ' ||
                                     '''1'' ORDEM,                                                    ' ||
                                     ' XBLNR CODIGORECEITA,                                             ' ||
                                     ' substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                             ' ||
                                     ' '''' FORNEC                             ' ||
                                     'FROM ' || V_NOME_TABELA ||'                                                 ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = ' || '''' || PS_ESTAB || '''' || '' ||
                                     ' AND DATA_FISCAL  BETWEEN  ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND' || '''' || PS_DATA_FINAL || '''' || '';

        BEGIN
          --    ######### I N S E R T - C A P A  #############
          dbms_output.put_line(Script_DAM_executar_capa0);
          EXECUTE IMMEDIATE (Script_DAM_executar_capa0);
        END;

        -- CAPA DAM
        Script_DAM_executar_Item1 := 'INSERT INTO LKM_SAIDA_GPS_DARF_ITEM1  SELECT                          ' ||
                                     ' ''I'' ITEM,                                                          ' ||
                                     ' LIFNR FORNECEDOR,                                                    ' ||
                                     ' COD_ESTAB LOCALNEGOCIO,                                             ' ||
                                     ' TRIM(TO_CHAR(SUM(VL_TRIB),''000000000099'')) VLRTRIB,                ' ||
                                     ' ''I;'' || LIFNR || '';'' ||  COD_ESTAB || '';'' || TRIM(TO_CHAR(SUM(VL_BRUTO),''000000000099'')) || '';'' AS LINHA,' ||
                                     ' LIFNR COD_FIS_JUR,                                                   ' ||
                                     ' ZUONR NUM_DOC_FIS,                                                   ' --ZUONR
                                     ||
                                     ' BURKS EMPRESA,                                                       ' ||
                                     ' BLDAT DATADOC,                                                       ' ||
                                     ' ''2'' ORDEM,                                                         ' ||
                                     ' XBLNR CODIGORECEITA,                                                  ' ||
                                     ' '''' FORNEC                             ' ||
                                     'FROM ' || V_NOME_TABELA ||'                                                     ' ||
                                     '  WHERE COD_EMPRESA =  ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = ' || '''' || PS_ESTAB || '''' || '' ||
                                     'AND DATA_FISCAL BETWEEN      ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     'AND ' || '''' || PS_DATA_FINAL || '''' ||
                                     'GROUP BY                                                              ' ||
                                     '''I'',                                                                ' ||
                                     ' LIFNR,                                                               ' ||
                                     ' COD_ESTAB,                                                          ' ||
                                     ' ''I;'' || LIFNR || '';'' || COD_ESTAB || '';'' ,                     ' ||
                                     ' LIFNR,                                                               ' ||
                                     ' ZUONR,                                                               ' || --ZUONR
                                     ' BURKS,                                                               ' ||
                                     ' BLDAT,                                                               ' ||
                                     ' ''2'',                                                               ' ||
                                     ' '''' ,                                                               ' ||
                                     ' XBLNR                                                                ' || '';

        BEGIN
          --######### I N S E R T - I T E M 1 ############
          dbms_output.put_line(Script_DAM_executar_Item1);
          EXECUTE IMMEDIATE (Script_DAM_executar_Item1);
        END;

        --ITEN2 DAM
        Script_DAM_executar_Item2 := ' INSERT INTO LKM_SAIDA_GPS_DARF_ITEM2 SELECT                       ' ||
                                     ' ''I'' ITEM,                                                       ' ||
                                     'XBLNR CONTALOCALIZADAPELOCODIGO,                                   ' ||
                                     'COD_ESTAB LOCALNEGOCIO,                                           ' ||
                                     'VL_TRIB VALOR,                                                     ' ||
                                     ' ''NF'' || ZUONR NOTAFISCAL,                                       ' ||
                                     ' ''I;'' || XBLNR || '';'' ||  COD_ESTAB || '';'' || VL_TRIB ||     ' ||
                                     ' '';'' || ZUONR || '';'' AS LINHA,                               ' ||
                                     'LIFNR COD_FIS_JUR,                                                 ' ||
                                     'ZUONR NUM_DOC_FIS,                                                 ' ||
                                     'BURKS EMPRESA,                                                     ' ||
                                     'BLDAT DATADOC,                                                     ' ||
                                     ' ''3'' ORDEM,                                                      ' ||
                                     ' XBLNR CODIGORECEITA,                                              ' ||
                                     ' '''' FORNEC                             ' ||
                                     'FROM ' || V_NOME_TABELA ||'                                                    ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = ' || '''' || PS_ESTAB || '''' || '' ||
                                     'AND DATA_FISCAL BETWEEN   ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     'AND  ' || '''' || PS_DATA_FINAL || '''' || '';

        BEGIN
          --######### I N S E R T - I T E M 2 ############
          dbms_output.put_line(Script_DAM_executar_Item2);
          EXECUTE IMMEDIATE (Script_DAM_executar_Item2);
        END;

        --MULTA DAM
        Script_DAM_executar_Multa := ' INSERT INTO LKM_SAIDA_GPS_DARF_ITEM3_M SELECT                        ' ||
                                     ' ''I'' ITEM,                                                          ' ||
                                     ' ''MULTA'' MULTA,                                                     ' ||
                                     'COD_ESTAB LOCALNEGOCIO,                                              ' ||
                                     'TRIM(TO_CHAR(SUM(MULTA),''000000000099'')) VALOR,                     ' ||
                                     ' ''I;MULTA;'' ||  COD_ESTAB || '';'' || TRIM(TO_CHAR(SUM(MULTA),''000000000099'')) || '';'' LINHA,' ||
                                     'LIFNR COD_FIS_JUR,                                                    ' ||
                                     'ZUONR NUM_DOC_FIS,                                                    ' ||
                                     'BURKS EMPRESA,                                                        ' ||
                                     'BLDAT DATADOC,                                                        ' ||
                                     ' ''4'' ORDEM,                                                         ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' '''' FORNEC                             ' ||
                                     'FROM ' || V_NOME_TABELA ||'                                                       ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = ' || '''' || PS_ESTAB || '''' || '' ||
                                     'AND DATA_FISCAL BETWEEN   ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     'AND                 ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'GROUP BY                                                              ' ||
                                     '''I'',                                                                ' ||
                                     ' ''MULTA'',                                                           ' ||
                                     ' COD_ESTAB,                                                          ' ||
                                     ' ''I;MULTA;''|| '';'' ||COD_ESTAB || '';'' ,                         ' ||
                                     ' LIFNR,                                                               ' ||
                                     ' ZUONR,                                                               ' || --ZUONR
                                     ' BURKS,                                                               ' ||
                                     ' BLDAT,                                                               ' ||
                                     ' ''4'',                                                               ' ||
                                     ' XBLNR ,                             ' ||
                                     ' ''''                                                                ' || '';

        BEGIN
          --######### I N S E R T - M U L T A ############
          dbms_output.put_line(Script_DAM_executar_Multa);
          EXECUTE IMMEDIATE (Script_DAM_executar_Multa);
        END;

        --JUROS DAM
        Script_DAM_executar_Juros := ' INSERT INTO LKM_SAIDA_GPS_DARF_ITEM4_J  SELECT                       ' ||
                                     '  ''I'' ITEM,                                                         ' ||
                                     '  ''JUROS'' MULTA,                                                    ' ||
                                     ' COD_ESTAB LOCALNEGOCIO,                                             ' ||
                                     ' TRIM(TO_CHAR(SUM(JUROS),''000000000099'')) VALOR,                    ' ||
                                     '  ''I;JUROS;'' || COD_ESTAB || '';'' || TRIM(TO_CHAR(SUM(JUROS),''000000000099'')) || '';'' LINHA,' ||
                                     ' LIFNR COD_FIS_JUR,                                                   ' ||
                                     ' ZUONR ,                                                              ' ||
                                     ' BURKS EMPRESA,                                                       ' ||
                                     ' BLDAT DATADOC,                                                       ' ||
                                     '  ''5'' ORDEM,                                                        ' ||
                                     ' XBLNR CODIGORECEITA,                                                  ' ||
                                     ' '''' FORNEC                             ' ||
                                     'FROM ' || V_NOME_TABELA ||'                                                       ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = ' || '''' || PS_ESTAB || '''' || '' ||
                                     'AND DATA_FISCAL BETWEEN   ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     'AND  ' || '''' || PS_DATA_FINAL || '''' ||
                                     'GROUP BY                                                              ' ||
                                     '''I'',                                                                ' ||
                                     ' ''JUROS'',                                                           ' ||
                                     ' COD_ESTAB,                                                          ' ||
                                     '  ''I;JUROS;''|| '';'' || COD_ESTAB || '';'' ,                        ' ||
                                     ' LIFNR,                                                               ' ||
                                     ' ZUONR,                                                               ' || --ZUONR
                                     ' BURKS,                                                               ' ||
                                     ' BLDAT,                                                               ' ||
                                     ' ''5'',                                                               ' ||
                                     ' xblnr ,                             ' ||
                                     ' ''''                                                                ' || '';

        BEGIN
          --######### I N S E R T - J U R O S  ###########
          dbms_output.put_line(Script_DAM_executar_Juros);
          EXECUTE IMMEDIATE (Script_DAM_executar_Juros);
        END;

        --ENTIDADES DAM
        Script_DAM_executar_Entid := ' INSERT INTO LKM_SAIDA_GPS_DARF_ITEM5_E  SELECT                      ' ||
                                     ' ''I'' ITEM,                                                         ' ||
                                     ' ''ENTIDADES'' MULTA,                                                ' ||
                                     'COD_ESTAB LOCALNEGOCIO,                                             ' ||
                                     'TRIM(TO_CHAR(SUM(ENTIDADES),''000000000099'')) VALOR,                ' ||
                                     ' ''I;ENTIDADES;'' ||  COD_ESTAB || '';'' || TRIM(TO_CHAR(SUM(ENTIDADES),''000000000099''))|| '';'' LINHA,' ||
                                     'LIFNR COD_FIS_JUR,                                                    ' ||
                                     'ZUONR NUM_DOC_FIS,                                                    ' ||
                                     'BURKS EMPRESA,                                                        ' ||
                                     'BLDAT DATADOC,                                                        ' ||
                                     ' ''6'' ORDEM,                                                         ' ||
                                     ' XBLNR CODIGORECEITA,                                                  ' ||
                                     ' '''' FORNEC                             ' ||
                                     'FROM ' || V_NOME_TABELA ||'                                                       ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = ' || '''' || PS_ESTAB || '''' || '' ||
                                     'AND DATA_FISCAL BETWEEN   ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     'AND ' || '''' || PS_DATA_FINAL || '''' ||
                                     'GROUP BY                                                              ' ||
                                     '''I'',                                                                ' ||
                                     ' ''ENTIDADES'',                                                       ' ||
                                     ' COD_ESTAB,                                                          ' ||
                                     '  ''I;ENTIDADES;''|| '';'' ||COD_ESTAB || '';'' ,                    ' ||
                                     ' LIFNR,                                                               ' ||
                                     ' ZUONR,                                                               ' || --ZUONR
                                     ' BURKS,                                                               ' ||
                                     ' BLDAT,                                                               ' ||
                                     ' ''6'',                                                               ' ||
                                     ' XBLNR ,                             ' ||
                                     ' ''''                                                                ' || '';

        BEGIN
          --######### I N S E R T - O. E N T I D A D E S #
          dbms_output.put_line(Script_DAM_executar_Entid);
          EXECUTE IMMEDIATE (Script_DAM_executar_Entid);
        END;

      END IF;
    END LOOP;
  END LKM_INSERT_DAM;
  --Aguardando teste e retirar documento fixo
  PROCEDURE LKM_INSERT_GPS(PS_EMPRESA      VARCHAR2,
                          PS_ESTAB        VARCHAR2,
                          P_LIMINAR       VARCHAR2,
                          PS_DATA_INICIAL DATE,
                          PS_DATA_FINAL   DATE) IS

    Script_GPS_executar_capa0 varchar(32000);
    Script_GPS_executar_Item1 varchar(32000);
    Script_GPS_executar_Item2 varchar(32000);
    Script_GPS_executar_Juros varchar(32000);
    Script_GPS_executar_Multa varchar(32000);
    Script_GPS_executar_Entid varchar(32000);
    V_NOME_TABELA  VARCHAR(255) := '' ;

    --  V_Data_ini_A varchar(255);
    --  V_Data_fim_A varchar(255);

  BEGIN
    FOR MINST1 IN (SELECT DISTINCT BKTXT
                     FROM VW_LKM_GPS
                    WHERE COD_EMPRESA = PS_EMPRESA
                      AND BLDAT BETWEEN PS_DATA_INICIAL AND PS_DATA_FINAL) LOOP
      IF MINST1.BKTXT = 'GPS' THEN

        EXECUTE IMMEDIATE ' ALTER SESSION SET NLS_DATE_FORMAT = ''DD/MM/YYYY''      ';


    IF P_LIMINAR = ('S') THEN
      V_NOME_TABELA := 'VW_LKM_GPS_PATRONAL';
    ELSE
      V_NOME_TABELA := 'VW_LKM_GPS';
    END IF;

        -- teste   dbms_output.put_line(V_data_ini_A || '-' || PS_DATA_FINAL);

        -->> GERACAO GPS <<--

        ------------------------------------------------------------GPS PJ 2100--------------------------------------------------
        Script_GPS_executar_capa0 := 'INSERT INTO LKM_SAIDA_GPS_DARF_CAPA SELECT DISTINCT               ' ||
                                     ' TO_CHAR(''H'') CABECALHO,                                        ' ||
                                     'BUDAT DATALANC,                                                   ' ||
                                     'GJARH EXERCICIO,                                                  ' ||
                                     'MONAT PERIODO,                                                    ' ||
                                     '''H;'' || BURKS || '';'' || to_char(LAST_DAY(BLDAT), ''DDMMYYYY'') || '';'' || to_char(sysdate, ''DDMMYYYY'') || '';'' ||   ' ||
                                     'GJARH || '';'' || MONAT || '';'' || XBLNR || '';'' AS LINHA,      ' ||
                                     'LIFNR COD_FIS_JUR,                                                ' ||
                                     '''0'' NUM_DOC_FIS,                                                ' ||
                                     'BURKS EMPRESA,                                                    ' ||
                                     'to_char(LAST_DAY(BLDAT), ''DDMMYYYY'') DATADOC,                   ' ||
                                    -- ''''' DATADOC,                   ' ||
                                     '''1'' ORDEM,                                                      ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                             ' ||
                                     ' ''0'' FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND ' || '''' || PS_DATA_FINAL || '''' ||
                                     'AND XBLNR = ''2100''' ||
                                    --------------------------------------------------------------------GPS PF 2658 ---------------------------------------------
                                     ' UNION ALL                                                        ' ||
                                     'SELECT DISTINCT                                                   ' ||
                                     ' TO_CHAR(''H'') CABECALHO,                                        ' ||
                                     'BUDAT DATALANC,                                                   ' ||
                                     'GJARH EXERCICIO,                                                  ' ||
                                     'MONAT PERIODO,                                                    ' ||
                                     '''H;'' || BURKS || '';'' || BLDAT || '';'' || BUDAT || '';'' ||   ' ||
                                     'GJARH || '';'' || MONAT || '';'' || XBLNR || '';'' ||substr(LOCAL_NEGO,5,19)||'';'' AS LINHA,' ||
                                     'LIFNR COD_FIS_JUR,                                                ' ||
                                     'ZUONR NUM_DOC_FIS,                                                ' ||
                                     'BURKS EMPRESA,                                                    ' ||
                                     'BLDAT DATADOC,                                                    ' ||
                                     '''1'' ORDEM,                                                      ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                                 ' ||
                                     ' FORNEC FORNEC                             ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND XBLNR NOT IN (''2100'',''2631'')' ||
                                     'AND LENGTH(TRIM(local_nego)) > 4' ||
                                    -------------------------------------------------------GPS 2631
                                     ' UNION ALL                                                        ' ||
                                     'SELECT DISTINCT                                                   ' ||
                                     ' TO_CHAR(''H'') CABECALHO,                                        ' ||
                                     'BUDAT DATALANC,                                                   ' ||
                                     'GJARH EXERCICIO,                                                  ' ||
                                     'MONAT PERIODO,                                                    ' ||
                                     '''H;'' || BURKS || '';'' || BLDAT || '';'' || BUDAT || '';'' ||   ' ||
                                     'GJARH || '';'' || MONAT || '';'' || XBLNR || '';'' ||substr(LOCAL_NEGO,5,19)|| '';''  AS LINHA,' ||
                                     'LIFNR COD_FIS_JUR,                                                ' ||
                                     'ZUONR NUM_DOC_FIS,                                                ' ||
                                     'BURKS EMPRESA,                                                    ' ||
                                     'BLDAT DATADOC,                                                    ' ||
                                     '''1'' ORDEM,                                                      ' ||
                                     ' XBLNR CODIGORECEITA,                                             ' ||
                                     ' substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                             ' ||
                                     ' FORNEC FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND XBLNR NOT IN (''2100'',''2658'')' || '';

        BEGIN
          --    ######### I N S E R T - C A P A  #############
          dbms_output.put_line(Script_GPS_executar_capa0);
          EXECUTE IMMEDIATE (Script_GPS_executar_capa0);
        END;

        -- CAPA GPS
        -------------------------------------------------------GPS PJ 2100 ---------------------------------------------------------
        Script_GPS_executar_Item1 := 'INSERT INTO LKM_SAIDA_GPS_DARF_ITEM1  SELECT                          ' ||
                                     ' ''I'' ITEM,                                                          ' ||
                                     ' LIFNR FORNECEDOR,                                                    ' ||
                                     ' substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                 ' ||
                                     ' TRIM(TO_CHAR(SUM(VL_TRIB),''000000000099'')) VLRTRIB,                ' ||
                                     ' ''I;'' || LIFNR || '';'' || substr(LOCAL_NEGO,1,4) || '';'' || TRIM(TO_CHAR(SUM(VL_TRIB),''000000000099'')) || '';'' AS LINHA,' ||
                                     ' LIFNR COD_FIS_JUR,                                                   ' ||
                                     ' ''0'' NUM_DOC_FIS,                                                   ' || --ZUONR
                                     ' BURKS EMPRESA,                                                       ' ||
                                     ' to_char(LAST_DAY(BLDAT), ''DDMMYYYY'') DATADOC,                                                       ' ||
                                     ' ''2'' ORDEM,                                                         ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' '''' FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND XBLNR = ''2100''' ||
                                     'GROUP BY                                                              ' ||
                                     '''I'',                                                                ' ||
                                     ' LIFNR,                                                               ' ||
                                     ' LOCAL_NEGO,                                                          ' ||
                                     ' ''I;'' || LIFNR || '';'' ||LOCAL_NEGO || '';'' ,                     ' ||
                                     ' LIFNR,                                                               ' ||
                                     ' ''0'',                                                               ' || --ZUONR
                                     ' BURKS,                                                               ' ||
                                     ' to_char(LAST_DAY(BLDAT), ''DDMMYYYY''),                                                               ' ||
                                     ' ''2'',                                                               ' ||
                                     ' XBLNR,                                                               ' ||
                                     ' ''''                                                                 ' ||
                                    ---------------------------------------------------------------GPS 2658 -----------------------------------------------------
                                     ' UNION ALL                                                            ' ||
                                     '  SELECT                                                              ' ||
                                     ' ''I'' ITEM,                                                          ' ||
                                     ' LIFNR FORNECEDOR,                                                    ' ||
                                     ' substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                             ' ||
                                     ' TRIM(TO_CHAR(SUM(VL_TRIB),''000000000099'')) VLRTRIB,                ' ||
                                     ' ''I;'' || LIFNR || '';'' || substr(LOCAL_NEGO,1,4) || '';'' || TRIM(TO_CHAR(SUM(VL_TRIB),''000000000099'')) || '';'' AS LINHA,' ||
                                     ' LIFNR COD_FIS_JUR,                                                   ' ||
                                     ' ZUONR NUM_DOC_FIS,                                                   ' || --ZUONR
                                     ' BURKS EMPRESA,                                                       ' ||
                                     ' BLDAT DATADOC,                                                       ' ||
                                     ' ''2'' ORDEM,                                                         ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' FORNEC FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND XBLNR not in (''2100'',''2631'')' ||
                                     'AND LENGTH(TRIM(local_nego)) > ''4'' ' ||
                                     'GROUP BY                                                              ' ||
                                     '''I'',                                                                ' ||
                                     ' LIFNR,                                                               ' ||
                                     ' LOCAL_NEGO,                                                          ' ||
                                     ' ''I;'' || LIFNR || '';'' ||LOCAL_NEGO || '';'' ,                     ' ||
                                     ' LIFNR,                                                               ' ||
                                     ' ZUONR,                                                               ' || --ZUONR
                                     ' BURKS,                                                               ' ||
                                     ' BLDAT,                                                               ' ||
                                     ' ''2'',                                                               ' ||
                                     ' XBLNR,                                                               ' ||
                                     ' FORNEC                                                                ' ||
                                    -------------------------------------------------------------------- 2631
                                     ' UNION ALL                                                            ' ||
                                     '  SELECT                                                              ' ||
                                     ' ''I'' ITEM,                                                          ' ||
                                     ' LIFNR FORNECEDOR,                                                    ' ||
                                     ' substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                             ' ||
                                     ' TRIM(TO_CHAR(SUM(VL_TRIB),''000000000099'')) VLRTRIB,                ' ||
                                     ' ''I;'' || LIFNR || '';'' || substr(LOCAL_NEGO,1,4) || '';'' || TRIM(TO_CHAR(SUM(VL_TRIB),''000000000099'')) || '';'' AS LINHA,' ||
                                     ' LIFNR COD_FIS_JUR,                                                   ' ||
                                     ' ZUONR NUM_DOC_FIS,                                                   ' || --ZUONR
                                     ' BURKS EMPRESA,                                                       ' ||
                                     ' BLDAT DATADOC,                                                       ' ||
                                     ' ''2'' ORDEM,                                                         ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' FORNEC FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND XBLNR not in (''2100'',''2658'')' ||
                                     'GROUP BY                                                              ' ||
                                     '''I'',                                                                ' ||
                                     ' LIFNR,                                                               ' ||
                                     ' LOCAL_NEGO,                                                          ' ||
                                     ' ''I;'' || LIFNR || '';'' ||LOCAL_NEGO || '';'' ,                     ' ||
                                     ' LIFNR,                                                               ' ||
                                     ' ZUONR,                                                               ' || --ZUONR
                                     ' BURKS,                                                               ' ||
                                     ' BLDAT,                                                               ' ||
                                     ' ''2'',                                                               ' ||
                                     ' XBLNR,                                                               ' ||
                                     ' FORNEC                                                                ' || '';
        BEGIN
          --######### I N S E R T - I T E M 1 ############
          dbms_output.put_line(Script_GPS_executar_Item1);
          EXECUTE IMMEDIATE (Script_GPS_executar_Item1);
        END;

        --ITEN2 GPS
        Script_GPS_executar_Item2 := ' INSERT INTO LKM_SAIDA_GPS_DARF_ITEM2 SELECT   ' ||
                                     ' ''I'' ITEM,                                                       ' ||
                                     'XBLNR CONTALOCALIZADAPELOCODIGO,                                   ' ||
                                     'substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                           ' ||
                                     'VL_TRIB VALOR,                                                     ' ||
                                     ' ''NF'' || ZUONR NOTAFISCAL,                                       ' ||
                                     ' ''I;'' || XBLNR || '';'' || substr(LOCAL_NEGO,1,4) || '';'' || VL_TRIB ||     ' ||
                                     ' '';'' || ZUONR || '';'' AS LINHA,                               ' ||
                                     'LIFNR COD_FIS_JUR,                                                 ' ||
                                     'ZUONR NUM_DOC_FIS,                                                 ' ||
                                     'BURKS EMPRESA,                                                     ' ||
                                     'BLDAT DATADOC,                                                     ' ||
                                     ' ''3'' ORDEM,                                                      ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' FORNEC FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND XBLNR = ''2100''' ||
                                    -------------------------------------------- 2658
                                     ' UNION ALL                                                            ' ||
                                     '  SELECT                                                              ' ||
                                     ' ''I'' ITEM,                                                       ' ||
                                     'XBLNR CONTALOCALIZADAPELOCODIGO,                                   ' ||
                                     'substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                           ' ||
                                     'VL_TRIB VALOR,                                                     ' ||
                                     ' ''NF'' || ZUONR NOTAFISCAL,                                       ' ||
                                     ' ''I;'' || XBLNR || '';'' || substr(LOCAL_NEGO,1,4) || '';'' || VL_TRIB ||     ' ||
                                     ' '';'' || ZUONR || '';'' AS LINHA,                               ' ||
                                     'LIFNR COD_FIS_JUR,                                                 ' ||
                                     'ZUONR NUM_DOC_FIS,                                                 ' ||
                                     'BURKS EMPRESA,                                                     ' ||
                                     'BLDAT DATADOC,                                                     ' ||
                                     ' ''3'' ORDEM,                                                      ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' FORNEC FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND LENGTH(TRIM(local_nego)) > ''4'' ' ||
                                     'AND XBLNR NOT IN (''2100'',''2631'')' ||
                                    -------------------------------------------- 2631
                                     ' UNION ALL                                                            ' ||
                                     '  SELECT                                                              ' ||
                                     ' ''I'' ITEM,                                                       ' ||
                                     'XBLNR CONTALOCALIZADAPELOCODIGO,                                   ' ||
                                     'substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                           ' ||
                                     'VL_TRIB VALOR,                                                     ' ||
                                     ' ''NF'' || ZUONR NOTAFISCAL,                                       ' ||
                                     ' ''I;'' || XBLNR || '';'' || substr(LOCAL_NEGO,1,4) || '';'' || VL_TRIB ||     ' ||
                                     ' '';'' || ZUONR || '';'' AS LINHA,                               ' ||
                                     'LIFNR COD_FIS_JUR,                                                 ' ||
                                     'ZUONR NUM_DOC_FIS,                                                 ' ||
                                     'BURKS EMPRESA,                                                     ' ||
                                     'BLDAT DATADOC,                                                     ' ||
                                     ' ''3'' ORDEM,                                                      ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' FORNEC FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND XBLNR NOT IN (''2100'',''2658'')' || '';
        BEGIN
          --######### I N S E R T - I T E M 2 ############
          dbms_output.put_line(Script_GPS_executar_Item2);
          EXECUTE IMMEDIATE (Script_GPS_executar_Item2);
        END;

        --MULTA GPS
        ----------------------------------------------------------GPS PJ 2100 ------------------------------------------
        Script_GPS_executar_Multa := ' INSERT INTO LKM_SAIDA_GPS_DARF_ITEM3_M SELECT                        ' ||
                                     ' ''I'' ITEM,                                                          ' ||
                                     ' ''MULTA'' MULTA,                                                     ' ||
                                     'substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                              ' ||
                                     'TRIM(TO_CHAR(SUM(MULTA),''000000000099'')) VALOR,                     ' ||
                                     ' ''I;MULTA;'' || substr(LOCAL_NEGO,1,4) || '';'' || TRIM(TO_CHAR(SUM(MULTA),''000000000099'')) || '';'' LINHA,' ||
                                     'LIFNR COD_FIS_JUR,                                                    ' ||
                                     '''999999994''   NUM_DOC_FIS,                                                  ' ||
                                     'BURKS EMPRESA,                                                        ' ||
                                     'to_char(LAST_DAY(BLDAT), ''DDMMYYYY'') DATADOC,                                                        ' ||
                                     ' ''4'' ORDEM,                                                         ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' '''' FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND XBLNR = ''2100''' ||
                                     'GROUP BY                                                              ' ||
                                     '''I'',                                                                ' ||
                                     ' ''MULTA'',                                                           ' ||
                                     ' LOCAL_NEGO,                                                          ' ||
                                     ' ''I;MULTA;'' || substr(LOCAL_NEGO,1,4) || '';'' ,                                ' ||
                                     ' LIFNR,                                                               ' ||
                                     ' ''0'',                                                               ' || --ZUONR
                                     ' BURKS,                                                               ' ||
                                     ' BLDAT,                                                               ' ||
                                     ' ''4'',                                                               ' ||
                                     ' XBLNR ,                                                 ' ||
                                     ' FORNEC                                                                ' ||
                                    --------------------------------------------------------------------GPS PF 2658 ---------------------------------------------------------
                                     'UNION ALL                                                             ' ||
                                     ' SELECT                                                               ' ||
                                     ' ''I'' ITEM,                                                          ' ||
                                     ' ''MULTA'' MULTA,                                                     ' ||
                                     'substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                              ' ||
                                     'TRIM(TO_CHAR(SUM(MULTA),''000000000099'')) VALOR,                     ' ||
                                     ' ''I;MULTA;'' || substr(LOCAL_NEGO,1,4) || '';'' || TRIM(TO_CHAR(SUM(MULTA),''000000000099'')) || '';'' LINHA,' ||
                                     'LIFNR COD_FIS_JUR,                                                    ' ||
                                     'ZUONR   NUM_DOC_FIS,                                                  ' ||
                                     'BURKS EMPRESA,                                                        ' ||
                                     'BLDAT DATADOC,                                                        ' ||
                                     ' ''4'' ORDEM,                                                         ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' FORNEC FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND LENGTH(TRIM(local_nego)) > ''4'' ' ||
                                     'AND XBLNR NOT IN (''2100'',''2631'')' ||
                                     'GROUP BY                                                              ' ||
                                     '''I'',                                                                ' ||
                                     ' ''MULTA'',                                                           ' ||
                                     ' substr(LOCAL_NEGO,1,4),                                                          ' ||
                                     ' ''I;MULTA;'' || substr(LOCAL_NEGO,1,4) || '';'' ,                                ' ||
                                     ' LIFNR,                                                               ' ||
                                     ' ZUONR,                                                               ' || --ZUONR
                                     ' BURKS,                                                               ' ||
                                     ' BLDAT,                                                               ' ||
                                     ' ''4'',                                                               ' ||
                                     ' XBLNR ,                                                 ' ||
                                     ' FORNEC                                                               ' ||
                                    --------------------------------------------------------------------GPS PF 2631 ---------------------------------------------------------
                                     'UNION ALL                                                             ' ||
                                     ' SELECT                                                               ' ||
                                     ' ''I'' ITEM,                                                          ' ||
                                     ' ''MULTA'' MULTA,                                                     ' ||
                                     'substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                              ' ||
                                     'TRIM(TO_CHAR(SUM(MULTA),''000000000099'')) VALOR,                     ' ||
                                     ' ''I;MULTA;'' || substr(LOCAL_NEGO,1,4) || '';'' || TRIM(TO_CHAR(SUM(MULTA),''000000000099'')) || '';'' LINHA,' ||
                                     'LIFNR COD_FIS_JUR,                                                    ' ||
                                     'ZUONR   NUM_DOC_FIS,                                                  ' ||
                                     'BURKS EMPRESA,                                                        ' ||
                                     'BLDAT DATADOC,                                                        ' ||
                                     ' ''4'' ORDEM,                                                         ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' FORNEC FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND XBLNR not in (''2100'',''2658'')' ||
                                     'GROUP BY                                                              ' ||
                                     '''I'',                                                                ' ||
                                     ' ''MULTA'',                                                           ' ||
                                     ' substr(LOCAL_NEGO,1,4),                                                          ' ||
                                     ' ''I;MULTA;'' || substr(LOCAL_NEGO,1,4) || '';'' ,                                ' ||
                                     ' LIFNR,                                                               ' ||
                                     ' ZUONR,                                                               ' || --ZUONR
                                     ' BURKS,                                                               ' ||
                                     ' BLDAT,                                                               ' ||
                                     ' ''4'',                                                               ' ||
                                     ' XBLNR ,                                                 ' ||
                                     ' FORNEC                                                               ' || '';
        BEGIN
          --######### I N S E R T - M U L T A ############
          dbms_output.put_line(Script_GPS_executar_Multa);
          EXECUTE IMMEDIATE (Script_GPS_executar_Multa);
        END;

        --JUROS GPS
        ---------------------------------------------------- GPS PJ 2100 -----------------------------------------------------------
        Script_GPS_executar_Juros := ' INSERT INTO LKM_SAIDA_GPS_DARF_ITEM4_J  SELECT                       ' ||
                                     '  ''I'' ITEM,                                                         ' ||
                                     '  ''JUROS'' MULTA,                                                    ' ||
                                     ' substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                             ' ||
                                     ' TRIM(TO_CHAR(SUM(JUROS),''000000000099'')) VALOR,                    ' ||
                                     '  ''I;JUROS;'' || substr(LOCAL_NEGO,1,4) || '';'' || TRIM(TO_CHAR(SUM(JUROS),''000000000099'')) || '';'' LINHA,   ' ||
                                     ' LIFNR COD_FIS_JUR,                                                   ' ||
                                     ' ''999999995''  ,                                                             ' ||
                                     ' BURKS EMPRESA,                                                       ' ||
                                     ' to_char(LAST_DAY(BLDAT), ''DDMMYYYY'') DATADOC,                                                       ' ||
                                     '  ''5'' ORDEM,                                                        ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' '''' FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND XBLNR = ''2100''' ||
                                     'GROUP BY                                                              ' ||
                                     '''I'',                                                                ' ||
                                     '''JUROS'',                                                            ' ||
                                     ' substr(LOCAL_NEGO,1,4),                                                          ' ||
                                     ' ''I;JUROS;'' || substr(LOCAL_NEGO,1,4) || '';'' ,                                ' ||
                                     ' LIFNR,                                                               ' ||
                                     ' ''0'',                                                               ' || --ZUONR
                                     ' BURKS,                                                               ' ||
                                     ' BLDAT,                                                               ' ||
                                     ' ''5'',                                                               ' ||
                                     ' XBLNR ,                                                 ' ||
                                     ' FORNEC                                                  ' ||
                                    ----------------------------------------------------------------------GPS PF 2658---------------------------------------
                                     'UNION ALL                                                             ' ||
                                     ' SELECT                                                               ' ||
                                     '  ''I'' ITEM,                                                         ' ||
                                     '  ''JUROS'' MULTA,                                                    ' ||
                                     ' substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                             ' ||
                                     ' TRIM(TO_CHAR(SUM(JUROS),''000000000099'')) VALOR,                    ' ||
                                     '  ''I;JUROS;'' || substr(LOCAL_NEGO,1,4) || '';'' || TRIM(TO_CHAR(SUM(JUROS),''000000000099'')) || '';'' LINHA,   ' ||
                                     ' LIFNR COD_FIS_JUR,                                                   ' ||
                                     ' ZUONR  ,                                                             ' ||
                                     ' BURKS EMPRESA,                                                       ' ||
                                     ' BLDAT DATADOC,                                                       ' ||
                                     '  ''5'' ORDEM,                                                        ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' FORNEC FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND LENGTH(TRIM(local_nego)) > ''4'' ' ||
                                     'AND XBLNR not in (''2100'',''2631'')' ||
                                     'GROUP BY                                                              ' ||
                                     '''I'',                                                                ' ||
                                     '''JUROS'',                                                            ' ||
                                     ' substr(LOCAL_NEGO,1,4),                                                          ' ||
                                     ' ''I;JUROS;'' || substr(LOCAL_NEGO,1,4) || '';'' ,                                ' ||
                                     ' LIFNR,                                                               ' ||
                                     ' ZUONR,                                                               ' || --ZUONR
                                     ' BURKS,                                                               ' ||
                                     ' BLDAT,                                                               ' ||
                                     ' ''5'',                                                               ' ||
                                     ' XBLNR ,                                                 ' ||
                                     ' FORNEC                                                                ' ||
                                    ----------------------------------------------------------------------GPS PF 2631 ---------------------------------------
                                     'UNION ALL                                                             ' ||
                                     ' SELECT                                                               ' ||
                                     '  ''I'' ITEM,                                                         ' ||
                                     '  ''JUROS'' MULTA,                                                    ' ||
                                     ' substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                             ' ||
                                     ' TRIM(TO_CHAR(SUM(JUROS),''000000000099'')) VALOR,                    ' ||
                                     '  ''I;JUROS;'' || substr(LOCAL_NEGO,1,4) || '';'' || TRIM(TO_CHAR(SUM(JUROS),''000000000099'')) || '';'' LINHA,   ' ||
                                     ' LIFNR COD_FIS_JUR,                                                   ' ||
                                     ' ZUONR  ,                                                             ' ||
                                     ' BURKS EMPRESA,                                                       ' ||
                                     ' BLDAT DATADOC,                                                       ' ||
                                     '  ''5'' ORDEM,                                                        ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' FORNEC FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND LENGTH(TRIM(local_nego)) > ''4'' ' ||
                                     'AND XBLNR not in (''2100'',''2658'')' ||
                                     'GROUP BY                                                              ' ||
                                     '''I'',                                                                ' ||
                                     '''JUROS'',                                                            ' ||
                                     ' substr(LOCAL_NEGO,1,4),                                                          ' ||
                                     ' ''I;JUROS;'' || substr(LOCAL_NEGO,1,4) || '';'' ,                                ' ||
                                     ' LIFNR,                                                               ' ||
                                     ' ZUONR,                                                               ' || --ZUONR
                                     ' BURKS,                                                               ' ||
                                     ' BLDAT,                                                               ' ||
                                     ' ''5'',                                                               ' ||
                                     ' XBLNR ,                                                 ' ||
                                     ' FORNEC                                                                ' || '';

        BEGIN
          --######### I N S E R T - J U R O S  ###########
          dbms_output.put_line(Script_GPS_executar_Juros);
          EXECUTE IMMEDIATE (Script_GPS_executar_Juros);
        END;

        --ENTIDADES GPS
        Script_GPS_executar_Entid := ' INSERT INTO LKM_SAIDA_GPS_DARF_ITEM5_E  SELECT                              ' ||
                                     ' ''I'' ITEM,                                                                 ' ||
                                     ' ''ENTIDADES'' MULTA,                                                        ' ||
                                     'substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                                     ' ||
                                     'TRIM(TO_CHAR(SUM(ENTIDADES),''000000000099'')) VALOR,                        ' ||
                                     ' ''I;ENTIDADES;'' || substr(LOCAL_NEGO,1,4) || '';'' || TRIM(TO_CHAR(SUM(ENTIDADES),''000000000099'')) || '';'' LINHA,   ' ||
                                     'LIFNR COD_FIS_JUR,                                                           ' ||
                                     '''999999996'' NUM_DOC_FIS,                                                           ' ||
                                     'BURKS EMPRESA,                                                               ' ||
                                     'to_char(LAST_DAY(BLDAT), ''DDMMYYYY'') DATADOC,                                                               ' ||
                                     ' ''6'' ORDEM,                                                                ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' '''' FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND XBLNR = ''2100''' ||
                                     'GROUP BY                                                                     ' ||
                                     '''I'',                                                                       ' ||
                                     '''ENTIDADES'',                                                               ' ||
                                     ' substr(LOCAL_NEGO,1,4),                                                                 ' ||
                                     ' ''I;ENTIDADES;'' || substr(LOCAL_NEGO,1,4) || '';'' ,                                   ' ||
                                     ' LIFNR,                                                                      ' ||
                                     ' ''0'',                                                                      ' || --ZUONR
                                     ' BURKS,                                                                      ' ||
                                     ' BLDAT,                                                                      ' ||
                                     ' ''6'',                                                                      ' ||
                                     ' XBLNR ,                                                 ' ||
                                     ' FORNEC                                                                       ' ||
                                    -------------------------------------------------------2658------------------

                                     'UNION ALL                                                                    ' ||
                                     ' SELECT                                                                      ' ||
                                     ' ''I'' ITEM,                                                                 ' ||
                                     ' ''ENTIDADES'' MULTA,                                                        ' ||
                                     'substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                                     ' ||
                                     'TRIM(TO_CHAR(SUM(ENTIDADES),''000000000099'')) VALOR,                        ' ||
                                     ' ''I;ENTIDADES;'' || substr(LOCAL_NEGO,1,4) || '';'' || TRIM(TO_CHAR(SUM(ENTIDADES),''000000000099'')) || '';'' LINHA,   ' ||
                                     'LIFNR COD_FIS_JUR,                                                           ' ||
                                     'ZUONR NUM_DOC_FIS,                                                           ' ||
                                     'BURKS EMPRESA,                                                               ' ||
                                     'BLDAT DATADOC,                                                               ' ||
                                     ' ''6'' ORDEM,                                                                ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' FORNEC FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND LENGTH(TRIM(local_nego)) > ''4'' ' ||
                                     'AND XBLNR not in (''2100'',''2631'')' ||
                                     'GROUP BY                                                                     ' ||
                                     '''I'',                                                                       ' ||
                                     '''ENTIDADES'',                                                               ' ||
                                     ' substr(LOCAL_NEGO,1,4),                                                                 ' ||
                                     ' ''I;ENTIDADES;'' || substr(LOCAL_NEGO,1,4) || '';'' ,                                   ' ||
                                     ' LIFNR,                                                                      ' ||
                                     ' ZUONR,                                                                      ' || --ZUONR
                                     ' BURKS,                                                                      ' ||
                                     ' BLDAT,                                                                      ' ||
                                     ' ''6'',                                                                      ' ||
                                     ' XBLNR ,                                                 ' ||
                                     ' FORNEC                                                                       ' ||
                                    --------------------------------------------------- GPS PF 2631 ------------------------------------------------------------
                                     'UNION ALL                                                                    ' ||
                                     ' SELECT                                                                      ' ||
                                     ' ''I'' ITEM,                                                                 ' ||
                                     ' ''ENTIDADES'' MULTA,                                                        ' ||
                                     'substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                                     ' ||
                                     'TRIM(TO_CHAR(SUM(ENTIDADES),''000000000099'')) VALOR,                        ' ||
                                     ' ''I;ENTIDADES;'' || substr(LOCAL_NEGO,1,4) || '';'' || TRIM(TO_CHAR(SUM(ENTIDADES),''000000000099'')) || '';'' LINHA,   ' ||
                                     'LIFNR COD_FIS_JUR,                                                           ' ||
                                     'ZUONR NUM_DOC_FIS,                                                           ' ||
                                     'BURKS EMPRESA,                                                               ' ||
                                     'BLDAT DATADOC,                                                               ' ||
                                     ' ''6'' ORDEM,                                                                ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' FORNEC FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND XBLNR not in (''2100'',''2658'')' ||
                                     'GROUP BY                                                                     ' ||
                                     '''I'',                                                                       ' ||
                                     '''ENTIDADES'',                                                               ' ||
                                     ' substr(LOCAL_NEGO,1,4),                                                                 ' ||
                                     ' ''I;ENTIDADES;'' || substr(LOCAL_NEGO,1,4) || '';'' ,                                   ' ||
                                     ' LIFNR,                                                                      ' ||
                                     ' ZUONR,                                                                      ' || --ZUONR
                                     ' BURKS,                                                                      ' ||
                                     ' BLDAT,                                                                      ' ||
                                     ' ''6'',                                                                      ' ||
                                     ' XBLNR ,                                                 ' ||
                                     ' FORNEC                                                                       ' || '';

        BEGIN
          --######### I N S E R T - O. E N T I D A D E S #
          dbms_output.put_line(Script_GPS_executar_Entid);
          EXECUTE IMMEDIATE (Script_GPS_executar_Entid);
        END;

        -- V_data_ini_A := null;
        -- V_data_fim_A := null;

      END IF;
    END LOOP;
  END LKM_INSERT_GPS;

--- REINF 2021

 PROCEDURE LKM_INSERT_REINF(PS_EMPRESA      VARCHAR2,
                          PS_ESTAB        VARCHAR2,
                          P_LIMINAR       VARCHAR2,
                          PS_DATA_INICIAL DATE,
                          PS_DATA_FINAL   DATE) IS

    Script_REINF_executar_capa0 varchar(32000);
    Script_REINF_executar_Item1 varchar(32000);
    Script_REINF_executar_Item2 varchar(32000);
    Script_REINF_executar_Juros varchar(32000);
    Script_REINF_executar_Multa varchar(32000);
    Script_REINF_executar_Entid varchar(32000);
    V_NOME_TABELA  VARCHAR(255) := '' ;

    --  V_Data_ini_A varchar(255);
    --  V_Data_fim_A varchar(255);

  BEGIN
        EXECUTE IMMEDIATE ' ALTER SESSION SET NLS_DATE_FORMAT = ''DD/MM/YYYY''      ';


    IF P_LIMINAR = ('S') THEN
      V_NOME_TABELA := 'VW_LKM_REINF_PATRONAL';
    ELSE
      V_NOME_TABELA := 'VW_LKM_REINF';
    END IF;

        -- teste   dbms_output.put_line(V_data_ini_A || '-' || PS_DATA_FINAL);

        -->> GERACAO REINF <<--

        ------------------------------------------------------------REINF PJ 2100--------------------------------------------------
        Script_REINF_executar_capa0 := 'INSERT INTO LKM_SAIDA_REINF_DARF_CAPA SELECT DISTINCT               ' ||
                                     ' BKTXT TIPO,                                        ' ||
                                     ' TO_CHAR(''H'') CABECALHO,                                        ' ||
                                     'BUDAT DATALANC,                                                   ' ||
                                     'GJARH EXERCICIO,                                                  ' ||
                                     'MONAT PERIODO,                                                    ' ||
                                     '''H;'' || BURKS || '';'' || to_char(LAST_DAY(BLDAT), ''DDMMYYYY'') || '';'' || to_char(sysdate, ''DDMMYYYY'') || '';'' ||   ' ||
                                     'GJARH || '';'' || MONAT || '';'' || XBLNR || '';'' AS LINHA,      ' ||
                                     'LIFNR COD_FIS_JUR,                                                ' ||
                                     '''0'' NUM_DOC_FIS,                                                ' ||
                                     'BURKS EMPRESA,                                                    ' ||
                                     'to_char(LAST_DAY(BLDAT), ''DDMMYYYY'') DATADOC,                   ' ||
                                    -- ''''' DATADOC,                   ' ||
                                     '''1'' ORDEM,                                                      ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                             ' ||
                                     ' ''0'' FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND ' || '''' || PS_DATA_FINAL || '''' ||
                                     'AND XBLNR = ''2100''' ||
                                    --------------------------------------------------------------------REINF PF 2658 ---------------------------------------------
                                     ' UNION ALL                                                        ' ||
                                     'SELECT DISTINCT                                                   ' ||
                                     ' BKTXT TIPO,                                        ' ||
                                     ' TO_CHAR(''H'') CABECALHO,                                        ' ||
                                     'BUDAT DATALANC,                                                   ' ||
                                     'GJARH EXERCICIO,                                                  ' ||
                                     'MONAT PERIODO,                                                    ' ||
                                     '''H;'' || BURKS || '';'' || BLDAT || '';'' || BUDAT || '';'' ||   ' ||
                                     'GJARH || '';'' || MONAT || '';'' || XBLNR || '';'' ||substr(LOCAL_NEGO,5,19)||'';'' AS LINHA,' ||
                                     'LIFNR COD_FIS_JUR,                                                ' ||
                                     'ZUONR NUM_DOC_FIS,                                                ' ||
                                     'BURKS EMPRESA,                                                    ' ||
                                     'BLDAT DATADOC,                                                    ' ||
                                     '''1'' ORDEM,                                                      ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                                 ' ||
                                     ' FORNEC FORNEC                             ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND XBLNR NOT IN (''2100'',''2631'')' ||
                                     'AND LENGTH(TRIM(local_nego)) > 4' ||
                                    -------------------------------------------------------REINF 2631
                                     ' UNION ALL                                                        ' ||
                                     'SELECT DISTINCT                                                   ' ||
                                     ' BKTXT TIPO,                                        ' ||
                                     ' TO_CHAR(''H'') CABECALHO,                                        ' ||
                                     'BUDAT DATALANC,                                                   ' ||
                                     'GJARH EXERCICIO,                                                  ' ||
                                     'MONAT PERIODO,                                                    ' ||
                                     '''H;'' || BURKS || '';'' || BLDAT || '';'' || BUDAT || '';'' ||   ' ||
                                     'GJARH || '';'' || MONAT || '';'' || XBLNR || '';'' ||substr(LOCAL_NEGO,5,19)|| '';''  AS LINHA,' ||
                                     'LIFNR COD_FIS_JUR,                                                ' ||
                                     'ZUONR NUM_DOC_FIS,                                                ' ||
                                     'BURKS EMPRESA,                                                    ' ||
                                     'BLDAT DATADOC,                                                    ' ||
                                     '''1'' ORDEM,                                                      ' ||
                                     ' XBLNR CODIGORECEITA,                                             ' ||
                                     ' substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                             ' ||
                                     ' FORNEC FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND XBLNR NOT IN (''2100'',''2658'')' || '';

        BEGIN
          --    ######### I N S E R T - C A P A  #############
        --  dbms_output.put_line(Script_REINF_executar_capa0);
          EXECUTE IMMEDIATE (Script_REINF_executar_capa0);
        END;

        -- CAPA REINF
        -------------------------------------------------------REINF PJ 2100 ---------------------------------------------------------
        Script_REINF_executar_Item1 := 'INSERT INTO LKM_SAIDA_REINF_DARF_ITEM1  SELECT                          ' ||
                                     ' BKTXT TIPO,                                        ' ||
                                     ' ''I'' ITEM,                                                          ' ||
                                     ' LIFNR FORNECEDOR,                                                    ' ||
                                     ' substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                 ' ||
                                     ' TRIM(TO_CHAR(SUM(VL_TRIB),''000000000099'')) VLRTRIB,                ' ||
                                     ' ''I;'' || LIFNR || '';'' || substr(LOCAL_NEGO,1,4) || '';'' || TRIM(TO_CHAR(SUM(VL_TRIB),''000000000099'')) || '';'' AS LINHA,' ||
                                     ' LIFNR COD_FIS_JUR,                                                   ' ||
                                     ' ''0'' NUM_DOC_FIS,                                                   ' || --ZUONR
                                     ' BURKS EMPRESA,                                                       ' ||
                                     ' to_char(LAST_DAY(BLDAT), ''DDMMYYYY'') DATADOC,                                                       ' ||
                                     ' ''2'' ORDEM,                                                         ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' '''' FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND XBLNR = ''2100''' ||
                                     'GROUP BY                                                              ' ||
                                     ' BKTXT ,                                        ' ||
                                     '''I'',                                                                ' ||
                                     ' LIFNR,                                                               ' ||
                                     ' LOCAL_NEGO,                                                          ' ||
                                     ' ''I;'' || LIFNR || '';'' ||LOCAL_NEGO || '';'' ,                     ' ||
                                     ' LIFNR,                                                               ' ||
                                     ' ''0'',                                                               ' || --ZUONR
                                     ' BURKS,                                                               ' ||
                                     ' to_char(LAST_DAY(BLDAT), ''DDMMYYYY''),                                                               ' ||
                                     ' ''2'',                                                               ' ||
                                     ' XBLNR,                                                               ' ||
                                     ' ''''                                                                 ' ||
                                    ---------------------------------------------------------------REINF 2658 -----------------------------------------------------
                                     ' UNION ALL                                                            ' ||
                                     '  SELECT                                                              ' ||
                                     ' BKTXT TIPO,                                        ' ||
                                     ' ''I'' ITEM,                                                          ' ||
                                     ' LIFNR FORNECEDOR,                                                    ' ||
                                     ' substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                             ' ||
                                     ' TRIM(TO_CHAR(SUM(VL_TRIB),''000000000099'')) VLRTRIB,                ' ||
                                     ' ''I;'' || LIFNR || '';'' || substr(LOCAL_NEGO,1,4) || '';'' || TRIM(TO_CHAR(SUM(VL_TRIB),''000000000099'')) || '';'' AS LINHA,' ||
                                     ' LIFNR COD_FIS_JUR,                                                   ' ||
                                     ' ZUONR NUM_DOC_FIS,                                                   ' || --ZUONR
                                     ' BURKS EMPRESA,                                                       ' ||
                                     ' BLDAT DATADOC,                                                       ' ||
                                     ' ''2'' ORDEM,                                                         ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' FORNEC FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND XBLNR not in (''2100'',''2631'')' ||
                                     'AND LENGTH(TRIM(local_nego)) > ''4'' ' ||
                                     'GROUP BY                                                              ' ||
                                     ' BKTXT ,                                        ' ||
                                     '''I'',                                                                ' ||
                                     ' LIFNR,                                                               ' ||
                                     ' LOCAL_NEGO,                                                          ' ||
                                     ' ''I;'' || LIFNR || '';'' ||LOCAL_NEGO || '';'' ,                     ' ||
                                     ' LIFNR,                                                               ' ||
                                     ' ZUONR,                                                               ' || --ZUONR
                                     ' BURKS,                                                               ' ||
                                     ' BLDAT,                                                               ' ||
                                     ' ''2'',                                                               ' ||
                                     ' XBLNR,                                                               ' ||
                                     ' FORNEC                                                                ' ||
                                    -------------------------------------------------------------------- 2631
                                     ' UNION ALL                                                            ' ||
                                     '  SELECT                                                              ' ||
                                     ' BKTXT TIPO,                                        ' ||
                                     ' ''I'' ITEM,                                                          ' ||
                                     ' LIFNR FORNECEDOR,                                                    ' ||
                                     ' substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                             ' ||
                                     ' TRIM(TO_CHAR(SUM(VL_TRIB),''000000000099'')) VLRTRIB,                ' ||
                                     ' ''I;'' || LIFNR || '';'' || substr(LOCAL_NEGO,1,4) || '';'' || TRIM(TO_CHAR(SUM(VL_TRIB),''000000000099'')) || '';'' AS LINHA,' ||
                                     ' LIFNR COD_FIS_JUR,                                                   ' ||
                                     ' ZUONR NUM_DOC_FIS,                                                   ' || --ZUONR
                                     ' BURKS EMPRESA,                                                       ' ||
                                     ' BLDAT DATADOC,                                                       ' ||
                                     ' ''2'' ORDEM,                                                         ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' FORNEC FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND XBLNR not in (''2100'',''2658'')' ||
                                     'GROUP BY                                                              ' ||
                                     ' BKTXT ,                                        ' ||
                                     '''I'',                                                                ' ||
                                     ' LIFNR,                                                               ' ||
                                     ' LOCAL_NEGO,                                                          ' ||
                                     ' ''I;'' || LIFNR || '';'' ||LOCAL_NEGO || '';'' ,                     ' ||
                                     ' LIFNR,                                                               ' ||
                                     ' ZUONR,                                                               ' || --ZUONR
                                     ' BURKS,                                                               ' ||
                                     ' BLDAT,                                                               ' ||
                                     ' ''2'',                                                               ' ||
                                     ' XBLNR,                                                               ' ||
                                     ' FORNEC                                                                ' || '';
        BEGIN
          --######### I N S E R T - I T E M 1 ############
         -- dbms_output.put_line(Script_REINF_executar_Item1);
          EXECUTE IMMEDIATE (Script_REINF_executar_Item1);
        END;

        --ITEN2 REINF
        Script_REINF_executar_Item2 := ' INSERT INTO LKM_SAIDA_REINF_DARF_ITEM2 SELECT   ' ||
                                     ' BKTXT TIPO,                                        ' ||
                                     ' ''I'' ITEM,                                                       ' ||
                                     'XBLNR CONTALOCALIZADAPELOCODIGO,                                   ' ||
                                     'substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                           ' ||
                                     'VL_TRIB VALOR,                                                     ' ||
                                     ' ''NF'' || ZUONR NOTAFISCAL,                                       ' ||
                                     ' ''I;'' || XBLNR || '';'' || substr(LOCAL_NEGO,1,4) || '';'' || VL_TRIB ||     ' ||
                                     ' '';'' || ZUONR || '';'' AS LINHA,                               ' ||
                                     'LIFNR COD_FIS_JUR,                                                 ' ||
                                     'ZUONR NUM_DOC_FIS,                                                 ' ||
                                     'BURKS EMPRESA,                                                     ' ||
                                     'BLDAT DATADOC,                                                     ' ||
                                     ' ''3'' ORDEM,                                                      ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' FORNEC FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND XBLNR = ''2100''' ||
                                    -------------------------------------------- 2658
                                     ' UNION ALL                                                            ' ||
                                     '  SELECT                                                              ' ||
                                     ' BKTXT TIPO,                                        ' ||
                                     ' ''I'' ITEM,                                                       ' ||
                                     'XBLNR CONTALOCALIZADAPELOCODIGO,                                   ' ||
                                     'substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                           ' ||
                                     'VL_TRIB VALOR,                                                     ' ||
                                     ' ''NF'' || ZUONR NOTAFISCAL,                                       ' ||
                                     ' ''I;'' || XBLNR || '';'' || substr(LOCAL_NEGO,1,4) || '';'' || VL_TRIB ||     ' ||
                                     ' '';'' || ZUONR || '';'' AS LINHA,                               ' ||
                                     'LIFNR COD_FIS_JUR,                                                 ' ||
                                     'ZUONR NUM_DOC_FIS,                                                 ' ||
                                     'BURKS EMPRESA,                                                     ' ||
                                     'BLDAT DATADOC,                                                     ' ||
                                     ' ''3'' ORDEM,                                                      ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' FORNEC FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND LENGTH(TRIM(local_nego)) > ''4'' ' ||
                                     'AND XBLNR NOT IN (''2100'',''2631'')' ||
                                    -------------------------------------------- 2631
                                     ' UNION ALL                                                            ' ||
                                     '  SELECT                                                              ' ||
                                     ' BKTXT TIPO,                                        ' ||
                                     ' ''I'' ITEM,                                                       ' ||
                                     'XBLNR CONTALOCALIZADAPELOCODIGO,                                   ' ||
                                     'substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                           ' ||
                                     'VL_TRIB VALOR,                                                     ' ||
                                     ' ''NF'' || ZUONR NOTAFISCAL,                                       ' ||
                                     ' ''I;'' || XBLNR || '';'' || substr(LOCAL_NEGO,1,4) || '';'' || VL_TRIB ||     ' ||
                                     ' '';'' || ZUONR || '';'' AS LINHA,                               ' ||
                                     'LIFNR COD_FIS_JUR,                                                 ' ||
                                     'ZUONR NUM_DOC_FIS,                                                 ' ||
                                     'BURKS EMPRESA,                                                     ' ||
                                     'BLDAT DATADOC,                                                     ' ||
                                     ' ''3'' ORDEM,                                                      ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' FORNEC FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND XBLNR NOT IN (''2100'',''2658'')' || '';
        BEGIN
          --######### I N S E R T - I T E M 2 ############
        --  dbms_output.put_line(Script_REINF_executar_Item2);
          EXECUTE IMMEDIATE (Script_REINF_executar_Item2);
        END;

        --MULTA REINF
        ----------------------------------------------------------REINF PJ 2100 ------------------------------------------
        Script_REINF_executar_Multa := ' INSERT INTO LKM_SAIDA_REINF_DARF_ITEM3_M SELECT                        ' ||
                                     ' BKTXT TIPO,                                        ' ||
                                     ' ''I'' ITEM,                                                          ' ||
                                     ' ''MULTA'' MULTA,                                                     ' ||
                                     'substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                              ' ||
                                     'TRIM(TO_CHAR(SUM(MULTA),''000000000099'')) VALOR,                     ' ||
                                     ' ''I;MULTA;'' || substr(LOCAL_NEGO,1,4) || '';'' || TRIM(TO_CHAR(SUM(MULTA),''000000000099'')) || '';'' LINHA,' ||
                                     'LIFNR COD_FIS_JUR,                                                    ' ||
                                     '''999999994''   NUM_DOC_FIS,                                                  ' ||
                                     'BURKS EMPRESA,                                                        ' ||
                                     'to_char(LAST_DAY(BLDAT), ''DDMMYYYY'') DATADOC,                                                        ' ||
                                     ' ''4'' ORDEM,                                                         ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' '''' FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND XBLNR = ''2100''' ||
                                     'GROUP BY                                                              ' ||
                                     ' BKTXT ,                                        ' ||
                                     '''I'',                                                                ' ||
                                     ' ''MULTA'',                                                           ' ||
                                     ' LOCAL_NEGO,                                                          ' ||
                                     ' ''I;MULTA;'' || substr(LOCAL_NEGO,1,4) || '';'' ,                                ' ||
                                     ' LIFNR,                                                               ' ||
                                     ' ''0'',                                                               ' || --ZUONR
                                     ' BURKS,                                                               ' ||
                                     ' BLDAT,                                                               ' ||
                                     ' ''4'',                                                               ' ||
                                     ' XBLNR ,                                                 ' ||
                                     ' FORNEC                                                                ' ||
                                    --------------------------------------------------------------------REINF PF 2658 ---------------------------------------------------------
                                     'UNION ALL                                                             ' ||
                                     ' SELECT                                                               ' ||
                                     ' BKTXT TIPO,                                        ' ||
                                     ' ''I'' ITEM,                                                          ' ||
                                     ' ''MULTA'' MULTA,                                                     ' ||
                                     'substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                              ' ||
                                     'TRIM(TO_CHAR(SUM(MULTA),''000000000099'')) VALOR,                     ' ||
                                     ' ''I;MULTA;'' || substr(LOCAL_NEGO,1,4) || '';'' || TRIM(TO_CHAR(SUM(MULTA),''000000000099'')) || '';'' LINHA,' ||
                                     'LIFNR COD_FIS_JUR,                                                    ' ||
                                     'ZUONR   NUM_DOC_FIS,                                                  ' ||
                                     'BURKS EMPRESA,                                                        ' ||
                                     'BLDAT DATADOC,                                                        ' ||
                                     ' ''4'' ORDEM,                                                         ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' FORNEC FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND LENGTH(TRIM(local_nego)) > ''4'' ' ||
                                     'AND XBLNR NOT IN (''2100'',''2631'')' ||
                                     'GROUP BY                                                              ' ||
                                     ' BKTXT ,                                        ' ||
                                     '''I'',                                                                ' ||
                                     ' ''MULTA'',                                                           ' ||
                                     ' substr(LOCAL_NEGO,1,4),                                                          ' ||
                                     ' ''I;MULTA;'' || substr(LOCAL_NEGO,1,4) || '';'' ,                                ' ||
                                     ' LIFNR,                                                               ' ||
                                     ' ZUONR,                                                               ' || --ZUONR
                                     ' BURKS,                                                               ' ||
                                     ' BLDAT,                                                               ' ||
                                     ' ''4'',                                                               ' ||
                                     ' XBLNR ,                                                 ' ||
                                     ' FORNEC                                                               ' ||
                                    --------------------------------------------------------------------REINF PF 2631 ---------------------------------------------------------
                                     'UNION ALL                                                             ' ||
                                     ' SELECT                                                               ' ||
                                     ' BKTXT TIPO,                                        ' ||
                                     ' ''I'' ITEM,                                                          ' ||
                                     ' ''MULTA'' MULTA,                                                     ' ||
                                     'substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                              ' ||
                                     'TRIM(TO_CHAR(SUM(MULTA),''000000000099'')) VALOR,                     ' ||
                                     ' ''I;MULTA;'' || substr(LOCAL_NEGO,1,4) || '';'' || TRIM(TO_CHAR(SUM(MULTA),''000000000099'')) || '';'' LINHA,' ||
                                     'LIFNR COD_FIS_JUR,                                                    ' ||
                                     'ZUONR   NUM_DOC_FIS,                                                  ' ||
                                     'BURKS EMPRESA,                                                        ' ||
                                     'BLDAT DATADOC,                                                        ' ||
                                     ' ''4'' ORDEM,                                                         ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' FORNEC FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND XBLNR not in (''2100'',''2658'')' ||
                                     'GROUP BY                                                              ' ||
                                     ' BKTXT ,                                        ' ||
                                     '''I'',                                                                ' ||
                                     ' ''MULTA'',                                                           ' ||
                                     ' substr(LOCAL_NEGO,1,4),                                                          ' ||
                                     ' ''I;MULTA;'' || substr(LOCAL_NEGO,1,4) || '';'' ,                                ' ||
                                     ' LIFNR,                                                               ' ||
                                     ' ZUONR,                                                               ' || --ZUONR
                                     ' BURKS,                                                               ' ||
                                     ' BLDAT,                                                               ' ||
                                     ' ''4'',                                                               ' ||
                                     ' XBLNR ,                                                 ' ||
                                     ' FORNEC                                                               ' || '';
        BEGIN
          --######### I N S E R T - M U L T A ############
       --    dbms_output.put_line(Script_REINF_executar_Multa);
          EXECUTE IMMEDIATE (Script_REINF_executar_Multa);
        END;

        --JUROS REINF
        ---------------------------------------------------- REINF PJ 2100 -----------------------------------------------------------
        Script_REINF_executar_Juros := ' INSERT INTO LKM_SAIDA_REINF_DARF_ITEM4_J  SELECT                       ' ||
                                     ' BKTXT TIPO,                                        ' ||
                                     '  ''I'' ITEM,                                                         ' ||
                                     '  ''JUROS'' MULTA,                                                    ' ||
                                     ' substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                             ' ||
                                     ' TRIM(TO_CHAR(SUM(JUROS),''000000000099'')) VALOR,                    ' ||
                                     '  ''I;JUROS;'' || substr(LOCAL_NEGO,1,4) || '';'' || TRIM(TO_CHAR(SUM(JUROS),''000000000099'')) || '';'' LINHA,   ' ||
                                     ' LIFNR COD_FIS_JUR,                                                   ' ||
                                     ' ''999999995''  ,                                                             ' ||
                                     ' BURKS EMPRESA,                                                       ' ||
                                     ' to_char(LAST_DAY(BLDAT), ''DDMMYYYY'') DATADOC,                                                       ' ||
                                     '  ''5'' ORDEM,                                                        ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' '''' FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND XBLNR = ''2100''' ||
                                     'GROUP BY                                                              ' ||
                                     ' BKTXT ,                                        ' ||
                                     '''I'',                                                                ' ||
                                     '''JUROS'',                                                            ' ||
                                     ' substr(LOCAL_NEGO,1,4),                                                          ' ||
                                     ' ''I;JUROS;'' || substr(LOCAL_NEGO,1,4) || '';'' ,                                ' ||
                                     ' LIFNR,                                                               ' ||
                                     ' ''0'',                                                               ' || --ZUONR
                                     ' BURKS,                                                               ' ||
                                     ' BLDAT,                                                               ' ||
                                     ' ''5'',                                                               ' ||
                                     ' XBLNR ,                                                 ' ||
                                     ' FORNEC                                                  ' ||
                                    ----------------------------------------------------------------------REINF PF 2658---------------------------------------
                                     'UNION ALL                                                             ' ||
                                     ' SELECT                                                               ' ||
                                     ' BKTXT TIPO,                                        ' ||
                                     '  ''I'' ITEM,                                                         ' ||
                                     '  ''JUROS'' MULTA,                                                    ' ||
                                     ' substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                             ' ||
                                     ' TRIM(TO_CHAR(SUM(JUROS),''000000000099'')) VALOR,                    ' ||
                                     '  ''I;JUROS;'' || substr(LOCAL_NEGO,1,4) || '';'' || TRIM(TO_CHAR(SUM(JUROS),''000000000099'')) || '';'' LINHA,   ' ||
                                     ' LIFNR COD_FIS_JUR,                                                   ' ||
                                     ' ZUONR  ,                                                             ' ||
                                     ' BURKS EMPRESA,                                                       ' ||
                                     ' BLDAT DATADOC,                                                       ' ||
                                     '  ''5'' ORDEM,                                                        ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' FORNEC FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND LENGTH(TRIM(local_nego)) > ''4'' ' ||
                                     'AND XBLNR not in (''2100'',''2631'')' ||
                                     'GROUP BY                                                              ' ||
                                     ' BKTXT ,                                        ' ||
                                     '''I'',                                                                ' ||
                                     '''JUROS'',                                                            ' ||
                                     ' substr(LOCAL_NEGO,1,4),                                                          ' ||
                                     ' ''I;JUROS;'' || substr(LOCAL_NEGO,1,4) || '';'' ,                                ' ||
                                     ' LIFNR,                                                               ' ||
                                     ' ZUONR,                                                               ' || --ZUONR
                                     ' BURKS,                                                               ' ||
                                     ' BLDAT,                                                               ' ||
                                     ' ''5'',                                                               ' ||
                                     ' XBLNR ,                                                 ' ||
                                     ' FORNEC                                                                ' ||
                                    ----------------------------------------------------------------------REINF PF 2631 ---------------------------------------
                                     'UNION ALL                                                             ' ||
                                     ' SELECT                                                               ' ||
                                     ' BKTXT TIPO,                                        ' ||
                                     '  ''I'' ITEM,                                                         ' ||
                                     '  ''JUROS'' MULTA,                                                    ' ||
                                     ' substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                             ' ||
                                     ' TRIM(TO_CHAR(SUM(JUROS),''000000000099'')) VALOR,                    ' ||
                                     '  ''I;JUROS;'' || substr(LOCAL_NEGO,1,4) || '';'' || TRIM(TO_CHAR(SUM(JUROS),''000000000099'')) || '';'' LINHA,   ' ||
                                     ' LIFNR COD_FIS_JUR,                                                   ' ||
                                     ' ZUONR  ,                                                             ' ||
                                     ' BURKS EMPRESA,                                                       ' ||
                                     ' BLDAT DATADOC,                                                       ' ||
                                     '  ''5'' ORDEM,                                                        ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' FORNEC FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND LENGTH(TRIM(local_nego)) > ''4'' ' ||
                                     'AND XBLNR not in (''2100'',''2658'')' ||
                                     'GROUP BY                                                              ' ||
                                     ' BKTXT ,                                        ' ||
                                     '''I'',                                                                ' ||
                                     '''JUROS'',                                                            ' ||
                                     ' substr(LOCAL_NEGO,1,4),                                                          ' ||
                                     ' ''I;JUROS;'' || substr(LOCAL_NEGO,1,4) || '';'' ,                                ' ||
                                     ' LIFNR,                                                               ' ||
                                     ' ZUONR,                                                               ' || --ZUONR
                                     ' BURKS,                                                               ' ||
                                     ' BLDAT,                                                               ' ||
                                     ' ''5'',                                                               ' ||
                                     ' XBLNR ,                                                 ' ||
                                     ' FORNEC                                                                ' || '';

        BEGIN
          --######### I N S E R T - J U R O S  ###########
        --   dbms_output.put_line(Script_REINF_executar_Juros);
          EXECUTE IMMEDIATE (Script_REINF_executar_Juros);
        END;

        --ENTIDADES REINF
        
        Script_REINF_executar_Entid := ' INSERT INTO LKM_SAIDA_REINF_DARF_ITEM5_E  SELECT                              ' ||
                                     ' BKTXT TIPO,                                        ' ||
                                     ' ''I'' ITEM,                                                                 ' ||
                                     ' ''ENTIDADES'' MULTA,                                                        ' ||
                                     'substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                                     ' ||
                                     'TRIM(TO_CHAR(SUM(ENTIDADES),''000000000099'')) VALOR,                        ' ||
                                     ' ''I;ENTIDADES;'' || substr(LOCAL_NEGO,1,4) || '';'' || TRIM(TO_CHAR(SUM(ENTIDADES),''000000000099'')) || '';'' LINHA,   ' ||
                                     'LIFNR COD_FIS_JUR,                                                           ' ||
                                     '''999999996'' NUM_DOC_FIS,                                                           ' ||
                                     'BURKS EMPRESA,                                                               ' ||
                                     'to_char(LAST_DAY(BLDAT), ''DDMMYYYY'') DATADOC,                                                               ' ||
                                     ' ''6'' ORDEM,                                                                ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' '''' FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND XBLNR = ''2100''' ||
                                     'GROUP BY                                                                     ' ||
                                     ' BKTXT ,                                        ' ||
                                     '''I'',                                                                       ' ||
                                     '''ENTIDADES'',                                                               ' ||
                                     ' substr(LOCAL_NEGO,1,4),                                                                 ' ||
                                     ' ''I;ENTIDADES;'' || substr(LOCAL_NEGO,1,4) || '';'' ,                                   ' ||
                                     ' LIFNR,                                                                      ' ||
                                     ' ''0'',                                                                      ' || --ZUONR
                                     ' BURKS,                                                                      ' ||
                                     ' BLDAT,                                                                      ' ||
                                     ' ''6'',                                                                      ' ||
                                     ' XBLNR ,                                                 ' ||
                                     ' FORNEC                                                                       ' ||
                                    -------------------------------------------------------2658------------------

                                     'UNION ALL                                                                    ' ||
                                     ' SELECT                                                                      ' ||
                                     ' BKTXT TIPO,                                        ' ||
                                     ' ''I'' ITEM,                                                                 ' ||
                                     ' ''ENTIDADES'' MULTA,                                                        ' ||
                                     'substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                                     ' ||
                                     'TRIM(TO_CHAR(SUM(ENTIDADES),''000000000099'')) VALOR,                        ' ||
                                     ' ''I;ENTIDADES;'' || substr(LOCAL_NEGO,1,4) || '';'' || TRIM(TO_CHAR(SUM(ENTIDADES),''000000000099'')) || '';'' LINHA,   ' ||
                                     'LIFNR COD_FIS_JUR,                                                           ' ||
                                     'ZUONR NUM_DOC_FIS,                                                           ' ||
                                     'BURKS EMPRESA,                                                               ' ||
                                     'BLDAT DATADOC,                                                               ' ||
                                     ' ''6'' ORDEM,                                                                ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' FORNEC FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND LENGTH(TRIM(local_nego)) > ''4'' ' ||
                                     'AND XBLNR not in (''2100'',''2631'')' ||
                                     'GROUP BY                                                                     ' ||
                                     ' BKTXT ,                                        ' ||
                                     '''I'',                                                                       ' ||
                                     '''ENTIDADES'',                                                               ' ||
                                     ' substr(LOCAL_NEGO,1,4),                                                                 ' ||
                                     ' ''I;ENTIDADES;'' || substr(LOCAL_NEGO,1,4) || '';'' ,                                   ' ||
                                     ' LIFNR,                                                                      ' ||
                                     ' ZUONR,                                                                      ' || --ZUONR
                                     ' BURKS,                                                                      ' ||
                                     ' BLDAT,                                                                      ' ||
                                     ' ''6'',                                                                      ' ||
                                     ' XBLNR ,                                                 ' ||
                                     ' FORNEC                                                                       ' ||
                                    --------------------------------------------------- REINF PF 2631 ------------------------------------------------------------
                                     'UNION ALL                                                                    ' ||
                                     ' SELECT                                                                      ' ||
                                     ' BKTXT TIPO,                                        ' ||
                                     ' ''I'' ITEM,                                                                 ' ||
                                     ' ''ENTIDADES'' MULTA,                                                        ' ||
                                     'substr(LOCAL_NEGO,1,4) LOCALNEGOCIO,                                                     ' ||
                                     'TRIM(TO_CHAR(SUM(ENTIDADES),''000000000099'')) VALOR,                        ' ||
                                     ' ''I;ENTIDADES;'' || substr(LOCAL_NEGO,1,4) || '';'' || TRIM(TO_CHAR(SUM(ENTIDADES),''000000000099'')) || '';'' LINHA,   ' ||
                                     'LIFNR COD_FIS_JUR,                                                           ' ||
                                     'ZUONR NUM_DOC_FIS,                                                           ' ||
                                     'BURKS EMPRESA,                                                               ' ||
                                     'BLDAT DATADOC,                                                               ' ||
                                     ' ''6'' ORDEM,                                                                ' ||
                                     ' XBLNR CODIGORECEITA,                                                 ' ||
                                     ' FORNEC FORNEC                                                 ' ||
                                     ' FROM ' || V_NOME_TABELA || ' ' ||
                                     'WHERE COD_EMPRESA = ' || '''' ||
                                     PS_EMPRESA || '''' || '' ||
                                     'AND COD_ESTAB = decode(' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ', ''000000 '',COD_ESTAB,' || '''' ||
                                     PS_ESTAB || '''' ||
                                     ') AND DATA_FISCAL  BETWEEN ' || '''' ||
                                     PS_DATA_INICIAL || '''' || '' ||
                                     ' AND                ' || '''' ||
                                     PS_DATA_FINAL || '''' ||
                                     'AND XBLNR not in (''2100'',''2658'')' ||
                                     'GROUP BY                                                                     ' ||
                                     ' BKTXT ,                                        ' ||
                                     '''I'',                                                                       ' ||
                                     '''ENTIDADES'',                                                               ' ||
                                     ' substr(LOCAL_NEGO,1,4),                                                                 ' ||
                                     ' ''I;ENTIDADES;'' || substr(LOCAL_NEGO,1,4) || '';'' ,                                   ' ||
                                     ' LIFNR,                                                                      ' ||
                                     ' ZUONR,                                                                      ' || --ZUONR
                                     ' BURKS,                                                                      ' ||
                                     ' BLDAT,                                                                      ' ||
                                     ' ''6'',                                                                      ' ||
                                     ' XBLNR ,                                                 ' ||
                                     ' FORNEC                                                                       ' || '';

        BEGIN
          --######### I N S E R T - O. E N T I D A D E S #
        --  dbms_output.put_line(Script_REINF_executar_Entid);
          EXECUTE IMMEDIATE (Script_REINF_executar_Entid);
        END;

        -- V_data_ini_A := null;
        -- V_data_fim_A := null;

    /*  END IF;
    END LOOP;*/


 ------
  END LKM_INSERT_REINF;

  -------------------------------
  --< I N S E R T - T A B L E S -
  -------------------------------

  ------------------------------------------------------------------------------------------------------------------------------->

  ---------------------------------
  -- T X T -  S A I D A - A R Q  --
  ---------------------------------

  PROCEDURE LKM_PLOAD(PS_EMPRESA      VARCHAR2,
                      PS_ESTAB        VARCHAR2,
                      P_FINALIDADE    VARCHAR2,
                      PS_DATA_INICIAL DATE,
                      PS_DATA_FINAL   DATE) IS

    -- S A I D A - L I B - P R O C --

    MLINHA            VARCHAR2(32767) := '';
    MLINHA2           VARCHAR2(32767) := '';
    --- Relatorio GPS
    MLINHA3           VARCHAR2(32767) := '';
    ---
    v_numero_arq      INT;
    v_numero_arq_5952 INT;
    v_q_item          INT;
    EMP               VARCHAR(256) := null;
    v_contador        NUMBER;
    v_contador1       NUMBER;
    v_contador2       NUMBER;
    v_contador3       NUMBER; -- Relatorio GPS
    v_contador4 NUMBER;
    v_contador5 NUMBER;
    v_contador6 NUMBER;
    v_contador7 NUMBER;
    v_contador_REINF NUMBER;
    v_contador_ESOCIAL NUMBER;

  BEGIN
    MPROC_ID := LIB_PROC.NEW('LKM_RECON3_CPROC', 48, 150);

    --nome sesi senai
    IF PS_EMPRESA = '001' THEN
      EMP := 'SESI';
    ELSE
      EMP := 'SENAI';
    END IF;

    v_contador  := 0;
    v_contador1 := 0;
    v_contador2 := 0;
    v_contador3 := 0; -- Relatorio GPS
    v_contador4 := 0;
    v_contador5 := 0;
    v_contador6 := 0;
    v_contador7 := 0;
     v_contador_REINF := 0;
    v_contador_ESOCIAL := 0;

    ------------------------------------------------------------------------------------------------------------
    -- G E R A -  G P S  + (D A R F 05889)
    -----------------------------------------------------------------------------------------------------------

    IF (P_FINALIDADE = '1') or (P_FINALIDADE = '3') THEN

      BEGIN

        FOR MREG IN (WITH LKM_LOAD as
                       -- GPS OUTRO
                        (SELECT DISTINCT LINHA,
                                        Localnegocio COD_FIS_JUR,
                                        NUM_DOC_FIS,
                                        ORDEM,
                                        EMPRESA,
                                        DATADOC,
                                        codigo_receita,
                                        fornec
                          FROM LKM_SAIDA_GPS_DARF_CAPA
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA NOT IN
                               ('0588',
                                '1708',
                                '3208',
                                '5952',
                                '5960',
                                '5979',
                                '3280',
                                '2100',
                                'DAM')
                        UNION ALL
                        SELECT DISTINCT LINHA,
                                        Localnegocio COD_FIS_JUR,
                                        TO_CHAR(NUM_DOC_FIS),
                                        ORDEM,
                                        EMPRESA,
                                        DATADOC,
                                        codigo_receita,
                                        fornec
                          FROM LKM_SAIDA_GPS_DARF_ITEM1
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA NOT IN
                               ('0588',
                                '1708',
                                '3208',
                                '5952',
                                '5960',
                                '5979',
                                '3280',
                                '2100',
                                'DAM')

                        UNION ALL
                        SELECT DISTINCT LINHA,
                                        Localnegocio COD_FIS_JUR,
                                        TO_CHAR(NUM_DOC_FIS),
                                        ORDEM,
                                        EMPRESA,
                                        DATADOC,
                                        codigo_receita,
                                        fornec
                          FROM LKM_SAIDA_GPS_DARF_ITEM2
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA NOT IN
                               ('0588',
                                '1708',
                                '3208',
                                '5952',
                                '5960',
                                '5979',
                                '3280',
                                '2100',
                                'DAM')
                        UNION ALL
                        SELECT DISTINCT LINHA,
                                        Localnegocio COD_FIS_JUR,
                                        TO_CHAR(NUM_DOC_FIS),
                                        ORDEM,
                                        EMPRESA,
                                        DATADOC,
                                        codigo_receita,
                                        fornec
                          FROM LKM_SAIDA_GPS_DARF_ITEM3_M
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA NOT IN
                               ('0588',
                                '1708',
                                '3208',
                                '5952',
                                '5960',
                                '5979',
                                '3280',
                                '2100',
                                'DAM')
                        UNION ALL
                        SELECT DISTINCT LINHA,
                                        Localnegocio COD_FIS_JUR,
                                        TO_CHAR(NUM_DOC_FIS),
                                        ORDEM,
                                        EMPRESA,
                                        DATADOC,
                                        codigo_receita,
                                        fornec
                          FROM LKM_SAIDA_GPS_DARF_ITEM4_J
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA NOT IN
                               ('0588',
                                '1708',
                                '3208',
                                '5952',
                                '5960',
                                '5979',
                                '3280',
                                '2100',
                                'DAM')
                        UNION ALL
                        SELECT DISTINCT LINHA,
                                        Localnegocio COD_FIS_JUR,
                                        TO_CHAR(NUM_DOC_FIS),
                                        ORDEM,
                                        EMPRESA,
                                        DATADOC,
                                        codigo_receita,
                                        fornec
                          FROM LKM_SAIDA_GPS_DARF_ITEM5_E
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA NOT IN
                               ('0588',
                                '1708',
                                '3208',
                                '5952',
                                '5960',
                                '5979',
                                '3280',
                                '2100',
                                'DAM')

                        ---------------------------------------------------------------------------------------------------
                        -- GPS 2100
                        ------------------------------------------------------------------------------------------
                        Union all

                        SELECT DISTINCT LINHA,
                                        COD_FIS_JUR,
                                        Localnegocio NUM_DOC_FIS,
                                        ORDEM,
                                        EMPRESA,
                                        DATADOC,
                                        codigo_receita,
                                        fornec
                          FROM LKM_SAIDA_GPS_DARF_CAPA
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA = '2100'
                        UNION ALL
                        SELECT DISTINCT LINHA,
                                        COD_FIS_JUR,
                                        Localnegocio NUM_DOC_FIS,
                                        ORDEM,
                                        EMPRESA,
                                        DATADOC,
                                        codigo_receita,
                                        fornec
                          FROM LKM_SAIDA_GPS_DARF_ITEM1
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA = '2100'

                        UNION ALL
                        SELECT LINHA,
                               COD_FIS_JUR,
                               Localnegocio NUM_DOC_FIS,
                               ORDEM,
                               EMPRESA,
                               DATADOC,
                               codigo_receita,
                               '' fornec
                          FROM LKM_SAIDA_GPS_DARF_ITEM2
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA = '2100'
                        UNION ALL
                        SELECT DISTINCT LINHA,
                                        COD_FIS_JUR,
                                        Localnegocio NUM_DOC_FIS,
                                        ORDEM,
                                        EMPRESA,
                                        DATADOC,
                                        codigo_receita,
                                        fornec
                          FROM LKM_SAIDA_GPS_DARF_ITEM3_M
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA = '2100'
                        UNION ALL
                        SELECT DISTINCT LINHA,
                                        COD_FIS_JUR,
                                        Localnegocio NUM_DOC_FIS,
                                        ORDEM,
                                        EMPRESA,
                                        DATADOC,
                                        codigo_receita,
                                        fornec
                          FROM LKM_SAIDA_GPS_DARF_ITEM4_J
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA = '2100'
                        UNION ALL
                        SELECT DISTINCT LINHA,
                                        COD_FIS_JUR,
                                        Localnegocio NUM_DOC_FIS,
                                        ORDEM,
                                        EMPRESA,
                                        DATADOC,
                                        codigo_receita,
                                        fornec
                          FROM LKM_SAIDA_GPS_DARF_ITEM5_E
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA = '2100'
                        ----------------------------------------------------------------------------------------------------------
                        -- G E R A - D A R F
                        ----------------------------------------------------------------------------------------------------------
                        UNION ALL
                        SELECT DISTINCT LINHA,
                                        COD_FIS_JUR,
                                        NUM_DOC_FIS,
                                        ORDEM,
                                        EMPRESA,
                                        '0' DATADOC,
                                        codigo_receita,
                                        '' fornec
                          FROM LKM_SAIDA_GPS_DARF_CAPA
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA = '0588'

                        UNION ALL
                        SELECT DISTINCT LINHA,
                                        COD_FIS_JUR,
                                        TO_CHAR(NUM_DOC_FIS),
                                        ORDEM,
                                        EMPRESA,
                                        '0' DATADOC,
                                        codigo_receita,
                                        '' fornec
                          FROM LKM_SAIDA_GPS_DARF_ITEM1
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA = ('0588')

                        UNION ALL
                        SELECT DISTINCT LINHA,
                                        COD_FIS_JUR,
                                        TO_CHAR(NUM_DOC_FIS),
                                        ORDEM,
                                        EMPRESA,
                                        '0' DATADOC,
                                        codigo_receita,
                                        '' fornec
                          FROM LKM_SAIDA_GPS_DARF_ITEM2
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA = ('0588')

                        UNION ALL
                        SELECT DISTINCT LINHA,
                                        COD_FIS_JUR,
                                        TO_CHAR(NUM_DOC_FIS),
                                        ORDEM,
                                        EMPRESA,
                                        '0' DATADOC,
                                        codigo_receita,
                                        '' fornec
                          FROM LKM_SAIDA_GPS_DARF_ITEM3_M
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA = ('0588')

                        UNION ALL
                        SELECT DISTINCT LINHA,
                                        COD_FIS_JUR,
                                        TO_CHAR(NUM_DOC_FIS),
                                        ORDEM,
                                        EMPRESA,
                                        '0' DATADOC,
                                        codigo_receita,
                                        '' fornec
                          FROM LKM_SAIDA_GPS_DARF_ITEM4_J
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA = ('0588')

                        UNION ALL
                        SELECT DISTINCT LINHA,
                                        COD_FIS_JUR,
                                        TO_CHAR(NUM_DOC_FIS),
                                        ORDEM,
                                        EMPRESA,
                                        '0' DATADOC,
                                        codigo_receita,
                                        '' fornec
                          FROM LKM_SAIDA_GPS_DARF_ITEM5_E
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA = ('0588')
                         ORDER BY 7, 3, 8, 2, 4)
                       Select LPAD(ROWNUM, 6, 0) SEQ, L.* from LKM_LOAD L)

         LOOP

          MLINHA       := NULL;
          MLINHA       := LIB_STR.W(MLINHA, MREG.LINHA, 1);
          v_numero_arq := 1;

          IF MLINHA IS NOT NULL THEN
            IF MREG.CODIGO_RECEITA = ('0588') or
               MREG.CODIGO_RECEITA = ('2100') or
               MREG.CODIGO_RECEITA = ('2631') or
               MREG.CODIGO_RECEITA = ('2658') THEN

              v_contador := v_contador + 1;
              IF P_FINALIDADE = 1 THEN
                IF v_contador = 1 THEN

                  LIB_PROC.ADD_TIPO(MPROC_ID,
                                    to_number(1),
                                    EMP || '_0588_DARF_RECON_' ||
                                    trim(to_char(sysdate,
                                                 'ddmmrrrrhh24miss')) ||
                                    '.TXT',
                                    2);

                END IF;

                LIB_PROC.add(plinha          => mLinha,
                             ppag            => 1,
                             plin            => 1,
                             ptipo           => to_number(1),
                             pChaveOrdenacao => MREG.SEQ);

              END IF;

              IF P_FINALIDADE = 3 THEN
                IF v_contador = 1 THEN
                  LIB_PROC.ADD_TIPO(MPROC_ID,
                                    1,
                                    EMP || '_' || PS_ESTAB || '_GPS_RECON_' ||
                                    trim(to_char(sysdate,
                                                 'ddmmrrrrhh24miss')) ||
                                    '.TXT',
                                    2);

                END IF;

                LIB_PROC.add(plinha          => MLINHA,
                             ppag            => 1,
                             plin            => 1,
                             ptipo           => 1,
                             pChaveOrdenacao => MREG.SEQ);

              END IF;

            END IF;
          END IF;
        END LOOP;






--------- Relatorio GPS Patronal 20%

  BEGIN

      FOR MREG99 IN (select 'COD_EMPRESA' || ';' ||
                            'COD_ESTAB' || ';' ||
                            'DAT_FISCAL' || ';' ||
                            'NUM_DOCFIS' || ';' ||
                            'SERIE_DOCFIS' || ';' ||
                            'SUB_SERIE_DOCFIS' || ';' ||
                            'DAT_EMISSAO' || ';' ||
                            'IND_FIS_JUR' || ';' ||
                            'COD_FIS_JUR' || ';' ||
                            'CPF_CGC' || ';' ||
                            'RAZAO_SOCIAL' || ';' ||
                            'VLR_TOT_NOTA' || ';' ||
                            'VLR_SERVICOS' || ';' ||
                            'VLR_ALIQ_INSS' || ';' ||
                            'VLR_INSS_RETIDO' || ';' ||
                            'CGC' || ';' ||
                            'RAZAO_SOCIAL_1' || ';' ||
                            'INSCRICAO_ESTADUAL' || ';' ||
                            'COD_RETENCAO' || ';' ||
                            'DAT_EXTEMP' || ';' ||
                            'IND_RET_EMISS_CPAG_CINDIVIDUAL' || ';' ||
                            'RAZAO_SOCIAL_EMP' || ';' ||
                            'VLR_OUTRAS_ENTID'
                              AS LINHA,
                          0 CHAVE_ORDERN
                      from DUAL
                   UNION ALL
                   select   COD_EMPRESA || ';' ||
                            COD_ESTAB || ';' ||
                            DAT_FISCAL || ';' ||
                            NUM_DOCFIS || ';' ||
                            SERIE_DOCFIS || ';' ||
                            SUB_SERIE_DOCFIS || ';' ||
                            DAT_EMISSAO || ';' ||
                            IND_FIS_JUR || ';' ||
                            COD_FIS_JUR || ';' ||
                            CPF_CGC || ';' ||
                            RAZAO_SOCIAL || ';' ||
                            VLR_TOT_NOTA || ';' ||
                            VLR_SERVICOS || ';' ||
                            VLR_ALIQ_INSS || ';' ||
                            VLR_INSS_RETIDO || ';' ||
                            CGC || ';' ||
                            RAZAO_SOCIAL_1 || ';' ||
                            INSCRICAO_ESTADUAL || ';' ||
                            COD_RETENCAO || ';' ||
                            DAT_EXTEMP || ';' ||
                            IND_RET_EMISS_CPAG_CINDIVIDUAL || ';' ||
                            RAZAO_SOCIAL_EMP || ';' ||
                            VLR_OUTRAS_ENTID
                             AS LINHA,
                          ROWNUM CHAVE_ORDERN

                     from VW_LKM_GPS_RELATORIO_P x
                    where 1 = 1
                         and DECODE(COD_EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000')  = PS_EMPRESA
                      and x.DAT_EMISSAO  between PS_DATA_INICIAL and
                          PS_DATA_FINAL
                    ORDER BY CHAVE_ORDERN)

       LOOP

        MLINHA3 := NULL;
        MLINHA3 := LIB_STR.W(MLINHA3, MREG99.LINHA, 1);
        --v_numero_arq := 1;

        v_contador3 := v_contador3 + 1;
        IF v_contador3 = 1 THEN

          LIB_PROC.ADD_TIPO(MPROC_ID,
                            to_number(99),
                            EMP || '_RELATORIO_GPS_20%_' ||
                            trim(to_char(sysdate, 'ddmmrrrrhh24miss')) ||
                            '.CSV',
                            2);

        END IF;

        LIB_PROC.add(plinha          => mLinha3,
                     ppag            => 1,
                     plin            => 1,
                     ptipo           => to_number(99),
                     pChaveOrdenacao => MREG99.CHAVE_ORDERN);

      END LOOP;
    END;


---------Teste Relatorio GPS


     END;

      -----------------------------------------------DARF QUEBRA----------------------------------------------------------

      ------- 1708
      BEGIN
        v_contador1 := 0;
        FOR MREG2 IN (WITH LKM_LOAD2 as
                         (SELECT DISTINCT LINHA,
                                         COD_FIS_JUR,
                                         NUM_DOC_FIS,
                                         ORDEM,
                                         EMPRESA,
                                         '0' DATADOC,
                                         codigo_receita,
                                         '' fornec
                           FROM LKM_SAIDA_GPS_DARF_CAPA
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = '1708'

                         UNION ALL
                         SELECT DISTINCT LINHA,
                                         COD_FIS_JUR,
                                         TO_CHAR(NUM_DOC_FIS),
                                         ORDEM,
                                         EMPRESA,
                                         '0' DATADOC,
                                         codigo_receita,
                                         '' fornec
                           FROM LKM_SAIDA_GPS_DARF_ITEM1
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = '1708'

                         UNION ALL
                         SELECT DISTINCT LINHA,
                                         COD_FIS_JUR,
                                         TO_CHAR(NUM_DOC_FIS),
                                         ORDEM,
                                         EMPRESA,
                                         '0' DATADOC,
                                         codigo_receita,
                                         fornec
                           FROM LKM_SAIDA_GPS_DARF_ITEM2
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = '1708'

                         UNION ALL
                         SELECT DISTINCT LINHA,
                                         COD_FIS_JUR,
                                         TO_CHAR(NUM_DOC_FIS),
                                         ORDEM,
                                         EMPRESA,
                                         '0' DATADOC,
                                         codigo_receita,
                                         '' fornec
                           FROM LKM_SAIDA_GPS_DARF_ITEM3_M
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = '1708'

                         UNION ALL
                         SELECT DISTINCT LINHA,
                                         COD_FIS_JUR,
                                         TO_CHAR(NUM_DOC_FIS),
                                         ORDEM,
                                         EMPRESA,
                                         '0' DATADOC,
                                         codigo_receita,
                                         '' fornec
                           FROM LKM_SAIDA_GPS_DARF_ITEM4_J
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = '1708'

                         UNION ALL
                         SELECT DISTINCT LINHA,
                                         COD_FIS_JUR,
                                         TO_CHAR(NUM_DOC_FIS),
                                         ORDEM,
                                         EMPRESA,
                                         '0' DATADOC,
                                         codigo_receita,
                                         '' fornec
                           FROM LKM_SAIDA_GPS_DARF_ITEM5_E
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = '1708'

                         /*ORDER BY 7, 3, 2, 4)*/
                          ORDER BY 5, 6)
                        Select LPAD(ROWNUM, 6, 0) SEQ, L.* from LKM_LOAD2 L)

         LOOP

          MLINHA       := NULL;
          MLINHA       := LIB_STR.W(MLINHA, MREG2.LINHA, 2);
          v_numero_arq := 2;
          --  LIB_PROC.ADD(MLINHA);

          IF MLINHA IS NOT NULL THEN

            v_contador1 := v_contador1 + 1;
            IF v_contador1 = 1 THEN

              LIB_PROC.ADD_TIPO(MPROC_ID,
                                to_number(2),
                                EMP || '_1708_DARF_RECON_' ||
                                trim(to_char(sysdate, 'ddmmrrrrhh24miss')) ||
                                '.TXT',
                                2);
            END IF;

            LIB_PROC.add(plinha          => trim(mLinha),
                         ppag            => 1,
                         plin            => 1,
                         ptipo           => to_number(2),
                         pChaveOrdenacao => MREG2.SEQ);

            -- LIB_PROC.ADD_LOG(MLINHA, 1);

          END IF;
        END LOOP;
      END;

      -------- 3208
      BEGIN
        v_contador2 := 0;
        FOR MREG3 IN (WITH LKM_LOAD3 as
                         (SELECT DISTINCT LINHA,
                                         COD_FIS_JUR,
                                         NUM_DOC_FIS,
                                         ORDEM,
                                         EMPRESA,
                                         '0' DATADOC,
                                         codigo_receita
                           FROM LKM_SAIDA_GPS_DARF_CAPA
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = '3208'

                         UNION ALL
                         SELECT DISTINCT LINHA,
                                         COD_FIS_JUR,
                                         TO_CHAR(NUM_DOC_FIS),
                                         ORDEM,
                                         EMPRESA,
                                         '0' DATADOC,
                                         codigo_receita
                           FROM LKM_SAIDA_GPS_DARF_ITEM1
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = '3208'

                         UNION ALL
                         SELECT DISTINCT LINHA,
                                         COD_FIS_JUR,
                                         TO_CHAR(NUM_DOC_FIS),
                                         ORDEM,
                                         EMPRESA,
                                         '0' DATADOC,
                                         codigo_receita
                           FROM LKM_SAIDA_GPS_DARF_ITEM2
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = '3208'

                         UNION ALL
                         SELECT DISTINCT LINHA,
                                         COD_FIS_JUR,
                                         TO_CHAR(NUM_DOC_FIS),
                                         ORDEM,
                                         EMPRESA,
                                         '0' DATADOC,
                                         codigo_receita
                           FROM LKM_SAIDA_GPS_DARF_ITEM3_M
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = '3208'

                         UNION ALL
                         SELECT DISTINCT LINHA,
                                         COD_FIS_JUR,
                                         TO_CHAR(NUM_DOC_FIS),
                                         ORDEM,
                                         EMPRESA,
                                         '0' DATADOC,
                                         codigo_receita
                           FROM LKM_SAIDA_GPS_DARF_ITEM4_J
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = '3208'

                         UNION ALL
                         SELECT DISTINCT LINHA,
                                         COD_FIS_JUR,
                                         TO_CHAR(NUM_DOC_FIS),
                                         ORDEM,
                                         EMPRESA,
                                         '0' DATADOC,
                                         codigo_receita
                           FROM LKM_SAIDA_GPS_DARF_ITEM5_E
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = '3208'

                          ORDER BY 7, 3, 2, 4)
                        Select LPAD(ROWNUM, 6, 0) SEQ, L.* from LKM_LOAD3 L)

         LOOP

          MLINHA       := NULL;
          MLINHA       := LIB_STR.W(MLINHA, MREG3.LINHA, 2);
          v_numero_arq := 3;
          --  LIB_PROC.ADD(MLINHA);

          IF MLINHA IS NOT NULL THEN

            v_contador2 := v_contador2 + 1;
            IF v_contador2 = 1 THEN

              LIB_PROC.ADD_TIPO(MPROC_ID,
                                to_number(3),
                                EMP || '_3208_DARF_RECON_' ||
                                trim(to_char(sysdate, 'ddmmrrrrhh24miss')) ||
                                '.TXT',
                                2);
            END IF;

            LIB_PROC.add(plinha          => trim(mLinha),
                         ppag            => 1,
                         plin            => 1,
                         ptipo           => to_number(3),
                         pChaveOrdenacao => MREG3.SEQ);

            -- LIB_PROC.ADD_LOG(MLINHA, 1);

          END IF;
        END LOOP;
      END;

      ---------------------------  QUEBRA 5952
      BEGIN
        --v_contador3       := 0;
        v_numero_arq_5952 := 0;
        v_q_item          := 0;

        FOR TY_A IN (WITH X AS
                        (SELECT DISTINCT TO_NUMBER(a.cabecalho) ITEM
                          FROM LKM_SAIDA_GPS_DARF_CAPA a
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA = '5952'
                        UNION ALL
                        SELECT DISTINCT TO_NUMBER(ITEM) ITEM
                          FROM LKM_SAIDA_GPS_DARF_ITEM1
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA = '5952'
                        UNION ALL
                        SELECT DISTINCT TO_NUMBER(ITEM) ITEM
                          FROM LKM_SAIDA_GPS_DARF_ITEM2
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA = '5952'
                        UNION ALL
                        SELECT DISTINCT TO_NUMBER(ITEM) ITEM
                          FROM LKM_SAIDA_GPS_DARF_ITEM3_M
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA = '5952'
                        UNION ALL
                        SELECT DISTINCT TO_NUMBER(ITEM) ITEM
                          FROM LKM_SAIDA_GPS_DARF_ITEM4_J
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA = '5952'
                        UNION ALL
                        SELECT DISTINCT TO_NUMBER(ITEM) ITEM
                          FROM LKM_SAIDA_GPS_DARF_ITEM5_E
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA = '5952')
                       SELECT DISTINCT ITEM FROM X ORDER BY 1) LOOP

          v_numero_arq_5952 := TO_NUMBER(TY_A.ITEM) + 15;
          v_q_iteM          := TY_A.ITEM;

          LIB_PROC.ADD_TIPO(MPROC_ID,
                            to_number(v_numero_arq_5952),
                            EMP || '_' || v_q_iteM || '_5952_DARF_RECON_' ||
                            trim(to_char(sysdate, 'ddmmrrrrhh24miss')) ||
                            '.TXT',
                            2);

          FOR MREG4 IN (WITH LKM_LOAD4 as
                           (SELECT DISTINCT to_char(CABECALHO) ITEM,
                                           LINHA,
                                           COD_FIS_JUR,
                                           NUM_DOC_FIS,
                                           ORDEM,
                                           EMPRESA,
                                           '0' DATADOC,
                                           codigo_receita,
                                           '' fornec
                             FROM LKM_SAIDA_GPS_DARF_CAPA
                            WHERE DECODE(EMPRESA,
                                         '1000',
                                         '001',
                                         '2000',
                                         '002',
                                         '000') = PS_EMPRESA
                              AND DATADOC BETWEEN
                                  TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                  TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                              AND CODIGO_RECEITA = '5952'

                           UNION ALL
                           SELECT DISTINCT to_char(ITEM),
                                           LINHA,
                                           COD_FIS_JUR,
                                           TO_CHAR(NUM_DOC_FIS),
                                           ORDEM,
                                           EMPRESA,
                                           '0' DATADOC,
                                           codigo_receita,
                                           '' fornec
                             FROM LKM_SAIDA_GPS_DARF_ITEM1
                            WHERE DECODE(EMPRESA,
                                         '1000',
                                         '001',
                                         '2000',
                                         '002',
                                         '000') = PS_EMPRESA
                              AND DATADOC BETWEEN
                                  TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                  TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                              AND CODIGO_RECEITA = '5952'

                           UNION ALL
                           SELECT DISTINCT to_char(ITEM),
                                           LINHA,
                                           COD_FIS_JUR,
                                           TO_CHAR(NUM_DOC_FIS),
                                           ORDEM,
                                           EMPRESA,
                                           '0' DATADOC,
                                           codigo_receita,
                                           fornec
                             FROM LKM_SAIDA_GPS_DARF_ITEM2
                            WHERE DECODE(EMPRESA,
                                         '1000',
                                         '001',
                                         '2000',
                                         '002',
                                         '000') = PS_EMPRESA
                              AND DATADOC BETWEEN
                                  TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                  TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                              AND CODIGO_RECEITA = '5952'

                           UNION ALL
                           SELECT DISTINCT to_char(ITEM),
                                           LINHA,
                                           COD_FIS_JUR,
                                           TO_CHAR(NUM_DOC_FIS),
                                           ORDEM,
                                           EMPRESA,
                                           '0' DATADOC,
                                           codigo_receita,
                                           '' fornec
                             FROM LKM_SAIDA_GPS_DARF_ITEM3_M
                            WHERE DECODE(EMPRESA,
                                         '1000',
                                         '001',
                                         '2000',
                                         '002',
                                         '000') = PS_EMPRESA
                              AND DATADOC BETWEEN
                                  TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                  TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                              AND CODIGO_RECEITA = '5952'

                           UNION ALL
                           SELECT DISTINCT to_char(ITEM),
                                           LINHA,
                                           COD_FIS_JUR,
                                           TO_CHAR(NUM_DOC_FIS),
                                           ORDEM,
                                           EMPRESA,
                                           '0' DATADOC,
                                           codigo_receita,
                                           '' fornec
                             FROM LKM_SAIDA_GPS_DARF_ITEM4_J
                            WHERE DECODE(EMPRESA,
                                         '1000',
                                         '001',
                                         '2000',
                                         '002',
                                         '000') = PS_EMPRESA
                              AND DATADOC BETWEEN
                                  TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                  TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                              AND CODIGO_RECEITA = '5952'

                           UNION ALL
                           SELECT DISTINCT to_char(ITEM),
                                           LINHA,
                                           COD_FIS_JUR,
                                           TO_CHAR(NUM_DOC_FIS),
                                           ORDEM,
                                           EMPRESA,
                                           '0' DATADOC,
                                           codigo_receita,
                                           '' fornec
                             FROM LKM_SAIDA_GPS_DARF_ITEM5_E
                            WHERE DECODE(EMPRESA,
                                         '1000',
                                         '001',
                                         '2000',
                                         '002',
                                         '000') = PS_EMPRESA
                              AND DATADOC BETWEEN
                                  TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                  TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                              AND CODIGO_RECEITA = '5952'

                            ORDER BY 5, 6, 4)
                          Select LPAD(ROWNUM, 6, 0) SEQ, L.*
                            from LKM_LOAD4 L
                           where to_char(ITEM) = to_char(v_q_iteM)) --TY_A.ITEM

           LOOP

            MLINHA := NULL;
            MLINHA := LIB_STR.W(replace(trim(MLINHA), ' ', ''),
                                replace(trim(MREG4.LINHA), ' ', ''),
                                2);

            IF MLINHA IS NOT NULL THEN

              LIB_PROC.add(plinha          => trim(mLinha),
                           ppag            => 1,
                           plin            => 1,
                           ptipo           => to_number(TY_A.ITEM + 15),
                           pChaveOrdenacao => MREG4.SEQ);
            END IF;

          END LOOP;
        END LOOP;
      END;

      -------5960
      BEGIN
        v_contador4 := 0;
        FOR MREG5 IN (WITH LKM_LOAD5 as
                         (SELECT DISTINCT LINHA,
                                         COD_FIS_JUR,
                                         NUM_DOC_FIS,
                                         ORDEM,
                                         EMPRESA,
                                         '0' DATADOC,
                                         codigo_receita
                           FROM LKM_SAIDA_GPS_DARF_CAPA
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = '5960'

                         UNION ALL
                         SELECT DISTINCT LINHA,
                                         COD_FIS_JUR,
                                         TO_CHAR(NUM_DOC_FIS),
                                         ORDEM,
                                         EMPRESA,
                                         '0' DATADOC,
                                         codigo_receita
                           FROM LKM_SAIDA_GPS_DARF_ITEM1
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = '5960'

                         UNION ALL
                         SELECT DISTINCT LINHA,
                                         COD_FIS_JUR,
                                         TO_CHAR(NUM_DOC_FIS),
                                         ORDEM,
                                         EMPRESA,
                                         '0' DATADOC,
                                         codigo_receita
                           FROM LKM_SAIDA_GPS_DARF_ITEM2
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = '5960'

                         UNION ALL
                         SELECT DISTINCT LINHA,
                                         COD_FIS_JUR,
                                         TO_CHAR(NUM_DOC_FIS),
                                         ORDEM,
                                         EMPRESA,
                                         '0' DATADOC,
                                         codigo_receita
                           FROM LKM_SAIDA_GPS_DARF_ITEM3_M
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = '5960'

                         UNION ALL
                         SELECT DISTINCT LINHA,
                                         COD_FIS_JUR,
                                         TO_CHAR(NUM_DOC_FIS),
                                         ORDEM,
                                         EMPRESA,
                                         '0' DATADOC,
                                         codigo_receita
                           FROM LKM_SAIDA_GPS_DARF_ITEM4_J
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = '5960'

                         UNION ALL
                         SELECT DISTINCT LINHA,
                                         COD_FIS_JUR,
                                         TO_CHAR(NUM_DOC_FIS),
                                         ORDEM,
                                         EMPRESA,
                                         '0' DATADOC,
                                         codigo_receita
                           FROM LKM_SAIDA_GPS_DARF_ITEM5_E
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = '5960'

                          ORDER BY 7, 3, 2, 4)
                        Select LPAD(ROWNUM, 6, 0) SEQ, L.* from LKM_LOAD5 L)

         LOOP

          MLINHA       := NULL;
          MLINHA       := LIB_STR.W(MLINHA, MREG5.LINHA, 2);
          v_numero_arq := 5;
          --  LIB_PROC.ADD(MLINHA);

          IF MLINHA IS NOT NULL THEN

            v_contador4 := v_contador4 + 1;
            IF v_contador4 = 1 THEN

              LIB_PROC.ADD_TIPO(MPROC_ID,
                                to_number(5),
                                EMP || '_5960_DARF_RECON_' ||
                                trim(to_char(sysdate, 'ddmmrrrrhh24miss')) ||
                                '.TXT',
                                2);
            END IF;

            LIB_PROC.add(plinha          => trim(mLinha),
                         ppag            => 1,
                         plin            => 1,
                         ptipo           => to_number(5),
                         pChaveOrdenacao => MREG5.SEQ);

            -- LIB_PROC.ADD_LOG(MLINHA, 1);

          END IF;
        END LOOP;
      END;

      -------5979
      BEGIN
        v_contador5 := 0;
        FOR MREG6 IN (WITH LKM_LOAD6 as
                         (SELECT DISTINCT LINHA,
                                         COD_FIS_JUR,
                                         NUM_DOC_FIS,
                                         ORDEM,
                                         EMPRESA,
                                         '0' DATADOC,
                                         codigo_receita
                           FROM LKM_SAIDA_GPS_DARF_CAPA
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = '5979'

                         UNION ALL
                         SELECT DISTINCT LINHA,
                                         COD_FIS_JUR,
                                         TO_CHAR(NUM_DOC_FIS),
                                         ORDEM,
                                         EMPRESA,
                                         '0' DATADOC,
                                         codigo_receita
                           FROM LKM_SAIDA_GPS_DARF_ITEM1
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = '5979'
                         UNION ALL
                         SELECT DISTINCT LINHA,
                                         COD_FIS_JUR,
                                         TO_CHAR(NUM_DOC_FIS),
                                         ORDEM,
                                         EMPRESA,
                                         '0' DATADOC,
                                         codigo_receita
                           FROM LKM_SAIDA_GPS_DARF_ITEM2
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = '5979'

                         UNION ALL
                         SELECT DISTINCT LINHA,
                                         COD_FIS_JUR,
                                         TO_CHAR(NUM_DOC_FIS),
                                         ORDEM,
                                         EMPRESA,
                                         '0' DATADOC,
                                         codigo_receita
                           FROM LKM_SAIDA_GPS_DARF_ITEM3_M
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = '5979'

                         UNION ALL
                         SELECT DISTINCT LINHA,
                                         COD_FIS_JUR,
                                         TO_CHAR(NUM_DOC_FIS),
                                         ORDEM,
                                         EMPRESA,
                                         '0' DATADOC,
                                         codigo_receita
                           FROM LKM_SAIDA_GPS_DARF_ITEM4_J
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = '5979'

                         UNION ALL
                         SELECT DISTINCT LINHA,
                                         COD_FIS_JUR,
                                         TO_CHAR(NUM_DOC_FIS),
                                         ORDEM,
                                         EMPRESA,
                                         '0' DATADOC,
                                         codigo_receita
                           FROM LKM_SAIDA_GPS_DARF_ITEM5_E
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = '5979'

                          ORDER BY 7, 3, 2, 4)
                        Select LPAD(ROWNUM, 6, 0) SEQ, L.* from LKM_LOAD6 L)

         LOOP

          MLINHA       := NULL;
          MLINHA       := LIB_STR.W(MLINHA, MREG6.LINHA, 2);
          v_numero_arq := 6;
          --  LIB_PROC.ADD(MLINHA);

          IF MLINHA IS NOT NULL THEN

            v_contador5 := v_contador5 + 1;
            IF v_contador5 = 1 THEN

              LIB_PROC.ADD_TIPO(MPROC_ID,
                                to_number(6),
                                EMP || '_5979_DARF_RECON_' ||
                                trim(to_char(sysdate, 'ddmmrrrrhh24miss')) ||
                                '.TXT',
                                2);
            END IF;

            LIB_PROC.add(plinha          => trim(mLinha),
                         ppag            => 1,
                         plin            => 1,
                         ptipo           => to_number(6),
                         pChaveOrdenacao => MREG6.SEQ);

            -- LIB_PROC.ADD_LOG(MLINHA, 1);

          END IF;
        END LOOP;
      END;

      -------3280
      BEGIN
        v_contador6 := 0;
        FOR MREG7 IN (WITH LKM_LOAD7 as
                         (SELECT DISTINCT LINHA,
                                         COD_FIS_JUR,
                                         NUM_DOC_FIS,
                                         ORDEM,
                                         EMPRESA,
                                         '0' DATADOC,
                                         codigo_receita
                           FROM LKM_SAIDA_GPS_DARF_CAPA
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = '3280'

                         UNION ALL
                         SELECT DISTINCT LINHA,
                                         COD_FIS_JUR,
                                         TO_CHAR(NUM_DOC_FIS),
                                         ORDEM,
                                         EMPRESA,
                                         '0' DATADOC,
                                         codigo_receita
                           FROM LKM_SAIDA_GPS_DARF_ITEM1
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = '3280'

                         UNION ALL
                         SELECT DISTINCT LINHA,
                                         COD_FIS_JUR,
                                         TO_CHAR(NUM_DOC_FIS),
                                         ORDEM,
                                         EMPRESA,
                                         '0' DATADOC,
                                         codigo_receita
                           FROM LKM_SAIDA_GPS_DARF_ITEM2
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = '3280'

                         UNION ALL
                         SELECT DISTINCT LINHA,
                                         COD_FIS_JUR,
                                         TO_CHAR(NUM_DOC_FIS),
                                         ORDEM,
                                         EMPRESA,
                                         '0' DATADOC,
                                         codigo_receita
                           FROM LKM_SAIDA_GPS_DARF_ITEM3_M
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = '3280'

                         UNION ALL
                         SELECT DISTINCT LINHA,
                                         COD_FIS_JUR,
                                         TO_CHAR(NUM_DOC_FIS),
                                         ORDEM,
                                         EMPRESA,
                                         '0' DATADOC,
                                         codigo_receita
                           FROM LKM_SAIDA_GPS_DARF_ITEM4_J
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = '3280'

                         UNION ALL
                         SELECT DISTINCT LINHA,
                                         COD_FIS_JUR,
                                         TO_CHAR(NUM_DOC_FIS),
                                         ORDEM,
                                         EMPRESA,
                                         '0' DATADOC,
                                         codigo_receita
                           FROM LKM_SAIDA_GPS_DARF_ITEM5_E
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = '3280'

                          ORDER BY 7, 3, 2, 4)
                        Select LPAD(ROWNUM, 6, 0) SEQ, L.* from LKM_LOAD7 L)

         LOOP

          MLINHA       := NULL;
          MLINHA       := LIB_STR.W(MLINHA, MREG7.LINHA, 2);
          v_numero_arq := 7;
          --  LIB_PROC.ADD(MLINHA);

          IF MLINHA IS NOT NULL THEN

            v_contador6 := v_contador6 + 1;
            IF v_contador6 = 1 THEN

              LIB_PROC.ADD_TIPO(MPROC_ID,
                                to_number(7),
                                EMP || '_3280_DARF_RECON_' ||
                                trim(to_char(sysdate, 'ddmmrrrrhh24miss')) ||
                                '.TXT',
                                2);
            END IF;

            LIB_PROC.add(plinha          => trim(mLinha),
                         ppag            => 1,
                         plin            => 1,
                         ptipo           => to_number(7),
                         pChaveOrdenacao => MREG7.SEQ);

            -- LIB_PROC.ADD_LOG(MLINHA, 1);

          END IF;
        END LOOP;
      END;

    END IF;


    ------------------------------------------------------------------------------------------------------------
    -- G E R A -  R E I N F  + E S O C I A L
    -----------------------------------------------------------------------------------------------------------

    IF (P_FINALIDADE = '4') THEN

      BEGIN


        LIB_PROC.ADD_TIPO(MPROC_ID,
                                    to_number(78),
                                    EMP || '_' || PS_ESTAB || '_ESOCIAL_RECON_' ||
                                    trim(to_char(sysdate,
                                                 'ddmmrrrrhh24miss')) ||
                                    '.TXT',
                                    2);


        LIB_PROC.ADD_TIPO(MPROC_ID,
                                    to_number(77),
                                    EMP || '_' || PS_ESTAB || '_REINF_RECON_' ||
                                    trim(to_char(sysdate,
                                                 'ddmmrrrrhh24miss')) ||
                                    '.TXT',
                                    2);

        FOR MREG IN (WITH LKM_LOAD as
                       -- REINF OUTRO
                        (SELECT DISTINCT TIPO, LINHA,
                                        Localnegocio COD_FIS_JUR,
                                        NUM_DOC_FIS,
                                        ORDEM,
                                        EMPRESA,
                                        DATADOC,
                                        codigo_receita,
                                        fornec
                          FROM msaf.LKM_SAIDA_REINF_DARF_CAPA
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA NOT IN
                               ('0588',
                                '1708',
                                '3208',
                                '5952',
                                '5960',
                                '5979',
                                '3280',
                                '2100',
                                'DAM')
                        UNION ALL
                        SELECT DISTINCT TIPO, LINHA,
                                        Localnegocio COD_FIS_JUR,
                                        TO_CHAR(NUM_DOC_FIS),
                                        ORDEM,
                                        EMPRESA,
                                        DATADOC,
                                        codigo_receita,
                                        fornec
                          FROM LKM_SAIDA_REINF_DARF_ITEM1
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA NOT IN
                               ('0588',
                                '1708',
                                '3208',
                                '5952',
                                '5960',
                                '5979',
                                '3280',
                                '2100',
                                'DAM')

                        UNION ALL
                        SELECT DISTINCT TIPO, LINHA,
                                        Localnegocio COD_FIS_JUR,
                                        TO_CHAR(NUM_DOC_FIS),
                                        ORDEM,
                                        EMPRESA,
                                        DATADOC,
                                        codigo_receita,
                                        fornec
                          FROM LKM_SAIDA_REINF_DARF_ITEM2
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA NOT IN
                               ('0588',
                                '1708',
                                '3208',
                                '5952',
                                '5960',
                                '5979',
                                '3280',
                                '2100',
                                'DAM')
                        UNION ALL
                        SELECT DISTINCT TIPO, LINHA,
                                        Localnegocio COD_FIS_JUR,
                                        TO_CHAR(NUM_DOC_FIS),
                                        ORDEM,
                                        EMPRESA,
                                        DATADOC,
                                        codigo_receita,
                                        fornec
                          FROM LKM_SAIDA_REINF_DARF_ITEM3_M
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA NOT IN
                               ('0588',
                                '1708',
                                '3208',
                                '5952',
                                '5960',
                                '5979',
                                '3280',
                                '2100',
                                'DAM')
                        UNION ALL
                        SELECT DISTINCT TIPO, LINHA,
                                        Localnegocio COD_FIS_JUR,
                                        TO_CHAR(NUM_DOC_FIS),
                                        ORDEM,
                                        EMPRESA,
                                        DATADOC,
                                        codigo_receita,
                                        fornec
                          FROM LKM_SAIDA_REINF_DARF_ITEM4_J
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA NOT IN
                               ('0588',
                                '1708',
                                '3208',
                                '5952',
                                '5960',
                                '5979',
                                '3280',
                                '2100',
                                'DAM')
                        UNION ALL
                        SELECT DISTINCT TIPO, LINHA,
                                        Localnegocio COD_FIS_JUR,
                                        TO_CHAR(NUM_DOC_FIS),
                                        ORDEM,
                                        EMPRESA,
                                        DATADOC,
                                        codigo_receita,
                                        fornec
                          FROM LKM_SAIDA_REINF_DARF_ITEM5_E
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA NOT IN
                               ('0588',
                                '1708',
                                '3208',
                                '5952',
                                '5960',
                                '5979',
                                '3280',
                                '2100',
                                'DAM')

                        ---------------------------------------------------------------------------------------------------
                        -- REINF 2100
                        ------------------------------------------------------------------------------------------
                        Union all

                        SELECT DISTINCT TIPO, LINHA,
                                        COD_FIS_JUR,
                                        Localnegocio NUM_DOC_FIS,
                                        ORDEM,
                                        EMPRESA,
                                        DATADOC,
                                        codigo_receita,
                                        fornec
                          FROM LKM_SAIDA_REINF_DARF_CAPA
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA = '2100'
                        UNION ALL
                        SELECT DISTINCT TIPO, LINHA,
                                        COD_FIS_JUR,
                                        Localnegocio NUM_DOC_FIS,
                                        ORDEM,
                                        EMPRESA,
                                        DATADOC,
                                        codigo_receita,
                                        fornec
                          FROM LKM_SAIDA_REINF_DARF_ITEM1
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA = '2100'

                        UNION ALL
                        SELECT TIPO, LINHA,
                               COD_FIS_JUR,
                               Localnegocio NUM_DOC_FIS,
                               ORDEM,
                               EMPRESA,
                               DATADOC,
                               codigo_receita,
                               '' fornec
                          FROM LKM_SAIDA_REINF_DARF_ITEM2
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA = '2100'
                        UNION ALL
                        SELECT DISTINCT TIPO, LINHA,
                                        COD_FIS_JUR,
                                        Localnegocio NUM_DOC_FIS,
                                        ORDEM,
                                        EMPRESA,
                                        DATADOC,
                                        codigo_receita,
                                        fornec
                          FROM LKM_SAIDA_REINF_DARF_ITEM3_M
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA = '2100'
                        UNION ALL
                        SELECT DISTINCT TIPO, LINHA,
                                        COD_FIS_JUR,
                                        Localnegocio NUM_DOC_FIS,
                                        ORDEM,
                                        EMPRESA,
                                        DATADOC,
                                        codigo_receita,
                                        fornec
                          FROM LKM_SAIDA_REINF_DARF_ITEM4_J
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA = '2100'
                        UNION ALL
                        SELECT DISTINCT TIPO, LINHA,
                                        COD_FIS_JUR,
                                        Localnegocio NUM_DOC_FIS,
                                        ORDEM,
                                        EMPRESA,
                                        DATADOC,
                                        codigo_receita,
                                        fornec
                          FROM LKM_SAIDA_REINF_DARF_ITEM5_E
                         WHERE DECODE(EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000') = PS_EMPRESA
                           AND DATADOC BETWEEN
                               TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                               TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                           AND CODIGO_RECEITA = '2100'
                         ORDER BY 1, 8, 4, 9, 3, 5)
                       Select LPAD(ROWNUM, 6, 0) SEQ, L.* from LKM_LOAD L)

         LOOP

          MLINHA       := NULL;
          MLINHA       := LIB_STR.W(MLINHA, MREG.LINHA, 1);
          v_numero_arq := 1;
          v_contador_REINF := v_contador_REINF + 1 ;
          v_contador_ESOCIAL := v_contador_ESOCIAL + 1;

          IF MLINHA IS NOT NULL THEN
            IF MREG.CODIGO_RECEITA = ('0588') or
               MREG.CODIGO_RECEITA = ('2100') or
               MREG.CODIGO_RECEITA = ('2631') or
               MREG.CODIGO_RECEITA = ('2658') THEN



              IF P_FINALIDADE = 4 THEN
               IF  MREG.Tipo = 'REINF' THEN

                LIB_PROC.add(plinha          => MLINHA,
                             ppag            => 1,
                             plin            => 1,
                             ptipo           => to_number(77),
                             pChaveOrdenacao => MREG.SEQ);

               END IF;
              END IF;


              IF P_FINALIDADE = 4 THEN
               IF  MREG.Tipo = 'ESOCIAL' THEN

                LIB_PROC.add(plinha          => MLINHA,
                             ppag            => 1,
                             plin            => 1,
                             ptipo           => to_number(78),
                             pChaveOrdenacao => MREG.SEQ);

               END IF;
              END IF;

            END IF;
          END IF;
        END LOOP;


--------- Relatorio GPS Patronal 20%

  BEGIN

      FOR MREG99 IN (select 'COD_EMPRESA' || ';' ||
                            'COD_ESTAB' || ';' ||
                            'DAT_FISCAL' || ';' ||
                            'NUM_DOCFIS' || ';' ||
                            'SERIE_DOCFIS' || ';' ||
                            'SUB_SERIE_DOCFIS' || ';' ||
                            'DAT_EMISSAO' || ';' ||
                            'IND_FIS_JUR' || ';' ||
                            'COD_FIS_JUR' || ';' ||
                            'CPF_CGC' || ';' ||
                            'RAZAO_SOCIAL' || ';' ||
                            'VLR_TOT_NOTA' || ';' ||
                            'VLR_SERVICOS' || ';' ||
                            'VLR_ALIQ_INSS' || ';' ||
                            'VLR_INSS_RETIDO' || ';' ||
                            'CGC' || ';' ||
                            'RAZAO_SOCIAL_1' || ';' ||
                            'INSCRICAO_ESTADUAL' || ';' ||
                            'COD_RETENCAO' || ';' ||
                            'DAT_EXTEMP' || ';' ||
                            'IND_RET_EMISS_CPAG_CINDIVIDUAL' || ';' ||
                            'RAZAO_SOCIAL_EMP' || ';' ||
                            'VLR_OUTRAS_ENTID'
                              AS LINHA,
                          0 CHAVE_ORDERN
                      from DUAL
                   UNION ALL
                   select   COD_EMPRESA || ';' ||
                            COD_ESTAB || ';' ||
                            DAT_FISCAL || ';' ||
                            NUM_DOCFIS || ';' ||
                            SERIE_DOCFIS || ';' ||
                            SUB_SERIE_DOCFIS || ';' ||
                            DAT_EMISSAO || ';' ||
                            IND_FIS_JUR || ';' ||
                            COD_FIS_JUR || ';' ||
                            CPF_CGC || ';' ||
                            RAZAO_SOCIAL || ';' ||
                            VLR_TOT_NOTA || ';' ||
                            VLR_SERVICOS || ';' ||
                            VLR_ALIQ_INSS || ';' ||
                            VLR_INSS_RETIDO || ';' ||
                            CGC || ';' ||
                            RAZAO_SOCIAL_1 || ';' ||
                            INSCRICAO_ESTADUAL || ';' ||
                            COD_RETENCAO || ';' ||
                            DAT_EXTEMP || ';' ||
                            IND_RET_EMISS_CPAG_CINDIVIDUAL || ';' ||
                            RAZAO_SOCIAL_EMP || ';' ||
                            VLR_OUTRAS_ENTID
                             AS LINHA,
                          ROWNUM CHAVE_ORDERN

                     from VW_LKM_GPS_RELATORIO_P x
                    where 1 = 1
                         and DECODE(COD_EMPRESA,
                                      '1000',
                                      '001',
                                      '2000',
                                      '002',
                                      '000')  = PS_EMPRESA
                      and x.DAT_EMISSAO  between PS_DATA_INICIAL and
                          PS_DATA_FINAL
                    ORDER BY CHAVE_ORDERN)

       LOOP

        MLINHA3 := NULL;
        MLINHA3 := LIB_STR.W(MLINHA3, MREG99.LINHA, 1);
        --v_numero_arq := 1;

        v_contador3 := v_contador3 + 1;
        IF v_contador3 = 1 THEN

          LIB_PROC.ADD_TIPO(MPROC_ID,
                            to_number(99),
                            EMP || '_RELATORIO_GPS_20%_' ||
                            trim(to_char(sysdate, 'ddmmrrrrhh24miss')) ||
                            '.CSV',
                            2);

        END IF;

        LIB_PROC.add(plinha          => mLinha3,
                     ppag            => 1,
                     plin            => 1,
                     ptipo           => to_number(99),
                     pChaveOrdenacao => MREG99.CHAVE_ORDERN);

      END LOOP;
    END;


---------Teste Relatorio REINF





     END;

    END IF;

    ------------------------------------------------------------------------------------------------------------
    -- G E R A -  D A M
    -----------------------------------------------------------------------------------------------------------

    IF (P_FINALIDADE = '2') OR (P_FINALIDADE = '5' ) THEN

      BEGIN
        v_contador7 := 0;
        FOR MREG9 IN (WITH LKM_LOAD as
                         (SELECT DISTINCT LINHA,
                                         Localnegocio COD_FIS_JUR,
                                         NUM_DOC_FIS,
                                         ORDEM,
                                         EMPRESA,
                                         DATADOC,
                                         codigo_receita,
                                         fornec
                           FROM LKM_SAIDA_GPS_DARF_CAPA
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = 'DAM'
                         UNION ALL
                         SELECT DISTINCT LINHA,
                                         Localnegocio COD_FIS_JUR,
                                         TO_CHAR(NUM_DOC_FIS),
                                         ORDEM,
                                         EMPRESA,
                                         DATADOC,
                                         codigo_receita,
                                         fornec
                           FROM LKM_SAIDA_GPS_DARF_ITEM1
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND localnegocio = PS_ESTAB
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = 'DAM'

                         UNION ALL
                         SELECT DISTINCT LINHA,
                                         Localnegocio COD_FIS_JUR,
                                         TO_CHAR(NUM_DOC_FIS),
                                         ORDEM,
                                         EMPRESA,
                                         DATADOC,
                                         codigo_receita,
                                         fornec
                           FROM LKM_SAIDA_GPS_DARF_ITEM2
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND localnegocio = PS_ESTAB
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = 'DAM'
                         UNION ALL
                         SELECT DISTINCT LINHA,
                                         Localnegocio COD_FIS_JUR,
                                         TO_CHAR(NUM_DOC_FIS),
                                         ORDEM,
                                         EMPRESA,
                                         DATADOC,
                                         codigo_receita,
                                         fornec
                           FROM LKM_SAIDA_GPS_DARF_ITEM3_M
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND localnegocio = PS_ESTAB
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = 'DAM'
                         UNION ALL
                         SELECT DISTINCT LINHA,
                                         Localnegocio COD_FIS_JUR,
                                         TO_CHAR(NUM_DOC_FIS),
                                         ORDEM,
                                         EMPRESA,
                                         DATADOC,
                                         codigo_receita,
                                         fornec
                           FROM LKM_SAIDA_GPS_DARF_ITEM4_J
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND localnegocio = PS_ESTAB
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = 'DAM'
                         UNION ALL
                         SELECT DISTINCT LINHA,
                                         Localnegocio COD_FIS_JUR,
                                         TO_CHAR(NUM_DOC_FIS),
                                         ORDEM,
                                         EMPRESA,
                                         DATADOC,
                                         codigo_receita,
                                         fornec
                           FROM LKM_SAIDA_GPS_DARF_ITEM5_E
                          WHERE DECODE(EMPRESA,
                                       '1000',
                                       '001',
                                       '2000',
                                       '002',
                                       '000') = PS_EMPRESA
                            AND localnegocio = PS_ESTAB
                            AND DATADOC BETWEEN
                                TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                            AND CODIGO_RECEITA = 'DAM'

                          ORDER BY 6, 3, 4)
                        Select LPAD(ROWNUM, 6, 0) SEQ, L.* from LKM_LOAD L)

         LOOP

          MLINHA2      := NULL;
          MLINHA2      := LIB_STR.W(MLINHA2, MREG9.LINHA, 1);
          v_numero_arq := 1;

          IF MLINHA2 IS NOT NULL THEN

            IF MREG9.CODIGO_RECEITA = 'DAM' THEN

              v_contador7 := v_contador7 + 1;

              IF v_contador7 = 1 THEN
                LIB_PROC.ADD_TIPO(MPROC_ID,
                                  to_number(9),
                                  EMP || '_' || PS_ESTAB || '_DAM_RECON_' ||
                                  trim(to_char(sysdate, 'ddmmrrrrhh24miss')) ||
                                  '.TXT',
                                  2);
              END IF;

              LIB_PROC.add(plinha          => MLINHA2,
                           ppag            => 1,
                           plin            => 1,
                           ptipo           => to_number(9),
                           pChaveOrdenacao => MREG9.SEQ);

            END IF;
          END IF;

        END LOOP;
      END;

    END IF;

  END LKM_PLOAD;

  -----------------------------------------------------------------------------------------------------------------------------
  ----------------------------------------------------------------
  -- R E L A T O R I O - R O D A  P E  - E - C A B E C A L H O  --
  ----------------------------------------------------------------

  PROCEDURE RELATORIO IS

  BEGIN

    IF VN_LINHA >= 47 THEN

      VS_MLINHA := LIB_STR.W(VS_MLINHA, LPAD('-', 179, '-'), 1);
      LIB_PROC.ADD(VS_MLINHA);

      VS_MLINHA := NULL;
      VS_MLINHA := LIB_STR.W(VS_MLINHA,
                             'DESENVOLVIDO POR LKM TECNOLOGIA LTDA  - 2019',
                             1);
      LIB_PROC.ADD(VS_MLINHA);

      VS_MLINHA := NULL;
      VS_MLINHA := LIB_STR.W(VS_MLINHA, LPAD('-', 179, '-'), 1);
      LIB_PROC.ADD(VS_MLINHA);

      VN_LINHA := VN_LINHA + 1;

    END IF;

  END RELATORIO;

  PROCEDURE CABECALHO(PS_EMPRESA VARCHAR2,
                      PS_DATA_INICIAL DATE,
                      PS_DATA_FINAL   DATE) IS

  BEGIN

    IF VN_LINHA >= 48 THEN
      VS_MLINHA := NULL;
      VS_MLINHA := LIB_STR.W(VS_MLINHA, 'EMPRESA    : ' || PS_EMPRESA, 1);
      VS_MLINHA := LIB_STR.W(VS_MLINHA,
                             'PAGINA : ' || LPAD(VN_PAGINA, 5, '0'),
                             136);
      LIB_PROC.ADD(VS_MLINHA);

      VS_MLINHA := NULL;
      VS_MLINHA := LIB_STR.W(VS_MLINHA,
                             'PERIODO    : ' ||
                             TO_CHAR(PS_DATA_INICIAL, 'DD/MM/YYYY') ||
                             ' ATE ' || TO_CHAR(PS_DATA_FINAL, 'DD/MM/YYYY'),
                             1);
      VS_MLINHA := LIB_STR.W(VS_MLINHA,
                             'DATA DE PROCESSAMENTO : ' ||
                             TO_CHAR(SYSDATE, 'DD/MM/RRRR HH24:MI:SS'),
                             107);
      LIB_PROC.ADD(VS_MLINHA);

      VS_MLINHA := NULL;
      VS_MLINHA := LIB_STR.W(VS_MLINHA, LPAD('-', 150, '-'), 1);
      LIB_PROC.ADD(VS_MLINHA);

      VS_MLINHA := NULL;
      VS_MLINHA := LIB_STR.W(VS_MLINHA,
                             '                            * * *    D O C U M E N T O S   C O M   R E T E N C A O    P A R A   P A G A M E N T O    * * *',
                             1);
      LIB_PROC.ADD(VS_MLINHA);

      VS_MLINHA := NULL;
      VS_MLINHA := LIB_STR.W(VS_MLINHA, LPAD('-', 179, '-'), 1);
      LIB_PROC.ADD(VS_MLINHA);

      --'                            * * *    D O C U M E N T O S   C O M   R E T E N C ? O    P A R A   P A G A M E N T O    * * *'
      --|COD_EMP|DAT_DOC |DAT_LANCTO|ANO |MES|RENT|FORNEC   |COD_REC|CENTRO| VL_BRUTO   | MULTA      | JUROS      | VL_TRIB    |NUM_DOCFIS|
      --|.......|........|..........|....|...|....|.........|.......|......|............|............|............|............|..........|
      --|1000...|12122017|12122017..|2017|12.|DARF|100089337|0588...|1001..|000000170985|000000000000|000000000000|000000450000|000000001.|

      VS_MLINHA := NULL;
      VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 1);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, 'EMP', 3);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 8);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, 'DDOC', 10);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 19);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, 'DLANC', 21);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 30);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, 'ANO', 32);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 37);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, 'MES', 39);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 42);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, 'CRET', 44);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 49);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, 'FGOV', 51);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 61);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, 'CRECT', 63);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 67);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, 'CC', 69);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 74);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, 'VL_BRUTO', 76);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 92);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, 'VL_TRIB', 94);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 110);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, 'NOTA', 112);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 126);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, 'PF/PJ', 128);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 138);
      LIB_PROC.ADD(VS_MLINHA);

      VS_MLINHA := NULL;
      VS_MLINHA := LIB_STR.W(VS_MLINHA, LPAD('-', 150, '-'), 1);
      LIB_PROC.ADD(VS_MLINHA);

      VN_LINHA  := 8;
      VN_PAGINA := VN_PAGINA + 1;

    END IF;

  END CABECALHO;

  PROCEDURE T_CABECALHO(PS_EMPRESA VARCHAR2,
                        PS_DATA_INICIAL DATE,
                        PS_DATA_FINAL   DATE) IS

  BEGIN

    IF VN_LINHA >= 48 THEN
      VS_MLINHA := NULL;
      VS_MLINHA := LIB_STR.W(VS_MLINHA, 'EMPRESA    : ' || PS_EMPRESA, 1);
      VS_MLINHA := LIB_STR.W(VS_MLINHA,
                             'PAGINA : ' || LPAD(VN_PAGINA, 5, '0'),
                             136);
      LIB_PROC.ADD(VS_MLINHA);

      VS_MLINHA := NULL;
      VS_MLINHA := LIB_STR.W(VS_MLINHA,
                             'PERIODO    : ' ||
                             TO_CHAR(PS_DATA_INICIAL, 'DD/MM/YYYY') ||
                             ' ATE ' || TO_CHAR(PS_DATA_FINAL, 'DD/MM/YYYY'),
                             1);
      VS_MLINHA := LIB_STR.W(VS_MLINHA,
                             'DATA DE PROCESSAMENTO : ' ||
                             TO_CHAR(SYSDATE, 'DD/MM/RRRR HH24:MI:SS'),
                             107);
      LIB_PROC.ADD(VS_MLINHA);

      VS_MLINHA := NULL;
      VS_MLINHA := LIB_STR.W(VS_MLINHA, LPAD('-', 150, '-'), 1);
      LIB_PROC.ADD(VS_MLINHA);

      VS_MLINHA := NULL;
      VS_MLINHA := LIB_STR.W(VS_MLINHA,
                             '                    * * * T O T A L  -  D O C U M E N T O S   C O M   R E T E N C A O    P A R A   P A G A M E N T O    * * *',
                             1);
      LIB_PROC.ADD(VS_MLINHA);

      VS_MLINHA := NULL;
      VS_MLINHA := LIB_STR.W(VS_MLINHA, LPAD('-', 179, '-'), 1);
      LIB_PROC.ADD(VS_MLINHA);

      --'                            * * *    D O C U M E N T O S   C O M   R E T E N C ? O    P A R A   P A G A M E N T O    * * *'
      --|EMPRESA |DAT_DOC |DAT_LANCTO|ANO |MES|RENT|FORNEC   |COD_REC|CENTRO| VL_BRUTO   | MULTA      | JUROS      | VL_TRIB    |NUM_DOCFIS|
      --|........|........|..........|....|...|....|.........|.......|......|............|............|............|............|..........|
      --|1000....|12122017|12122017..|2017|12.|DARF|100089337|0588...|1001..|000000170985|000000000000|000000000000|000000450000|000000001.|

      VS_MLINHA := NULL;
      VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 1);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, 'EMP', 3);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 8);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, 'DDOC', 10);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 19);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, 'DLANC', 21);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 30);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, 'ANO', 32);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 37);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, 'MES', 39);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 42);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, 'CRET', 44);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 49);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, 'FGOV', 51);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 61);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, 'CRECT', 63);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 67);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, 'CC', 69);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 74);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, 'T-VL_BRUTO', 76);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 92);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, 'T-VL_TRIB', 94);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 110);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, 'QUAN_NOTA', 112);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 126);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, 'PF/PJ', 128);
      VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 138);
      LIB_PROC.ADD(VS_MLINHA);

      VS_MLINHA := NULL;
      VS_MLINHA := LIB_STR.W(VS_MLINHA, LPAD('-', 150, '-'), 1);
      LIB_PROC.ADD(VS_MLINHA);

      VN_LINHA  := 8;
      VN_PAGINA := VN_PAGINA + 1;

    END IF;

  END T_CABECALHO;

  --
  ---------------------------------
  -- M O N T A - R E L T O R I O --
  ---------------------------------

  PROCEDURE CORPO(PS_EMPRESA VARCHAR2,
                  PS_ESTAB   VARCHAR2,
                  PS_EXPORT       VARCHAR2,
                  PS_NUM_DOCFIS   VARCHAR2,
                  PS_SERIE        VARCHAR2,
                  PS_RETENCAO     VARCHAR2,
                  PS_COD_FISJUR   VARCHAR2,
                  PS_DATA_INICIAL DATE,
                  PS_DATA_FINAL   DATE) IS

    MLINHA VARCHAR2(32767) := '';
    --MLINHA2      VARCHAR2(5000) := '';
    v_contador1 NUMBER;
    --v_contador2 NUMBER;

    CURSOR C_NFS IS
      SELECT DISTINCT BURKS,
                      BLDAT,
                      BUDAT,
                      GJARH,
                      MONAT,
                      BKTXT,
                      LIFNR,
                      XBLNR,
                      LOCAL_NEGO,
                      TO_CHAR(VL_BRUTO / 100, '0000000000,00') VL_BRUTO,
                      TO_CHAR(MULTA / 100, '0000000000,00') MULTA,
                      TO_CHAR(JUROS / 100, '0000000000,00') JUROS,
                      TO_CHAR(ENTIDADES / 100, '0000000000,00') ENTIDADES,
                      TO_CHAR(VL_TRIB / 100, '0000000000,00') VL_TRIB,
                      (lpad(trim(substr(trim(regexp_substr(ZUONR,
                                                           '[^-]+',
                                                           1,
                                                           1)),
                                        1,
                                        9)),
                            9,
                            '0') || '-' ||
                      LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0),
                            3,
                            0)) ZUONR,
                      DATA_FISCAL,
                      COD_EMPRESA,
                      trim(regexp_substr(X.CKEY, '[^-]+', 1, 3)) FORNEC
        FROM VW_LKM_DARF_A X
       WHERE COD_EMPRESA = PS_EMPRESA
         AND DATA_FISCAL BETWEEN PS_DATA_INICIAL AND PS_DATA_FINAL
         AND XBLNR = DECODE(PS_RETENCAO,
                            '',
                            XBLNR,
                            'DARF',
                            XBLNR,
                            'GPS',
                            '0',
                            'DAM',
                            '0',
                            PS_RETENCAO)
            -- AND X.LOCAL_NEGO  = DECODE(PS_ESTAB,'000000',X.LOCAL_NEGO,PS_ESTAB )
         AND to_CHAR(trim(regexp_substr(X.CKEY, '[^-]+', 1, 2))) =
             to_CHAR(DECODE(PS_ESTAB,
                            '000000',
                            trim(regexp_substr(X.CKEY, '[^-]+', 1, 2)),
                            PS_ESTAB))

         and (lpad(trim(substr(trim(regexp_substr(ZUONR, '[^-]+', 1, 1)),
                               1,
                               9)),
                   9,
                   '0') || '-' ||
             LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0)) LIKE
             DECODE(ps_num_docfis,
                    000000000,
                    (lpad(trim(substr(trim(regexp_substr(ZUONR,
                                                         '[^-]+',
                                                         1,
                                                         1)),
                                      1,
                                      9)),
                          9,
                          '0') || '-' ||
                    LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0))

                   ,
                    '',
                    (lpad(trim(substr(trim(regexp_substr(ZUONR,
                                                         '[^-]+',
                                                         1,
                                                         1)),
                                      1,
                                      9)),
                          9,
                          '0') || '-' ||
                    LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0)),
                    0,
                    (lpad(trim(substr(trim(regexp_substr(ZUONR,
                                                         '[^-]+',
                                                         1,
                                                         1)),
                                      1,
                                      9)),
                          9,
                          '0') || '-' ||
                    LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0)),
                    ('%' || lpad(trim(substr(ps_num_docfis, 1, 9)), 9, '0') || '-' ||
                    lpad(trim(substr(decode(PS_SERIE, '', '000', PS_SERIE),
                                      1,
                                      3)),
                          3,
                          '0') || '%'))

         AND trim(regexp_substr(X.CKEY, '[^-]+', 1, 3))

             LIKE DECODE(PS_COD_FISJUR,
                         000000000000,
                         trim(regexp_substr(X.CKEY, '[^-]+', 1, 3)),
                         '',
                         trim(regexp_substr(X.CKEY, '[^-]+', 1, 3)),
                         '0',
                         trim(regexp_substr(X.CKEY, '[^-]+', 1, 3)),
                         PS_COD_FISJUR)

      UNION ALL
      SELECT DISTINCT BURKS,
                      BLDAT,
                      BUDAT,
                      GJARH,
                      MONAT,
                      BKTXT,
                      LIFNR,
                      XBLNR,
                      LOCAL_NEGO,
                      TO_CHAR(VL_BRUTO , '0000000000,00') VL_BRUTO,
                      TO_CHAR(MULTA / 100, '0000000000,00') MULTA,
                      TO_CHAR(JUROS / 100, '0000000000,00') JUROS,
                      TO_CHAR(ENTIDADES / 100, '0000000000,00') ENTIDADES,
                      TO_CHAR(VL_TRIB , '0000000000,00') VL_TRIB,
                      (lpad(trim(substr(trim(regexp_substr(ZUONR,
                                                           '[^-]+',
                                                           1,
                                                           1)),
                                        1,
                                        9)),
                            9,
                            '0') || '-' ||
                      LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0),
                            3,
                            0)) ZUONR,
                      DATA_FISCAL,
                      COD_EMPRESA,
                      '' FORNEC
        FROM VW_LKM_DAM Y
       WHERE COD_EMPRESA = PS_EMPRESA
         AND DATA_FISCAL BETWEEN PS_DATA_INICIAL AND PS_DATA_FINAL
         AND XBLNR = DECODE(PS_RETENCAO,
                            '',
                            XBLNR,
                            'DAM',
                            XBLNR,
                            'GPS',
                            '0',
                            'DARF',
                            '0',
                            PS_RETENCAO)
         AND to_CHAR(Y.cod_estab) =
             to_CHAR(DECODE(PS_ESTAB, 000000, Y.cod_estab, PS_ESTAB))
         and (lpad(trim(substr(trim(regexp_substr(ZUONR, '[^-]+', 1, 1)),
                               1,
                               9)),
                   9,
                   '0') || '-' ||
             LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0)) LIKE
             DECODE(ps_num_docfis,
                    000000000,
                    (lpad(trim(substr(trim(regexp_substr(ZUONR,
                                                         '[^-]+',
                                                         1,
                                                         1)),
                                      1,
                                      9)),
                          9,
                          '0') || '-' ||
                    LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0))

                   ,
                    '',
                    (lpad(trim(substr(trim(regexp_substr(ZUONR,
                                                         '[^-]+',
                                                         1,
                                                         1)),
                                      1,
                                      9)),
                          9,
                          '0') || '-' ||
                    LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0)),
                    0,
                    (lpad(trim(substr(trim(regexp_substr(ZUONR,
                                                         '[^-]+',
                                                         1,
                                                         1)),
                                      1,
                                      9)),
                          9,
                          '0') || '-' ||
                    LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0)),
                    ('%' || lpad(trim(substr(ps_num_docfis, 1, 9)), 9, '0') || '-' ||
                    lpad(trim(substr(decode(PS_SERIE, '', '000', PS_SERIE),
                                      1,
                                      3)),
                          3,
                          '0') || '%'))

      UNION ALL
      SELECT DISTINCT BURKS,
                      BLDAT,
                      BUDAT,
                      GJARH,
                      MONAT,
                      BKTXT,
                      LIFNR,
                      XBLNR,
                      SUBSTR(LOCAL_NEGO, 1, 4) LOCAL_NEGO,
                      TO_CHAR(VL_BRUTO / 100, '0000000000,00') VL_BRUTO,
                      TO_CHAR(MULTA / 100, '0000000000,00') MULTA,
                      TO_CHAR(JUROS / 100, '0000000000,00') JUROS,
                      TO_CHAR(ENTIDADES / 100, '0000000000,00') ENTIDADES,
                      TO_CHAR(VL_TRIB / 100, '0000000000,00') VL_TRIB,
                      (lpad(trim(substr(trim(regexp_substr(ZUONR,
                                                           '[^-]+',
                                                           1,
                                                           1)),
                                        1,
                                        9)),
                            9,
                            '0') || '-' ||
                      LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0),
                            3,
                            0)) ZUONR,
                      DATA_FISCAL,
                      COD_EMPRESA,
                      COD_FIS_JUR FORNEC
        FROM VW_LKM_GPS X
       WHERE COD_EMPRESA = PS_EMPRESA
         AND DATA_FISCAL BETWEEN PS_DATA_INICIAL AND PS_DATA_FINAL
         AND XBLNR = DECODE(PS_RETENCAO,
                            '',
                            XBLNR,
                            'GPS',
                            XBLNR,
                            'DARF',
                            '0',
                            'DAM',
                            '0',
                            PS_RETENCAO)
         AND to_CHAR(X.LOCAL_NEGO) =
             to_CHAR(DECODE(PS_ESTAB, '000000', X.LOCAL_NEGO, PS_ESTAB))
         and (lpad(trim(substr(trim(regexp_substr(ZUONR, '[^-]+', 1, 1)),
                               1,
                               9)),
                   9,
                   '0') || '-' ||
             LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0)) LIKE
             DECODE(ps_num_docfis,
                    000000000,
                    (lpad(trim(substr(trim(regexp_substr(ZUONR,
                                                         '[^-]+',
                                                         1,
                                                         1)),
                                      1,
                                      9)),
                          9,
                          '0') || '-' ||
                    LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0))

                   ,
                    '',
                    (lpad(trim(substr(trim(regexp_substr(ZUONR,
                                                         '[^-]+',
                                                         1,
                                                         1)),
                                      1,
                                      9)),
                          9,
                          '0') || '-' ||
                    LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0)),
                    0,
                    (lpad(trim(substr(trim(regexp_substr(ZUONR,
                                                         '[^-]+',
                                                         1,
                                                         1)),
                                      1,
                                      9)),
                          9,
                          '0') || '-' ||
                    LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0)),
                    ('%' || lpad(trim(substr(ps_num_docfis, 1, 9)), 9, '0') || '-' ||
                    lpad(trim(substr(decode(PS_SERIE, '', '000', PS_SERIE),
                                      1,
                                      3)),
                          3,
                          '0') || '%'))

         and COD_FIS_JUR LIKE DECODE(PS_COD_FISJUR,
                                     000000000000,
                                     X.COD_FIS_JUR,
                                     '',
                                     X.COD_FIS_JUR,
                                     '0',
                                     X.COD_FIS_JUR,
                                     PS_COD_FISJUR)

       ORDER BY 6, 8, 9, 15, 18;

  BEGIN

    IF (PS_EXPORT IS NULL) THEN
      LIB_PROC.ADD_LOG(' ', 1);
      LIB_PROC.ADD_LOG('      >>>>>>>  USUARIO : ' || MUSUARIO ||
                       '  - NAO FOI INFORMADO O TIPO DE RELATORIO, NESSE CASO SERAO INFORMADOS OS TOTALIZADORES EM TELA',
                       1);
      LIB_PROC.ADD_LOG(' ', 1);
    END IF;

    IF (PS_EXPORT = '0') THEN

      FOR MREG IN C_NFS LOOP
        CABECALHO(PS_EMPRESA,
                  PS_DATA_INICIAL,
                  PS_DATA_FINAL);

        VS_MLINHA := NULL;
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 1);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, MREG.BURKS, 3);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 8);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, MREG.BLDAT, 10);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 19);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, MREG.BUDAT, 21);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 30);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, MREG.GJARH, 32);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 37);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, MREG.MONAT, 39);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 42);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, MREG.BKTXT, 44);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 49);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, MREG.LIFNR, 51);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 61);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, MREG.XBLNR, 63);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 67);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, MREG.LOCAL_NEGO, 69);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 74);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, MREG.VL_BRUTO, 76);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 92);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, MREG.VL_TRIB, 94);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 110);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, MREG.ZUONR, 112);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 126);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, MREG.FORNEC, 128);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 138);

        LIB_PROC.ADD(VS_MLINHA);
        VN_LINHA := VN_LINHA + 1;
        RELATORIO;

      END LOOP;

      WHILE VN_LINHA <= 46 LOOP
        VS_MLINHA := NULL;
        VS_MLINHA := LIB_STR.W(VS_MLINHA, ' ', 1);
        LIB_PROC.ADD(VS_MLINHA);
        VN_LINHA := VN_LINHA + 1;
      END LOOP;

      VS_MLINHA := NULL;
      VS_MLINHA := LIB_STR.W(VS_MLINHA, LPAD('-', 150, '-'), 1);
      LIB_PROC.ADD(VS_MLINHA);

      VS_MLINHA := NULL;
      VS_MLINHA := LIB_STR.W(VS_MLINHA,
                             'DESENVOLVIDO POR LKM TECNOLOGIA LTDA - 2019 ',
                             1);
      LIB_PROC.ADD(VS_MLINHA);

      VS_MLINHA := NULL;
      VS_MLINHA := LIB_STR.W(VS_MLINHA, LPAD('-', 150, '-'), 1);
      LIB_PROC.ADD(VS_MLINHA);

      VN_LINHA := VN_LINHA + 1;

    ELSIF (PS_EXPORT = '1') THEN

      BEGIN
        MPROC_ID    := LIB_PROC.NEW('LKM_RECON3_CPROC', 48, 150);
        v_contador1 := 0;
        --   v_contador2 := 0;

        FOR MREG IN C_NFS LOOP

          MLINHA := NULL;
          MLINHA := LIB_STR.W(MLINHA,
                              'TESTE
                                    ',
                              1);
          MLINHA := LIB_STR.W(MLINHA,
                              MREG.BURKS || ';' || MREG.BLDAT || ';' ||
                              MREG.BUDAT || ';' || MREG.GJARH || ';' ||
                              MREG.Monat || ';' || MREG.BKTXT || ';' ||
                              MREG.LIFNR || ';' || MREG.XBLNR || ';' ||
                              MREG.LOCAL_NEGO || ';' || MREG.VL_BRUTO || ';' ||
                              MREG.MULTA || ';' || MREG.JUROS || ';' ||
                              MREG.ENTIDADES || ';' || MREG.VL_TRIB || ';' ||
                              MREG.ZUONR || ';' || MREG.DATA_FISCAL || ';' ||
                              MREG.COD_EMPRESA || ';' || MREG.FORNEC || ';',
                              1);

          v_contador1 := v_contador1 + 1;
          IF v_contador1 = 1 THEN

            LIB_PROC.ADD_TIPO(MPROC_ID,
                              to_number(2),
                              '_Relatorio_' ||
                              trim(to_char(sysdate, 'ddmmrrrrhh24miss')) ||
                              '.CSV',
                              2);

          END IF;

          LIB_PROC.add(plinha => mLinha,
                       ppag   => 2,
                       plin   => 2,
                       ptipo  => to_number(2));

        END LOOP;
      END;

    END IF;
  END CORPO;

  PROCEDURE SOMA_CORPO(PS_EMPRESA VARCHAR2,
                       PS_ESTAB   VARCHAR2,
                       --P_FINALIDADE     VARCHAR2,
                       --PS_RELATORIO     VARCHAR2,
                       --P_MJE            VARCHAR2,
                       PS_NUM_DOCFIS   VARCHAR2,
                       PS_SERIE        VARCHAR2,
                       PS_RETENCAO     VARCHAR2,
                       PS_COD_FISJUR   VARCHAR2,
                       PS_DATA_INICIAL DATE,
                       PS_DATA_FINAL   DATE) IS

    CURSOR C_CAP_CF IS
      WITH LKM_RELATORIO AS
       (SELECT DISTINCT BURKS,
                        '' BLDAT,
                        '' BUDAT,
                        GJARH,
                        MONAT,
                        BKTXT,
                        LIFNR,
                        XBLNR,
                        '' LOCAL_NEGO,
                        VL_BRUTO,
                        MULTA,
                        JUROS,
                        ENTIDADES,
                        VL_TRIB,
                        ZUONR,
                        to_char(LAST_DAY(DATA_FISCAL), 'DDMMYYYY') DATA_FISCAL,
                        COD_EMPRESA,
                        trim(regexp_substr(X.CKEY, '[^-]+', 1, 3)) FORNEC
          FROM VW_LKM_DARF_A X
         WHERE COD_EMPRESA = PS_EMPRESA
           AND DATA_FISCAL BETWEEN PS_DATA_INICIAL AND PS_DATA_FINAL
           AND XBLNR = DECODE(PS_RETENCAO,
                              '',
                              XBLNR,
                              'DARF',
                              XBLNR,
                              'GPS',
                              '0',
                              'DAM',
                              '0',
                              PS_RETENCAO)
              -- AND X.LOCAL_NEGO  = DECODE(PS_ESTAB,'000000',X.LOCAL_NEGO,PS_ESTAB )
           AND to_CHAR(trim(regexp_substr(X.CKEY, '[^-]+', 1, 2))) =
               to_CHAR(DECODE(PS_ESTAB,
                              '000000',
                              trim(regexp_substr(X.CKEY, '[^-]+', 1, 2)),
                              PS_ESTAB))

           and (lpad(trim(substr(trim(regexp_substr(ZUONR, '[^-]+', 1, 1)),
                                 1,
                                 9)),
                     9,
                     '0') || '-' ||
               LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0)) LIKE
               DECODE(ps_num_docfis,
                      000000000,
                      (lpad(trim(substr(trim(regexp_substr(ZUONR,
                                                           '[^-]+',
                                                           1,
                                                           1)),
                                        1,
                                        9)),
                            9,
                            '0') || '-' ||
                      LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0))

                     ,
                      '',
                      (lpad(trim(substr(trim(regexp_substr(ZUONR,
                                                           '[^-]+',
                                                           1,
                                                           1)),
                                        1,
                                        9)),
                            9,
                            '0') || '-' ||
                      LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0)),
                      0,
                      (lpad(trim(substr(trim(regexp_substr(ZUONR,
                                                           '[^-]+',
                                                           1,
                                                           1)),
                                        1,
                                        9)),
                            9,
                            '0') || '-' ||
                      LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0)),
                      ('%' || lpad(trim(substr(ps_num_docfis, 1, 9)), 9, '0') || '-' ||
                      lpad(trim(substr(decode(PS_SERIE, '', '000', PS_SERIE),
                                        1,
                                        3)),
                            3,
                            '0') || '%'))

           AND trim(regexp_substr(X.CKEY, '[^-]+', 1, 3))

               LIKE DECODE(PS_COD_FISJUR,
                           000000000000,
                           trim(regexp_substr(X.CKEY, '[^-]+', 1, 3)),
                           '',
                           trim(regexp_substr(X.CKEY, '[^-]+', 1, 3)),
                           '0',
                           trim(regexp_substr(X.CKEY, '[^-]+', 1, 3)),
                           PS_COD_FISJUR)

        UNION ALL
        SELECT DISTINCT BURKS,
                        '' BLDAT,
                        '' BUDAT,
                        GJARH,
                        MONAT,
                        BKTXT,
                        LIFNR,
                        XBLNR,
                        LOCAL_NEGO,
                        VLR_SERVICO VL_BRUTO,
                        MULTA,
                        JUROS,
                        ENTIDADES,
                        VL_TRIB,
                        ZUONR,
                        to_char(LAST_DAY(DATA_FISCAL), 'DDMMYYYY') DATA_FISCAL,
                        COD_EMPRESA,
                        '' FORNEC
          FROM VW_LKM_DAM Y
         WHERE COD_EMPRESA = PS_EMPRESA
           AND DATA_FISCAL BETWEEN PS_DATA_INICIAL AND PS_DATA_FINAL
           AND XBLNR = DECODE(PS_RETENCAO,
                              '',
                              XBLNR,
                              'DAM',
                              XBLNR,
                              'GPS',
                              '0',
                              'DARF',
                              '0',
                              PS_RETENCAO)
           AND to_CHAR(Y.cod_estab) =
               to_CHAR(DECODE(PS_ESTAB, 000000, Y.cod_estab, PS_ESTAB))
           and (lpad(trim(substr(trim(regexp_substr(ZUONR, '[^-]+', 1, 1)),
                                 1,
                                 9)),
                     9,
                     '0') || '-' ||
               LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0)) LIKE
               DECODE(ps_num_docfis,
                      000000000,
                      (lpad(trim(substr(trim(regexp_substr(ZUONR,
                                                           '[^-]+',
                                                           1,
                                                           1)),
                                        1,
                                        9)),
                            9,
                            '0') || '-' ||
                      LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0))

                     ,
                      '',
                      (lpad(trim(substr(trim(regexp_substr(ZUONR,
                                                           '[^-]+',
                                                           1,
                                                           1)),
                                        1,
                                        9)),
                            9,
                            '0') || '-' ||
                      LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0)),
                      0,
                      (lpad(trim(substr(trim(regexp_substr(ZUONR,
                                                           '[^-]+',
                                                           1,
                                                           1)),
                                        1,
                                        9)),
                            9,
                            '0') || '-' ||
                      LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0)),
                      ('%' || lpad(trim(substr(ps_num_docfis, 1, 9)), 9, '0') || '-' ||
                      lpad(trim(substr(decode(PS_SERIE, '', '000', PS_SERIE),
                                        1,
                                        3)),
                            3,
                            '0') || '%'))

        UNION ALL
        SELECT DISTINCT BURKS,
                        '' BLDAT,
                        '' BUDAT,
                        GJARH,
                        MONAT,
                        BKTXT,
                        LIFNR,
                        XBLNR,
                        '' LOCAL_NEGO,
                        VL_BRUTO,
                        MULTA,
                        JUROS,
                        ENTIDADES,
                        VL_TRIB,
                        ZUONR,
                        to_char(LAST_DAY(DATA_FISCAL), 'DDMMYYYY') DATA_FISCAL,
                        COD_EMPRESA,
                        COD_FIS_JUR FORNEC
          FROM VW_LKM_GPS X
         WHERE COD_EMPRESA = PS_EMPRESA
           AND DATA_FISCAL BETWEEN PS_DATA_INICIAL AND PS_DATA_FINAL
           AND XBLNR = DECODE(PS_RETENCAO,
                              '',
                              XBLNR,
                              'GPS',
                              XBLNR,
                              'DARF',
                              '0',
                              'DAM',
                              '0',
                              PS_RETENCAO)
           AND to_CHAR(X.LOCAL_NEGO) =
               to_CHAR(DECODE(PS_ESTAB, '000000', X.LOCAL_NEGO, PS_ESTAB))
           and (lpad(trim(substr(trim(regexp_substr(ZUONR, '[^-]+', 1, 1)),
                                 1,
                                 9)),
                     9,
                     '0') || '-' ||
               LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0)) LIKE
               DECODE(ps_num_docfis,
                      000000000,
                      (lpad(trim(substr(trim(regexp_substr(ZUONR,
                                                           '[^-]+',
                                                           1,
                                                           1)),
                                        1,
                                        9)),
                            9,
                            '0') || '-' ||
                      LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0))

                     ,
                      '',
                      (lpad(trim(substr(trim(regexp_substr(ZUONR,
                                                           '[^-]+',
                                                           1,
                                                           1)),
                                        1,
                                        9)),
                            9,
                            '0') || '-' ||
                      LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0)),
                      0,
                      (lpad(trim(substr(trim(regexp_substr(ZUONR,
                                                           '[^-]+',
                                                           1,
                                                           1)),
                                        1,
                                        9)),
                            9,
                            '0') || '-' ||
                      LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0)),
                      ('%' || lpad(trim(substr(ps_num_docfis, 1, 9)), 9, '0') || '-' ||
                      lpad(trim(substr(decode(PS_SERIE, '', '000', PS_SERIE),
                                        1,
                                        3)),
                            3,
                            '0') || '%'))

           and COD_FIS_JUR LIKE DECODE(PS_COD_FISJUR,
                                       000000000000,
                                       X.COD_FIS_JUR,
                                       '',
                                       X.COD_FIS_JUR,
                                       '0',
                                       X.COD_FIS_JUR,
                                       PS_COD_FISJUR)

        )
      SELECT BURKS,
             BLDAT,
             BUDAT,
             GJARH,
             MONAT,
             BKTXT,
             LIFNR,
             XBLNR,
             LOCAL_NEGO,
             TO_CHAR(SUM(VL_BRUTO / 100), '0000000000D00') VL_BRUTO,
             TO_CHAR(SUM(MULTA / 100), '0000000000D00') MULTA,
             TO_CHAR(SUM(JUROS / 100), '0000000000D00') JUROS,
             TO_CHAR(SUM(ENTIDADES / 100), '0000000000D00') ENTIDADES,
             TO_CHAR(SUM(VL_TRIB / 100), '0000000000D00') VL_TRIB,
             LPAD(COUNT(ZUONR), 7, 0) ZUONR,
             DATA_FISCAL,
             COD_EMPRESA,
             FORNEC
        FROM LKM_RELATORIO

       group by BURKS,
                BLDAT,
                BUDAT,
                GJARH,
                MONAT,
                BKTXT,
                LIFNR,
                XBLNR,
                LOCAL_NEGO,
                DATA_FISCAL,
                COD_EMPRESA,
                FORNEC

       ORDER BY 6, 8, 15, 18

      ;

    CURSOR C_CAP_SF IS
      WITH LKM_RELATORIO AS
       (SELECT DISTINCT BURKS,
                        '' BLDAT,
                        '' BUDAT,
                        GJARH,
                        MONAT,
                        BKTXT,
                        LIFNR,
                        XBLNR,
                        '' LOCAL_NEGO,
                        VL_BRUTO,
                        MULTA,
                        JUROS,
                        ENTIDADES,
                        VL_TRIB,
                        ZUONR,
                        to_char(LAST_DAY(DATA_FISCAL), 'DDMMYYYY') DATA_FISCAL,
                        COD_EMPRESA,
                        '' FORNEC
          FROM VW_LKM_DARF_A X
         WHERE COD_EMPRESA = PS_EMPRESA
           AND DATA_FISCAL BETWEEN PS_DATA_INICIAL AND PS_DATA_FINAL
           AND XBLNR = DECODE(PS_RETENCAO,
                              '',
                              XBLNR,
                              'DARF',
                              XBLNR,
                              'GPS',
                              '0',
                              'DAM',
                              '0',
                              PS_RETENCAO)
              -- AND X.LOCAL_NEGO  = DECODE(PS_ESTAB,'000000',X.LOCAL_NEGO,PS_ESTAB )
           AND to_CHAR(trim(regexp_substr(X.CKEY, '[^-]+', 1, 2))) =
               to_CHAR(DECODE(PS_ESTAB,
                              '000000',
                              trim(regexp_substr(X.CKEY, '[^-]+', 1, 2)),
                              PS_ESTAB))

           and (lpad(trim(substr(trim(regexp_substr(ZUONR, '[^-]+', 1, 1)),
                                 1,
                                 9)),
                     9,
                     '0') || '-' ||
               LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0)) LIKE
               DECODE(ps_num_docfis,
                      000000000,
                      (lpad(trim(substr(trim(regexp_substr(ZUONR,
                                                           '[^-]+',
                                                           1,
                                                           1)),
                                        1,
                                        9)),
                            9,
                            '0') || '-' ||
                      LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0))

                     ,
                      '',
                      (lpad(trim(substr(trim(regexp_substr(ZUONR,
                                                           '[^-]+',
                                                           1,
                                                           1)),
                                        1,
                                        9)),
                            9,
                            '0') || '-' ||
                      LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0)),
                      0,
                      (lpad(trim(substr(trim(regexp_substr(ZUONR,
                                                           '[^-]+',
                                                           1,
                                                           1)),
                                        1,
                                        9)),
                            9,
                            '0') || '-' ||
                      LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0)),
                      ('%' || lpad(trim(substr(ps_num_docfis, 1, 9)), 9, '0') || '-' ||
                      lpad(trim(substr(decode(PS_SERIE, '', '000', PS_SERIE),
                                        1,
                                        3)),
                            3,
                            '0') || '%'))

        UNION ALL
        SELECT DISTINCT BURKS,
                        '' BLDAT,
                        '' BUDAT,
                        GJARH,
                        MONAT,
                        BKTXT,
                        LIFNR,
                        XBLNR,
                        LOCAL_NEGO,
                        VLR_SERVICO VL_BRUTO,
                        MULTA,
                        JUROS,
                        ENTIDADES,
                        VL_TRIB,
                        ZUONR,
                        to_char(LAST_DAY(DATA_FISCAL), 'DDMMYYYY') DATA_FISCAL,
                        COD_EMPRESA,
                        '' FORNEC
          FROM VW_LKM_DAM Y
         WHERE COD_EMPRESA = PS_EMPRESA
           AND DATA_FISCAL BETWEEN PS_DATA_INICIAL AND PS_DATA_FINAL
           AND XBLNR = DECODE(PS_RETENCAO,
                              '',
                              XBLNR,
                              'DAM',
                              XBLNR,
                              'GPS',
                              '0',
                              'DARF',
                              '0',
                              PS_RETENCAO)
           AND to_CHAR(Y.cod_estab) =
               to_CHAR(DECODE(PS_ESTAB, 000000, Y.cod_estab, PS_ESTAB))
           and (lpad(trim(substr(trim(regexp_substr(ZUONR, '[^-]+', 1, 1)),
                                 1,
                                 9)),
                     9,
                     '0') || '-' ||
               LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0)) LIKE
               DECODE(ps_num_docfis,
                      000000000,
                      (lpad(trim(substr(trim(regexp_substr(ZUONR,
                                                           '[^-]+',
                                                           1,
                                                           1)),
                                        1,
                                        9)),
                            9,
                            '0') || '-' ||
                      LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0))

                     ,
                      '',
                      (lpad(trim(substr(trim(regexp_substr(ZUONR,
                                                           '[^-]+',
                                                           1,
                                                           1)),
                                        1,
                                        9)),
                            9,
                            '0') || '-' ||
                      LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0)),
                      0,
                      (lpad(trim(substr(trim(regexp_substr(ZUONR,
                                                           '[^-]+',
                                                           1,
                                                           1)),
                                        1,
                                        9)),
                            9,
                            '0') || '-' ||
                      LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0)),
                      ('%' || lpad(trim(substr(ps_num_docfis, 1, 9)), 9, '0') || '-' ||
                      lpad(trim(substr(decode(PS_SERIE, '', '000', PS_SERIE),
                                        1,
                                        3)),
                            3,
                            '0') || '%'))

        UNION ALL
        SELECT DISTINCT BURKS,
                        '' BLDAT,
                        '' BUDAT,
                        GJARH,
                        MONAT,
                        BKTXT,
                        LIFNR,
                        XBLNR,
                        '' LOCAL_NEGO,
                        VL_BRUTO,
                        MULTA,
                        JUROS,
                        ENTIDADES,
                        VL_TRIB,
                        ZUONR,
                        to_char(LAST_DAY(DATA_FISCAL), 'DDMMYYYY') DATA_FISCAL,
                        COD_EMPRESA,
                        '' FORNEC
          FROM VW_LKM_GPS X
         WHERE COD_EMPRESA = PS_EMPRESA
           AND DATA_FISCAL BETWEEN PS_DATA_INICIAL AND PS_DATA_FINAL
           AND XBLNR = DECODE(PS_RETENCAO,
                              '',
                              XBLNR,
                              'GPS',
                              XBLNR,
                              'DARF',
                              '0',
                              'DAM',
                              '0',
                              PS_RETENCAO)
           AND to_CHAR(X.LOCAL_NEGO) =
               to_CHAR(DECODE(PS_ESTAB, '000000', X.LOCAL_NEGO, PS_ESTAB))
           and (lpad(trim(substr(trim(regexp_substr(ZUONR, '[^-]+', 1, 1)),
                                 1,
                                 9)),
                     9,
                     '0') || '-' ||
               LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0)) LIKE
               DECODE(ps_num_docfis,
                      000000000,
                      (lpad(trim(substr(trim(regexp_substr(ZUONR,
                                                           '[^-]+',
                                                           1,
                                                           1)),
                                        1,
                                        9)),
                            9,
                            '0') || '-' ||
                      LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0))

                     ,
                      '',
                      (lpad(trim(substr(trim(regexp_substr(ZUONR,
                                                           '[^-]+',
                                                           1,
                                                           1)),
                                        1,
                                        9)),
                            9,
                            '0') || '-' ||
                      LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0)),
                      0,
                      (lpad(trim(substr(trim(regexp_substr(ZUONR,
                                                           '[^-]+',
                                                           1,
                                                           1)),
                                        1,
                                        9)),
                            9,
                            '0') || '-' ||
                      LPAD(NVL(regexp_substr(ZUONR, '[^-]+', 1, 2), 0), 3, 0)),
                      ('%' || lpad(trim(substr(ps_num_docfis, 1, 9)), 9, '0') || '-' ||
                      lpad(trim(substr(decode(PS_SERIE, '', '000', PS_SERIE),
                                        1,
                                        3)),
                            3,
                            '0') || '%'))

        )
      SELECT BURKS,
             BLDAT,
             BUDAT,
             GJARH,
             MONAT,
             BKTXT,
             LIFNR,
             XBLNR,
             LOCAL_NEGO,
             TO_CHAR(SUM(VL_BRUTO / 100), '0000000000D00') VL_BRUTO,
             TO_CHAR(SUM(MULTA / 100), '0000000000D00') MULTA,
             TO_CHAR(SUM(JUROS / 100), '0000000000D00') JUROS,
             TO_CHAR(SUM(ENTIDADES / 100), '0000000000D00') ENTIDADES,
             TO_CHAR(SUM(VL_TRIB / 100), '0000000000D00') VL_TRIB,
             LPAD(COUNT(ZUONR), 7, 0) ZUONR,
             DATA_FISCAL,
             COD_EMPRESA,
             '' FORNEC
        FROM LKM_RELATORIO

       group by BURKS,
                BLDAT,
                BUDAT,
                GJARH,
                MONAT,
                BKTXT,
                LIFNR,
                XBLNR,
                LOCAL_NEGO,
                DATA_FISCAL,
                COD_EMPRESA,
                ''

       ORDER BY 6, 8, 15, 18;

  BEGIN
    IF PS_COD_FISJUR = 000000000000
      --or PS_COD_FISJUR = ''
       or PS_COD_FISJUR = '0' THEN

      FOR REGGF IN C_CAP_SF LOOP

        T_CABECALHO(PS_EMPRESA,
                    PS_DATA_INICIAL,
                    PS_DATA_FINAL);
        VS_MLINHA := NULL;
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 1);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, REGGF.BURKS, 3);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 8);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, REGGF.BLDAT, 10);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 19);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, REGGF.BUDAT, 21);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 30);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, REGGF.GJARH, 32);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 37);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, REGGF.MONAT, 39);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 42);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, REGGF.BKTXT, 44);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 49);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, REGGF.LIFNR, 51);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 61);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, REGGF.XBLNR, 63);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 67);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, REGGF.LOCAL_NEGO, 69);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 74);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, REGGF.VL_BRUTO, 76);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 92);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, REGGF.VL_TRIB, 94);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 110);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, REGGF.ZUONR, 112);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 126);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, REGGF.FORNEC, 128);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 138);

        LIB_PROC.ADD(VS_MLINHA);
        VN_LINHA := VN_LINHA + 1;
        RELATORIO;
      END LOOP;

    ELSE

      FOR REGG IN C_CAP_CF LOOP

        T_CABECALHO(PS_EMPRESA,
                    PS_DATA_INICIAL,
                    PS_DATA_FINAL);
        VS_MLINHA := NULL;
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 1);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, REGG.BURKS, 3);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 8);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, REGG.BLDAT, 10);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 19);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, REGG.BUDAT, 21);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 30);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, REGG.GJARH, 32);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 37);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, REGG.MONAT, 39);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 42);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, REGG.BKTXT, 44);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 49);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, REGG.LIFNR, 51);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 61);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, REGG.XBLNR, 63);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 67);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, REGG.LOCAL_NEGO, 69);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 74);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, REGG.VL_BRUTO, 76);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 92);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, REGG.VL_TRIB, 94);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 110);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, REGG.ZUONR, 112);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 126);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, REGG.FORNEC, 128);
        VS_MLINHA := LIB_STR.W(VS_MLINHA, '|', 138);
        LIB_PROC.ADD(VS_MLINHA);
        VN_LINHA := VN_LINHA + 1;
        RELATORIO;
      END LOOP;

    END IF;

    WHILE VN_LINHA <= 46 LOOP
      VS_MLINHA := NULL;
      VS_MLINHA := LIB_STR.W(VS_MLINHA, ' ', 1);
      LIB_PROC.ADD(VS_MLINHA);
      VN_LINHA := VN_LINHA + 1;
    END LOOP;

    VS_MLINHA := NULL;
    VS_MLINHA := LIB_STR.W(VS_MLINHA, LPAD('-', 150, '-'), 1);
    LIB_PROC.ADD(VS_MLINHA);

    VS_MLINHA := NULL;
    VS_MLINHA := LIB_STR.W(VS_MLINHA,
                           'DESENVOLVIDO POR LKM TECNOLOGIA LTDA - 2019 ',
                           1);
    LIB_PROC.ADD(VS_MLINHA);

    VS_MLINHA := NULL;
    VS_MLINHA := LIB_STR.W(VS_MLINHA, LPAD('-', 150, '-'), 1);
    LIB_PROC.ADD(VS_MLINHA);

    VN_LINHA := VN_LINHA + 1;

  END SOMA_CORPO;

  -- RELATORIO FBL3N

  PROCEDURE LKM_PLOAD_FBL3N(PS_EMPRESA VARCHAR2,
                            --PS_ESTAB   VARCHAR2,
                            --               P_FINALIDADE2   VARCHAR2,
                            PS_DATA_INICIAL DATE,
                            PS_DATA_FINAL   DATE) IS
    -- S A I D A - L I B - P R O C --

    MLINHA      VARCHAR2(32767) := '';
    --MLINHA2     VARCHAR2(32767) := '';
   -- MLINHA3     VARCHAR2(32767) := '';
    EMP         VARCHAR(256) := null;
    v_contador  NUMBER;
    --v_contador1 NUMBER;
    --v_contador2 NUMBER;

  BEGIN
    MPROC_ID := LIB_PROC.NEW('LKM_RECON3_CPROC', 48, 150);

    --nome sesi senai
    IF PS_EMPRESA = '001' THEN
      EMP := 'SESI';
    ELSE
      EMP := 'SENAI';
    END IF;

    v_contador  := 0;
    --v_contador1 := 0;
    --v_contador2 := 0;

    ------------------------------------------------------------------------------------------------------------
    -- G E R A - R E L A T O R I O - F B L 3 N - C O N C I L I A D O R
    -----------------------------------------------------------------------------------------------------------

    ----- NAO ENCONTRADOS NA 07

    BEGIN

      FOR MREG IN (select 'COD_EMPRESA' || ';' ||
                          'COD_EMPRESA' || ';' ||
                          'COD_ESTAB' || ';' ||
                          'NUM_DOCFIS_X07' || ';' ||
                          'NUM_DOCFIS_X01' || ';' ||
                          'NUM_DOCTO' || ';' ||
                          'TIPO_DOCTO' || ';' ||
                          'DATA_DOCTO' || ';' ||
                          'CHAV_LANCTO' || ';' ||
                          'MONTANTE' || ';' ||
                          'TEXTO'   || ';' ||
                          'TIPO' || ';' ||
                          'CONTA' || ';' ||
                          'ALIQ' || ';' ||
                          'NUM_CONTROLE'  AS LINHA,
                          0 CHAVE_ORDERN

                     from DUAL
                   UNION ALL
                   select NOK.COD_EMPRESA || ';' ||
                          NOK.COD_EMPRESA || ';' ||
                          NOK.COD_ESTAB || ';' ||
                          NOK.NUM_DOCFIS_X07 || ';' ||
                          NOK.NUM_DOCFIS_X01 || ';' ||
                          NOK.NUM_DOCTO || ';' ||
                          NOK.TIPO_DOCTO || ';' ||
                          NOK.DATA_DOCTO || ';' ||
                          NOK.CHAV_LANCTO || ';' ||
                          NOK.MONTANTE || ';' ||
                          NOK.TEXTO   || ';' ||
                          NOK.TIPO || ';' ||
                          NOK.CONTA || ';' ||
                          NOK.ALIQ || ';' ||
                          NOK.NUM_CONTROLE
                          AS LINHA,
                          ROWNUM CHAVE_ORDERN

                     from vw_lkm_fbl3n_erro NOK
                    where 1 = 1
                         and COD_EMPRESA = PS_EMPRESA
                      and data_DOCTO between PS_DATA_INICIAL and
                          PS_DATA_FINAL
                    ORDER BY CHAVE_ORDERN)

       LOOP

        MLINHA := NULL;
        MLINHA := LIB_STR.W(MLINHA, MREG.LINHA, 1);
        --v_numero_arq := 1;

        v_contador := v_contador + 1;
        IF v_contador = 1 THEN

          LIB_PROC.ADD_TIPO(MPROC_ID,
                            to_number(1),
                            EMP || '_FBL3N_NAO_ENCONTRADOS_X07_' ||
                            trim(to_char(sysdate, 'ddmmrrrrhh24miss')) ||
                            '.CSV',
                            2);

        END IF;

        LIB_PROC.add(plinha          => mLinha,
                     ppag            => 1,
                     plin            => 1,
                     ptipo           => to_number(1),
                     pChaveOrdenacao => MREG.CHAVE_ORDERN);

      END LOOP;
    END;

    ----------------------------
    -- NAO ENCONTRADOR NA 01

    BEGIN

      FOR MREG2 IN (select 'COD_EMPRESA' || ';' ||
                          'COD_EMPRESA' || ';' ||
                          'COD_ESTAB' || ';' ||
                          'NUM_DOCFIS_X07' || ';' ||
                          'NUM_DOCFIS_X01' || ';' ||
                          'NUM_DOCTO' || ';' ||
                          'TIPO_DOCTO' || ';' ||
                          'DATA_DOCTO' || ';' ||
                          'CHAV_LANCTO' || ';' ||
                          'MONTANTE' || ';' ||
                          'TEXTO'   || ';' ||
                          'TIPO' || ';' ||
                          'CONTA' || ';' ||
                          'ALIQ' || ';' ||
                          'NUM_CONTROLE'  AS LINHA,
                          0 CHAVE_ORDERN

                     from DUAL
                   UNION ALL
                   select NOK.COD_EMPRESA || ';' ||
                          NOK.COD_EMPRESA || ';' ||
                          NOK.COD_ESTAB || ';' ||
                          NOK.NUM_DOCFIS_X07 || ';' ||
                          NOK.NUM_DOCFIS_X01 || ';' ||
                          NOK.NUM_DOCTO || ';' ||
                          NOK.TIPO_DOCTO || ';' ||
                          NOK.DATA_DOCTO || ';' ||
                          NOK.CHAV_LANCTO || ';' ||
                          NOK.MONTANTE || ';' ||
                          NOK.TEXTO   || ';' ||
                          NOK.TIPO || ';' ||
                          NOK.CONTA || ';' ||
                          NOK.ALIQ || ';' ||
                          NOK.NUM_CONTROLE
                          AS LINHA,
                          ROWNUM CHAVE_ORDERN

                     from vw_lkm_fbl3n_erro_x07 NOK
                    where 1 = 1
                         and COD_EMPRESA = PS_EMPRESA
                      and data_DOCTO between PS_DATA_INICIAL and
                          PS_DATA_FINAL
                    ORDER BY CHAVE_ORDERN)

       LOOP

        MLINHA := NULL;
        MLINHA := LIB_STR.W(MLINHA, MREG2.LINHA, 1);
        --v_numero_arq := 1;

        v_contador := v_contador + 1;
        IF v_contador = 1 THEN

          LIB_PROC.ADD_TIPO(MPROC_ID,
                            to_number(1),
                            EMP || '_FBL3N_NAO_ENCONTRADOS_X01_' ||
                            trim(to_char(sysdate, 'ddmmrrrrhh24miss')) ||
                            '.CSV',
                            2);

        END IF;

        LIB_PROC.add(plinha          => mLinha,
                     ppag            => 1,
                     plin            => 1,
                     ptipo           => to_number(1),
                     pChaveOrdenacao => MREG2.CHAVE_ORDERN);

      END LOOP;
    END;

  END LKM_PLOAD_FBL3N;

  PROCEDURE LKM_PLOAD_MJE(PS_EMPRESA      VARCHAR2,
                          PS_ESTAB        VARCHAR2,
                          P_FINALIDADE    VARCHAR2,
                          P_MJE           VARCHAR2,
                          PS_NUM_DOCFIS   VARCHAR2,
                          PS_SERIE        VARCHAR2,
                          PS_RETENCAO     VARCHAR2,
                          PS_COD_FISJUR   VARCHAR2,
                          PS_VLR_MULTA    VARCHAR2,
                          PS_VLR_JUROS    VARCHAR2,
                          PS_DATA_INICIAL DATE,
                          PS_DATA_FINAL   DATE) IS

    -- S A I D A - L I B - P R O C --

    MLINHA          VARCHAR2(32767) := '';
    MLINHA2         VARCHAR2(32767) := '';
    P_VLR_MULTA     VARCHAR2(256);
    P_VLR_JUROS     VARCHAR2(256);
    --P_VLR_ENTIDADES VARCHAR2(256);
    v_numero_arq    INT;
    EMP             VARCHAR(256) := null;
    v_contador      NUMBER;
    v_contador7     NUMBER;

  BEGIN
    MPROC_ID := LIB_PROC.NEW('LKM_RECON3_CPROC', 48, 150);

    IF PS_VLR_MULTA IS NULL THEN
      P_VLR_MULTA := 0;
    ELSE
      P_VLR_MULTA := PS_VLR_MULTA;
    END IF;

    IF PS_VLR_JUROS IS NULL THEN
      P_VLR_JUROS := 0;
    ELSE
      P_VLR_JUROS := PS_VLR_JUROS;
    END IF;

    IF PS_EMPRESA = '001' THEN
      EMP := 'SESI';
    ELSE
      EMP := 'SENAI';

    END IF;

    v_contador  := 0;
    v_contador7 := 0;

    ------------------------------------------------------------------------------------------------------------
    -- G E R A -  G P S  + (D A R F 05889)
    -----------------------------------------------------------------------------------------------------------
    IF (P_MJE = 'S') THEN
      IF (P_FINALIDADE = '1') or (P_FINALIDADE = '3') THEN

        BEGIN

          FOR MREG IN (WITH LKM_LOAD_GPS as
                         -- GPS Outros
                         --Capa
                          (SELECT DISTINCT ITEM1.LINHA,
                                          ITEM1.Localnegocio COD_FIS_JUR,
                                          ITEM2.NUM_DOC_FIS,
                                          ITEM1.ORDEM,
                                          ITEM1.EMPRESA,
                                          ITEM1.DATADOC,
                                          ITEM1.codigo_receita,
                                          ITEM1.fornec
                            FROM LKM_SAIDA_GPS_DARF_CAPA ITEM1
                            left Join lkm_saida_gps_darf_item2 item2
                              on item1.codigo_receita = item2.codigo_receita
                             and item1.datadoc = item2.datadoc
                             and item1.num_doc_fis = item2.num_doc_fis
                           WHERE DECODE(ITEM1.EMPRESA,
                                        '1000',
                                        '001',
                                        '2000',
                                        '002',
                                        '000') = PS_EMPRESA
                             AND ITEM1.DATADOC BETWEEN
                                 TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                 TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                             AND lpad(trim(substr(trim(regexp_substr(ITEM2.num_doc_fis,
                                                                     '[^-]+',
                                                                     1,
                                                                     1)),
                                                  1,
                                                  9)),
                                      9,
                                      '0')

                                 in (SELECT LPAD(COLUMN_VALUE, 9, 0) LINHA
                                       FROM TABLE(explode(';', ps_num_docfis))
                                      where COLUMN_VALUE is not null)

                             AND LPAD(NVL(regexp_substr(ITEM2.num_doc_fis,
                                                        '[^-]+',
                                                        1,
                                                        2),
                                          0),
                                      3,
                                      0)

                                 in (SELECT LPAD(COLUMN_VALUE, 3, 0) LINHA
                                       FROM TABLE(explode(';', PS_SERIE))
                                      where COLUMN_VALUE is not null)

                             AND ITEM1.Codigo_Receita like
                                 ('%' || trim(PS_RETENCAO) || '%')
                             AND ITEM1.Codigo_Receita in ('2631', '2658')
                             AND item1.fornec like
                                 ('%' || trim(PS_COD_FISJUR) || '%')

                          UNION ALL
                          --Item1
                          SELECT DISTINCT trim(regexp_substr(item1.LINHA,
                                                             '[^;]+',
                                                             1,
                                                             1)) || ';' ||
                                          trim(regexp_substr(item1.LINHA,
                                                             '[^;]+',
                                                             1,
                                                             2)) || ';' ||
                                          trim(regexp_substr(item1.LINHA,
                                                             '[^;]+',
                                                             1,
                                                             3)) || ';' ||

                                          trim(TO_CHAR(item2.VALOR +
                                                       REPLACE(REPLACE(TRIM(to_char(NVL(P_VLR_MULTA,
                                                                                        0),
                                                                                    '0000000000D00')),
                                                                       '.',
                                                                       ''),
                                                               ',',
                                                               '') +
                                                       REPLACE(REPLACE(TRIM(to_char(NVL(P_VLR_JUROS,
                                                                                        0),
                                                                                    '0000000000D00')),
                                                                       '.',
                                                                       ''),
                                                               ',',
                                                               ''),
                                                       '000000000000')) || ';' as linha,
                                          item1.Localnegocio COD_FIS_JUR,
                                          TO_CHAR(item1.NUM_DOC_FIS),
                                          item1.ORDEM,
                                          item1.EMPRESA,
                                          item1.DATADOC,
                                          item1.codigo_receita,
                                          item1.fornec
                            FROM LKM_SAIDA_GPS_DARF_ITEM1 item1
                            left Join lkm_saida_gps_darf_item2 item2
                              on item1.codigo_receita = item2.codigo_receita
                             and item1.num_doc_fis = item2.num_doc_fis
                             and item1.fornec = item2.fornec

                           WHERE DECODE(item1.EMPRESA,
                                        '1000',
                                        '001',
                                        '2000',
                                        '002',
                                        '000') = PS_EMPRESA
                             AND item1.DATADOC BETWEEN
                                 TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                 TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                             AND lpad(trim(substr(trim(regexp_substr(ITEM2.num_doc_fis,
                                                                     '[^-]+',
                                                                     1,
                                                                     1)),
                                                  1,
                                                  9)),
                                      9,
                                      '0')

                                 in (SELECT LPAD(COLUMN_VALUE, 9, 0) LINHA
                                       FROM TABLE(explode(';', ps_num_docfis))
                                      where COLUMN_VALUE is not null)

                             AND LPAD(NVL(regexp_substr(ITEM2.num_doc_fis,
                                                        '[^-]+',
                                                        1,
                                                        2),
                                          0),
                                      3,
                                      0)

                                 in (SELECT LPAD(COLUMN_VALUE, 3, 0) LINHA
                                       FROM TABLE(explode(';', PS_SERIE))
                                      where COLUMN_VALUE is not null)

                             AND item2.fornec like
                                 ('%' || trim(PS_COD_FISJUR) || '%')
                             AND ITEM2.Codigo_Receita like
                                 ('%' || trim(PS_RETENCAO) || '%')
                             AND ITEM2.Codigo_Receita in ('2631', '2658')

                          UNION ALL
                          --Item2
                          SELECT DISTINCT LINHA,
                                          Localnegocio COD_FIS_JUR,
                                          TO_CHAR(NUM_DOC_FIS),
                                          ORDEM,
                                          EMPRESA,
                                          DATADOC,
                                          codigo_receita,
                                          fornec
                            FROM LKM_SAIDA_GPS_DARF_ITEM2 item2
                           WHERE DECODE(EMPRESA,
                                        '1000',
                                        '001',
                                        '2000',
                                        '002',
                                        '000') = PS_EMPRESA
                             AND DATADOC BETWEEN
                                 TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                 TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                             AND lpad(trim(substr(trim(regexp_substr(ITEM2.num_doc_fis,
                                                                     '[^-]+',
                                                                     1,
                                                                     1)),
                                                  1,
                                                  9)),
                                      9,
                                      '0')

                                 in (SELECT LPAD(COLUMN_VALUE, 9, 0) LINHA
                                       FROM TABLE(explode(';', ps_num_docfis))
                                      where COLUMN_VALUE is not null)

                             AND LPAD(NVL(regexp_substr(ITEM2.num_doc_fis,
                                                        '[^-]+',
                                                        1,
                                                        2),
                                          0),
                                      3,
                                      0)

                                 in (SELECT LPAD(COLUMN_VALUE, 3, 0) LINHA
                                       FROM TABLE(explode(';', PS_SERIE))
                                      where COLUMN_VALUE is not null)

                             AND fornec like
                                 ('%' || trim(PS_COD_FISJUR) || '%')
                             AND ITEM2.Codigo_Receita like
                                 ('%' || trim(PS_RETENCAO) || '%')
                             AND ITEM2.Codigo_Receita in ('2631', '2658')

                          UNION ALL
                          --Multa
                          SELECT DISTINCT 'I;MULTA;' ||
                                          DECODE(PS_EMPRESA,
                                                 '001',
                                                 '1001',
                                                 '002',
                                                 '2001',
                                                 '0000') || ';' ||
                                          REPLACE(REPLACE(TRIM(TO_CHAR(P_VLR_MULTA,
                                                                       '0000000000D00',
                                                                       'NLS_NUMERIC_CHARACTERS='',.''')),
                                                          '.',
                                                          ''),
                                                  ',',
                                                  '') || ';' as LINHA,
                                          item1.Localnegocio cod_fis_jur,
                                          TO_CHAR(item1.NUM_DOC_FIS),
                                          '4' ORDEM,
                                          item1.EMPRESA,
                                          item1.DATADOC,
                                          item1.codigo_receita,
                                          item1.fornec
                            FROM LKM_SAIDA_GPS_DARF_ITEM1 item1
                            left Join lkm_saida_gps_darf_item2 item2
                              on item1.codigo_receita = item2.codigo_receita
                             and item1.num_doc_fis = item2.num_doc_fis
                             and item1.datadoc = item2.datadoc

                           WHERE DECODE(item1.EMPRESA,
                                        '1000',
                                        '001',
                                        '2000',
                                        '002',
                                        '000') = PS_EMPRESA
                             AND item1.DATADOC BETWEEN
                                 TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                 TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                             AND lpad(trim(substr(trim(regexp_substr(ITEM2.num_doc_fis,
                                                                     '[^-]+',
                                                                     1,
                                                                     1)),
                                                  1,
                                                  9)),
                                      9,
                                      '0')

                                 in (SELECT LPAD(COLUMN_VALUE, 9, 0) LINHA
                                       FROM TABLE(explode(';', ps_num_docfis))
                                      where COLUMN_VALUE is not null)

                             AND LPAD(NVL(regexp_substr(ITEM2.num_doc_fis,
                                                        '[^-]+',
                                                        1,
                                                        2),
                                          0),
                                      3,
                                      0)

                                 in (SELECT LPAD(COLUMN_VALUE, 3, 0) LINHA
                                       FROM TABLE(explode(';', PS_SERIE))
                                      where COLUMN_VALUE is not null)

                             AND item1.fornec like
                                 ('%' || trim(PS_COD_FISJUR) || '%')
                             AND ITEM2.Codigo_Receita like
                                 ('%' || trim(PS_RETENCAO) || '%')
                             AND ITEM2.Codigo_Receita in ('2631', '2658')

                          UNION ALL
                          --Juros
                          SELECT DISTINCT 'I;JUROS;' ||
                                          DECODE(PS_EMPRESA,
                                                 '001',
                                                 '1001',
                                                 '002',
                                                 '2001',
                                                 '0000') || ';' ||
                                          REPLACE(REPLACE(TRIM(TO_CHAR(P_VLR_JUROS,
                                                                       '0000000000D00',
                                                                       'NLS_NUMERIC_CHARACTERS='',.''')),
                                                          '.',
                                                          ''),
                                                  ',',
                                                  '') || ';' as LINHA,
                                          item1.Localnegocio COD_FIS_JUR,
                                          TO_CHAR(item1.NUM_DOC_FIS),
                                          '5' ORDEM,
                                          item1.EMPRESA,
                                          item1.DATADOC,
                                          item1.codigo_receita,
                                          item1.fornec
                            FROM LKM_SAIDA_GPS_DARF_ITEM1 item1
                            left Join lkm_saida_gps_darf_item2 item2
                              on item1.codigo_receita = item2.codigo_receita
                             and item1.num_doc_fis = item2.num_doc_fis
                             and item1.datadoc = item2.datadoc

                           WHERE DECODE(item1.EMPRESA,
                                        '1000',
                                        '001',
                                        '2000',
                                        '002',
                                        '000') = PS_EMPRESA
                             AND item1.DATADOC BETWEEN
                                 TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                 TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                             AND lpad(trim(substr(trim(regexp_substr(ITEM2.num_doc_fis,
                                                                     '[^-]+',
                                                                     1,
                                                                     1)),
                                                  1,
                                                  9)),
                                      9,
                                      '0')

                                 in (SELECT LPAD(COLUMN_VALUE, 9, 0) LINHA
                                       FROM TABLE(explode(';', ps_num_docfis))
                                      where COLUMN_VALUE is not null)

                             AND LPAD(NVL(regexp_substr(ITEM2.num_doc_fis,
                                                        '[^-]+',
                                                        1,
                                                        2),
                                          0),
                                      3,
                                      0)

                                 in (SELECT LPAD(COLUMN_VALUE, 3, 0) LINHA
                                       FROM TABLE(explode(';', PS_SERIE))
                                      where COLUMN_VALUE is not null)

                             AND item1.fornec like
                                 ('%' || trim(PS_COD_FISJUR) || '%')
                             AND ITEM2.Codigo_Receita like
                                 ('%' || trim(PS_RETENCAO) || '%')
                             AND ITEM2.Codigo_Receita in ('2631', '2658')

                          UNION ALL
                          --Entidades
                          SELECT DISTINCT LINHA,
                                          COD_FIS_JUR,
                                          Localnegocio NUM_DOC_FIS,
                                          '6' ORDEM,
                                          EMPRESA,
                                          DATADOC,
                                          codigo_receita,
                                          fornec
                            FROM LKM_SAIDA_GPS_DARF_ITEM5_E
                           WHERE DECODE(EMPRESA,
                                        '1000',
                                        '001',
                                        '2000',
                                        '002',
                                        '000') = PS_EMPRESA
                             AND DATADOC BETWEEN
                                 TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                 TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                             AND CODIGO_RECEITA in ('2631', '2658')
                             AND fornec like
                                 ('%' || trim(PS_COD_FISJUR) || '%')

                          --GPS 2100

                          -------------------------------------------------------
                          union all

                          SELECT DISTINCT ITEM1.LINHA,
                                          ITEM1.Localnegocio COD_FIS_JUR,
                                          ITEM2.NUM_DOC_FIS,
                                          ITEM1.ORDEM,
                                          ITEM1.EMPRESA,
                                          ITEM1.DATADOC,
                                          ITEM1.codigo_receita,
                                          ITEM1.fornec
                            FROM LKM_SAIDA_GPS_DARF_CAPA ITEM1
                            left Join lkm_saida_gps_darf_item2 item2
                              on item1.codigo_receita = item2.codigo_receita

                           WHERE DECODE(ITEM1.EMPRESA,
                                        '1000',
                                        '001',
                                        '2000',
                                        '002',
                                        '000') = PS_EMPRESA
                             AND ITEM1.DATADOC BETWEEN
                                 TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                 TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                             AND lpad(trim(substr(trim(regexp_substr(ITEM2.num_doc_fis,
                                                                     '[^-]+',
                                                                     1,
                                                                     1)),
                                                  1,
                                                  9)),
                                      9,
                                      '0')

                                 in (SELECT LPAD(COLUMN_VALUE, 9, 0) LINHA
                                       FROM TABLE(explode(';', ps_num_docfis))
                                      where COLUMN_VALUE is not null)

                             AND LPAD(NVL(regexp_substr(ITEM2.num_doc_fis,
                                                        '[^-]+',
                                                        1,
                                                        2),
                                          0),
                                      3,
                                      0)

                                 in (SELECT LPAD(COLUMN_VALUE, 3, 0) LINHA
                                       FROM TABLE(explode(';', PS_SERIE))
                                      where COLUMN_VALUE is not null)

                             AND ITEM1.Codigo_Receita like
                                 ('%' || trim(PS_RETENCAO) || '%')
                             AND ITEM1.Codigo_Receita in ('2100')
                             AND item2.fornec like
                                 ('%' || trim(PS_COD_FISJUR) || '%')

                          UNION ALL
                          --Item1
                          SELECT DISTINCT trim(regexp_substr(item1.LINHA,
                                                             '[^;]+',
                                                             1,
                                                             1)) || ';' ||
                                          trim(regexp_substr(item1.LINHA,
                                                             '[^;]+',
                                                             1,
                                                             2)) || ';' ||
                                          trim(regexp_substr(item1.LINHA,
                                                             '[^;]+',
                                                             1,
                                                             3)) || ';' ||

                                          trim(TO_CHAR(item2.VALOR +
                                                       REPLACE(REPLACE(TRIM(to_char(NVL(P_VLR_MULTA,
                                                                                        0),
                                                                                    '0000000000D00')),
                                                                       '.',
                                                                       ''),
                                                               ',',
                                                               '') +
                                                       REPLACE(REPLACE(TRIM(to_char(NVL(P_VLR_JUROS,
                                                                                        0),
                                                                                    '0000000000D00')),
                                                                       '.',
                                                                       ''),
                                                               ',',
                                                               ''),
                                                       '000000000000')) || ';' as linha,
                                          item1.Localnegocio COD_FIS_JUR,
                                          TO_CHAR(item1.NUM_DOC_FIS),
                                          item1.ORDEM,
                                          item1.EMPRESA,
                                          item1.DATADOC,
                                          item1.codigo_receita,
                                          item1.fornec
                            FROM LKM_SAIDA_GPS_DARF_ITEM1 item1
                            left Join lkm_saida_gps_darf_item2 item2
                              on item1.codigo_receita = item2.codigo_receita

                           WHERE DECODE(item1.EMPRESA,
                                        '1000',
                                        '001',
                                        '2000',
                                        '002',
                                        '000') = PS_EMPRESA
                             AND item1.DATADOC BETWEEN
                                 TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                 TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                             AND lpad(trim(substr(trim(regexp_substr(ITEM2.num_doc_fis,
                                                                     '[^-]+',
                                                                     1,
                                                                     1)),
                                                  1,
                                                  9)),
                                      9,
                                      '0')

                                 in (SELECT LPAD(COLUMN_VALUE, 9, 0) LINHA
                                       FROM TABLE(explode(';', ps_num_docfis))
                                      where COLUMN_VALUE is not null)

                             AND LPAD(NVL(regexp_substr(ITEM2.num_doc_fis,
                                                        '[^-]+',
                                                        1,
                                                        2),
                                          0),
                                      3,
                                      0)

                                 in (SELECT LPAD(COLUMN_VALUE, 3, 0) LINHA
                                       FROM TABLE(explode(';', PS_SERIE))
                                      where COLUMN_VALUE is not null)

                             AND item2.fornec like
                                 ('%' || trim(PS_COD_FISJUR) || '%')
                             AND ITEM2.Codigo_Receita like
                                 ('%' || trim(PS_RETENCAO) || '%')
                             AND ITEM2.Codigo_Receita in ('2100')

                          UNION ALL
                          --Item2
                          SELECT DISTINCT LINHA,
                                          Localnegocio COD_FIS_JUR,
                                          TO_CHAR(NUM_DOC_FIS),
                                          ORDEM,
                                          EMPRESA,
                                          DATADOC,
                                          codigo_receita,
                                          fornec
                            FROM LKM_SAIDA_GPS_DARF_ITEM2 item2
                           WHERE DECODE(EMPRESA,
                                        '1000',
                                        '001',
                                        '2000',
                                        '002',
                                        '000') = PS_EMPRESA
                             AND DATADOC BETWEEN
                                 TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                 TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                             AND lpad(trim(substr(trim(regexp_substr(ITEM2.num_doc_fis,
                                                                     '[^-]+',
                                                                     1,
                                                                     1)),
                                                  1,
                                                  9)),
                                      9,
                                      '0')

                                 in (SELECT LPAD(COLUMN_VALUE, 9, 0) LINHA
                                       FROM TABLE(explode(';', ps_num_docfis))
                                      where COLUMN_VALUE is not null)

                             AND LPAD(NVL(regexp_substr(ITEM2.num_doc_fis,
                                                        '[^-]+',
                                                        1,
                                                        2),
                                          0),
                                      3,
                                      0)

                                 in (SELECT LPAD(COLUMN_VALUE, 3, 0) LINHA
                                       FROM TABLE(explode(';', PS_SERIE))
                                      where COLUMN_VALUE is not null)

                             AND fornec like
                                 ('%' || trim(PS_COD_FISJUR) || '%')
                             AND ITEM2.Codigo_Receita like
                                 ('%' || trim(PS_RETENCAO) || '%')
                             AND ITEM2.Codigo_Receita in ('2100')

                          UNION ALL
                          --Multa
                          SELECT DISTINCT 'I;MULTA;' ||
                                          DECODE(PS_EMPRESA,
                                                 '001',
                                                 '1001',
                                                 '002',
                                                 '2001',
                                                 '0000') || ';' ||
                                          REPLACE(REPLACE(TRIM(TO_CHAR(P_VLR_MULTA,
                                                                       '0000000000D00',
                                                                       'NLS_NUMERIC_CHARACTERS='',.''')),
                                                          '.',
                                                          ''),
                                                  ',',
                                                  '') || ';' as LINHA,
                                          item1.Localnegocio cod_fis_jur,
                                          TO_CHAR(item1.NUM_DOC_FIS),
                                          '4' ORDEM,
                                          item1.EMPRESA,
                                          item1.DATADOC,
                                          item1.codigo_receita,
                                          item1.fornec
                            FROM LKM_SAIDA_GPS_DARF_ITEM1 item1
                            left Join lkm_saida_gps_darf_item2 item2
                              on item1.codigo_receita = item2.codigo_receita

                           WHERE DECODE(item1.EMPRESA,
                                        '1000',
                                        '001',
                                        '2000',
                                        '002',
                                        '000') = PS_EMPRESA
                             AND item1.DATADOC BETWEEN
                                 TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                 TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                             AND lpad(trim(substr(trim(regexp_substr(ITEM2.num_doc_fis,
                                                                     '[^-]+',
                                                                     1,
                                                                     1)),
                                                  1,
                                                  9)),
                                      9,
                                      '0')

                                 in (SELECT LPAD(COLUMN_VALUE, 9, 0) LINHA
                                       FROM TABLE(explode(';', ps_num_docfis))
                                      where COLUMN_VALUE is not null)

                             AND LPAD(NVL(regexp_substr(ITEM2.num_doc_fis,
                                                        '[^-]+',
                                                        1,
                                                        2),
                                          0),
                                      3,
                                      0)

                                 in (SELECT LPAD(COLUMN_VALUE, 3, 0) LINHA
                                       FROM TABLE(explode(';', PS_SERIE))
                                      where COLUMN_VALUE is not null)

                             AND item2.fornec like
                                 ('%' || trim(PS_COD_FISJUR) || '%')
                             AND ITEM2.Codigo_Receita like
                                 ('%' || trim(PS_RETENCAO) || '%')
                             AND ITEM2.Codigo_Receita in ('2100')

                          UNION ALL
                          --Juros
                          SELECT DISTINCT 'I;JUROS;' ||
                                          DECODE(PS_EMPRESA,
                                                 '001',
                                                 '1001',
                                                 '002',
                                                 '2001',
                                                 '0000') || ';' ||
                                          REPLACE(REPLACE(TRIM(TO_CHAR(P_VLR_JUROS,
                                                                       '0000000000D00',
                                                                       'NLS_NUMERIC_CHARACTERS='',.''')),
                                                          '.',
                                                          ''),
                                                  ',',
                                                  '') || ';' as LINHA,
                                          item1.Localnegocio COD_FIS_JUR,
                                          TO_CHAR(item1.NUM_DOC_FIS),
                                          '5' ORDEM,
                                          item1.EMPRESA,
                                          item1.DATADOC,
                                          item1.codigo_receita,
                                          item1.fornec
                            FROM LKM_SAIDA_GPS_DARF_ITEM1 item1
                            left Join lkm_saida_gps_darf_item2 item2
                              on item1.codigo_receita = item2.codigo_receita

                           WHERE DECODE(item1.EMPRESA,
                                        '1000',
                                        '001',
                                        '2000',
                                        '002',
                                        '000') = PS_EMPRESA
                             AND item1.DATADOC BETWEEN
                                 TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                 TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                             AND lpad(trim(substr(trim(regexp_substr(ITEM2.num_doc_fis,
                                                                     '[^-]+',
                                                                     1,
                                                                     1)),
                                                  1,
                                                  9)),
                                      9,
                                      '0')

                                 in (SELECT LPAD(COLUMN_VALUE, 9, 0) LINHA
                                       FROM TABLE(explode(';', ps_num_docfis))
                                      where COLUMN_VALUE is not null)

                             AND LPAD(NVL(regexp_substr(ITEM2.num_doc_fis,
                                                        '[^-]+',
                                                        1,
                                                        2),
                                          0),
                                      3,
                                      0)

                                 in (SELECT LPAD(COLUMN_VALUE, 3, 0) LINHA
                                       FROM TABLE(explode(';', PS_SERIE))
                                      where COLUMN_VALUE is not null)

                             AND item2.fornec like
                                 ('%' || trim(PS_COD_FISJUR) || '%')
                             AND ITEM2.Codigo_Receita like
                                 ('%' || trim(PS_RETENCAO) || '%')
                             AND ITEM2.Codigo_Receita in ('2100')

                          UNION ALL
                          --Entidades
                          SELECT DISTINCT LINHA,
                                          COD_FIS_JUR,
                                          Localnegocio NUM_DOC_FIS,
                                          '6' ORDEM,
                                          EMPRESA,
                                          DATADOC,
                                          codigo_receita,
                                          fornec
                            FROM LKM_SAIDA_GPS_DARF_ITEM5_E
                           WHERE DECODE(EMPRESA,
                                        '1000',
                                        '001',
                                        '2000',
                                        '002',
                                        '000') = PS_EMPRESA
                             AND DATADOC BETWEEN
                                 TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                 TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                             AND CODIGO_RECEITA = '2100'
                             AND fornec like
                                 ('%' || trim(PS_COD_FISJUR) || '%')

                           ORDER BY 4),
                         LKM_LOAD_DARF as

                          (

                          ----------------------------------------------------------------------------------------------------------
                          -- G E R A - D A R F
                          ----------------------------------------------------------------------------------------------------------
                          --CAPA
                          SELECT DISTINCT capa.linha,
                                           capa.COD_FIS_JUR,
                                           TO_CHAR(item2.NUM_DOC_FIS),
                                           capa.ORDEM,
                                           capa.EMPRESA,
                                           '0' DATADOC,
                                           capa.codigo_receita,
                                           '' fornec
                            FROM LKM_SAIDA_GPS_DARF_CAPA CAPA
                            left Join lkm_saida_gps_darf_item2 item2
                              on CAPA.codigo_receita = item2.codigo_receita

                           WHERE lpad(trim(substr(trim(regexp_substr(ITEM2.num_doc_fis,
                                                                     '[^-]+',
                                                                     1,
                                                                     1)),
                                                  1,
                                                  9)),
                                      9,
                                      '0')

                                 in (SELECT LPAD(COLUMN_VALUE, 9, 0) LINHA
                                       FROM TABLE(explode(';', ps_num_docfis))
                                      where COLUMN_VALUE is not null)

                             AND LPAD(NVL(regexp_substr(ITEM2.num_doc_fis,
                                                        '[^-]+',
                                                        1,
                                                        2),
                                          0),
                                      3,
                                      0)

                                 in (SELECT LPAD(COLUMN_VALUE, 3, 0) LINHA
                                       FROM TABLE(explode(';', PS_SERIE))
                                      where COLUMN_VALUE is not null)

                             AND DECODE(CAPA.EMPRESA,
                                        '1000',
                                        '001',
                                        '2000',
                                        '002',
                                        '000') = PS_EMPRESA
                             AND DECODE(item2.EMPRESA,
                                        '1000',
                                        '001',
                                        '2000',
                                        '002',
                                        '000') = PS_EMPRESA
                             AND capa.DATADOC BETWEEN
                                 TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                 TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                             AND item2.DATADOC BETWEEN
                                 TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                 TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                             AND capa.CODIGO_RECEITA like
                                 ('%' || trim(PS_RETENCAO) || '%')
                             AND capa.Codigo_Receita not in
                                 ('2100', '2631', '2658', 'DAM')

                          --ITEM 1
                          UNION ALL
                          SELECT DISTINCT trim(regexp_substr(item1.LINHA,
                                                             '[^;]+',
                                                             1,
                                                             1)) || ';' ||
                                          trim(regexp_substr(item1.LINHA,
                                                             '[^;]+',
                                                             1,
                                                             2)) || ';' ||
                                          trim(regexp_substr(item1.LINHA,
                                                             '[^;]+',
                                                             1,
                                                             3)) || ';' ||

                                          trim(TO_CHAR(item2.VALOR +
                                                       REPLACE(REPLACE(TRIM(to_char(NVL(P_VLR_MULTA,
                                                                                        0),
                                                                                    '0000000000D00')),
                                                                       '.',
                                                                       ''),
                                                               ',',
                                                               '') +
                                                       REPLACE(REPLACE(TRIM(to_char(NVL(P_VLR_JUROS,
                                                                                        0),
                                                                                    '0000000000D00')),
                                                                       '.',
                                                                       ''),
                                                               ',',
                                                               ''),
                                                       '000000000000')) || ';' as linha,
                                          item1.COD_FIS_JUR,
                                          TO_CHAR(item2.NUM_DOC_FIS),
                                          item1.ORDEM,
                                          item1.EMPRESA,
                                          '0' DATADOC,
                                          item1.codigo_receita,
                                          '' fornec
                            FROM LKM_SAIDA_GPS_DARF_ITEM1 item1
                            left Join lkm_saida_gps_darf_item2 item2
                              on item1.codigo_receita = item2.codigo_receita

                           WHERE lpad(trim(substr(trim(regexp_substr(ITEM2.num_doc_fis,
                                                                     '[^-]+',
                                                                     1,
                                                                     1)),
                                                  1,
                                                  9)),
                                      9,
                                      '0')

                                 in (SELECT LPAD(COLUMN_VALUE, 9, 0) LINHA
                                       FROM TABLE(explode(';', ps_num_docfis))
                                      where COLUMN_VALUE is not null)

                             AND LPAD(NVL(regexp_substr(ITEM2.num_doc_fis,
                                                        '[^-]+',
                                                        1,
                                                        2),
                                          0),
                                      3,
                                      0)

                                 in (SELECT LPAD(COLUMN_VALUE, 3, 0) LINHA
                                       FROM TABLE(explode(';', PS_SERIE))
                                      where COLUMN_VALUE is not null)

                             AND DECODE(item1.EMPRESA,
                                        '1000',
                                        '001',
                                        '2000',
                                        '002',
                                        '000') = PS_EMPRESA
                             AND DECODE(item2.EMPRESA,
                                        '1000',
                                        '001',
                                        '2000',
                                        '002',
                                        '000') = PS_EMPRESA
                             AND item1.DATADOC BETWEEN
                                 TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                 TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                             AND item2.DATADOC BETWEEN
                                 TO_CHAR(PS_DATA_INICIAL, 'DDMMYYYY') AND
                                 TO_CHAR(PS_DATA_FINAL, 'DDMMYYYY')
                             AND item1.CODIGO_RECEITA like
                                 ('%' || trim(PS_RETENCAO) || '%')
                             AND ITEM1.Codigo_Receita not in
                                 ('2100', '2631', '2658', 'DAM')

                          UNION ALL
                          --Item2
                          SELECT DISTINCT LINHA,
                                          COD_FIS_JUR,
                                          TO_CHAR(NUM_DOC_FIS),
                                          ORDEM,
                                          EMPRESA,
                                          '0' DATADOC,
                                          codigo_receita,
                                          '' fornec
                            FROM LKM_SAIDA_GPS_DARF_ITEM2 ITEM2
                           WHERE DECODE(EMPRESA,
                                        '1000',
                                        '001',
                                        '2000',
                                        '002',
                                        '000') = PS_EMPRESA
                             AND DATADOC BETWEEN
                                 TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                 TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                             AND lpad(trim(substr(trim(regexp_substr(ITEM2.num_doc_fis,
                                                                     '[^-]+',
                                                                     1,
                                                                     1)),
                                                  1,
                                                  9)),
                                      9,
                                      '0')

                                 in (SELECT LPAD(COLUMN_VALUE, 9, 0) LINHA
                                       FROM TABLE(explode(';', ps_num_docfis))
                                      where COLUMN_VALUE is not null)

                             AND LPAD(NVL(regexp_substr(ITEM2.num_doc_fis,
                                                        '[^-]+',
                                                        1,
                                                        2),
                                          0),
                                      3,
                                      0)

                                 in (SELECT LPAD(COLUMN_VALUE, 3, 0) LINHA
                                       FROM TABLE(explode(';', PS_SERIE))
                                      where COLUMN_VALUE is not null)

                             AND CODIGO_RECEITA like
                                 ('%' || trim(PS_RETENCAO) || '%')
                             AND Codigo_Receita not in
                                 ('2100', '2631', '2658', 'DAM')

                          UNION ALL
                          --Multa
                          SELECT DISTINCT 'I;MULTA;' ||
                                          DECODE(PS_EMPRESA,
                                                 '001',
                                                 '1001',
                                                 '002',
                                                 '2001',
                                                 '0000') || ';' ||
                                          REPLACE(REPLACE(TRIM(TO_CHAR(P_VLR_MULTA,
                                                                       '0000000000D00',
                                                                       'NLS_NUMERIC_CHARACTERS='',.''')),
                                                          '.',
                                                          ''),
                                                  ',',
                                                  '') || ';' as LINHA,
                                          COD_FIS_JUR,
                                          TO_CHAR(NUM_DOC_FIS),
                                          '4' ORDEM,
                                          EMPRESA,
                                          '0' DATADOC,
                                          codigo_receita,
                                          '' fornec
                            FROM LKM_SAIDA_GPS_DARF_ITEM2
                           WHERE DECODE(EMPRESA,
                                        '1000',
                                        '001',
                                        '2000',
                                        '002',
                                        '000') = PS_EMPRESA
                             AND DATADOC BETWEEN
                                 TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                 TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                             AND lpad(trim(substr(trim(regexp_substr(num_doc_fis,
                                                                     '[^-]+',
                                                                     1,
                                                                     1)),
                                                  1,
                                                  9)),
                                      9,
                                      '0')

                                 in (SELECT LPAD(COLUMN_VALUE, 9, 0) LINHA
                                       FROM TABLE(explode(';', ps_num_docfis))
                                      where COLUMN_VALUE is not null)

                             AND LPAD(NVL(regexp_substr(num_doc_fis,
                                                        '[^-]+',
                                                        1,
                                                        2),
                                          0),
                                      3,
                                      0)

                                 in (SELECT LPAD(COLUMN_VALUE, 3, 0) LINHA
                                       FROM TABLE(explode(';', PS_SERIE))
                                      where COLUMN_VALUE is not null)

                             AND CODIGO_RECEITA like
                                 ('%' || trim(PS_RETENCAO) || '%')
                             AND Codigo_Receita not in
                                 ('2100', '2631', '2658', 'DAM')

                          UNION ALL
                          --Juros
                          SELECT DISTINCT 'I;JUROS;' ||
                                          DECODE(PS_EMPRESA,
                                                 '001',
                                                 '1001',
                                                 '002',
                                                 '2001',
                                                 '0000') || ';' ||
                                          REPLACE(REPLACE(TRIM(TO_CHAR(P_VLR_JUROS,
                                                                       '0000000000D00',
                                                                       'NLS_NUMERIC_CHARACTERS='',.''')),
                                                          '.',
                                                          ''),
                                                  ',',
                                                  '') || ';' as LINHA,
                                          COD_FIS_JUR,
                                          TO_CHAR(NUM_DOC_FIS),
                                          '5' ORDEM,
                                          EMPRESA,
                                          '0' DATADOC,
                                          codigo_receita,
                                          '' fornec
                            FROM LKM_SAIDA_GPS_DARF_ITEM2
                           WHERE DECODE(EMPRESA,
                                        '1000',
                                        '001',
                                        '2000',
                                        '002',
                                        '000') = PS_EMPRESA
                             AND DATADOC BETWEEN
                                 TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                 TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                             AND lpad(trim(substr(trim(regexp_substr(num_doc_fis,
                                                                     '[^-]+',
                                                                     1,
                                                                     1)),
                                                  1,
                                                  9)),
                                      9,
                                      '0')

                                 in (SELECT LPAD(COLUMN_VALUE, 9, 0) LINHA
                                       FROM TABLE(explode(';', ps_num_docfis))
                                      where COLUMN_VALUE is not null)

                             AND LPAD(NVL(regexp_substr(num_doc_fis,
                                                        '[^-]+',
                                                        1,
                                                        2),
                                          0),
                                      3,
                                      0)

                                 in (SELECT LPAD(COLUMN_VALUE, 3, 0) LINHA
                                       FROM TABLE(explode(';', PS_SERIE))
                                      where COLUMN_VALUE is not null)

                             AND CODIGO_RECEITA like
                                 ('%' || trim(PS_RETENCAO) || '%')
                             AND Codigo_Receita not in
                                 ('2100', '2631', '2658', 'DAM')

                          UNION ALL
                          --Entidades
                          SELECT DISTINCT LINHA,
                                          '999999999' COD_FIS_JUR,
                                          TO_CHAR('999999999'),
                                          '6' ORDEM,
                                          EMPRESA,
                                          '0' DATADOC,
                                          codigo_receita,
                                          '' fornec
                            FROM LKM_SAIDA_GPS_DARF_ITEM5_E
                           WHERE DECODE(EMPRESA,
                                        '1000',
                                        '001',
                                        '2000',
                                        '002',
                                        '000') = PS_EMPRESA
                             AND DATADOC BETWEEN
                                 TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                 TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                             AND CODIGO_RECEITA like
                                 ('%' || trim(PS_RETENCAO) || '%')
                             AND Codigo_Receita not in
                                 ('2100', '2631', '2658', 'DAM')

                           ORDER BY 7, 3, 8, 2, 4)

                         Select LPAD(ROWNUM, 6, 0) SEQ, L.*
                           from LKM_LOAD_GPS L
                         union all
                         Select LPAD(ROWNUM, 6, 0) SEQ, M.*
                           from LKM_LOAD_DARF M

                       )

           LOOP

            MLINHA       := NULL;
            MLINHA       := LIB_STR.W(MLINHA, MREG.LINHA, 1);
            v_numero_arq := 1;

            IF MLINHA IS NOT NULL THEN
              IF MREG.CODIGO_RECEITA = ('0588') or
                 MREG.CODIGO_RECEITA = ('1708') or
                 MREG.CODIGO_RECEITA = ('5952') or
                 MREG.CODIGO_RECEITA = ('3280') or
                 MREG.CODIGO_RECEITA = ('5960') or
                 MREG.CODIGO_RECEITA = ('5979') or
                 MREG.CODIGO_RECEITA = ('3280') or
                 MREG.CODIGO_RECEITA = ('2100') or
                 MREG.CODIGO_RECEITA = ('2631') or
                 MREG.CODIGO_RECEITA = ('2658') THEN

                v_contador := v_contador + 1;
                IF P_FINALIDADE = 1 THEN
                  IF v_contador = 1 THEN

                    LIB_PROC.ADD_TIPO(MPROC_ID,
                                      to_number(1),
                                      EMP || '_DARF_RECON_' ||
                                      trim(to_char(sysdate,
                                                   'ddmmrrrrhh24miss')) ||
                                      '.TXT',
                                      2);

                  END IF;

                  LIB_PROC.add(plinha          => mLinha,
                               ppag            => 1,
                               plin            => 1,
                               ptipo           => to_number(1),
                               pChaveOrdenacao => MREG.SEQ);

                END IF;

                IF P_FINALIDADE = 3 THEN
                  IF v_contador = 1 THEN
                    LIB_PROC.ADD_TIPO(MPROC_ID,
                                      1,
                                      EMP || '_' || PS_ESTAB ||
                                      '_GPS_RECON_' ||
                                      trim(to_char(sysdate,
                                                   'ddmmrrrrhh24miss')) ||
                                      '.TXT',
                                      2);

                  END IF;

                  LIB_PROC.add(plinha          => MLINHA,
                               ppag            => 1,
                               plin            => 1,
                               ptipo           => 1,
                               pChaveOrdenacao => MREG.SEQ);

                END IF;

              END IF;

            END IF;

          END LOOP;

        END;

      END IF;

      ------------------------------------------------------------------------------------------------------------
      -- G E R A -  D A M
      -----------------------------------------------------------------------------------------------------------

      IF (P_FINALIDADE = '2') OR (P_FINALIDADE = '5' ) THEN

        BEGIN
          v_contador7 := 0;
          FOR MREG9 IN (WITH LKM_LOAD as
                          --capa
                           (SELECT DISTINCT ITEM1.LINHA,
                                           ITEM1.Localnegocio COD_FIS_JUR,
                                           ITEM2.NUM_DOC_FIS,
                                           ITEM1.ORDEM,
                                           ITEM1.EMPRESA,
                                           ITEM1.DATADOC,
                                           ITEM1.codigo_receita,
                                           ITEM1.fornec
                             FROM LKM_SAIDA_GPS_DARF_CAPA ITEM1
                             left Join lkm_saida_gps_darf_item2 item2
                               on item1.codigo_receita =
                                  item2.codigo_receita
                              and item1.datadoc = item2.datadoc
                              and item1.num_doc_fis = item2.num_doc_fis
                            WHERE DECODE(ITEM1.EMPRESA,
                                         '1000',
                                         '001',
                                         '2000',
                                         '002',
                                         '000') = PS_EMPRESA
                              AND ITEM1.DATADOC BETWEEN
                                  TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                  TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                              AND lpad(trim(substr(trim(regexp_substr(ITEM1.num_doc_fis,
                                                                      '[^-]+',
                                                                      1,
                                                                      1)),
                                                   1,
                                                   9)),
                                       9,
                                       '0')

                                  in (SELECT LPAD(COLUMN_VALUE, 9, 0) LINHA
                                        FROM TABLE(explode(';', ps_num_docfis))
                                       where COLUMN_VALUE is not null)

                              AND LPAD(NVL(regexp_substr(ITEM1.num_doc_fis,
                                                         '[^-]+',
                                                         1,
                                                         2),
                                           0),
                                       3,
                                       0)

                                  in (SELECT LPAD(COLUMN_VALUE, 3, 0) LINHA
                                        FROM TABLE(explode(';', PS_SERIE))
                                       where COLUMN_VALUE is not null)

                              AND ITEM1.Codigo_Receita like
                                  ('%' || trim(PS_RETENCAO) || '%')
                              AND ITEM2.Localnegocio = PS_ESTAB

                           UNION ALL
                           --Item1
                           SELECT DISTINCT trim(regexp_substr(item1.LINHA,
                                                              '[^;]+',
                                                              1,
                                                              1)) || ';' ||
                                           trim(regexp_substr(item1.LINHA,
                                                              '[^;]+',
                                                              1,
                                                              2)) || ';' ||
                                           PS_ESTAB || ';' ||

                                           trim(TO_CHAR(item2.VALOR +
                                                        REPLACE(REPLACE(TRIM(to_char(NVL(P_VLR_MULTA,
                                                                                         0),
                                                                                     '0000000000D00')),
                                                                        '.',
                                                                        ''),
                                                                ',',
                                                                '') +
                                                        REPLACE(REPLACE(TRIM(to_char(NVL(P_VLR_JUROS,
                                                                                         0),
                                                                                     '0000000000D00')),
                                                                        '.',
                                                                        ''),
                                                                ',',
                                                                ''),
                                                        '000000000000')) || ';' as linha,
                                           item1.Localnegocio COD_FIS_JUR,
                                           TO_CHAR(item1.NUM_DOC_FIS),
                                           item1.ORDEM,
                                           item1.EMPRESA,
                                           item1.DATADOC,
                                           item1.codigo_receita,
                                           item1.fornec
                             FROM LKM_SAIDA_GPS_DARF_ITEM1 item1
                             left Join lkm_saida_gps_darf_item2 item2
                               on item1.codigo_receita =
                                  item2.codigo_receita
                              AND ITEM1.NUM_DOC_FIS = ITEM2.NUM_DOC_FIS

                            WHERE DECODE(item1.EMPRESA,
                                         '1000',
                                         '001',
                                         '2000',
                                         '002',
                                         '000') = PS_EMPRESA
                              AND item1.DATADOC BETWEEN
                                  TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                  TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                              AND lpad(trim(substr(trim(regexp_substr(ITEM2.num_doc_fis,
                                                                      '[^-]+',
                                                                      1,
                                                                      1)),
                                                   1,
                                                   9)),
                                       9,
                                       '0')

                                  in (SELECT LPAD(COLUMN_VALUE, 9, 0) LINHA
                                        FROM TABLE(explode(';', ps_num_docfis))
                                       where COLUMN_VALUE is not null)

                              AND LPAD(NVL(regexp_substr(ITEM2.num_doc_fis,
                                                         '[^-]+',
                                                         1,
                                                         2),
                                           0),
                                       3,
                                       0)

                                  in (SELECT LPAD(COLUMN_VALUE, 3, 0) LINHA
                                        FROM TABLE(explode(';', PS_SERIE))
                                       where COLUMN_VALUE is not null)

                              AND ITEM2.Codigo_Receita like
                                  ('%' || trim(PS_RETENCAO) || '%')
                              AND ITEM2.Localnegocio = PS_ESTAB

                           UNION ALL
                           --Item2
                           SELECT DISTINCT LINHA,
                                           Localnegocio COD_FIS_JUR,
                                           TO_CHAR(NUM_DOC_FIS),
                                           ORDEM,
                                           EMPRESA,
                                           DATADOC,
                                           codigo_receita,
                                           fornec
                             FROM LKM_SAIDA_GPS_DARF_ITEM2 item2
                            WHERE DECODE(EMPRESA,
                                         '1000',
                                         '001',
                                         '2000',
                                         '002',
                                         '000') = PS_EMPRESA
                              AND DATADOC BETWEEN
                                  TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                  TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                              AND lpad(trim(substr(trim(regexp_substr(ITEM2.num_doc_fis,
                                                                      '[^-]+',
                                                                      1,
                                                                      1)),
                                                   1,
                                                   9)),
                                       9,
                                       '0')

                                  in (SELECT LPAD(COLUMN_VALUE, 9, 0) LINHA
                                        FROM TABLE(explode(';', ps_num_docfis))
                                       where COLUMN_VALUE is not null)

                              AND LPAD(NVL(regexp_substr(ITEM2.num_doc_fis,
                                                         '[^-]+',
                                                         1,
                                                         2),
                                           0),
                                       3,
                                       0)

                                  in (SELECT LPAD(COLUMN_VALUE, 3, 0) LINHA
                                        FROM TABLE(explode(';', PS_SERIE))
                                       where COLUMN_VALUE is not null)

                              AND ITEM2.Codigo_Receita like
                                  ('%' || trim(PS_RETENCAO) || '%')
                              AND ITEM2.Localnegocio = PS_ESTAB

                           UNION ALL
                           --Multa
                           SELECT DISTINCT 'I;MULTA;' || PS_ESTAB || ';' ||
                                           REPLACE(REPLACE(TRIM(TO_CHAR(P_VLR_MULTA,
                                                                        '0000000000D00',
                                                                        'NLS_NUMERIC_CHARACTERS='',.''')),
                                                           '.',
                                                           ''),
                                                   ',',
                                                   '') || ';' as LINHA,
                                           item1.Localnegocio cod_fis_jur,
                                           TO_CHAR(item1.NUM_DOC_FIS),
                                           '4' ORDEM,
                                           item1.EMPRESA,
                                           item1.DATADOC,
                                           item1.codigo_receita,
                                           item1.fornec
                             FROM LKM_SAIDA_GPS_DARF_ITEM1 item1
                             left Join lkm_saida_gps_darf_item2 item2
                               on item1.codigo_receita =
                                  item2.codigo_receita
                              and item1.num_doc_fis = item2.num_doc_fis

                            WHERE DECODE(item1.EMPRESA,
                                         '1000',
                                         '001',
                                         '2000',
                                         '002',
                                         '000') = PS_EMPRESA
                              AND item1.DATADOC BETWEEN
                                  TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                  TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                              AND lpad(trim(substr(trim(regexp_substr(ITEM2.num_doc_fis,
                                                                      '[^-]+',
                                                                      1,
                                                                      1)),
                                                   1,
                                                   9)),
                                       9,
                                       '0')

                                  in (SELECT LPAD(COLUMN_VALUE, 9, 0) LINHA
                                        FROM TABLE(explode(';', ps_num_docfis))
                                       where COLUMN_VALUE is not null)

                              AND LPAD(NVL(regexp_substr(ITEM2.num_doc_fis,
                                                         '[^-]+',
                                                         1,
                                                         2),
                                           0),
                                       3,
                                       0)

                                  in (SELECT LPAD(COLUMN_VALUE, 3, 0) LINHA
                                        FROM TABLE(explode(';', PS_SERIE))
                                       where COLUMN_VALUE is not null)

                              AND ITEM2.Codigo_Receita like
                                  ('%' || trim(PS_RETENCAO) || '%')
                              AND ITEM2.Localnegocio = PS_ESTAB

                           UNION ALL
                           --Juros
                           SELECT DISTINCT 'I;JUROS;' || PS_ESTAB || ';' ||
                                           REPLACE(REPLACE(TRIM(TO_CHAR(P_VLR_JUROS,
                                                                        '0000000000D00',
                                                                        'NLS_NUMERIC_CHARACTERS='',.''')),
                                                           '.',
                                                           ''),
                                                   ',',
                                                   '') || ';' as LINHA,
                                           item1.Localnegocio COD_FIS_JUR,
                                           TO_CHAR(item1.NUM_DOC_FIS),
                                           '5' ORDEM,
                                           item1.EMPRESA,
                                           item1.DATADOC,
                                           item1.codigo_receita,
                                           item1.fornec
                             FROM LKM_SAIDA_GPS_DARF_ITEM1 item1
                             left Join lkm_saida_gps_darf_item2 item2
                               on item1.codigo_receita =
                                  item2.codigo_receita
                              and item1.num_doc_fis = item2.num_doc_fis

                            WHERE DECODE(item1.EMPRESA,
                                         '1000',
                                         '001',
                                         '2000',
                                         '002',
                                         '000') = PS_EMPRESA
                              AND item1.DATADOC BETWEEN
                                  TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                  TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                              AND lpad(trim(substr(trim(regexp_substr(ITEM2.num_doc_fis,
                                                                      '[^-]+',
                                                                      1,
                                                                      1)),
                                                   1,
                                                   9)),
                                       9,
                                       '0')

                                  in (SELECT LPAD(COLUMN_VALUE, 9, 0) LINHA
                                        FROM TABLE(explode(';', ps_num_docfis))
                                       where COLUMN_VALUE is not null)

                              AND LPAD(NVL(regexp_substr(ITEM2.num_doc_fis,
                                                         '[^-]+',
                                                         1,
                                                         2),
                                           0),
                                       3,
                                       0)

                                  in (SELECT LPAD(COLUMN_VALUE, 3, 0) LINHA
                                        FROM TABLE(explode(';', PS_SERIE))
                                       where COLUMN_VALUE is not null)

                              AND ITEM2.Codigo_Receita like
                                  ('%' || trim(PS_RETENCAO) || '%')
                              AND ITEM2.Localnegocio = PS_ESTAB
                           UNION ALL

                           --Entidades
                           SELECT DISTINCT LINHA,
                                           Localnegocio COD_FIS_JUR,
                                           TO_CHAR(NUM_DOC_FIS),
                                           '6' ORDEM,
                                           EMPRESA,
                                           DATADOC,
                                           codigo_receita,
                                           fornec
                             FROM LKM_SAIDA_GPS_DARF_ITEM5_E ITEM2
                            WHERE DECODE(EMPRESA,
                                         '1000',
                                         '001',
                                         '2000',
                                         '002',
                                         '000') = PS_EMPRESA
                              AND localnegocio = PS_ESTAB

                              AND lpad(trim(substr(trim(regexp_substr(ITEM2.num_doc_fis,
                                                                      '[^-]+',
                                                                      1,
                                                                      1)),
                                                   1,
                                                   9)),
                                       9,
                                       '0')

                                  in (SELECT LPAD(COLUMN_VALUE, 9, 0) LINHA
                                        FROM TABLE(explode(';', ps_num_docfis))
                                       where COLUMN_VALUE is not null)

                              AND LPAD(NVL(regexp_substr(ITEM2.num_doc_fis,
                                                         '[^-]+',
                                                         1,
                                                         2),
                                           0),
                                       3,
                                       0)

                                  in (SELECT LPAD(COLUMN_VALUE, 3, 0) LINHA
                                        FROM TABLE(explode(';', PS_SERIE))
                                       where COLUMN_VALUE is not null)




                              AND DATADOC BETWEEN
                                  TO_DATE(PS_DATA_INICIAL, 'DD/MM/YYYY') AND
                                  TO_DATE(PS_DATA_FINAL, 'DD/MM/YYYY')
                              AND CODIGO_RECEITA = 'DAM'

                            ORDER BY 4)
                          Select LPAD(ROWNUM, 6, 0) SEQ, L.* from LKM_LOAD L)

           LOOP

            MLINHA2      := NULL;
            MLINHA2      := LIB_STR.W(MLINHA2, MREG9.LINHA, 1);
            v_numero_arq := 1;

            IF MLINHA2 IS NOT NULL THEN

              IF MREG9.CODIGO_RECEITA = 'DAM' THEN

                v_contador7 := v_contador7 + 1;

                IF v_contador7 = 1 THEN
                  LIB_PROC.ADD_TIPO(MPROC_ID,
                                    to_number(9),
                                    EMP || '_' || PS_ESTAB || '_DAM_RECON_' ||
                                    trim(to_char(sysdate,
                                                 'ddmmrrrrhh24miss')) ||
                                    '.TXT',
                                    2);
                END IF;

                LIB_PROC.add(plinha          => MLINHA2,
                             ppag            => 1,
                             plin            => 1,
                             ptipo           => to_number(9),
                             pChaveOrdenacao => MREG9.SEQ);

              END IF;

            END IF;

          END LOOP;

        END;

      END IF;

    END IF;
  END LKM_PLOAD_MJE;
END LKM_RECON3_CPROC;
/
