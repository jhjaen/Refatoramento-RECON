CREATE OR REPLACE VIEW VW_LKM_MUNICIPAIS_FGMAISS AS
SELECT X09.COD_EMPRESA
       ,X09.COD_ESTAB
       ,x09.num_docfis
       ,X09.SERIE_DOCFIS                          SERIE_DOCFIS
       ,''                                        VAZIO
       ,X07.DATA_EMISSAO                          DT_EMISSAO
       ,CASE WHEN X07.MOVTO_E_S IN (1,4) THEN
               'TOMADOR'
             ELSE
               'PRESTADOR'
        END                                       TIPO
       ,MUN.COD_MUNICIPIO                         COD_MUNICIPIO
       ,ESTAB.CGC                                 CGC
       ,x09.data_fiscal
       ,x09.ident_fis_jur
--Lucas Lima
      ,to_char(MAX(SUBSTR(decode(x09.num_item,1,NVL(X116.COD_SERV_LEI_116,'0000'),'0000'),1,2)
        ||'.'||SUBSTR(decode(x09.num_item,1,NVL(X116.COD_SERV_LEI_116,'0000'),'0000'),3,2)))     AS ITEM_SERVICO1
       ,to_char(replace(replace(MAX(SUBSTR(decode(x09.num_item,2,NVL(X116.COD_SERV_LEI_116,'0000'),'0000'),1,2)
        ||'.'||SUBSTR(decode(x09.num_item,2,NVL(X116.COD_SERV_LEI_116,'0000'),'0000'),3,2)),'.',''),',',''))    AS ITEM_SERVICO2
       ,to_char(MAX(SUBSTR(decode(x09.num_item,3,NVL(X116.COD_SERV_LEI_116,'0000'),'0000'),1,2)
        ||'.'||SUBSTR(decode(x09.num_item,3,NVL(X116.COD_SERV_LEI_116,'0000'),'0000'),3,2)))     AS ITEM_SERVICO3
       ,to_char(MAX(SUBSTR(decode(x09.num_item,4,NVL(X116.COD_SERV_LEI_116,'0000'),'0000'),1,2)
        ||'.'||SUBSTR(decode(x09.num_item,4,NVL(X116.COD_SERV_LEI_116,'0000'),'0000'),3,2)))     AS ITEM_SERVICO4
       ,to_char(MAX(SUBSTR(decode(x09.num_item,5,NVL(X116.COD_SERV_LEI_116,'0000'),'0000'),1,2)
        ||'.'||SUBSTR(decode(x09.num_item,5,NVL(X116.COD_SERV_LEI_116,'0000'),'0000'),3,2)))     AS ITEM_SERVICO5
       ,to_char(MAX(SUBSTR(decode(x09.num_item,6,NVL(X116.COD_SERV_LEI_116,'0000'),'0000'),1,2)
        ||'.'||SUBSTR(decode(x09.num_item,6,NVL(X116.COD_SERV_LEI_116,'0000'),'0000'),3,2)))     AS ITEM_SERVICO6
       ,to_char(MAX(SUBSTR(decode(x09.num_item,7,NVL(X116.COD_SERV_LEI_116,'0000'),'0000'),1,2)
        ||'.'||SUBSTR(decode(x09.num_item,7,NVL(X116.COD_SERV_LEI_116,'0000'),'0000'),3,2)))     AS ITEM_SERVICO7
       ,to_char(MAX(SUBSTR(decode(x09.num_item,8,NVL(X116.COD_SERV_LEI_116,'0000'),'0000'),1,2)
        ||'.'||SUBSTR(decode(x09.num_item,8,NVL(X116.COD_SERV_LEI_116,'0000'),'0000'),3,2)))     AS ITEM_SERVICO8
       ,to_char(MAX(decode(x09.num_item,1,X09.Vlr_Servico,0)))                                           AS VLR_TRIBUTO_ISS1
       ,to_char(MAX(decode(x09.num_item,2,X09.VLR_TRIBUTO_ISS,0)))                                       AS VLR_TRIBUTO_ISS2
       ,to_char(MAX(decode(x09.num_item,3,X09.VLR_TRIBUTO_ISS,0)))                                       AS VLR_TRIBUTO_ISS3
       ,to_char(MAX(decode(x09.num_item,4,X09.VLR_TRIBUTO_ISS,0)))                                       AS VLR_TRIBUTO_ISS4
       ,to_char(MAX(decode(x09.num_item,5,X09.VLR_TRIBUTO_ISS,0)))                                       AS VLR_TRIBUTO_ISS5
       ,to_char(MAX(decode(x09.num_item,6,X09.VLR_TRIBUTO_ISS,0)))                                       AS VLR_TRIBUTO_ISS6
       ,to_char(MAX(decode(x09.num_item,7,X09.VLR_TRIBUTO_ISS,0)))                                       AS VLR_TRIBUTO_ISS7
       ,to_char(MAX(decode(x09.num_item,8,X09.VLR_TRIBUTO_ISS,0)))                                       AS VLR_TRIBUTO_ISS8
