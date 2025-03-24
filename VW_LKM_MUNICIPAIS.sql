CREATE OR REPLACE VIEW VW_LKM_MUNICIPAIS AS
With LKM as  (
SELECT distinct ESTAB.COD_EMPRESA                         COD_EMPRESA
       ,ESTAB.COD_ESTAB                           COD_ESTAB
       ,ESTAB.CGC                                 CGC
       ,ESTAB.RAZAO_SOCIAL                        RAZAO_TOMADOR
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
       --REGRA PRA BROTAS
       ,CASE WHEN MUN.COD_MUNICIPIO = '7902' THEN
             CASE WHEN NVL(X07.COD_MUNICIPIO,MUN.COD_UF||MUN.COD_MUNICIPIO) = MUN_T.COD_UF||MUN_T.COD_MUNICIPIO THEN
               'NFSE'
             ELSE
               'T'
             END
        ELSE
                 X07.SERIE_DOCFIS
        END                           SERIE
       ,CASE WHEN X2005.COD_DOCTO = 'RPA' THEN
                '3'
             ELSE
               '1'
        END                                       ES_TIPO
       ,X07.DATA_EMISSAO                          DT_EMISSAO
       ,X2018.COD_SERVICO                         COD_SERVICO
       ,X09.VLR_SERVICO                           VLR_SERVICO
       ,X04.COD_MUNICIPIO                         COD_MUNICIPIO_X04
--       ,MUN.COD_UF||X04.COD_MUNICIPIO                         COD_MUNICIPIO_X04
--
       ,CASE WHEN PRT_MUN.COD_PARAM = '445' AND MUN.COD_MUNICIPIO = x07.cod_municipio_dest OR PRT_MUN.COD_PARAM = '589' THEN
               '1'
             WHEN PRT_MUN.COD_PARAM = '445' AND MUN.COD_MUNICIPIO <> x07.cod_municipio_dest THEN
               '2'
             WHEN X04.IND_CLASSE_PFJ = '10' OR  PRT_MUN.COD_PARAM = '433' THEN
               '3'
             WHEN X04.IND_CLASSE_PFJ = '07' OR  PRT_MUN.COD_PARAM = '420' THEN
               '4'
             WHEN X04.IND_CLASSE_PFJ = '9' OR  PRT_MUN.COD_PARAM = '427' THEN
               '5'
             WHEN PRT_MUN.COD_PARAM = '485' THEN
               '6'
        END                                        CD_NATUREZA_OPERACAO
       /*,CASE WHEN X04.IND_CLASSE_EMP = '01' THEN '6'
             WHEN X04.IND_CLASSE_EMP = '04' THEN '1'
             WHEN X04.IND_CLASSE_PFJ = '06' THEN '3'
             WHEN X04.IND_CLASSE_PFJ = '02' THEN '4'
             WHEN X04.IND_CLASSE_PFJ = '08' OR PRT_MUN.COD_PARAM = '421' THEN '2'
             WHEN X04.IND_CLASSE_PFJ = '10' OR PRT_MUN.COD_PARAM = '433' THEN '9'
             WHEN X04.IND_CLASSE_PFJ = '07' OR PRT_MUN.COD_PARAM = '420' THEN '10'
             WHEN X04.IND_CLASSE_PFJ = '09' OR PRT_MUN.COD_PARAM = '427' THEN '11'
             WHEN PRT_MUN.COD_PARAM = '452' THEN '5'
             WHEN PRT_MUN.COD_PARAM = '589' THEN '7'
             WHEN PRT_MUN.COD_PARAM = '495' THEN '8'
             WHEN PRT_MUN.COD_PARAM = '485' THEN '12'
        END                                        CD_REGIME*/

       , CASE WHEN MUN.COD_MUNICIPIO = '34609' THEN '7'  END CD_REGIME
       ,ESTAB.CGC||TO_CHAR(SYSDATE,'YYYY')||TO_CHAR(SYSDATE,'MM')
       ||TO_CHAR(SYSDATE,'DD')||TO_CHAR(SYSDATE,'HH')||TO_CHAR(SYSDATE,'MI')
       ||TO_CHAR(SYSDATE,'SS')                     NOME_ARQUIVO
       ,CASE WHEN MUN.COD_MUNICIPIO = '13702' THEN
               CASE WHEN ESTAB.IND_ISS = '07' THEN
                          'S'
                     ELSE
                          'N'
                END
             ELSE
               CASE WHEN ESTAB.IND_ISS = '07' THEN
                          '1'
                     ELSE
                          '2'
                END
        END                                   SIMPLES_NACIONAL
       ,CASE WHEN MUN.COD_MUNICIPIO IN ('34609','47700','35507') THEN
               CASE WHEN X07.SITUACAO <> 'S' THEN
                      '1'
                     ELSE
                       '2'
                END
             WHEN  MUN.COD_MUNICIPIO = '7902' THEN
               CASE WHEN X07.SITUACAO = 'S' THEN
                      'C'
                    WHEN ESTAB.IND_ISS = '04' THEN 'I'
                    WHEN ESTAB.IND_ISS = '02' THEN 'T'
                    WHEN ESTAB.IND_ISS = '07' THEN 'S'
                    ELSE 'F'

                END
             WHEN  MUN.COD_MUNICIPIO = '13702' THEN
               CASE WHEN X07.SITUACAO = 'S' THEN
                      '2'
                    WHEN X09.VLR_TRIBUTO_ISS > 0 THEN '1'
                    WHEN X09.VLR_ISS_RETIDO > 0 THEN '5'
                    ELSE '1'

                END
             WHEN  MUN.COD_MUNICIPIO = '36703' THEN
               CASE WHEN X07.SITUACAO <> 'S' THEN
                      '1'
                    ELSE '2'

                END
        END                                       SITUACAO
        ,''                                        VAZIO
        --,SUBSTR(X116.COD_SERV_LEI_116,1,2)||'.'||SUBSTR(X116.COD_SERV_LEI_116,3,4)                     COD_SERV_LEI_116
--        ,LTRIM(SUBSTR(X116.COD_SERV_LEI_116,1,2),0)||'.'||SUBSTR(X116.COD_SERV_LEI_116,3,4)                     COD_SERV_LEI_116
--<Lucaslima
          ,(TO_NUMBER(SUBSTR(X116.COD_SERV_LEI_116,1,2))||'.'||SUBSTR(X116.COD_SERV_LEI_116,3,4))                     COD_SERV_LEI_116
--LucasLima>
        ,nvl(X09.VLR_DEDUCAO_ISS,0)                       VLR_DEDUCAO_ISS
        ,CASE WHEN MUN.COD_MUNICIPIO IN ('36703') THEN
                  case when nvl(x07.ind_tp_ret,0) = '1'  then

                       'S'
                      else
                        'N'
                 end
              ELSE
                case when nvl(x07.ind_tp_ret,0) = '1'  then

                       '1'
                      else
                        '2'
                 end
          END                                      RETENCAO
         ,x09.VLR_TRIBUTO_ISS                      VLR_TRIBUTO_ISS
         ,nvl(x09.VLR_ISS_RETIDO,0)                VLR_ISS_RETIDO
         ,x09.VLR_BASE_ISS_3                       VLR_OUTRAS_RETENCOES
         --,X09.VLR_BASE_ISS_1                       VLR_BASE
         ,X09.VLR_SERVICO                          VLR_BASE
         ,X09.ALIQ_TRIBUTO_ISS                     ALIQ_TRIBUTO_ISS
         ,CASE WHEN MUN.COD_MUNICIPIO IN ('36703') THEN
                  CASE WHEN EST.COD_REGIAO = 'EX' THEN
                            '3'
                       WHEN LENGTH(X04.CPF_CGC) = 11 THEN
                            '2'
                       ELSE
                            '1'
                  END
               ELSE
                   CASE WHEN EST.COD_REGIAO = 'EX' THEN
                            '3'
                       WHEN LENGTH(X04.CPF_CGC) = 11 THEN
                            '1'
                       ELSE
                            '2'
                  END
           END                                     TIPO_CGCCPF
          ,X04.CPF_CGC                             CPF_CGC
          ,nvl(X04.INSC_MUNICIPAL,' ')             INSC_MUNICIPAL
          ,SUBSTR(X04.RAZAO_SOCIAL,1,50)           RAZAO_SOCIAL
          ,SUBSTR(X04.NOME_FANTASIA,1,50)          NOME_FANTASIA
          ,SUBSTR(X04.ENDERECO,1,50)               ENDERECO
          ,X04.NUM_ENDERECO                        NUM_ENDERECO
          ,nvl(X04.TP_LOGRADOURO,' ')              TP_LOGRADOURO
          ,NVL(SUBSTR(X04.COMPL_ENDERECO,1,40),' ') COMPL_ENDERECO
          ,SUBSTR(X04.BAIRRO,1,50)                 BAIRRO
          ,EST.COD_ESTADO                          COD_ESTADO
          --,X04.CEP                                 CEP
          ,TRIM(TO_CHAR(X04.CEP,'00000000'))       CEP --ATFL
          ,SUBSTR(X04.CIDADE,1,50)                 CIDADE
          ,MUN_T.COD_UF||LPAD(MUN_T.COD_MUNICIPIO,5,'0')       IBGE_TERCEIRO -- ATFL 08-12-2020
          ,SUBSTR(X04.TELEFONE,1,15)               TELEFONE
          ,SUBSTR(X04.E_MAIL,1,100)                E_MAIL
          ,CASE WHEN X2018.IND_TP_SERVICO = 1 THEN
                  TO_CHAR(X07.COD_MUNICIPIO)
                WHEN X2018.IND_TP_SERVICO <> 1 AND X07.COD_MUNICIPIO IS NULL THEN
                  MUN.COD_UF||MUN.COD_MUNICIPIO
                ELSE TO_CHAR(X07.COD_MUNICIPIO)
           END                                     IBGE_RECOLHIMENTO
          ,CASE WHEN X07.COD_MUNICIPIO IS NOT NULL THEN
                  EST_X2097.COD_ESTADO
                ELSE MUN.COD_MUN_ESTADO
           END                                     ESTADO_RECOLHIMENTO
          ,CASE WHEN X09.VLR_TRIBUTO_ISS > 0  THEN
                  '1'
                ELSE '2'
           END                                     SN_ISS_TRIBUTAVEL
           ,CASE WHEN X07.IND_TP_RET = '1'  THEN
                  '1'
                ELSE '2'
           END                                     SN_ISS_RETIDO

/*          ,CASE WHEN MUN.COD_MUNICIPIO in ('7902','13702') THEN
                    CASE
                      WHEN MUN.COD_MUNICIPIO = X07.COD_MUNICIPIO THEN 'D'
                      ELSE 'F'
                    END
           END                                     LOCAL_SERV_TOMADO
*/
--<LucasLima
          ,CASE WHEN X2097.COD_MUNIC_ISS in ('3507902','3513702') THEN
                    CASE
                      WHEN X2097.COD_MUNIC_ISS = X07.COD_MUNICIPIO THEN 'D'
                      ELSE 'F'
                    END
           END                                     LOCAL_SERV_TOMADO
--LucasLima>


          ,X2018.COD_ATIVIDADE                     COD_ATIVIDADE
          ,CASE WHEN X07.IND_TP_RET = '1' OR X2098.IND_TOM_TRIBUT_ISS = 'S' OR X09.VLR_ISS_RETIDO > 0 THEN
                  'N'
                 ELSE
                   'S'
           END                                     IMPOSTO_PAGO
          ,NVL(X07.DT_PAGTO_NF,X07.Data_Fiscal)   DT_PAGTO_NF
          ,CASE WHEN EST.COD_ESTADO <> 'EX' THEN
                  'S'
                ELSE
                  'N'
           END                                     DENTRO_PAIS
          ,CASE WHEN X09.VLR_DEDUCAO_ISS > 0 THEN
                   'S'
                ELSE
                  'N'
           END                                     DEDUCAO_MATERIAL
          ,CASE WHEN UPPER(X04.INSC_ESTADUAL) = 'ISENTO' THEN
                 'S'
                ELSE
                  'N'
           END                                     INSCRICAO_ESTADUAL_ISENTO
          ,X04.INSC_ESTADUAL                       INSC_ESTADUAL
          ,regexp_replace(ESTAB.CGC,'([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})','\1.\2.\3/\4-')     CGC_FORMATADO
          ,CASE WHEN EST.COD_REGIAO = 'EX' THEN
                    ''
               WHEN LENGTH(X04.CPF_CGC) = 11 THEN
                   translate(to_char(X04.CPF_CGC / 100, '000,000,000.00'), ',.', '.-')
               ELSE
                   regexp_replace(X04.CPF_CGC,'([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})','\1.\2.\3/\4-')
          END                                      CPF_CGC_FORMATADO
          ,'N'                                     TP_REFERENCIA
          ,nvl(X09.COD_CFPS,' ')                   COD_CFPS
          ,'31'                                    SERIE_MODELO
          ,''                                      CODIGO_ACESSO
          --<atfl
          ,CASE WHEN ESTAB.COD_MUNIC_ISS = X07.COD_MUNICIPIO THEN
                  '1'
              ELSE
                  '2'
              END                                                                               AS NAT_OPER
           -->atfl
          ,X09.Descricao_Compl                                                                 DescriNfi
          ,X09.Quantidade                                                                      QuantidadeNfi
          ,X09.Vlr_Unit                                                                        VlrUnitarioNfi
          ,x09.vlr_aliq_pis                                                                    vlr_aliq_pis
          ,x09.vlr_aliq_cofins                                                                 vlr_aliq_cofins
          ,x09.vlr_pis                                                                         vlr_pis
          ,x09.vlr_cofins                                                                      vlr_cofins
          ,x09.vlr_aliq_csll                                                                   vlr_aliq_csll
          ,to_char(substr(x09.vlr_aliq_inss,1,5),'00.00')                                      vlr_aliq_inss
          --,x53.aliquota                                                                        aliquota
          ,''                                                                                  aliquota --atfl 05.02

FROM DWT_DOCTO_FISCAL X07
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
                                                   AND MUN.COD_MUNICIPIO        = PRT_MUN.COD_MUNICIPIO
                                                   AND X2018.COD_SERVICO        = PRT_MUN.COD_SERVICO
                                                   AND X2097.IDENT_ESTADO       = PRT_MUN.IDENT_ESTADO
--atfl inicio 05.02.2020 -- TRECHO COMENTADO
    /*LEFT JOIN X53_RETENCAO_IRRF  X53               ON X07.Ident_Docto           = x53.ident_docto
                                                   AND x07.cod_empresa          = x53.cod_empresa
                                                   AND x07.cod_estab            = x53.cod_estab
                                                   AND x07.ident_fis_jur        = x53.ident_fis_jur
                                                   AND x07.num_docfis           = x53.num_docfis
   WHERE X53.cod_receita = '170806'*/
--atfl fim 05.02.2020
where x07.cod_class_doc_fis = 2
and x07.situacao != 'S'
and x07.movto_e_s != '9'
)

