CREATE OR REPLACE VIEW VW_LKM_MUNICIPAIS_NOTA AS
SELECT ESTAB.COD_EMPRESA                          COD_EMPRESA
       ,ESTAB.COD_ESTAB                           COD_ESTAB
       ,ESTAB.CGC                                 CGC
       ,ESTAB.INSC_MUNICIPAL                      INSC_MUNICIPAL_ESTAB
       ,X07.DATA_FISCAL                           DATA_FISCAL
       ,MUN.DESCRICAO                             DESCRICAO
       ,CASE WHEN X07.MOVTO_E_S IN (1,4) THEN
               'TOMADOR'
             ELSE
               'PRESTADOR'
        END                                       TIPO
       ,MUN.COD_UF||MUN.COD_MUNICIPIO             IBGE
       ,MUN.COD_MUNICIPIO                         COD_MUNICIPIO
       ,X07.NUM_DOCFIS                            NUM_DOCFIS
       --REGRA PARA BROTAS
       ,CASE WHEN MUN.COD_MUNICIPIO = '7902' THEN
             CASE WHEN X04.COD_MUNICIPIO = MUN.COD_MUNICIPIO THEN
               'NFSE'
             ELSE 'T'
             END
        ELSE X07.SERIE_DOCFIS
        END                         SERIE
       ,CASE WHEN X2005.COD_DOCTO = 'RPA' THEN
                '3'
             ELSE
               '1'
        END                                       ES_TIPO
       ,X07.DATA_EMISSAO                          DT_EMISSAO
       ,CASE WHEN X07.MOVTO_E_S IN (1,4) THEN
               'R'
             ELSE
               'E'
        END                                       TIPO_NOTA
        ,X04.CPF_CGC                             CPF_CGC
        ,X07.VLR_TOT_NOTA                        VLR_TOT_NOTA
        ,CASE WHEN X07.VLR_ISS_RETIDO > 0 THEN
               'S'
              ELSE 'I'/*'P' - Alterado devido ao erro na valida¿¿o do arquivo para Alvares Machado */
         END                                     TP_RECOLHIMENTO
        ,SUBSTR(X04.RAZAO_SOCIAL,1,50)           RAZAO_SOCIAL
        ,EST.COD_ESTADO                          COD_ESTADO
        ,X04.CEP                                 CEP
        ,SUBSTR(X04.CIDADE,1,50)                 CIDADE
--< atffl
        ,ESTAB.RAZAO_SOCIAL                      RAZAO_TOMADOR
        ,CASE WHEN X07.SITUACAO = 'S' THEN 'S'
              WHEN X07.VLR_ISS_RETIDO > 0 THEN
               'R'
              ELSE 'I'

         END                                     ST_NOTA --(N-Normal, C-Cancelada, A-Anulada, I-Isenta, R-Retida, S-Substituta, T-Nao tributavel, E-Regime especial ou D-Descontado pela prefeitura.)
        ,CASE WHEN X04.IND_SIMPLES_NAC = 'S' THEN
              'S'
              ELSE
                'N'
         END                                     OPT_SIMPLES
         ,CASE WHEN X07.VLR_BASE_ISS_2 >0 THEN '3'
               WHEN ESTAB.COD_MUNIC_ISS = X07.COD_MUNICIPIO THEN
               '1'
               ELSE
                 '2'
         END NAT_OPERACAO --1 - Tributacao no municipio 2 - Tributacao fora do municipio 3 - Isencao
       ,CASE WHEN X07.SITUACAO = 'S'  THEN
               'CANCELADO'
             ELSE
               ' '
       END                                                                                      AS MOTIVO_CANC
--> atfl

 ,CASE WHEN ESTAB.COD_MUNIC_ISS = X07.COD_MUNICIPIO THEN
                  '1'
              ELSE
                  '2'
              END                                                                                NAT_OPER

FROM DWT_DOCTO_FISCAL X07
     LEFT JOIN ESTABELECIMENTO ESTAB                ON X07.COD_EMPRESA          = ESTAB.COD_EMPRESA
                                                   AND X07.COD_ESTAB           = ESTAB.COD_ESTAB
    LEFT JOIN MUNICIPIO MUN                        ON ESTAB.COD_MUNICIPIO      = MUN.COD_MUNICIPIO
                                                   AND ESTAB.IDENT_ESTADO      = MUN.IDENT_ESTADO
    LEFT JOIN X2005_TIPO_DOCTO   X2005             ON X07.IDENT_DOCTO       = X2005.IDENT_DOCTO
    LEFT JOIN X04_PESSOA_FIS_JUR X04               ON X07.IDENT_FIS_JUR       = X04.IDENT_FIS_JUR
    LEFT JOIN MUNICIPIO MUN_T                      ON X04.COD_MUNICIPIO      = MUN_T.COD_MUNICIPIO
                                                   AND X04.IDENT_ESTADO      = MUN_T.IDENT_ESTADO
    LEFT JOIN ESTADO    EST                        ON X04.IDENT_ESTADO         = EST.IDENT_ESTADO

    WHERE ESTAB.COD_ESTAB != '1108'
    AND X07.SITUACAO = 'N'
    AND X07.MOVTO_E_S <> '9'
    and x07.cod_class_doc_fis = '2'
    and nvl(substr(x07.cod_municipio,3,5),0) <> nvl(x07.cod_municipio_orig,0);
