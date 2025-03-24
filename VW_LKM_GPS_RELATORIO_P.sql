CREATE OR REPLACE VIEW VW_LKM_GPS_RELATORIO_P AS
with LKM_AUTONOMOS as (
--------------2100 exceto MEI (05)
SELECT DISTINCT
                DECODE(X.COD_EMPRESA, '001', '1000', '002', '2000', '000') cod_empresa  --001
               ,X.COD_ESTAB cod_estab  --1001
               ,TO_DATE(X.Dat_Fiscal,'DD/MM/RRRR') dat_fiscal  --01/12/2020 00:00:00
               ,TRIM(TO_CHAR(X.NUM_DOCFIS)) num_docfis  --000001212
               ,TRIM(TO_CHAR(X.SERIE_DOCFIS)) serie_docfis  --1
               ,'' sub_serie_docfis  --
               ,TO_DATE(X.DAT_EMISSAO,'DD/MM/RRRR') dat_emissao  --01/12/2020 00:00:0
               ,X.Ind_Fis_Jur ind_fis_jur --1
               ,x.cod_fis_jur cod_fis_jur --100077394
               ,x04.cpf_cgc cpf_cgc  --71928444000130
               ,x04.razao_social razao_social  --EMOBREL ENGENHARIA E CONSTRUCOES LTDA
               ,x.vlr_tot_nota vlr_tot_nota  --204480,97
               ,x.vlr_servicos vlr_servicos  --75021,44
               ,x.vlr_aliq_inss vlr_aliq_inss  --11
               ,x.vlr_inss_retido vlr_inss_retido --8252,36
               ,ESTAB.CGC cgc  --03779133000104
               ,ESTAB.Razao_Social razao_social_1  --SERVICO SOCIAL DA INDUSTRIA-SESI
               ,'' inscricao_estadual --ISENTO
               ,X.COD_RETENCAO cod_retencao  --2631
               ,'' dat_extemp  --
               ,'N' ind_ret_emiss_cpag_cindividual -- N
               ,ESTAB.Razao_Social razao_social_emp  --SERVICO SOCIAL DA INDUSTRIA - SESI
               ,X.VLR_OUTRAS_ENTID vlr_outras_entid -- 0

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

          AND DWT07.SITUACAO <> 'S'
          AND X.Vlr_Aliq_Inss <> '20'
          AND NVL(X04.IND_CLASSE_EMP,0) <> '05' --atfl 18.12.2020
                ),