select "COD_EMPRESA","COD_ESTAB","CGC","RAZAO_TOMADOR","INSC_MUNICIPAL_ESTAB","DATA_FISCAL","DESCRICAO","TIPO","IBGE","COD_MUNICIPIO","NUM_DOCFIS","SERIE","ES_TIPO","DT_EMISSAO","COD_SERVICO","VLR_SERVICO","COD_MUNICIPIO_X04","CD_NATUREZA_OPERACAO","CD_REGIME","NOME_ARQUIVO","SIMPLES_NACIONAL","SITUACAO","VAZIO","COD_SERV_LEI_116","VLR_DEDUCAO_ISS","RETENCAO","VLR_TRIBUTO_ISS","VLR_ISS_RETIDO","VLR_OUTRAS_RETENCOES","VLR_BASE","ALIQ_TRIBUTO_ISS","TIPO_CGCCPF","CPF_CGC","INSC_MUNICIPAL","RAZAO_SOCIAL","NOME_FANTASIA","ENDERECO","NUM_ENDERECO","TP_LOGRADOURO","COMPL_ENDERECO","BAIRRO","COD_ESTADO","CEP","CIDADE","IBGE_TERCEIRO","TELEFONE","E_MAIL","IBGE_RECOLHIMENTO","ESTADO_RECOLHIMENTO","SN_ISS_TRIBUTAVEL","SN_ISS_RETIDO","LOCAL_SERV_TOMADO","COD_ATIVIDADE","IMPOSTO_PAGO","DT_PAGTO_NF","DENTRO_PAIS","DEDUCAO_MATERIAL","INSCRICAO_ESTADUAL_ISENTO","INSC_ESTADUAL","CGC_FORMATADO","CPF_CGC_FORMATADO","TP_REFERENCIA","COD_CFPS","SERIE_MODELO","CODIGO_ACESSO","NAT_OPER","DESCRINFI","QUANTIDADENFI","VLRUNITARIONFI","VLR_ALIQ_PIS","VLR_ALIQ_COFINS","VLR_PIS","VLR_COFINS","VLR_ALIQ_CSLL","VLR_ALIQ_INSS","ALIQUOTA" from LKM x
   where x.COD_MUNICIPIO = '36703'
    and COD_CFPS  <> '511'
 union all