-- Lucas Lima
       ,CASE WHEN SUM(X09.VLR_ISS_RETIDO)   > 0 THEN
               'SIM'
             ELSE
               'NAO'
        END                                                                                     AS RETENCAO
       ,regexp_replace(ESTAB.CGC,'([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})','\1.\2.\3/\4-')     CGC_FORMATADO
       ,CASE WHEN EST.COD_REGIAO = 'EX' THEN
                    ''
               WHEN LENGTH(X04.CPF_CGC) = 11 THEN
                   translate(to_char(X04.CPF_CGC / 100, '000,000,000.00'), ',.', '.-')
               ELSE
                   regexp_replace(X04.CPF_CGC,'([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})','\1.\2.\3/\4-')
          END                                      CPF_CGC_FORMATADO
       ,'9999'                                                                                  AS CIDADE_ISSQN
       ,ESTAB.RAZAO_SOCIAL                                                                      AS RAZAO_TOMADOR
--<LucasLima
       ,X09.Aliq_Tributo_Iss                                                                    ALIQ_TRIBUTO_ISS
       ,MUN.COD_UF||MUN.COD_MUNICIPIO                                                           IBGE
       ,(TO_NUMBER(SUBSTR(X116.COD_SERV_LEI_116,1,2))||'.'||SUBSTR(X116.COD_SERV_LEI_116,3,4))  COD_SERV_LEI_116
--LucasLima>
        ,CASE WHEN ESTAB.COD_MUNIC_ISS = X07.COD_MUNICIPIO THEN
                  '1'
              ELSE
                  '2'
              END                                                                                NAT_OPER
--Lucas Lima
       ,NVL(X04.IND_SIMPLES_NAC,'N') OPT_SIMPLES
       ,X07.obs_compl_motivo MOTIVO_CANC
       ,X07.Situacao  ST_NOTA

--Lucas Lima