LKM_GPS  as (SELECT DISTINCT
                DECODE(X.COD_EMPRESA, '001', '1000', '002', '2000', '000') cod_empresa  --001
               ,X.COD_ESTAB cod_estab  --1001
               ,TO_DATE(X.Dat_Fiscal,'DD/MM/RRRR') dat_fiscal  --01/12/2020 00:00:00
               ,TRIM(TO_CHAR(X.NUM_DOCFIS)) num_docfis  --000001212
               ,TRIM(TO_CHAR(X.SERIE_DOCFIS)) serie_docfis  --1
               ,'' sub_serie_docfis  --
               ,TO_DATE(X.DAT_EMISSAO,'DD/MM/RRRR') dat_emissao  --01/12/2020 00:00:0
               ,X.Ind_Fis_Jur ind_fis_jur --1
               ,x.cod_fis_jur cod_fis_jur --100077394
               ,x04.cpf_cgc cpf_cgc  --71928444000130
               ,x04.razao_social razao_social  --EMOBREL ENGENHARIA E CONSTRUCOES LTDA
               ,x.vlr_tot_nota vlr_tot_nota  --204480,97
               ,x.vlr_servicos vlr_servicos  --75021,44
               ,x.vlr_aliq_inss vlr_aliq_inss  --11
               ,x.vlr_inss_retido vlr_inss_retido --8252,36
               ,ESTAB.CGC cgc  --03779133000104
               ,ESTAB.Razao_Social razao_social_1  --SERVICO SOCIAL DA INDUSTRIA-SESI
               ,'' inscricao_estadual --ISENTO
               ,X.COD_RETENCAO cod_retencao  --2631
               ,'' dat_extemp  --
               ,'N' ind_ret_emiss_cpag_cindividual -- N
               ,ESTAB.Razao_Social razao_social_emp  --SERVICO SOCIAL DA INDUSTRIA - SESI
               ,X.VLR_OUTRAS_ENTID vlr_outras_entid -- 0

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

UNION ALL

SELECT DISTINCT
                DECODE(X.COD_EMPRESA, '001', '1000', '002', '2000', '000') cod_empresa  --001
               ,X.COD_ESTAB cod_estab  --1001
               ,TO_DATE(X.Dat_Fiscal,'DD/MM/RRRR') dat_fiscal  --01/12/2020 00:00:00
               ,TRIM(TO_CHAR(X.NUM_DOCFIS)) num_docfis  --000001212
               ,TRIM(TO_CHAR(X.SERIE_DOCFIS)) serie_docfis  --1
               ,'' sub_serie_docfis  --
               ,TO_DATE(X.DAT_EMISSAO,'DD/MM/RRRR') dat_emissao  --01/12/2020 00:00:0
               ,X.Ind_Fis_Jur ind_fis_jur --1
               ,x.cod_fis_jur cod_fis_jur --100077394
               ,x04.cpf_cgc cpf_cgc  --71928444000130
               ,x04.razao_social razao_social  --EMOBREL ENGENHARIA E CONSTRUCOES LTDA
               ,x.vlr_tot_nota vlr_tot_nota  --204480,97
               ,x.vlr_servicos vlr_servicos  --75021,44
               ,x.vlr_aliq_inss vlr_aliq_inss  --11
               ,x.vlr_inss_retido vlr_inss_retido --8252,36
               ,ESTAB.CGC cgc  --03779133000104
               ,ESTAB.Razao_Social razao_social_1  --SERVICO SOCIAL DA INDUSTRIA-SESI
               ,'' inscricao_estadual --ISENTO
               ,X.COD_RETENCAO cod_retencao  --2631
               ,'' dat_extemp  --
               ,'N' ind_ret_emiss_cpag_cindividual -- N
               ,ESTAB.Razao_Social razao_social_emp  --SERVICO SOCIAL DA INDUSTRIA - SESI
               ,X.VLR_OUTRAS_ENTID vlr_outras_entid -- 0
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
          AND DWT07.SITUACAO <> 'S'
          AND NVL(X04.IND_CLASSE_EMP,0) = '05'

              )

               select  cod_empresa  --001
               ,cod_estab  --1001
               ,dat_fiscal  --01/12/2020 00:00:00
               ,num_docfis  --000001212
               ,serie_docfis  --1
               ,sub_serie_docfis  --
               ,dat_emissao  --01/12/2020 00:00:0
               ,ind_fis_jur --1
               ,cod_fis_jur --100077394
               ,cpf_cgc  --71928444000130
               ,razao_social  --EMOBREL ENGENHARIA E CONSTRUCOES LTDA
               ,TRIM(TO_CHAR(NVL(vlr_tot_nota,0),'0000000000D99')) vlr_tot_nota  --204480,97
               ,TRIM(TO_CHAR(NVL(vlr_servicos,0),'0000000000D99'))  vlr_servicos  --75021,44
               ,TRIM(TO_CHAR(NVL(vlr_aliq_inss,0),'0000000000D99'))  vlr_aliq_inss  --11
               ,TRIM(TO_CHAR(NVL(vlr_inss_retido,0),'0000000000D99'))  vlr_inss_retido --8252,36
               ,cgc  --03779133000104
               ,razao_social_1  --SERVICO SOCIAL DA INDUSTRIA-SESI
               ,inscricao_estadual --ISENTO
               ,cod_retencao  --2631
               ,dat_extemp  --
               ,ind_ret_emiss_cpag_cindividual -- N
               ,razao_social_emp  --SERVICO SOCIAL DA INDUSTRIA - SESI
               ,TRIM(TO_CHAR(NVL(vlr_outras_entid,0),'0000000000D99')) vlr_outras_entid -- 0
                   from LKM_AUTONOMOS

           Union all
               Select  cod_empresa  --001
               ,cod_estab  --1001
               ,dat_fiscal  --01/12/2020 00:00:00
               ,num_docfis  --000001212
               ,serie_docfis  --1
               ,sub_serie_docfis  --
               ,dat_emissao  --01/12/2020 00:00:0
               ,ind_fis_jur --1
               ,cod_fis_jur --100077394
               ,cpf_cgc  --71928444000130
               ,razao_social  --EMOBREL ENGENHARIA E CONSTRUCOES LTDA
               ,TRIM(TO_CHAR(NVL(vlr_tot_nota,0),'0000000000D99')) vlr_tot_nota  --204480,97
               ,TRIM(TO_CHAR(NVL(vlr_servicos,0),'0000000000D99'))  vlr_servicos  --75021,44
               ,TRIM(TO_CHAR(NVL(vlr_aliq_inss,0),'0000000000D99'))  vlr_aliq_inss  --11
               ,TRIM(TO_CHAR(NVL(vlr_inss_retido,0),'0000000000D99'))  vlr_inss_retido --8252,36
               ,cgc  --03779133000104
               ,razao_social_1  --SERVICO SOCIAL DA INDUSTRIA-SESI
               ,inscricao_estadual --ISENTO
               ,cod_retencao  --2631
               ,dat_extemp  --
               ,ind_ret_emiss_cpag_cindividual -- N
               ,razao_social_emp  --SERVICO SOCIAL DA INDUSTRIA - SESI
               ,TRIM(TO_CHAR(NVL(vlr_outras_entid,0),'0000000000D99'))  vlr_outras_entid -- 0
                    from LKM_GPS;