select "COD_EMPRESA","COD_ESTAB","CGC","RAZAO_TOMADOR","INSC_MUNICIPAL_ESTAB","DATA_FISCAL","DESCRICAO","TIPO","IBGE","COD_MUNICIPIO","NUM_DOCFIS","SERIE","ES_TIPO","DT_EMISSAO","COD_SERVICO","VLR_SERVICO","COD_MUNICIPIO_X04","CD_NATUREZA_OPERACAO","CD_REGIME","NOME_ARQUIVO","SIMPLES_NACIONAL","SITUACAO","VAZIO","COD_SERV_LEI_116","VLR_DEDUCAO_ISS","RETENCAO","VLR_TRIBUTO_ISS","VLR_ISS_RETIDO","VLR_OUTRAS_RETENCOES","VLR_BASE","ALIQ_TRIBUTO_ISS","TIPO_CGCCPF","CPF_CGC","INSC_MUNICIPAL","RAZAO_SOCIAL","NOME_FANTASIA","ENDERECO","NUM_ENDERECO","TP_LOGRADOURO","COMPL_ENDERECO","BAIRRO","COD_ESTADO","CEP","CIDADE","IBGE_TERCEIRO","TELEFONE","E_MAIL","IBGE_RECOLHIMENTO","ESTADO_RECOLHIMENTO","SN_ISS_TRIBUTAVEL","SN_ISS_RETIDO","LOCAL_SERV_TOMADO","COD_ATIVIDADE","IMPOSTO_PAGO","DT_PAGTO_NF","DENTRO_PAIS","DEDUCAO_MATERIAL","INSCRICAO_ESTADUAL_ISENTO","INSC_ESTADUAL","CGC_FORMATADO","CPF_CGC_FORMATADO","TP_REFERENCIA","COD_CFPS","SERIE_MODELO","CODIGO_ACESSO","NAT_OPER","DESCRINFI","QUANTIDADENFI","VLRUNITARIONFI","VLR_ALIQ_PIS","VLR_ALIQ_COFINS","VLR_PIS","VLR_COFINS","VLR_ALIQ_CSLL","VLR_ALIQ_INSS","ALIQUOTA" from LKM x
   where x.COD_MUNICIPIO <> '36703';