FROM  DWT_DOCTO_FISCAL X07
     LEFT JOIN DWT_ITENS_SERV X09                  ON X07.COD_EMPRESA            = X09.COD_EMPRESA
                                                   AND X07.COD_ESTAB           = X09.COD_ESTAB
                                                   AND X07.DATA_FISCAL         = X09.DATA_FISCAL
                                                   AND X07.MOVTO_E_S           = X09.MOVTO_E_S
                                                   AND X07.NORM_DEV            = X09.NORM_DEV
                                                   AND X07.IDENT_DOCTO         = X09.IDENT_DOCTO
                                                   AND X07.IDENT_FIS_JUR       = X09.IDENT_FIS_JUR
                                                   AND X07.NUM_DOCFIS          = X09.NUM_DOCFIS
                                                   AND X07.SERIE_DOCFIS        = X09.SERIE_DOCFIS
                                                   AND X07.SUB_SERIE_DOCFIS    = X09.SUB_SERIE_DOCFIS
    LEFT JOIN ESTABELECIMENTO ESTAB                ON X07.COD_EMPRESA          = ESTAB.COD_EMPRESA
                                                   AND X07.COD_ESTAB           = ESTAB.COD_ESTAB
    LEFT JOIN MUNICIPIO MUN                        ON ESTAB.COD_MUNICIPIO      = MUN.COD_MUNICIPIO
                                                   AND ESTAB.IDENT_ESTADO      = MUN.IDENT_ESTADO
    LEFT JOIN X04_PESSOA_FIS_JUR X04               ON X07.IDENT_FIS_JUR       = X04.IDENT_FIS_JUR
    LEFT JOIN MUNICIPIO MUN_T                      ON X04.COD_MUNICIPIO      = MUN_T.COD_MUNICIPIO
                                                   AND X04.IDENT_ESTADO      = MUN_T.IDENT_ESTADO
    LEFT JOIN ESTADO    EST                        ON X04.IDENT_ESTADO         = EST.IDENT_ESTADO

    LEFT JOIN X2005_TIPO_DOCTO   X2005             ON X07.IDENT_DOCTO       = X2005.IDENT_DOCTO
    LEFT JOIN X2018_SERVICOS X2018                 ON X09.IDENT_SERVICO        = X2018.IDENT_SERVICO
    LEFT JOIN DWT_SERVICO_LEI_116 X116             ON X2018.IDENT_SERV_LEI_116  = X116.IDENT_SERV_LEI_116
    LEFT JOIN X2097_MUNIC_ISS X2097                ON X07.COD_MUNICIPIO         = X2097.COD_MUNIC_ISS
    LEFT JOIN ESTADO EST_X2097                     ON X2097.IDENT_ESTADO        = EST_X2097.IDENT_ESTADO
    LEFT JOIN X2098_ALIQ_SERVICO X2098             ON X2097.COD_MUNIC_ISS       = X2098.COD_MUNIC_ISS
    LEFT JOIN PRT_SERVICO_MUNIC_MSAF PRT_MUN       ON X07.COD_EMPRESA           = PRT_MUN.COD_EMPRESA
                                                   AND X07.COD_MUNICIPIO        = PRT_MUN.COD_MUNICIPIO
                                                   AND X2018.COD_SERVICO        = PRT_MUN.COD_SERVICO
                                                   AND X2097.IDENT_ESTADO       = PRT_MUN.IDENT_ESTADO
-- Filtro FGMAIS
WHERE X09.Cod_Estab in ('1154','1089')
  and x07.situacao = 'N'
  and x07.cod_class_doc_fis = '2'
   AND X07.MOVTO_E_S <> '9'



-- Filtro FGMAIS

GROUP BY X09.COD_EMPRESA
       ,X09.COD_ESTAB
       ,x09.num_docfis
       ,X09.SERIE_DOCFIS
       ,x09.data_fiscal
       ,x09.ident_fis_jur
       ,regexp_replace(ESTAB.CGC,'([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})','\1.\2.\3/\4-')
       ,CASE WHEN EST.COD_REGIAO = 'EX' THEN
                    ''
               WHEN LENGTH(X04.CPF_CGC) = 11 THEN
                   translate(to_char(X04.CPF_CGC / 100, '000,000,000.00'), ',.', '.-')
               ELSE
                   regexp_replace(X04.CPF_CGC,'([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})','\1.\2.\3/\4-')
          END
       ,X07.DATA_EMISSAO
       ,CASE WHEN X07.MOVTO_E_S IN (1,4) THEN
               'TOMADOR'
             ELSE
               'PRESTADOR'
        END
       ,MUN.COD_MUNICIPIO
       ,ESTAB.CGC
       ,ESTAB.RAZAO_SOCIAL
--<LucasLima
       ,X09.Aliq_Tributo_Iss
       ,MUN.COD_UF||MUN.COD_MUNICIPIO
       ,(TO_NUMBER(SUBSTR(X116.COD_SERV_LEI_116,1,2))||'.'||SUBSTR(X116.COD_SERV_LEI_116,3,4))
--LucasLima>
       ,CASE WHEN ESTAB.COD_MUNIC_ISS = X07.COD_MUNICIPIO THEN
                  '1'
          ELSE
                  '2'
       END
--Lucas Lima
        ,X04.IND_SIMPLES_NAC
        ,X07.obs_compl_motivo
        ,X07.Situacao
--Lucas Lima;
