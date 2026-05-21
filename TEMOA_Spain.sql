BEGIN TRANSACTION;

CREATE TABLE "regions" (
	"regions"	TEXT,
	"region_note"	TEXT,
	PRIMARY KEY("regions")
);
INSERT INTO "regions" VALUES ('ES','Spain');

CREATE TABLE "time_period_labels" (
	"t_period_labels"	text,
	"t_period_labels_desc"	text,
	PRIMARY KEY("t_period_labels")
);
INSERT INTO "time_period_labels" VALUES ('e','Existing vintages');
INSERT INTO "time_period_labels" VALUES ('f','Future vintages');

CREATE TABLE "time_periods" (
	"t_periods"	integer,
	"flag"	text,
	PRIMARY KEY("t_periods"),
	FOREIGN KEY("flag") REFERENCES "time_period_labels"("t_period_labels")
);
INSERT INTO "time_periods" VALUES (2005,'e');
INSERT INTO "time_periods" VALUES (2010,'f');
INSERT INTO "time_periods" VALUES (2015,'f');
INSERT INTO "time_periods" VALUES (2020,'f');
INSERT INTO "time_periods" VALUES (2025,'f');
INSERT INTO "time_periods" VALUES (2030,'f');
INSERT INTO "time_periods" VALUES (2035,'f');
INSERT INTO "time_periods" VALUES (2040,'f');
INSERT INTO "time_periods" VALUES (2045,'f');
INSERT INTO "time_periods" VALUES (2050,'f');
INSERT INTO "time_periods" VALUES (2060,'f');

CREATE TABLE "MyopicBaseyear" (
	"year"	real,
	"notes"	text
);

CREATE TABLE "time_season" (
	"t_season"	text,
	PRIMARY KEY("t_season")
);
INSERT INTO "time_season" VALUES ('summer');
INSERT INTO "time_season" VALUES ('intermediate');
INSERT INTO "time_season" VALUES ('winter');

CREATE TABLE "time_of_day" (
	"t_day"	text,
	PRIMARY KEY("t_day")
);
INSERT INTO "time_of_day" VALUES ('day');
INSERT INTO "time_of_day" VALUES ('night');
INSERT INTO "time_of_day" VALUES ('peak');

CREATE TABLE "SegFrac" (
	"season_name"	text,
	"time_of_day_name"	text,
	"segfrac"	real CHECK("segfrac" >= 0 AND "segfrac" <= 1),
	"segfrac_notes"	text,
	PRIMARY KEY("season_name","time_of_day_name"),
	FOREIGN KEY("season_name") REFERENCES "time_season"("t_season"),
	FOREIGN KEY("time_of_day_name") REFERENCES "time_of_day"("t_day")
);
INSERT INTO "SegFrac" VALUES ('summer','day',  0.114,'10.5281/zenodo.3544900');
INSERT INTO "SegFrac" VALUES ('summer','night',0.125,'10.5281/zenodo.3544900');
INSERT INTO "SegFrac" VALUES ('summer','peak', 0.010,'10.5281/zenodo.3544900');
INSERT INTO "SegFrac" VALUES ('intermediate','day',0.193,'10.5281/zenodo.3544900');
INSERT INTO "SegFrac" VALUES ('intermediate','night',0.211,'10.5281/zenodo.3544900');
INSERT INTO "SegFrac" VALUES ('intermediate','peak',0.018,'10.5281/zenodo.3544900');
INSERT INTO "SegFrac" VALUES ('winter','day',  0.151,'10.5281/zenodo.3544900');
INSERT INTO "SegFrac" VALUES ('winter','night',0.164,'10.5281/zenodo.3544900');
INSERT INTO "SegFrac" VALUES ('winter','peak', 0.014,'10.5281/zenodo.3544900');

CREATE TABLE "sector_labels" (
	"sector"	text,
	PRIMARY KEY("sector")
);
INSERT INTO "sector_labels" VALUES ('AGR');
INSERT INTO "sector_labels" VALUES ('COM');
INSERT INTO "sector_labels" VALUES ('RES');
INSERT INTO "sector_labels" VALUES ('TRA');
INSERT INTO "sector_labels" VALUES ('IND');
INSERT INTO "sector_labels" VALUES ('ELC');
INSERT INTO "sector_labels" VALUES ('STG');
INSERT INTO "sector_labels" VALUES ('UPS');
INSERT INTO "sector_labels" VALUES ('H2');
INSERT INTO "sector_labels" VALUES ('CCUS');

CREATE TABLE "technology_labels" (
	"tech_labels"	text,
	"tech_labels_desc"	text,
	PRIMARY KEY("tech_labels")
);
INSERT INTO "technology_labels" VALUES ('r','Resource technology');
INSERT INTO "technology_labels" VALUES ('p','Production technology');
INSERT INTO "technology_labels" VALUES ('pb','Baseload production technology');
INSERT INTO "technology_labels" VALUES ('ps','Storage technology');

CREATE TABLE "technologies" (
	"tech"	text,
	"flag"	text,
	"sector"	text,
	"tech_desc"	text,
	"tech_category"	text,
	PRIMARY KEY("tech"),
	FOREIGN KEY("flag") REFERENCES "technology_labels"("tech_labels"),
	FOREIGN KEY("sector") REFERENCES "sector_labels"("sector")
);
-- Import/export
INSERT INTO "technologies" VALUES ('UPS_IMP_ELC_AFR','p','UPS','Import/Export - Electricity from Africa','');
INSERT INTO "technologies" VALUES ('UPS_IMP_ELC_OEE','p','UPS','Import/Export - Electricity from Other Eastern European countries','');
INSERT INTO "technologies" VALUES ('UPS_IMP_ELC_RUS','p','UPS','Import/Export - Electricity from Russia','');
INSERT INTO "technologies" VALUES ('UPS_IMP_ELC_MEA','p','UPS','Import/Export - Electricity from Middle Eastern Asian countries','');
INSERT INTO "technologies" VALUES ('UPS_IMP_ELC_CAC','p','UPS','Import/Export - Electricity from Central Asian countries','');
INSERT INTO "technologies" VALUES ('UPS_IMP_OIL_USA','p','UPS','Import/Export - Oil from USA','');
INSERT INTO "technologies" VALUES ('UPS_IMP_OIL_CAN','p','UPS','Import/Export - Oil from Canada','');
INSERT INTO "technologies" VALUES ('UPS_IMP_OIL_MEX','p','UPS','Import/Export - Oil from Mexico','');
INSERT INTO "technologies" VALUES ('UPS_IMP_OIL_OLA','p','UPS','Import/Export - Oil from Other Latin American countries','');
INSERT INTO "technologies" VALUES ('UPS_IMP_OIL_BRA','p','UPS','Import/Export - Oil from Brazil','');
INSERT INTO "technologies" VALUES ('UPS_IMP_OIL_RUS','p','UPS','Import/Export - Oil from Russia','');
INSERT INTO "technologies" VALUES ('UPS_IMP_OIL_MEA','p','UPS','Import/Export - Oil from Other Eastern European countries','');
INSERT INTO "technologies" VALUES ('UPS_IMP_OIL_AFR','p','UPS','Import/Export - Oil from Africa','');
INSERT INTO "technologies" VALUES ('UPS_IMP_OIL_CHI','p','UPS','Import/Export - Oil from China','');
INSERT INTO "technologies" VALUES ('UPS_IMP_OIL_JPN','p','UPS','Import/Export - Oil from Japan','');
INSERT INTO "technologies" VALUES ('UPS_IMP_OIL_ODA','p','UPS','Import/Export - Oil from Other developed Asian countries','');
INSERT INTO "technologies" VALUES ('UPS_IMP_OIL_FEE','p','UPS','Import/Export - Oil feedstock','');
INSERT INTO "technologies" VALUES ('UPS_EXP_OIL','p','UPS','Import/Export - Oil export','');
INSERT INTO "technologies" VALUES ('UPS_IMP_GAS_PIP_AFR','p','UPS','Import/Export - Gas from Africa','');
INSERT INTO "technologies" VALUES ('UPS_IMP_GAS_PIP_RUS','p','UPS','Import/Export - Gas from Russia','');
INSERT INTO "technologies" VALUES ('UPS_IMP_GAS_PIP_CAC','p','UPS','Import/Export - Gas from Central Asian countries (Azerbaijan - White Stream)','');
INSERT INTO "technologies" VALUES ('UPS_IMP_GAS_PIP_MEA','p','UPS','Import/Export - Gas from Central Asian countries (Eastmed - Israel)','');
INSERT INTO "technologies" VALUES ('UPS_EXP_GAS','p','UPS','Import/Export - Natural gas export','');
INSERT INTO "technologies" VALUES ('UPS_IMP_GAS_LNG_AFR','p','UPS','Import/Export - LNG from Africa','');
INSERT INTO "technologies" VALUES ('UPS_IMP_GAS_LNG_MEA','p','UPS','Import/Export - LNG from Middle East Asia','');
INSERT INTO "technologies" VALUES ('UPS_IMP_GAS_LNG_GLB','p','UPS','Import/Export - LNG from Other non-specified countries','');
INSERT INTO "technologies" VALUES ('UPS_IMP_GAS_LNG_OLA','p','UPS','Import/Export - LNG from Other Latin American countries','');
INSERT INTO "technologies" VALUES ('UPS_IMP_GAS_LNG_USA','p','UPS','Import/Export - LNG from USA','');
INSERT INTO "technologies" VALUES ('UPS_IMP_GAS_LNG_RUS','p','UPS','Import/Export - LNG from Russia','');
INSERT INTO "technologies" VALUES ('UPS_IMP_COA_AFR','p','UPS','Import/Export - Hard coal from Africa','');
INSERT INTO "technologies" VALUES ('UPS_IMP_COA_AUS','p','UPS','Import/Export - Hard coal from Oceania','');
INSERT INTO "technologies" VALUES ('UPS_IMP_COA_CAC','p','UPS','Import/Export - Hard coal from Central Asian countries','');
INSERT INTO "technologies" VALUES ('UPS_IMP_COA_CAN','p','UPS','Import/Export - Hard coal from Canada','');
INSERT INTO "technologies" VALUES ('UPS_IMP_COA_ODA','p','UPS','Import/Export - Hard coal from Other developed Asian countries','');
INSERT INTO "technologies" VALUES ('UPS_IMP_COA_OEE','p','UPS','Import/Export - Hard coal from Other Eastern European countries','');
INSERT INTO "technologies" VALUES ('UPS_IMP_COA_OLA','p','UPS','Import/Export - Hard coal from Other Latin American countries','');
INSERT INTO "technologies" VALUES ('UPS_IMP_COA_RUS','p','UPS','Import/Export - Hard coal from Russia','');
INSERT INTO "technologies" VALUES ('UPS_IMP_COA_USA','p','UPS','Import/Export - Hard coal from USA','');
INSERT INTO "technologies" VALUES ('UPS_EXP_COA','p','UPS','Import/Export - Coal export','');
INSERT INTO "technologies" VALUES ('UPS_IMP_BIO_ETH','p','UPS','Import of ethanol','');
INSERT INTO "technologies" VALUES ('UPS_IMP_BIO_DST','p','UPS','Import of EMHV','');
INSERT INTO "technologies" VALUES ('UPS_IMP_BIO_WOD','p','UPS','Import of wood products','');
INSERT INTO "technologies" VALUES ('UPS_IMP_H2','p','UPS','Import of hydrogen','');
-- Fuel technologies
INSERT INTO "technologies" VALUES ('UPS_FT_NGA','p','UPS','Upstream - Fuel Tech - Natural Gas (UPS) - NON-OPEC','');
INSERT INTO "technologies" VALUES ('UPS_FT_OIL_RPP','p','UPS','Upstream - Fuel Tech - Refined Pet Products-Liq (UPS) - NON-OPEC','');
INSERT INTO "technologies" VALUES ('UPS_FT_OIL_RPG','p','UPS','Upstream - Fuel Tech - Refined Pet Products-Gas (UPS) - NON-OPEC','');
INSERT INTO "technologies" VALUES ('UPS_FT_ELC','p','UPS','Upstream - Fuel Tech - Electricity (UPS) - NON-OPEC','');
-- Mining
INSERT INTO "technologies" VALUES ('UPS_LOC_HOIL_1','p','UPS','Upstream - Heavy oil (ground) - Located reserves - Step 1 - NON-OPEC','');
INSERT INTO "technologies" VALUES ('UPS_LOC_HOIL_2','p','UPS','Upstream - Heavy oil (ground) - Located reserves - Step 2 - NON-OPEC','');
INSERT INTO "technologies" VALUES ('UPS_LOC_HOIL_3','p','UPS','Upstream - Heavy oil (ground) - Located reserves - Step 3 - NON-OPEC','');
INSERT INTO "technologies" VALUES ('UPS_GRO_HOIL_1','p','UPS','Upstream - Heavy oil (ground) - Reserves growth  - Step 1 - NON-OPEC','');
INSERT INTO "technologies" VALUES ('UPS_GRO_HOIL_2','p','UPS','Upstream - Heavy oil (ground) - Reserves growth  - Step 2 - NON-OPEC','');
INSERT INTO "technologies" VALUES ('UPS_GRO_HOIL_3','p','UPS','Upstream - Heavy oil (ground) - Reserves growth  - Step 3 - NON-OPEC','');
INSERT INTO "technologies" VALUES ('UPS_DIS_HOIL_1','p','UPS','Upstream - Heavy oil (ground) - New discovery - Step 1 - NON-OPEC','');
INSERT INTO "technologies" VALUES ('UPS_DIS_HOIL_2','p','UPS','Upstream - Heavy oil (ground) - New discovery - Step 2 - NON-OPEC','');
INSERT INTO "technologies" VALUES ('UPS_DIS_HOIL_3','p','UPS','Upstream - Heavy oil (ground) - New discovery - Step 3 - NON-OPEC','');
INSERT INTO "technologies" VALUES ('UPS_LOC_HSAN_1','p','UPS','Upstream - Oil sands (in situ - ultra heavy) - Located reserves - Step 1 - NON-OPEC','');
INSERT INTO "technologies" VALUES ('UPS_LOC_HSAN_2','p','UPS','Upstream - Oil sands (in situ - ultra heavy) - Located reserves  - Step 2 - NON-OPEC','');
INSERT INTO "technologies" VALUES ('UPS_LOC_HSAN_3','p','UPS','Upstream - Oil sands (in situ - ultra heavy) - Located reserves - Step 3 - NON-OPEC','');
INSERT INTO "technologies" VALUES ('UPS_REC_HSAN_1','p','UPS','Upstream - Oil sands (in situ - ultra heavy) - Enhanced recovery - Step 1 - NON-OPEC','');
INSERT INTO "technologies" VALUES ('UPS_REC_HSAN_2','p','UPS','Upstream - Oil sands (in situ - ultra heavy) - Enhanced recovery - Step 2 - NON-OPEC','');
INSERT INTO "technologies" VALUES ('UPS_REC_HSAN_3','p','UPS','Upstream - Oil sands (in situ - ultra heavy) - Enhanced recovery - Step 3 - NON-OPEC','');
INSERT INTO "technologies" VALUES ('UPS_LOC_NGA_1','p','UPS','Upstream - Natural gas (ground) - Located reserves - Step 1 - NON-OPEC','');
INSERT INTO "technologies" VALUES ('UPS_LOC_NGA_2','p','UPS','Upstream - Natural gas (ground) - Located reserves - Step 2 - NON-OPEC','');
INSERT INTO "technologies" VALUES ('UPS_LOC_NGA_3','p','UPS','Upstream - Natural gas (ground) - Located reserves - Step 3 - NON-OPEC','');
INSERT INTO "technologies" VALUES ('UPS_GRO_NGA_1','p','UPS','Upstream - Natural gas (ground) - Reserves growth  - Step 1 - NON-OPEC','');
INSERT INTO "technologies" VALUES ('UPS_GRO_NGA_2','p','UPS','Upstream - Natural gas (ground) - Reserves growth  - Step 2 - NON-OPEC','');
INSERT INTO "technologies" VALUES ('UPS_GRO_NGA_3','p','UPS','Upstream - Natural gas (ground) - Reserves growth  - Step 3 - NON-OPEC','');
INSERT INTO "technologies" VALUES ('UPS_DIS_NGA_1','p','UPS','Upstream - Natural gas (ground) - New discovery - Step 1 - NON-OPEC','');
INSERT INTO "technologies" VALUES ('UPS_DIS_NGA_2','p','UPS','Upstream - Natural gas (ground) - New discovery - Step 2 - NON-OPEC','');
INSERT INTO "technologies" VALUES ('UPS_DIS_NGA_3','p','UPS','Upstream - Natural gas (ground) - New discovery - Step 3 - NON-OPEC','');
INSERT INTO "technologies" VALUES ('UPS_LOC_BCO','p','UPS','Upstream - Brown coal (ground) - Located reserves - NON-OPEC','');
INSERT INTO "technologies" VALUES ('UPS_DIS_BCO','p','UPS','Upstream - Brown coal (ground) - New discovery - NON-OPEC','');
INSERT INTO "technologies" VALUES ('UPS_LOC_HCO','p','UPS','Upstream - Hard coal (ground) - Located reserves - NON-OPEC','');
INSERT INTO "technologies" VALUES ('UPS_DIS_HCO','p','UPS','Upstream - Hard coal (ground) - New discovery - NON-OPEC','');
-- Renewables
INSERT INTO "technologies" VALUES ('UPS_HYD_POT','p','UPS','Upstream - Hydro potential - Existing','');
INSERT INTO "technologies" VALUES ('UPS_GEO_POT','p','UPS','Upstream - Geothermal potential - Existing','');
INSERT INTO "technologies" VALUES ('UPS_SOL_PV_POT','p','UPS','Upstream - Solar PV potential - Existing','');
INSERT INTO "technologies" VALUES ('UPS_SOL_CSP_POT','p','UPS','Upstream - Solar CSP potential - Existing','');
INSERT INTO "technologies" VALUES ('UPS_SOL_TH_POT','p','UPS','Upstream - Solar thermal potential - Existing','');
INSERT INTO "technologies" VALUES ('UPS_TDL_POT','p','UPS','Upstream - Tide potential - Existing','');
INSERT INTO "technologies" VALUES ('UPS_WAV_POT','p','UPS','Upstream - Wave potential - Existing','');
INSERT INTO "technologies" VALUES ('UPS_WIN_ON_POT','p','UPS','Upstream - Wind potential (onshore) - Existing','');
INSERT INTO "technologies" VALUES ('UPS_WIN_OFF_POT','p','UPS','Upstream - Wind potential (offshore) - Existing','');
INSERT INTO "technologies" VALUES ('UPS_BIO_RPS_POT','p','UPS','Rape seed production - Existing','');
INSERT INTO "technologies" VALUES ('UPS_BIO_CRP_STC_POT','p','UPS','Starch crop production - Existing','');
INSERT INTO "technologies" VALUES ('UPS_BIO_CRP_SUG_POT','p','UPS','Sugar crop production - Existing','');
INSERT INTO "technologies" VALUES ('UPS_BIO_CRP_GRS_POT','p','UPS','Grassy crop production - Existing','');
INSERT INTO "technologies" VALUES ('UPS_BIO_CRP_WOD_1_POT','p','UPS','Woody crop production - Existing','');
INSERT INTO "technologies" VALUES ('UPS_BIO_CRP_WOD_2_POT','p','UPS','Woody crop production 1 - Existing','');
INSERT INTO "technologies" VALUES ('UPS_BIO_AGR_WST_POT','p','UPS','Agricultural waste potential - Existing','');
INSERT INTO "technologies" VALUES ('UPS_BIO_FOR_1_POT','p','UPS','Forestry residues potential - Existing','');
INSERT INTO "technologies" VALUES ('UPS_BIO_FOR_2_POT','p','UPS','Forestry residues potential 1 - Existing','');
INSERT INTO "technologies" VALUES ('UPS_BIO_WOD_RES_1_POT','p','UPS','Wood processing residues - Existing','');
INSERT INTO "technologies" VALUES ('UPS_BIO_WOD_RES_2_POT','p','UPS','Wood processing residues 1 - Existing','');
INSERT INTO "technologies" VALUES ('UPS_BIO_WOD_PRD_1_POT','p','UPS','Wood products - Existing','');
INSERT INTO "technologies" VALUES ('UPS_BIO_WOD_PRD_2_POT','p','UPS','Wood products 1 - Existing','');
INSERT INTO "technologies" VALUES ('UPS_BIO_MUN_POT','p','UPS','Municipal Waste Production - Existing','');
INSERT INTO "technologies" VALUES ('UPS_BIO_SLU_POT','p','UPS','Industrial Waste-Sludge Production - Existing','');
INSERT INTO "technologies" VALUES ('UPS_BIO_GAS_POT','p','UPS','Biogas Production - Existing','');
INSERT INTO "technologies" VALUES ('UPS_BIO_LIQ_POT','p','UPS','Biofuels Production - Existing','');
-- Import
INSERT INTO "technologies" VALUES ('UPS_IMP_BIO_OIL','p','UPS','Import of vegetable oil for biofuel units','');
INSERT INTO "technologies" VALUES ('UPS_IMP_BIO_SUG','p','UPS','Import of sugar feedstock','');
INSERT INTO "technologies" VALUES ('UPS_IMP_BIO_ISOBUT','p','UPS','Import of isobutylene','');
-- Biofuels
INSERT INTO "technologies" VALUES ('BIO_REF1_CRUSHING_E','p','UPS','Oilseeds crushing','');
INSERT INTO "technologies" VALUES ('BIO_REF1_TRANSESTER_E','p','UPS','Transesterification of vegetable oils.1GenBiofuel','');
INSERT INTO "technologies" VALUES ('BIO_REF1_ETHAMIDE_E','p','UPS','Ethanol production from starch crops.1GenBiofuel','');
INSERT INTO "technologies" VALUES ('BIO_REF1_ETHSUG_E','p','UPS','Ethanol production from sugar crops.1GenBiofuel','');
INSERT INTO "technologies" VALUES ('BIO_REF1_HVO_N','p','UPS','Hydrotreated vegetable oil.1GenBiofuel','');
INSERT INTO "technologies" VALUES ('BIO_REF1_ETBE_E','p','UPS','ETBE production.1GenBiofuel','');
INSERT INTO "technologies" VALUES ('BIO_REF2_ETH_N','p','UPS','Ethanol production from lignocellulosic biomass.2GenBiofuel.','');
INSERT INTO "technologies" VALUES ('BIO_REF2_DST_N','p','UPS','FT-diesel production from lignocellulosic biomass.2GenBiofuel.','');
INSERT INTO "technologies" VALUES ('BIO_REF2_KER_N','p','UPS','FT-kerosene production from lignocellulosic biomass.2GenBiofuel.','');
INSERT INTO "technologies" VALUES ('BIO_REF2_ETH_CCS_N','p','UPS','Ethanol production from lign. biomass. CCS 2GenBiofuel.','');
INSERT INTO "technologies" VALUES ('BIO_REF2_DST_CCS_N','p','UPS','FT-diesel production from lign biomass. CCS 2GenBiofuel.','');
INSERT INTO "technologies" VALUES ('BIO_REF2_KER_CCS_N','p','UPS','FT-diesel production from lign biomass. CCS 2GenBiofuel.','');
-- Primary energy production
INSERT INTO "technologies" VALUES ('UPS_PRI_HFO_1_E','p','UPS','Upstream - Prod of Heavy Oil  - Step 1 - NON-OPEC - Existing','');
INSERT INTO "technologies" VALUES ('UPS_PRI_HFO_2_E','p','UPS','Upstream - Prod of Heavy Oil  - Step 2 - NON-OPEC - Existing','');
INSERT INTO "technologies" VALUES ('UPS_PRI_HFO_3_E','p','UPS','Upstream - Prod of Heavy Oil  - Step 3 - NON-OPEC - Existing','');
INSERT INTO "technologies" VALUES ('UPS_PRI_HOIL_E','p','UPS','Upstream - Prod of Ultra Heavy Oil - NON-OPEC - Existing','');
INSERT INTO "technologies" VALUES ('UPS_PRI_MIX_OIL_CRD_E','p','UPS','Upstream - Mix Synthetic oil (from mined bitumen + liquefac) to Crude oil - NON-OPEC - Existing','');
INSERT INTO "technologies" VALUES ('UPS_PRI_FIP_NGA_1_E','p','UPS','Upstream - Field + Gas Plant  - Step 1 - NON-OPEC - Existing','');
INSERT INTO "technologies" VALUES ('UPS_PRI_FIP_NGA_2_E','p','UPS','Upstream - Field + Gas Plant  - Step 2 - NON-OPEC - Existing','');
INSERT INTO "technologies" VALUES ('UPS_PRI_COA_HCO_E','p','UPS','Upstream - Prod of Hard coal  - NON-OPEC - Existing','');
INSERT INTO "technologies" VALUES ('UPS_PRI_COA_BCO_E','p','UPS','Upstream - Prod of Brown coal - NON-OPEC - Existing','');
INSERT INTO "technologies" VALUES ('UPS_PRI_ADD_E','p','UPS','Upstream - Prod of Additives - NON-OPEC - Existing','');
-- Secondary transformation
INSERT INTO "technologies" VALUES ('UPS_SEC_COA_OVC','p','UPS','Upstream - Production of coke and coke-oven-gas - NON-OPEC - Existing','');
INSERT INTO "technologies" VALUES ('UPS_SEC_GAS_TWN','p','UPS','Upstream - Production of town gas - NON-OPEC - Existing','');
INSERT INTO "technologies" VALUES ('UPS_SEC_GAS_BFG','p','UPS','Upstream - Blast furnace - NON-OPEC - Existing','');
INSERT INTO "technologies" VALUES ('UPS_SEC_REF_FDS','p','UPS','Secondary transformation - Refinery feedstock','');
INSERT INTO "technologies" VALUES ('UPS_SEC_LIQ','p','UPS','Upstream - Liquefaction processes - NON-OPEC - Existing','');
INSERT INTO "technologies" VALUES ('UPS_SEC_TRA','p','UPS','Upstream - Non specified transformations - NON-OPEC - Existing','');
INSERT INTO "technologies" VALUES ('UPS_SEC_REF_FLX','p','UPS','Secondary transformation - Flexible refinery','');
INSERT INTO "technologies" VALUES ('UPS_SEC_L2G_ON','p','UPS','Import - Regasification - Onshore','');
INSERT INTO "technologies" VALUES ('UPS_SEC_L2G_OFF','p','UPS','Import - Regasification - Offshore','');
-- Nuclear fuel cycle
INSERT INTO "technologies" VALUES ('UPS_MIN_IMP_URA_NAT','p','UPS','Upstream - Mining - Extraction of Natural uranium -  Existing','');
INSERT INTO "technologies" VALUES ('UPS_FT_LWR_URA','p','UPS','Upstream - Fuel technology - Enrichment of natural uranium','');
INSERT INTO "technologies" VALUES ('UPS_FT_LWR_UOX','p','UPS','Upstream - Fuel technology - UOX fuel production for LWR','');
INSERT INTO "technologies" VALUES ('UPS_FT_LWR_MOX','p','UPS','Upstream - Fuel technology - MOX fuel production for LWR','');
INSERT INTO "technologies" VALUES ('UPS_FT_FR_MOX','p','UPS','Upstream - Fuel technology - MOX fuel prodcution for FR','');
INSERT INTO "technologies" VALUES ('UPS_FT_ABWR_TRU','p','UPS','Upstream - Fuel technology - TRU-based fuel production for ABWR','');
INSERT INTO "technologies" VALUES ('UPS_FT_ABWR_NAU','p','UPS','Upstream - Fuel technology - NAU-based fuel production for BTU','');
INSERT INTO "technologies" VALUES ('UPS_FT_ADS_TRU','p','UPS','Upstream - Fuel technology - TRU-based fuel production for ADS','');
INSERT INTO "technologies" VALUES ('UPS_FT_ADS_MA','p','UPS','Upstream - Fuel technology - MA-based fuel production for ADS','');
INSERT INTO "technologies" VALUES ('UPS_NUC_LWR_UOX_E','p','UPS','Upstream - UOX-fuelled part of LWR core - New','');
INSERT INTO "technologies" VALUES ('UPS_NUC_LWR_MOX_E','p','UPS','Upstream - MOX-fuelled part of LWR core - New','');
INSERT INTO "technologies" VALUES ('UPS_NUC_FR_MOX_N','p','UPS','Upstream - MOX-fuelled part of FR core - New','');
INSERT INTO "technologies" VALUES ('UPS_NUC_ABWR_TRU_N','p','UPS','Upstream - TRU-fuelled part of ABWR core - New','');
INSERT INTO "technologies" VALUES ('UPS_NUC_ABWR_UTR_N','p','UPS','Upstream - Uranium- + TRU-fuelled part of UTR core - New','');
INSERT INTO "technologies" VALUES ('UPS_NUC_ADS_TRU_N','p','UPS','Upstream - TRU-fuelled part of ADS core - New','');
INSERT INTO "technologies" VALUES ('UPS_NUC_ADS_MA_N','p','UPS','Upstream - MA-fuelled part of ADS core - New','');
INSERT INTO "technologies" VALUES ('UPS_REP_PUREX_LWR_UOX_E','p','UPS','Upstream - PUREX reprocessing of UOX from LWR - New','');
INSERT INTO "technologies" VALUES ('UPS_REP_UREX_LWR_UOX_E','p','UPS','Upstream - UREX reprocessing of UOX from LWR - New','');
INSERT INTO "technologies" VALUES ('UPS_REP_PUREX_LWR_MOX_E','p','UPS','Upstream - PUREX reprocessing of MOX from LWR - New','');
INSERT INTO "technologies" VALUES ('UPS_REP_ADV_PUREX_LWR_UOX_E','p','UPS','Upstream - Advanced PUREX reprocessing of UOX from LWR - New','');
INSERT INTO "technologies" VALUES ('UPS_REP_ADV_PUREX_LWR_MOX_E','p','UPS','Upstream - Advanced PUREX reprocessing of MOX from LWR - New','');
INSERT INTO "technologies" VALUES ('UPS_REP_ADV_PUREX_FR_MOX_E','p','UPS','Upstream - Advanced PUREX reprocessing of MOX from FR - New','');
INSERT INTO "technologies" VALUES ('UPS_TRA_ADS_MA_E','p','UPS','Upstream - Transformation technology - New','');
INSERT INTO "technologies" VALUES ('UPS_TRA_FR_MOX_E','p','UPS','Upstream - Transformation technology - New','');
INSERT INTO "technologies" VALUES ('UPS_TRA_LWR_MOX_E','p','UPS','Upstream - Transformation technology - New','');
INSERT INTO "technologies" VALUES ('UPS_WDP_SPENT_LWR_UOX_E','p','UPS','Upstream - Final deposit of spent UOX fuel from LWR - New','');
INSERT INTO "technologies" VALUES ('UPS_WDP_SPENT_LWR_MOX_E','p','UPS','Upstream - Final deposit of spent MOX fuel from LWR - New','');
INSERT INTO "technologies" VALUES ('UPS_WDP_SPENT_FR_MOX_E','p','UPS','Upstream - Final deposit of spent MOX fuel from FR - New','');
INSERT INTO "technologies" VALUES ('UPS_WDP_HLW_PUREX_LWR_UOX_E','p','UPS','Upstream - Deposit for HLW from PUREX reprocessing of spent UOX fuel for LWR - New','');
INSERT INTO "technologies" VALUES ('UPS_WDP_HLW_UREX_LWR_UOX_E','p','UPS','Upstream - Deposit for HLW from UREX reprocessing of spent UOX fuel for LWR - New','');
INSERT INTO "technologies" VALUES ('UPS_WDP_HLW_UREX_LWR_MOX_E','p','UPS','Upstream - Deposit for HLW from PUREX reprocessing of spent MOX fuel for LWR - New','');
INSERT INTO "technologies" VALUES ('UPS_WDP_HLW_ADV_PUREX_LWR_UOX_E','p','UPS','Upstream - Deposit for HLW from advanced PUREX reprocessing of spent UOX fuel for LWR - New','');
INSERT INTO "technologies" VALUES ('UPS_WDP_HLW_ADV_PUREX_LWR_MOX_E','p','UPS','Upstream - Deposit for HLW from advanced PUREX reprocessing of spent MOX fuel for LWR  - New','');
INSERT INTO "technologies" VALUES ('UPS_WDP_HLW_ADV_PUREX_FR_MOX_E','p','UPS','Upstream - Deposit for HLW from advanced PUREX reprocessing of spent MOX fuel for FR - New','');
INSERT INTO "technologies" VALUES ('UPS_WDP_HLW_PYRO_ABWR_TRU_E','p','UPS','Upstream - Deposit for HLW from PYRO reprocessing of spent ABWR TRU fuel - New','');
INSERT INTO "technologies" VALUES ('UPS_WDP_HLW_PYRO_ABWR_UTR_E','p','UPS','Upstream - Deposit for HLW from PYRO reprocessing of spent ABWR Uranium + TRU fuel - New','');
INSERT INTO "technologies" VALUES ('UPS_WDP_HLW_PYRO_ADS_TRU_E','p','UPS','Upstream - Deposit for HLW from PYRO reprocessing of spent ADS TRU fuel - New','');
INSERT INTO "technologies" VALUES ('UPS_WDP_HLW_PYRO_ADS_MA_E','p','UPS','Upstream - Deposit for HLW from PYRO reprocessing of spent ADS MA fuel - New','');
INSERT INTO "technologies" VALUES ('UPS_WDP_PUREX_UREX_E','p','UPS','Upstream - Deposit for Uranium from PUREX and UREX processes - New','');
-- Hydrogen
INSERT INTO "technologies" VALUES ('H2_FT_NGA','p','H2','Hydrogen - Fuel technology - Natural gas','');
INSERT INTO "technologies" VALUES ('H2_FT_COA','p','H2','Hydrogen - Fuel technology - Coal','');
INSERT INTO "technologies" VALUES ('H2_FT_OIL','p','H2','Hydrogen - Fuel technology - Refined Pet Products-Liq','');
INSERT INTO "technologies" VALUES ('H2_FT_ETH','p','H2','Hydrogen - Fuel technology - Ethanol','');
INSERT INTO "technologies" VALUES ('H2_FT_BIO','p','H2','Hydrogen - Fuel technology - Renewable biomass','');
INSERT INTO "technologies" VALUES ('H2_FT_ELC','p','H2','Hydrogen - Fuel technology - Electricity','');
INSERT INTO "technologies" VALUES ('H2_SR_NGA','p','H2','Hydrogen production - Natural gas steam reforming','');
INSERT INTO "technologies" VALUES ('H2_GS_COA','p','H2','Hydrogen production - Coal gasification','');
INSERT INTO "technologies" VALUES ('H2_PO_OIL','p','H2','Hydrogen production - Heavy oil partial oxidation','');
INSERT INTO "technologies" VALUES ('H2_SR_BIO','p','H2','Hydrogen production - Solid biomass steam reforming','');
INSERT INTO "technologies" VALUES ('H2_GS_BIO','p','H2','Hydrogen production - Solid biomass gasification','');
INSERT INTO "technologies" VALUES ('H2_SR_ETH','p','H2','Hydrogen production - Ethanol steam reforming, decentralized','');
INSERT INTO "technologies" VALUES ('H2_EL_ALK','p','H2','Hydrogen production - Alkaline electrolyzer','');
INSERT INTO "technologies" VALUES ('H2_EL_PEM','p','H2','Hydrogen production - PEM electrolyzer','');
INSERT INTO "technologies" VALUES ('H2_EL_SOEC','p','H2','Hydrogen production - SOEC','');
INSERT INTO "technologies" VALUES ('H2_EL_AEM','p','H2','Hydrogen production - AEM electrolyzer','');
INSERT INTO "technologies" VALUES ('H2_DMY','p','H2','Dummy - Hydrogen from electrolysis to Hydrogen','');
INSERT INTO "technologies" VALUES ('H2_BL_DMY','p','H2','Dummy - Hydrogen from electrolysis to Hydrogen for blending','');
-- CCUS
INSERT INTO "technologies" VALUES ('CCUS_H2_SR_NGA','p','CCUS','Natural Gas Steam Reforming w/CCUS','');
INSERT INTO "technologies" VALUES ('CCUS_H2_SR_NGA_LINKED','p','CCUS','LINKED tech for CCUS_H2_SR_NGA','');
INSERT INTO "technologies" VALUES ('CCUS_H2_GS_COA','p','CCUS','Coal Gasification w/CCUS','');
INSERT INTO "technologies" VALUES ('CCUS_H2_GS_COA_LINKED','p','CCUS','LINKED tech for CCUS_H2_GS_COA','');
INSERT INTO "technologies" VALUES ('CCUS_H2_GS_BIO','p','CCUS','Biomass Gasification w/CCUS','');
INSERT INTO "technologies" VALUES ('CCUS_H2_GS_BIO_LINKED','p','CCUS','LINKED tech for CCUS_H2_GS_BIO','');
INSERT INTO "technologies" VALUES ('CCUS_ELC_COA','p','CCUS','Coal power plant w/CCUS','');
INSERT INTO "technologies" VALUES ('CCUS_ELC_COA_LINKED','p','CCUS','LINKED tech for CCUS_ELC_COA','');
INSERT INTO "technologies" VALUES ('CCUS_ELC_NGA','p','CCUS','Natural gas power plant w/CCUS','');
INSERT INTO "technologies" VALUES ('CCUS_ELC_NGA_LINKED','p','CCUS','LINKED tech for CCUS_ELC_NGA','');
INSERT INTO "technologies" VALUES ('CCUS_DAC','p','CCUS','Direct Air Capture (DAC) with chemical absorption','');
INSERT INTO "technologies" VALUES ('SF_NGA_METH','p','CCUS','Methane production from H2C and CO2 (Methanation)','');
INSERT INTO "technologies" VALUES ('SF_DST_HYDR','p','CCUS','Gas oil production from H2C and CO2 (Hydrogenation)','');
INSERT INTO "technologies" VALUES ('SF_DST_COELC','p','CCUS','Gas oil production from ELC_CEN and CO2 (Coelectrolysis)','');
INSERT INTO "technologies" VALUES ('SF_KER_HYDR','p','CCUS','Kerosene production from H2C and CO2 (Hydrogenation)','');
INSERT INTO "technologies" VALUES ('SF_KER_COELC','p','CCUS','Kerosene production from ELC_CEN and CO2 (Coelectrolysis)','');
INSERT INTO "technologies" VALUES ('SF_DSTKER_DAC','p','CCUS','Gas oil/Kerosene production from ELC_CEN and CO2 (Coelectrolysis-DAC)','');
INSERT INTO "technologies" VALUES ('SF_MEOH_HYDR','p','CCUS','Methanol production from H2C and CO2 (Hydrogenation)','');
INSERT INTO "technologies" VALUES ('SF_MEOH_COELC','p','CCUS','Methanol production from ELC_CEN and CO2 (Coelectrolysis)','');
INSERT INTO "technologies" VALUES ('SF_MEOH_DAC','p','CCUS','Methanol production from ELC_CEN and CO2 (Coelectrolysis-DAC)','');
INSERT INTO "technologies" VALUES ('SEQ_SNK_EOR_ONS_N','p','CCUS','Sequestration - Sink Pot - Enhanced Oil Recovery (onshore) - New','');
INSERT INTO "technologies" VALUES ('SEQ_SNK_EOR_OFF_N','p','CCUS','Sequestration - Sink Pot - Enhanced Oil Recovery (offshore) - New','');
INSERT INTO "technologies" VALUES ('SEQ_SNK_DOF_ONS_N','p','CCUS','Sequestration - Sink Pot - Depleted oil fields (onshore) - New','');
--INSERT INTO "technologies" VALUES ('SEQ_SNK_DGF_ONS_N','p','CCUS','Sequestration - Sink Pot - Depleted gas fields (onshore) - New','');
INSERT INTO "technologies" VALUES ('SEQ_SNK_DOF_OFF_N','p','CCUS','Sequestration - Sink Pot - Depleted oil fields (offshore) - New','');
INSERT INTO "technologies" VALUES ('SEQ_SNK_DGF_OFF_N','p','CCUS','Sequestration - Sink Pot - Depleted gas fields (offshore) - New','');
INSERT INTO "technologies" VALUES ('SEQ_SNK_ECB_N','p','CCUS','Sequestration - Sink Pot - Enhanced Coalbed Methane recovery < 1000 m - New','');
INSERT INTO "technologies" VALUES ('SEQ_SNK_ECB_DEEP_N','p','CCUS','Sequestration - Sink Pot - Enhanced Coalbed Methane recovery > 1000 m - New','');
INSERT INTO "technologies" VALUES ('SEQ_SNK_DSA_ONS_N','p','CCUS','Sequestration - Sink Pot - Deep saline aquifers (onshore) - New','');
INSERT INTO "technologies" VALUES ('SEQ_SNK_DSA_OFF_N','p','CCUS','Sequestration - Sink Pot - Deep saline aquifers (offshore) - New','');
INSERT INTO "technologies" VALUES ('SEQ_SNK_DOC_N','p','CCUS','Sequestration - Sink Pot - Storage in the deep ocean - New','');
INSERT INTO "technologies" VALUES ('SEQ_SNK_AFF_1_N','p','CCUS','Sequestration - Sink Pot - Afforestation 1 - New','');
INSERT INTO "technologies" VALUES ('SEQ_SNK_AFF_2_N','p','CCUS','Sequestration - Sink Pot - Afforestation 2 - New','');
INSERT INTO "technologies" VALUES ('SEQ_SNK_AFF_3_N','p','CCUS','Sequestration - Sink Pot - Afforestation 3 - New','');
INSERT INTO "technologies" VALUES ('SEQ_SNK_AFF_4_N','p','CCUS','Sequestration - Sink Pot - Afforestation 4 - New','');
INSERT INTO "technologies" VALUES ('SEQ_REM_EOR_ONS_N','p','CCUS','Sequestration - Removal - Enhanced Oil Recovery - New','');
INSERT INTO "technologies" VALUES ('SEQ_REM_EOR_OFF_N','p','CCUS','Sequestration - Removal - Enhanced Oil Recovery (offshore) - New','');
INSERT INTO "technologies" VALUES ('SEQ_REM_DOF_ONS_N','p','CCUS','Sequestration - Removal - Depleted oil fields (onshore) - New','');
--INSERT INTO "technologies" VALUES ('SEQ_REM_DGF_ONS_N','p','CCUS','Sequestration - Removal - Depleted gas fields (onshore) - New','');
INSERT INTO "technologies" VALUES ('SEQ_REM_DOF_OFF_N','p','CCUS','Sequestration - Removal - Depleted oil fields (offshore) - New','');
INSERT INTO "technologies" VALUES ('SEQ_REM_DGF_OFF_N','p','CCUS','Sequestration - Removal - Depleted gas fields (offshore) - New','');
INSERT INTO "technologies" VALUES ('SEQ_REM_ECB_N','p','CCUS','Sequestration - Removal - Enhanced Coalbed Methane recovery <1000 m - New','');
INSERT INTO "technologies" VALUES ('SEQ_REM_ECB_DEEP_N','p','CCUS','Sequestration - Removal - Enhanced Coalbed Methane recovery >1000 m - New','');
INSERT INTO "technologies" VALUES ('SEQ_REM_DSA_ONS_N','p','CCUS','Sequestration - Removal - Deep saline aquifers (onshore) - New','');
INSERT INTO "technologies" VALUES ('SEQ_REM_DSA_OFF_N','p','CCUS','Sequestration - Removal - Deep saline aquifers (offshore) - New','');
INSERT INTO "technologies" VALUES ('SEQ_REM_DOC_N','p','CCUS','Sequestration - Removal - Storage in the deep ocean - New','');
INSERT INTO "technologies" VALUES ('SEQ_REM_MIN_N','p','CCUS','Sequestration - Removal - Mineralization for CO2 storage - New','');
INSERT INTO "technologies" VALUES ('SEQ_REM_AFF_N','p','CCUS','Sequestration - Removal - Afforestation - New','');
INSERT INTO "technologies" VALUES ('SEQ_SNK_CO2_BKS_N','p','CCUS','Sequestration - Sink Pot - CO2 Backstop technology','');
INSERT INTO "technologies" VALUES ('SEQ_REM_CO2_BKS_N','p','CCUS','Sequestration - Removal - CO2 Backstop technology','');
-- Dummies
INSERT INTO "technologies" VALUES ('DMY_OUT_TECH','p','UPS','Dummy demand technology to produce OUT_DMY','');
--INSERT INTO "technologies" VALUES ('DMY_DEM_ANNUAL','p','UPS','Dummy import for demand commodities - Annual','');
--INSERT INTO "technologies" VALUES ('DMY_PHY_ANNUAL','p','UPS','Dummy import for physical commodities - Annual','');
INSERT INTO "technologies" VALUES ('DMY_PHY_NON_ANNUAL','p','UPS','Dummy import for physical commodities - Non annual','');
-- Electricity sector
-- Fuel technologies
INSERT INTO "technologies" VALUES ('ELC_FT_NGA','p','ELC','Electricity - Fuel technology - Natural gas','');
INSERT INTO "technologies" VALUES ('ELC_FT_OIL','p','ELC','Electricity - Fuel technology - Oil','');
INSERT INTO "technologies" VALUES ('ELC_FT_COA','p','ELC','Electricity - Fuel technology - Coal','');
INSERT INTO "technologies" VALUES ('ELC_FT_BIO','p','ELC','Electricity - Fuel technology - Biofuels','');
INSERT INTO "technologies" VALUES ('ELC_FT_BGS','p','ELC','Electricity - Fuel technology - Biogas','');
INSERT INTO "technologies" VALUES ('ELC_FT_CRP','p','ELC','Electricity - Fuel technology - Crops','');
INSERT INTO "technologies" VALUES ('ELC_FT_MUN','p','ELC','Electricity - Fuel technology - Municipal waste','');
INSERT INTO "technologies" VALUES ('ELC_FT_HYD','p','ELC','Electricity - Fuel technology - Hydroelectric energy','');
INSERT INTO "technologies" VALUES ('ELC_FT_GEO','p','ELC','Electricity - Fuel technology - Geothermal energy','');
INSERT INTO "technologies" VALUES ('ELC_FT_SOL_PV','p','ELC','Electricity - Fuel technology - Solar energy - PV','');
INSERT INTO "technologies" VALUES ('ELC_FT_SOL_TH','p','ELC','Electricity - Fuel technology - Solar energy - PV','');
INSERT INTO "technologies" VALUES ('ELC_FT_SOL_CSP','p','ELC','Electricity - Fuel technology - Solar energy - CSP','');
INSERT INTO "technologies" VALUES ('ELC_FT_WAV','p','ELC','Electricity - Fuel technology - Wave energy','');
INSERT INTO "technologies" VALUES ('ELC_FT_TDL','p','ELC','Electricity - Fuel technology - Tide energy','');
INSERT INTO "technologies" VALUES ('ELC_FT_WIN_ON','p','ELC','Electricity - Fuel technology - Wind energy - Onshore','');
INSERT INTO "technologies" VALUES ('ELC_FT_WIN_OFF','p','ELC','Electricity - Fuel technology - Wind energy - Offshore','');
INSERT INTO "technologies" VALUES ('ELC_FT_H2','p','ELC','Electricity - Fuel technology - Hydrogen','');
-- Base year technologies
INSERT INTO "technologies" VALUES ('ELC_OIL_E','pb','ELC','Electricity - Oil-based capacity - Existing','');
INSERT INTO "technologies" VALUES ('ELC_NGA_E','pb','ELC','Electricity - Gas-based capacity - Existing','');
INSERT INTO "technologies" VALUES ('ELC_COA_E','pb','ELC','Electricity - Coal-based capacity - Existing','');
INSERT INTO "technologies" VALUES ('ELC_BIO_E','pb','ELC','Electricity - Biomass-based capacity - Existing','');
INSERT INTO "technologies" VALUES ('ELC_HYD_GEN_E','p','ELC','Electricity - Hydroelectric conventional capacity - Existing','');
INSERT INTO "technologies" VALUES ('ELC_HYD_PUM_E','ps','ELC','Electricity - Hydroelectric pumped capacity - Existing','');
INSERT INTO "technologies" VALUES ('ELC_NUC_FIS_E','pb','ELC','Electricity - Nuclear-based capacity - Existing','');
INSERT INTO "technologies" VALUES ('ELC_GEO_E','p','ELC','Electricity - Geothermal capacity - Existing','');
INSERT INTO "technologies" VALUES ('ELC_WIN_E','p','ELC','Electricity - Wind-based capacity - Existing','');
INSERT INTO "technologies" VALUES ('ELC_SOL_E','p','ELC','Electricity - Solar-based capacity - Existing','');
INSERT INTO "technologies" VALUES ('ELC_MAR_E','p','ELC','Electricity - Marine-based capacity - Existing','');
-- CHP
INSERT INTO "technologies" VALUES ('ELC_CHP_OIL_E','p','ELC','Electricity - CHP - Oil-based capacity - Existing','');
INSERT INTO "technologies" VALUES ('ELC_CHP_NGA_E','p','ELC','Electricity - CHP - Gas-based capacity - Existing','');
INSERT INTO "technologies" VALUES ('ELC_CHP_COA_E','p','ELC','Electricity - CHP - Coal-based capacity - Existing','');
INSERT INTO "technologies" VALUES ('ELC_CHP_BIO_E','p','ELC','Electricity - CHP - biomass-based capacity - Existing','');
INSERT INTO "technologies" VALUES ('ELC_CHP_GEO_E','p','ELC','Electricity - CHP - Geothermal capacity - Existing','');
-- Heat
INSERT INTO "technologies" VALUES ('HET_OIL_E','p','ELC','Heat production - Oil-based capacity - Existing','');
INSERT INTO "technologies" VALUES ('HET_NGA_E','p','ELC','Heat production - Gas-based capacity - Existing','');
INSERT INTO "technologies" VALUES ('HET_COA_E','p','ELC','Heat production - Coal-based capacity - Existing','');
INSERT INTO "technologies" VALUES ('HET_BIO_E','p','ELC','Heat production - biomass-based capacity - Existing','');
INSERT INTO "technologies" VALUES ('HET_GEO_E','p','ELC','Heat production - Geothermal capacity - Existing','');
INSERT INTO "technologies" VALUES ('HET_SOL_E','p','ELC','Heat production - Solar-based capacity - Existing','');
-- Storage
INSERT INTO "technologies" VALUES ('ELC_STG_CEN_BTT_N','ps','STG','Storage - Centralized Electricity - Lithium-Ion Battery','10.25984/1871952');
INSERT INTO "technologies" VALUES ('ELC_STG_DST_BTT_N','ps','STG','Storage - Distributed Electricity - Lithium-Ion Battery','10.25984/1871952');
-- New technologies
INSERT INTO "technologies" VALUES ('ELC_COA_PUL_N','pb','ELC','Electricity - Pulverized Coal plant - New','');
INSERT INTO "technologies" VALUES ('ELC_COA_CCO_N','pb','ELC','Electricity - IGCC plant - New','');
INSERT INTO "technologies" VALUES ('ELC_COA_PFB_N','pb','ELC','Electricity - Pressurized fluidized bed plant - New','');
INSERT INTO "technologies" VALUES ('ELC_NGA_CCY_ADV_N','pb','ELC','Electricity - Advanced gas combined cycle plant - New','');
INSERT INTO "technologies" VALUES ('ELC_NGA_FCE_N','p','ELC','Electricity - Fuel Cell plant - New','');
INSERT INTO "technologies" VALUES ('ELC_NUC_FIS_LWR_N','pb','ELC','Electricity - Gen III LWR - New','');
INSERT INTO "technologies" VALUES ('ELC_NUC_FIS_EPR_N','pb','ELC','Electricity - Gen III+ EPR - New','');
INSERT INTO "technologies" VALUES ('ELC_NUC_FIS_FR_N','pb','ELC','Electricity - Gen IV Fast reactor - New','');
INSERT INTO "technologies" VALUES ('ELC_NUC_FIS_ABWR_N','pb','ELC','Electricity - Gen IV Advanced breeder reactor  - New','');
INSERT INTO "technologies" VALUES ('ELC_NUC_FIS_ADS_TRU_N','pb','ELC','Electricity - Gen IV TRU-fuelled accelerator-driven system reactor - New','');
INSERT INTO "technologies" VALUES ('ELC_NUC_FIS_ADS_MA_N','pb','ELC','Electricity - Gen IV MA-fuelled accelerator-driven system reactor - New','');
INSERT INTO "technologies" VALUES ('ELC_OIL_MIX_TUR_N','pb','ELC','Electricity - Oil mix steam turbine plant - New','');
INSERT INTO "technologies" VALUES ('ELC_OIL_MIX_CCY_N','pb','ELC','Electricity - Oil mix combined cycle plant - New','');
INSERT INTO "technologies" VALUES ('ELC_OIL_GBL_N','pb','ELC','Electricity - Generic distributed generation for base load plant - New','');
INSERT INTO "technologies" VALUES ('ELC_OIL_GPL_N','pb','ELC','Electricity - Generic distributed generation for peak load plant - New','');
INSERT INTO "technologies" VALUES ('ELC_BIO_GSF_CEN_N','p','ELC','Electricity - Solid biomass gasification, centralized plant - New','');
INSERT INTO "technologies" VALUES ('ELC_BIO_COM_CEN_N','p','ELC','Electricity - Solid biomass direct combustion, centralized plant - New','');
INSERT INTO "technologies" VALUES ('ELC_BIO_GSF_DEC_N','p','ELC','Electricity - Solid biomass gasification, decentralized plant - New','');
INSERT INTO "technologies" VALUES ('ELC_BIO_COM_DEC_N','p','ELC','Electricity - Solid biomass direct Combustion, decentralized plant - New','');
INSERT INTO "technologies" VALUES ('ELC_BIO_GAS_N','p','ELC','Electricity - Renewable biogas from waste plant - New','');
INSERT INTO "technologies" VALUES ('ELC_BIO_CRP_GSF_N','p','ELC','Electricity - Crop gasification plant - New','');
INSERT INTO "technologies" VALUES ('ELC_BIO_CRP_COM_N','p','ELC','Electricity - Crop direct combustion plant - New','');
INSERT INTO "technologies" VALUES ('ELC_BIO_MUN_INC_N','p','ELC','Electricity - Waste incineration plant - New','');
INSERT INTO "technologies" VALUES ('ELC_HYD_GEN_DAM_N','p','ELC','Electricity - Generic impoundment hydroelectric plant, high cost - New','');
INSERT INTO "technologies" VALUES ('ELC_HYD_GEN_RUN_N','p','ELC','Electricity - Generic run-on-river hydroelectric plant - New','');
INSERT INTO "technologies" VALUES ('ELC_GEO_FLS_N','p','ELC','Electricity - Geothermal flashed steam - New','');
INSERT INTO "technologies" VALUES ('ELC_GEO_BNY_N','p','ELC','Electricity - Geothermal binary - New','');
INSERT INTO "technologies" VALUES ('ELC_GEO_BNY_HIG_N','p','ELC','Electricity - Geothermal binary high - New','');
INSERT INTO "technologies" VALUES ('ELC_WIN_N','p','ELC','Electricity - Wind onshore, centralized plant 1 - New','');
INSERT INTO "technologies" VALUES ('ELC_WIN_OFF_N','p','ELC','Electricity - Wind offshore plant - New','');
INSERT INTO "technologies" VALUES ('ELC_SOL_PV_CEN_N','p','ELC','Electricity - Solar PV centralized plant - New','');
INSERT INTO "technologies" VALUES ('ELC_SOL_PV_DST_N','p','ELC','Electricity - Solar PV decentralized plant - New','');
INSERT INTO "technologies" VALUES ('ELC_SOL_CSP_1_N','p','ELC','Electricity - Concentrated Solar Thermal Power centralized plant - New','');
INSERT INTO "technologies" VALUES ('ELC_SOL_CSP_2_N','p','ELC','Electricity - Concentrated Solar Thermal Power with Storage 7.5 h 1 - New','');
INSERT INTO "technologies" VALUES ('ELC_SOL_CSP_3_N','p','ELC','Electricity - Concentrated Solar Thermal Power with Storage 7.5 h 2 - New','');
INSERT INTO "technologies" VALUES ('ELC_SOL_CSP_4_N','p','ELC','Electricity - Concentrated Solar Thermal Power with Storage 7.5 h 3 - New','');
INSERT INTO "technologies" VALUES ('ELC_MAR_WAV_N','p','ELC','Electricity - Marine offshore wave plant - New','');
INSERT INTO "technologies" VALUES ('ELC_MAR_TDL_N','p','ELC','Electricity - Marine tidal stream plant - New','');
INSERT INTO "technologies" VALUES ('ELC_HYD_PUM_N','ps','ELC','Electricity - Pumped hydro daynite storage - New','');
INSERT INTO "technologies" VALUES ('ELC_HH2_PEMFC_N','p','ELC','Electricity - PEM fuel cell system - New','');
-- Sequestration technologies
INSERT INTO "technologies" VALUES ('ELC_COA_CCO_IG_CCS_N','p','ELC','Electricity - IGCC+CO2 removal from input gas - New','');
INSERT INTO "technologies" VALUES ('ELC_COA_CCO_FG_CCS_N','p','ELC','Electricity - IGCC+CO2 removal from flue gas - New','');
INSERT INTO "technologies" VALUES ('ELC_COA_PUL_FG_CCS_N','p','ELC','Electricity - Conventional Pulverized Coal+CO2 removal from flue gas - New','');
INSERT INTO "technologies" VALUES ('ELC_NGA_FG_CCS_N','p','ELC','Electricity - NGCC+CO2 removal from flue gas - New','');
INSERT INTO "technologies" VALUES ('ELC_NGA_SOFC_CCS_N','p','ELC','Electricity - SOFC (GAS) + CO2 removal - New','');
INSERT INTO "technologies" VALUES ('ELC_BIO_CRP_GSF_CCS_N','p','ELC','Electricity - Crop gasification with CCS - New','');
INSERT INTO "technologies" VALUES ('ELC_BIO_CRP_COM_CCS_N','p','ELC','Electricity - Crop direct combustion with CCS - New','');
INSERT INTO "technologies" VALUES ('ELC_BIO_GSF_CCS_N','p','ELC','Electricity - Solid biomass gasification with CCS - New','');
INSERT INTO "technologies" VALUES ('ELC_BIO_COM_CCS_N','p','ELC','Electricity - Solid biomass direct combustion with CCS - New','');
-- Heat production
INSERT INTO "technologies" VALUES ('HET_NGA_N','p','ELC','Heat production - Natural gas plant - New','');
INSERT INTO "technologies" VALUES ('HET_OIL_N','p','ELC','Heat production - Oil plant - New','');
INSERT INTO "technologies" VALUES ('HET_BIO_N','p','ELC','Heat production - biomass plant - New','');
INSERT INTO "technologies" VALUES ('HET_COA_N','p','ELC','Heat production - Coal plant - New','');
INSERT INTO "technologies" VALUES ('HET_GEO_N','p','ELC','Heat production - Geothermal plant - New','');
INSERT INTO "technologies" VALUES ('HET_SOL_N','p','ELC','Heat production - Solar plant - New','');
-- CHP
INSERT INTO "technologies" VALUES ('ELC_CHP_NGA_N','p','ELC','CHP - Natural gas plant  - New','');
INSERT INTO "technologies" VALUES ('ELC_CHP_COA_N','p','ELC','CHP - Coal plant  - New','');
INSERT INTO "technologies" VALUES ('ELC_CHP_BIO_N','p','ELC','CHP - Biomass plant - New','');
-- Micro-CHP
INSERT INTO "technologies" VALUES ('COM_CHP_NGA_CI_N','p','COM','mCHP - Commercial - Internal combustion engine - Natural gas','');
INSERT INTO "technologies" VALUES ('COM_CHP_NGA_MICRO_N','p','COM','mCHP - Commercial - Cogeneration microturbine - Natural gas','');
INSERT INTO "technologies" VALUES ('COM_CHP_NGA_CC_N','p','COM','mCHP - Commercial - Combined cycle - Natural gas','');
INSERT INTO "technologies" VALUES ('COM_CHP_SLB_CI_N','p','COM','mCHP - Commercial - Internal combustion engine - Solid biomass','');
INSERT INTO "technologies" VALUES ('COM_CHP_NGA_SOFC_N','p','COM','mCHP - Commercial - Solid oxide fuel cell - Natural gas','');
INSERT INTO "technologies" VALUES ('COM_CHP_H2_PEMFC_N','p','COM','mCHP - Commercial - PEM fuel cell - Hydrogen','');
INSERT INTO "technologies" VALUES ('IND_CHP_NGA_CI_N','p','IND','mCHP - Industry - Internal combustion engine - Natural gas','');
INSERT INTO "technologies" VALUES ('IND_CHP_NGA_TG_N','p','IND','mCHP - Industry - Simple cycle gas turbine - Natural gas','');
INSERT INTO "technologies" VALUES ('IND_CHP_NGA_TV_N','p','IND','mCHP - Industry - Steam turbine - Natural gas','');
INSERT INTO "technologies" VALUES ('IND_CHP_BLQ_CI_N','p','IND','mCHP - Industry - Internal combustion engine - Bioliquid','');
INSERT INTO "technologies" VALUES ('RES_CHP_NGA_CI_N','p','RES','mCHP - Residential - Internal combustion engine - Natural gas','');
INSERT INTO "technologies" VALUES ('RES_CHP_NGA_MICRO_N','p','RES','mCHP - Residential - Cogenerative microturbine - Natural gas','');
INSERT INTO "technologies" VALUES ('RES_CHP_NGA_CC_N','p','RES','mCHP - Residential - Combined cycle - Natural gas','');
INSERT INTO "technologies" VALUES ('RES_CHP_NGA_STR_N','p','RES','mCHP - Residential - Stirling engine - Natural gas','');
INSERT INTO "technologies" VALUES ('RES_CHP_NGA_SOFC_N','p','RES','mCHP - Residential - Solid oxide fuel cell - Natural gas','');
INSERT INTO "technologies" VALUES ('RES_CHP_H2_PEMFC_N','p','RES','mCHP - Residential - Solid oxide fuel cell - Hydrogen','');
-- Linked technologies
INSERT INTO "technologies" VALUES ('ELC_COA_CCO_IG_CCS_N_LINKED','p','ELC','Linked technologies - Electricity - IGCC+CO2 removal from input gas - New','');
INSERT INTO "technologies" VALUES ('ELC_COA_CCO_FG_CCS_N_LINKED','p','ELC','Linked technologies - Electricity - IGCC+CO2 removal from flue gas - New','');
INSERT INTO "technologies" VALUES ('ELC_COA_PUL_FG_CCS_N_LINKED','p','ELC','Linked technologies - Electricity - Pulverized Coal+CO2 removal from flue gas - New','');
INSERT INTO "technologies" VALUES ('ELC_NGA_FG_CCS_N_LINKED','p','ELC','Linked technologies - Electricity - NGCC+CO2 removal from flue gas - New','');
INSERT INTO "technologies" VALUES ('ELC_NGA_SOFC_CCS_N_LINKED','p','ELC','Linked technologies - Electricity - SOFC (GAS) + CO2 removal - New','');
INSERT INTO "technologies" VALUES ('ELC_BIO_CRP_GSF_CCS_N_LINKED','p','ELC','Linked technologies - Electricity - Crop gasification with CCS - New','');
INSERT INTO "technologies" VALUES ('ELC_BIO_CRP_COM_CCS_N_LINKED','p','ELC','Linked technologies - Electricity - Crop direct combustion with CCS - New','');
INSERT INTO "technologies" VALUES ('ELC_BIO_GSF_CCS_N_LINKED','p','ELC','Linked technologies - Electricity - Solid Biomass gasification with CCS - New','');
INSERT INTO "technologies" VALUES ('ELC_BIO_COM_CCS_N_LINKED','p','ELC','Linked technologies - Electricity - Solid Biomass direct combustion with CCS - New','');
-- Distrib and demand
INSERT INTO "technologies" VALUES ('DISTR_ELC','p','DIS','','');
INSERT INTO "technologies" VALUES ('END_USES_ELC','p','DIS','','');
INSERT INTO "technologies" VALUES ('END_USES_HET','p','DIS','','');
-- Other sectors and dummies (not required in the whole database)
INSERT INTO "technologies" VALUES ('DMY_ELC_TECH','p','UPS','Dummy technology to consume SNK_ELC_CO2','');
-- Materials
INSERT INTO "technologies" VALUES ('MAT_SUP_ALU','p','MAT','Material Supply - Aluminum','');
INSERT INTO "technologies" VALUES ('MAT_SUP_BOR','p','MAT','Material Supply - Boron','');
INSERT INTO "technologies" VALUES ('MAT_SUP_CER','p','MAT','Material Supply - Cerium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_CHR','p','MAT','Material Supply - Chromium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_COB','p','MAT','Material Supply - Cobalt','');
INSERT INTO "technologies" VALUES ('MAT_SUP_COP','p','MAT','Material Supply - Copper','');
INSERT INTO "technologies" VALUES ('MAT_SUP_DYS','p','MAT','Material Supply - Dysprosium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_EUP','p','MAT','Material Supply - Europium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_FLU','p','MAT','Material Supply - Fluospar','');
INSERT INTO "technologies" VALUES ('MAT_SUP_GAD','p','MAT','Material Supply - Gadolinium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_GAL','p','MAT','Material Supply - Gallium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_GER','p','MAT','Material Supply - Germanium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_GRA','p','MAT','Material Supply - Graphite','');
INSERT INTO "technologies" VALUES ('MAT_SUP_IND','p','MAT','Material Supply - Indium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_IRI','p','MAT','Material Supply - Iridium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_LAN','p','MAT','Material Supply - Lanthanum','');
INSERT INTO "technologies" VALUES ('MAT_SUP_LIT','p','MAT','Material Supply - Lithium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_MAG','p','MAT','Material Supply - Magnesium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_MAN','p','MAT','Material Supply - Manganese','');
INSERT INTO "technologies" VALUES ('MAT_SUP_MOL','p','MAT','Material Supply - Molybdenum','');
INSERT INTO "technologies" VALUES ('MAT_SUP_NEO','p','MAT','Material Supply - Neodymium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_NIC','p','MAT','Material Supply - Nickel','');
INSERT INTO "technologies" VALUES ('MAT_SUP_NIO','p','MAT','Material Supply - Niobium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_PAL','p','MAT','Material Supply - Palladium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_PHO','p','MAT','Material Supply - Phosphorus','');
INSERT INTO "technologies" VALUES ('MAT_SUP_PLA','p','MAT','Material Supply - Platinum','');
INSERT INTO "technologies" VALUES ('MAT_SUP_PRA','p','MAT','Material Supply - Praseodymium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_SIL','p','MAT','Material Supply - Silicon','');
INSERT INTO "technologies" VALUES ('MAT_SUP_SIV','p','MAT','Material Supply - Silver','');
INSERT INTO "technologies" VALUES ('MAT_SUP_TAN','p','MAT','Material Supply - Tantalum','');
INSERT INTO "technologies" VALUES ('MAT_SUP_TER','p','MAT','Material Supply - Terbium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_TIT','p','MAT','Material Supply - Titanium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_VAN','p','MAT','Material Supply - Vanadium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_YTT','p','MAT','Material Supply - Yttrium','');
INSERT INTO "technologies" VALUES ('MAT_SUP_ZIR','p','MAT','Material Supply - Zirconium','');

CREATE TABLE "tech_mga" (
	"tech"	text,
	"notes"	text,
	PRIMARY KEY("tech")
);
INSERT INTO "tech_mga" VALUES ('H2_FT_NGA','');
INSERT INTO "tech_mga" VALUES ('H2_FT_COA','');
INSERT INTO "tech_mga" VALUES ('H2_FT_OIL','');
INSERT INTO "tech_mga" VALUES ('H2_FT_ETH','');
INSERT INTO "tech_mga" VALUES ('H2_FT_BIO','');
INSERT INTO "tech_mga" VALUES ('H2_FT_ELC','');
INSERT INTO "tech_mga" VALUES ('ELC_FT_NGA','');
INSERT INTO "tech_mga" VALUES ('ELC_FT_OIL','');
INSERT INTO "tech_mga" VALUES ('ELC_FT_COA','');
INSERT INTO "tech_mga" VALUES ('ELC_FT_BIO','');
INSERT INTO "tech_mga" VALUES ('ELC_FT_BGS','');
INSERT INTO "tech_mga" VALUES ('ELC_FT_CRP','');
INSERT INTO "tech_mga" VALUES ('ELC_FT_MUN','');
INSERT INTO "tech_mga" VALUES ('ELC_FT_HYD','');
INSERT INTO "tech_mga" VALUES ('ELC_FT_GEO','');
INSERT INTO "tech_mga" VALUES ('ELC_FT_SOL_PV','');
INSERT INTO "tech_mga" VALUES ('ELC_FT_SOL_TH','');
INSERT INTO "tech_mga" VALUES ('ELC_FT_SOL_CSP','');
INSERT INTO "tech_mga" VALUES ('ELC_FT_WAV','');
INSERT INTO "tech_mga" VALUES ('ELC_FT_TDL','');
INSERT INTO "tech_mga" VALUES ('ELC_FT_WIN_ON','');
INSERT INTO "tech_mga" VALUES ('ELC_FT_WIN_OFF','');
INSERT INTO "tech_mga" VALUES ('ELC_FT_H2','');

CREATE TABLE "tech_imports" (
	"tech"	text,
	"notes"	text,
	PRIMARY KEY("tech")
);
INSERT INTO "tech_imports" VALUES ('UPS_IMP_ELC_AFR','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_ELC_OEE','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_ELC_RUS','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_ELC_MEA','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_ELC_CAC','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_OIL_USA','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_OIL_CAN','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_OIL_MEX','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_OIL_OLA','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_OIL_BRA','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_OIL_RUS','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_OIL_MEA','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_OIL_AFR','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_OIL_CHI','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_OIL_JPN','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_OIL_ODA','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_OIL_FEE','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_GAS_PIP_AFR','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_GAS_PIP_RUS','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_GAS_PIP_CAC','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_GAS_PIP_MEA','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_GAS_LNG_AFR','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_GAS_LNG_MEA','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_GAS_LNG_GLB','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_GAS_LNG_OLA','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_GAS_LNG_USA','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_GAS_LNG_RUS','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_COA_AFR','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_COA_AUS','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_COA_CAC','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_COA_CAN','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_COA_ODA','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_COA_OEE','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_COA_OLA','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_COA_RUS','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_COA_USA','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_BIO_ETH','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_BIO_DST','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_BIO_WOD','');
INSERT INTO "tech_imports" VALUES ('UPS_IMP_H2','');

CREATE TABLE "tech_exports" (
	"tech"	text,
	"notes"	text,
	PRIMARY KEY("tech")
);
INSERT INTO "tech_exports" VALUES ('UPS_EXP_GAS','');
INSERT INTO "tech_exports" VALUES ('UPS_EXP_OIL','');
INSERT INTO "tech_exports" VALUES ('UPS_EXP_COA','');

CREATE TABLE "tech_domestic" (
	"tech"	text,
	"notes"	text,
	PRIMARY KEY("tech")
);
CREATE TABLE "tech_reserve" (
	"tech"	text,
	"notes"	text,
	PRIMARY KEY("tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
-- Electricity sector
INSERT INTO "tech_reserve" VALUES ('ELC_OIL_E','');
INSERT INTO "tech_reserve" VALUES ('ELC_NGA_E','');
INSERT INTO "tech_reserve" VALUES ('ELC_COA_E','');
INSERT INTO "tech_reserve" VALUES ('ELC_BIO_E','');
INSERT INTO "tech_reserve" VALUES ('ELC_HYD_GEN_E','');
INSERT INTO "tech_reserve" VALUES ('ELC_NUC_FIS_E','');
INSERT INTO "tech_reserve" VALUES ('ELC_GEO_E','');
INSERT INTO "tech_reserve" VALUES ('ELC_WIN_E','');
INSERT INTO "tech_reserve" VALUES ('ELC_SOL_E','');
INSERT INTO "tech_reserve" VALUES ('ELC_MAR_E','');
INSERT INTO "tech_reserve" VALUES ('ELC_CHP_OIL_E','');
INSERT INTO "tech_reserve" VALUES ('ELC_CHP_NGA_E','');
INSERT INTO "tech_reserve" VALUES ('ELC_CHP_COA_E','');
INSERT INTO "tech_reserve" VALUES ('ELC_CHP_BIO_E','');
INSERT INTO "tech_reserve" VALUES ('ELC_CHP_GEO_E','');
INSERT INTO "tech_reserve" VALUES ('ELC_COA_PUL_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_COA_CCO_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_COA_PFB_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_NGA_CCY_ADV_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_NGA_FCE_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_NUC_FIS_LWR_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_NUC_FIS_EPR_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_NUC_FIS_FR_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_NUC_FIS_ABWR_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_NUC_FIS_ADS_TRU_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_NUC_FIS_ADS_MA_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_OIL_MIX_TUR_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_OIL_MIX_CCY_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_OIL_GBL_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_OIL_GPL_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_BIO_GSF_CEN_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_BIO_COM_CEN_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_BIO_GSF_DEC_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_BIO_COM_DEC_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_BIO_GAS_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_BIO_CRP_GSF_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_BIO_CRP_COM_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_BIO_MUN_INC_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_HYD_GEN_DAM_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_HYD_GEN_RUN_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_GEO_FLS_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_GEO_BNY_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_GEO_BNY_HIG_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_WIN_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_WIN_OFF_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_SOL_PV_CEN_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_SOL_PV_DST_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_SOL_CSP_1_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_SOL_CSP_2_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_SOL_CSP_3_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_SOL_CSP_4_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_MAR_WAV_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_MAR_TDL_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_HH2_PEMFC_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_COA_CCO_IG_CCS_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_COA_CCO_FG_CCS_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_COA_PUL_FG_CCS_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_NGA_FG_CCS_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_NGA_SOFC_CCS_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_BIO_CRP_GSF_CCS_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_BIO_CRP_COM_CCS_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_BIO_GSF_CCS_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_BIO_COM_CCS_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_CHP_NGA_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_CHP_COA_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_CHP_BIO_N','');
-- Storage
INSERT INTO "tech_reserve" VALUES ('ELC_HYD_PUM_E','');
INSERT INTO "tech_reserve" VALUES ('ELC_HYD_PUM_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_STG_CEN_BTT_N','');
INSERT INTO "tech_reserve" VALUES ('ELC_STG_DST_BTT_N','');

CREATE TABLE "tech_exchange" (
	"tech"	text,
	"notes"	TEXT,
	PRIMARY KEY("tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);

CREATE TABLE "tech_curtailment" (
	"tech"	text,
	"notes"	TEXT,
	PRIMARY KEY("tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
-- Electricity sector
INSERT INTO "tech_curtailment" VALUES ('ELC_WIN_E','');
INSERT INTO "tech_curtailment" VALUES ('ELC_WIN_N','');
INSERT INTO "tech_curtailment" VALUES ('ELC_WIN_OFF_N','');
INSERT INTO "tech_curtailment" VALUES ('ELC_SOL_E','');
INSERT INTO "tech_curtailment" VALUES ('ELC_SOL_PV_CEN_N','');
INSERT INTO "tech_curtailment" VALUES ('ELC_SOL_PV_DST_N','');
INSERT INTO "tech_curtailment" VALUES ('ELC_SOL_CSP_1_N','');
INSERT INTO "tech_curtailment" VALUES ('ELC_SOL_CSP_2_N','');
INSERT INTO "tech_curtailment" VALUES ('ELC_SOL_CSP_3_N','');
INSERT INTO "tech_curtailment" VALUES ('ELC_SOL_CSP_4_N','');


CREATE TABLE "tech_flex" (
	"tech"	text,
	"notes"	TEXT,
	PRIMARY KEY("tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);

CREATE TABLE "tech_annual" (
	"tech"	text,
	"notes"	TEXT,
	PRIMARY KEY("tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
INSERT INTO "tech_annual" VALUES ('UPS_REC_HSAN_3','');
INSERT INTO "tech_annual" VALUES ('UPS_REC_HSAN_2','');
INSERT INTO "tech_annual" VALUES ('UPS_REC_HSAN_1','');
INSERT INTO "tech_annual" VALUES ('UPS_LOC_HOIL_1','');
INSERT INTO "tech_annual" VALUES ('UPS_LOC_HOIL_2','');
INSERT INTO "tech_annual" VALUES ('UPS_LOC_HOIL_3','');
INSERT INTO "tech_annual" VALUES ('UPS_LOC_HSAN_1','');
INSERT INTO "tech_annual" VALUES ('UPS_LOC_HSAN_2','');
INSERT INTO "tech_annual" VALUES ('UPS_LOC_HSAN_3','');
INSERT INTO "tech_annual" VALUES ('UPS_LOC_NGA_1','');
INSERT INTO "tech_annual" VALUES ('UPS_LOC_NGA_2','');
INSERT INTO "tech_annual" VALUES ('UPS_LOC_NGA_3','');
INSERT INTO "tech_annual" VALUES ('UPS_LOC_BCO','');
INSERT INTO "tech_annual" VALUES ('UPS_LOC_HCO','');
INSERT INTO "tech_annual" VALUES ('UPS_GRO_HOIL_1','');
INSERT INTO "tech_annual" VALUES ('UPS_GRO_HOIL_2','');
INSERT INTO "tech_annual" VALUES ('UPS_GRO_HOIL_3','');
INSERT INTO "tech_annual" VALUES ('UPS_GRO_NGA_1','');
INSERT INTO "tech_annual" VALUES ('UPS_GRO_NGA_2','');
INSERT INTO "tech_annual" VALUES ('UPS_GRO_NGA_3','');
INSERT INTO "tech_annual" VALUES ('UPS_DIS_HOIL_1','');
INSERT INTO "tech_annual" VALUES ('UPS_DIS_HOIL_2','');
INSERT INTO "tech_annual" VALUES ('UPS_DIS_HOIL_3','');
INSERT INTO "tech_annual" VALUES ('UPS_DIS_NGA_1','');
INSERT INTO "tech_annual" VALUES ('UPS_DIS_NGA_2','');
INSERT INTO "tech_annual" VALUES ('UPS_DIS_NGA_3','');
INSERT INTO "tech_annual" VALUES ('UPS_DIS_BCO','');
INSERT INTO "tech_annual" VALUES ('UPS_DIS_HCO','');
INSERT INTO "tech_annual" VALUES ('UPS_MIN_IMP_URA_NAT','');
INSERT INTO "tech_annual" VALUES ('UPS_HYD_POT','');
INSERT INTO "tech_annual" VALUES ('UPS_GEO_POT','');
INSERT INTO "tech_annual" VALUES ('UPS_SOL_PV_POT','');
INSERT INTO "tech_annual" VALUES ('UPS_SOL_CSP_POT','');
INSERT INTO "tech_annual" VALUES ('UPS_SOL_TH_POT','');
INSERT INTO "tech_annual" VALUES ('UPS_TDL_POT','');
INSERT INTO "tech_annual" VALUES ('UPS_WAV_POT','');
INSERT INTO "tech_annual" VALUES ('UPS_WIN_ON_POT','');
INSERT INTO "tech_annual" VALUES ('UPS_WIN_OFF_POT','');
INSERT INTO "tech_annual" VALUES ('UPS_FT_NGA','');
INSERT INTO "tech_annual" VALUES ('UPS_FT_OIL_RPP','');
INSERT INTO "tech_annual" VALUES ('UPS_FT_OIL_RPG','');
INSERT INTO "tech_annual" VALUES ('UPS_FT_ELC','');
INSERT INTO "tech_annual" VALUES ('UPS_IMP_BIO_ETH','');
INSERT INTO "tech_annual" VALUES ('UPS_IMP_OIL_USA','');
INSERT INTO "tech_annual" VALUES ('UPS_IMP_OIL_CAN','');
INSERT INTO "tech_annual" VALUES ('UPS_IMP_OIL_MEX','');
INSERT INTO "tech_annual" VALUES ('UPS_IMP_OIL_OLA','');
INSERT INTO "tech_annual" VALUES ('UPS_IMP_OIL_BRA','');
INSERT INTO "tech_annual" VALUES ('UPS_IMP_OIL_RUS','');
INSERT INTO "tech_annual" VALUES ('UPS_IMP_OIL_MEA','');
INSERT INTO "tech_annual" VALUES ('UPS_IMP_OIL_AFR','');
INSERT INTO "tech_annual" VALUES ('UPS_IMP_OIL_CHI','');
INSERT INTO "tech_annual" VALUES ('UPS_IMP_OIL_JPN','');
INSERT INTO "tech_annual" VALUES ('UPS_IMP_OIL_ODA','');
INSERT INTO "tech_annual" VALUES ('UPS_IMP_OIL_FEE','');
INSERT INTO "tech_annual" VALUES ('UPS_EXP_OIL','');
INSERT INTO "tech_annual" VALUES ('UPS_PRI_COA_HCO_E','');
INSERT INTO "tech_annual" VALUES ('UPS_PRI_COA_BCO_E','');
INSERT INTO "tech_annual" VALUES ('UPS_IMP_COA_AFR','');
INSERT INTO "tech_annual" VALUES ('UPS_IMP_COA_CAC','');
INSERT INTO "tech_annual" VALUES ('UPS_IMP_COA_AUS','');
INSERT INTO "tech_annual" VALUES ('UPS_IMP_COA_CAN','');
INSERT INTO "tech_annual" VALUES ('UPS_IMP_COA_OEE','');
INSERT INTO "tech_annual" VALUES ('UPS_IMP_COA_RUS','');
INSERT INTO "tech_annual" VALUES ('UPS_IMP_COA_ODA','');
INSERT INTO "tech_annual" VALUES ('UPS_IMP_COA_USA','');
INSERT INTO "tech_annual" VALUES ('UPS_IMP_COA_OLA','');
INSERT INTO "tech_annual" VALUES ('UPS_EXP_COA','');
INSERT INTO "tech_annual" VALUES ('UPS_IMP_BIO_DST','');
INSERT INTO "tech_annual" VALUES ('UPS_PRI_ADD_E','');
INSERT INTO "tech_annual" VALUES ('UPS_SEC_LIQ','');
INSERT INTO "tech_annual" VALUES ('UPS_SEC_COA_OVC','');
INSERT INTO "tech_annual" VALUES ('UPS_SEC_GAS_TWN','');
INSERT INTO "tech_annual" VALUES ('UPS_SEC_REF_FDS','');
INSERT INTO "tech_annual" VALUES ('UPS_SEC_TRA','');
INSERT INTO "tech_annual" VALUES ('UPS_SEC_REF_FLX','');
INSERT INTO "tech_annual" VALUES ('BIO_REF2_DST_N','');
INSERT INTO "tech_annual" VALUES ('BIO_REF2_KER_N','');
INSERT INTO "tech_annual" VALUES ('BIO_REF2_DST_CCS_N','');
INSERT INTO "tech_annual" VALUES ('BIO_REF2_KER_CCS_N','');
INSERT INTO "tech_annual" VALUES ('UPS_FT_LWR_URA','');
INSERT INTO "tech_annual" VALUES ('UPS_FT_LWR_UOX','');
INSERT INTO "tech_annual" VALUES ('UPS_FT_LWR_MOX','');
INSERT INTO "tech_annual" VALUES ('UPS_FT_FR_MOX','');
INSERT INTO "tech_annual" VALUES ('UPS_FT_ABWR_TRU','');
INSERT INTO "tech_annual" VALUES ('UPS_FT_ABWR_NAU','');
INSERT INTO "tech_annual" VALUES ('UPS_FT_ADS_TRU','');
INSERT INTO "tech_annual" VALUES ('UPS_FT_ADS_MA','');
INSERT INTO "tech_annual" VALUES ('UPS_NUC_LWR_UOX_E','');
INSERT INTO "tech_annual" VALUES ('UPS_NUC_LWR_MOX_E','');
INSERT INTO "tech_annual" VALUES ('UPS_NUC_FR_MOX_N','');
INSERT INTO "tech_annual" VALUES ('UPS_NUC_ABWR_TRU_N','');
INSERT INTO "tech_annual" VALUES ('UPS_NUC_ABWR_UTR_N','');
INSERT INTO "tech_annual" VALUES ('UPS_NUC_ADS_TRU_N','');
INSERT INTO "tech_annual" VALUES ('UPS_NUC_ADS_MA_N','');
INSERT INTO "tech_annual" VALUES ('UPS_REP_PUREX_LWR_UOX_E','');
INSERT INTO "tech_annual" VALUES ('UPS_REP_UREX_LWR_UOX_E','');
INSERT INTO "tech_annual" VALUES ('UPS_REP_PUREX_LWR_MOX_E','');
INSERT INTO "tech_annual" VALUES ('UPS_REP_ADV_PUREX_LWR_UOX_E','');
INSERT INTO "tech_annual" VALUES ('UPS_REP_ADV_PUREX_LWR_MOX_E','');
INSERT INTO "tech_annual" VALUES ('UPS_REP_ADV_PUREX_FR_MOX_E','');
INSERT INTO "tech_annual" VALUES ('UPS_TRA_ADS_MA_E','');
INSERT INTO "tech_annual" VALUES ('UPS_TRA_FR_MOX_E','');
INSERT INTO "tech_annual" VALUES ('UPS_TRA_LWR_MOX_E','');
INSERT INTO "tech_annual" VALUES ('H2_FT_NGA','');
INSERT INTO "tech_annual" VALUES ('H2_FT_COA','');
INSERT INTO "tech_annual" VALUES ('H2_FT_OIL','');
INSERT INTO "tech_annual" VALUES ('H2_FT_ETH','');
INSERT INTO "tech_annual" VALUES ('H2_FT_BIO','');
INSERT INTO "tech_annual" VALUES ('SEQ_SNK_EOR_ONS_N','');
INSERT INTO "tech_annual" VALUES ('SEQ_SNK_EOR_OFF_N','');
INSERT INTO "tech_annual" VALUES ('SEQ_SNK_DOF_ONS_N','');
INSERT INTO "tech_annual" VALUES ('SEQ_SNK_DOF_OFF_N','');
INSERT INTO "tech_annual" VALUES ('SEQ_SNK_DGF_OFF_N','');
INSERT INTO "tech_annual" VALUES ('SEQ_SNK_ECB_N','');
INSERT INTO "tech_annual" VALUES ('SEQ_SNK_ECB_DEEP_N','');
INSERT INTO "tech_annual" VALUES ('SEQ_SNK_DSA_ONS_N','');
INSERT INTO "tech_annual" VALUES ('SEQ_SNK_DSA_OFF_N','');
INSERT INTO "tech_annual" VALUES ('SEQ_SNK_DOC_N','');
INSERT INTO "tech_annual" VALUES ('SEQ_SNK_AFF_1_N','');
INSERT INTO "tech_annual" VALUES ('SEQ_SNK_AFF_2_N','');
INSERT INTO "tech_annual" VALUES ('SEQ_SNK_AFF_3_N','');
INSERT INTO "tech_annual" VALUES ('SEQ_SNK_AFF_4_N','');
INSERT INTO "tech_annual" VALUES ('SEQ_SNK_CO2_BKS_N','');
INSERT INTO "tech_annual" VALUES ('SEQ_REM_EOR_ONS_N','');
INSERT INTO "tech_annual" VALUES ('SEQ_REM_EOR_OFF_N','');
INSERT INTO "tech_annual" VALUES ('SEQ_REM_DOF_ONS_N','');
INSERT INTO "tech_annual" VALUES ('SEQ_REM_DOF_OFF_N','');
INSERT INTO "tech_annual" VALUES ('SEQ_REM_DGF_OFF_N','');
INSERT INTO "tech_annual" VALUES ('SEQ_REM_ECB_N','');
INSERT INTO "tech_annual" VALUES ('SEQ_REM_ECB_DEEP_N','');
INSERT INTO "tech_annual" VALUES ('SEQ_REM_DSA_ONS_N','');
INSERT INTO "tech_annual" VALUES ('SEQ_REM_DSA_OFF_N','');
INSERT INTO "tech_annual" VALUES ('SEQ_REM_DOC_N','');
INSERT INTO "tech_annual" VALUES ('SEQ_REM_MIN_N','');
INSERT INTO "tech_annual" VALUES ('SEQ_REM_AFF_N','');
INSERT INTO "tech_annual" VALUES ('SEQ_REM_CO2_BKS_N','');
INSERT INTO "tech_annual" VALUES ('DMY_OUT_TECH','');

CREATE TABLE "commodity_labels" (
	"comm_labels"	text,
	"comm_labels_desc"	text,
	PRIMARY KEY("comm_labels")
);
INSERT INTO "commodity_labels" VALUES ('p','Physical commodity');
INSERT INTO "commodity_labels" VALUES ('e','Emissions commodity');
INSERT INTO "commodity_labels" VALUES ('d','Service demand commodity');

CREATE TABLE "commodities" (
	"comm_name"	text,
	"flag"	text,
	"comm_desc"	text,
	PRIMARY KEY("comm_name"),
	FOREIGN KEY("flag") REFERENCES "commodity_labels"("comm_labels")
);
-- Upstream sector commodities
-- Demand
INSERT INTO "commodities" VALUES ('DMY_OUT','d','Dummy output commodity');
-- Physical commodities
INSERT INTO "commodities" VALUES ('ethos','p','Dummy generation commodity');
INSERT INTO "commodities" VALUES ('BIO_GRS','p','Grass crops - PJ');
INSERT INTO "commodities" VALUES ('BIO_STC','p','Starch crops - PJ');
INSERT INTO "commodities" VALUES ('BIO_SUG','p','Sugar crops - PJ');
INSERT INTO "commodities" VALUES ('BIO_DST','p','FT-diesel from lignocellulosic biomass - PJ (0.044 PJ/kt)');
INSERT INTO "commodities" VALUES ('BIO_ETB','p','Ethyl tertio butyl ether from bioethanol - PJ (0.036 PJ/kt)');
INSERT INTO "commodities" VALUES ('BIO_ETH','p','Ethanol - PJ (0.027 kt/PJ)');
INSERT INTO "commodities" VALUES ('BIO_GAS','p','Biogas - PJ');
INSERT INTO "commodities" VALUES ('BIO_HVO','p','Hydrotreated vegetable oil - PJ (0.044 PJ/kt)');
INSERT INTO "commodities" VALUES ('BIO_ISOBUTYL','p','Isobutylene - PJ');
INSERT INTO "commodities" VALUES ('BIO_KER','p','FT-kerosene from lignocellulosic biomass - PJ ');
INSERT INTO "commodities" VALUES ('BIO_LIQ','p','Liquid biofuels - PJ');
INSERT INTO "commodities" VALUES ('BIO_MHV','p','Methyl ester from vegetable oil - PJ (0.0385 kt/PJ)');
INSERT INTO "commodities" VALUES ('BIO_MUN','p','Municipal waste');
INSERT INTO "commodities" VALUES ('BIO_NAP','p','Bio-naphtha - PJ (0.044 PJ/kt)');
INSERT INTO "commodities" VALUES ('BIO_OIL','p','Vegetable oil feedstocks - PJ');
INSERT INTO "commodities" VALUES ('BIO_RPS','p','Rapeseed - PJ');
INSERT INTO "commodities" VALUES ('BIO_SLU','p','Industrial waste-sludge - PJ');
INSERT INTO "commodities" VALUES ('BIO_WOD','p','Wood products - PJ');
INSERT INTO "commodities" VALUES ('COA_BCO','p','Brown coal');
INSERT INTO "commodities" VALUES ('COA_BCO_MIN','p','Brown coal (ground)');
INSERT INTO "commodities" VALUES ('COA_HCO','p','Hard coal');
INSERT INTO "commodities" VALUES ('COA_HCO_MIN','p','Hard coal (ground)');
INSERT INTO "commodities" VALUES ('COA_OVC','p','Coke oven coke');
INSERT INTO "commodities" VALUES ('GAS_BFG','p','Blast furnace gas');
INSERT INTO "commodities" VALUES ('GAS_COG','p','Coke oven gas');
INSERT INTO "commodities" VALUES ('GAS_ETH','p','Ethane');
INSERT INTO "commodities" VALUES ('GAS_GWG','p','Gas works gas');
INSERT INTO "commodities" VALUES ('GAS_LNG','p','Liquified Natural gas');
INSERT INTO "commodities" VALUES ('GAS_NGA','p','Natural gas');
INSERT INTO "commodities" VALUES ('GAS_NGA_MIN','p','Natural gas (ground)');
INSERT INTO "commodities" VALUES ('GAS_OXY','p','Oxygen steel furnace gas');
INSERT INTO "commodities" VALUES ('GAS_RFG','p','Refinery gas');
INSERT INTO "commodities" VALUES ('GEO','p','Geothermal energy');
INSERT INTO "commodities" VALUES ('HYD','p','Hydro energy');
INSERT INTO "commodities" VALUES ('MAT_WOD','p','Industrial solid biowaste');
INSERT INTO "commodities" VALUES ('OIL_ADD','p','Additive (MTBE, etc.)');
INSERT INTO "commodities" VALUES ('OIL_ASP','p','Asphalt');
INSERT INTO "commodities" VALUES ('OIL_CRD','p','Crude oil');
INSERT INTO "commodities" VALUES ('OIL_CRD_MIN','p','Heavy crude oil (ground)');
INSERT INTO "commodities" VALUES ('OIL_CRD_PRI','p','Crude oil');
INSERT INTO "commodities" VALUES ('OIL_CRDU','p','Ultra heavy oil (from in-situ bitumen)');
INSERT INTO "commodities" VALUES ('OIL_DST','p','Distillates');
INSERT INTO "commodities" VALUES ('OIL_FEE','p','Refinery feedstock');
INSERT INTO "commodities" VALUES ('OIL_GSL','p','Gasoline');
INSERT INTO "commodities" VALUES ('OIL_HFO','p','Heavy fuel oil');
INSERT INTO "commodities" VALUES ('OIL_KER','p','Kerosene');
INSERT INTO "commodities" VALUES ('OIL_LPG','p','Liquid petroleum gas');
INSERT INTO "commodities" VALUES ('OIL_LUB','p','Lubricants');
INSERT INTO "commodities" VALUES ('OIL_NAP','p','Naphtha');
INSERT INTO "commodities" VALUES ('OIL_NCR','p','Synthetic oil (from mined bitumen + liquefac)');
INSERT INTO "commodities" VALUES ('OIL_NSP','p','Non specified oil');
INSERT INTO "commodities" VALUES ('OIL_OBI_MIN','p','Oil sands (in situ - ultra heavy)');
INSERT INTO "commodities" VALUES ('OIL_PTC','p','Petroleum coke');
INSERT INTO "commodities" VALUES ('OIL_WAX','p','Paraffin wax');
INSERT INTO "commodities" VALUES ('OIL_WSP','p','White spirit');
INSERT INTO "commodities" VALUES ('SOL_CSP','p','Solar energy (CSP)');
INSERT INTO "commodities" VALUES ('SOL_PV','p','Solar energy (PV)');
INSERT INTO "commodities" VALUES ('SOL_TH','p','Solar energy (Thermal)');
INSERT INTO "commodities" VALUES ('SYN_DST','p','Synfuel - Gas oil');
INSERT INTO "commodities" VALUES ('SYN_GSL','p','Synfuel - Methanol');
INSERT INTO "commodities" VALUES ('SYN_KER','p','Synfuel - Kerosene');
INSERT INTO "commodities" VALUES ('SYN_NGA','p','Synfuel - Natural gas');
INSERT INTO "commodities" VALUES ('TDL','p','Tide energy');
INSERT INTO "commodities" VALUES ('UPS_ELC','p','Electricity (UPS)');
INSERT INTO "commodities" VALUES ('UPS_HET','p','Heat (UPS)');
INSERT INTO "commodities" VALUES ('UPS_NGA','p','Natural Gas (UPS)');
INSERT INTO "commodities" VALUES ('UPS_OIL_GAS','p','Refined Pet Products-Gas (UPS)');
INSERT INTO "commodities" VALUES ('UPS_OIL_LIQ','p','Refined petroleum products (UPS)');
INSERT INTO "commodities" VALUES ('WAV','p','Wave energy');
INSERT INTO "commodities" VALUES ('WIN_OFF','p','Wind energy (offshore)');
INSERT INTO "commodities" VALUES ('WIN_ON','p','Wind energy (offshore)');
---- Nuclear fuel cycle
INSERT INTO "commodities" VALUES ('URA_NAT','p','Natural Uranium');
INSERT INTO "commodities" VALUES ('URA_ENR','p','Enriched Uranium');
INSERT INTO "commodities" VALUES ('URA_DEP','p','Depleted Uranium');
INSERT INTO "commodities" VALUES ('LWR_UOX','p','UOX fuel for LWR');
INSERT INTO "commodities" VALUES ('LWR_MOX','p','MOX fuel for LWR');
INSERT INTO "commodities" VALUES ('FR_MOX','p','MOX fuel for FR');
INSERT INTO "commodities" VALUES ('ABWR_TRU','p','TRU fuel for ABWR');
INSERT INTO "commodities" VALUES ('ABWR_UTR','p','Uranium + TRU fuel for ABWR');
INSERT INTO "commodities" VALUES ('ADS_TRU','p','TRU fuel for ADS');
INSERT INTO "commodities" VALUES ('ADS_MA','p','MA fuel for ADS');
INSERT INTO "commodities" VALUES ('UPS_NUC_HET_LWR_UOX','p','Heat from LWR, UOX fuelled');
INSERT INTO "commodities" VALUES ('UPS_NUC_HET_LWR_MOX','p','Heat from LWR, MOX fuelled');
INSERT INTO "commodities" VALUES ('UPS_NUC_HET_FR_MOX','p','Heat from FR, MOX fuelled');
INSERT INTO "commodities" VALUES ('UPS_NUC_HET_ABWR_TRU','p','Heat from ABWR, TRU fuelled');
INSERT INTO "commodities" VALUES ('UPS_NUC_HET_ABWR_UTR','p','Heat from ABWR, Uranium + TRU fuelled');
INSERT INTO "commodities" VALUES ('UPS_NUC_HET_ADS_TRU','p','Heat from ADS, TRU fuelled');
INSERT INTO "commodities" VALUES ('UPS_NUC_HET_ADS_MA','p','Heat from ADS, MA fuelled');
INSERT INTO "commodities" VALUES ('UPS_NUC_SPENT_LWR_UOX','p','Spent UOX fuel from LWR');
INSERT INTO "commodities" VALUES ('UPS_NUC_SPENT_LWR_MOX','p','Spent MOX fuel from LWR');
INSERT INTO "commodities" VALUES ('UPS_NUC_SPENT_FR_MOX','p','Spent MOX fuel from FR');
INSERT INTO "commodities" VALUES ('UPS_UOX_PUREX_URA','p','Uranium from PUREX reprocessing of spent UOX fuel from LWR');
INSERT INTO "commodities" VALUES ('UPS_UOX_PUREX_PU','p','Plutonium from PUREX reprocessing of spent UOX fuel from LWR');
INSERT INTO "commodities" VALUES ('UPS_UOX_PUREX_HLW','p','HLW from PUREX reprocessing of spent UOX fuel from LWR');
INSERT INTO "commodities" VALUES ('UPS_UOX_UREX_URA','p','Uranium from UREX reprocessing of spent UOX fuel from LWR');
INSERT INTO "commodities" VALUES ('UPS_UOX_UREX_TRU','p','TRU from UREX reprocessing of spent UOX fuel from LWR');
INSERT INTO "commodities" VALUES ('UPS_UOX_UREX_HLW','p','HLW from UREX reprocessing of spent UOX fuel from LWR');
INSERT INTO "commodities" VALUES ('UPS_MOX_PUREX_URA','p','Uranium from PUREX reprocessing of spent MOX fuel from LWR');
INSERT INTO "commodities" VALUES ('UPS_MOX_PUREX_PU','p','Plutonium from PUREX reprocessing of spent MOX fuel from LWR');
INSERT INTO "commodities" VALUES ('UPS_MOX_PUREX_HLW','p','HLW from PUREX reprocessing of spent MOX fuel from LWR');
INSERT INTO "commodities" VALUES ('UPS_UOX_ADV_PUREX_LWR_URA','p','Uranium from advanced PUREX reprocessing of spent UOX fuel from LWR');
INSERT INTO "commodities" VALUES ('UPS_UOX_ADV_PUREX_LWR_PU','p','Plutonium from advanced PUREX reprocessing of spent UOX fuel from LWR');
INSERT INTO "commodities" VALUES ('UPS_UOX_ADV_PUREX_LWR_MA','p','MA from advanced PUREX reprocessing of spent UOX fuel from LWR');
INSERT INTO "commodities" VALUES ('UPS_UOX_ADV_PUREX_LWR_HLW','p','HLW from advanced PUREX reprocessing of spent UOX fuel from LWR');
INSERT INTO "commodities" VALUES ('UPS_MOX_ADV_PUREX_LWR_URA','p','Uranium from advanced PUREX reprocessing of spent MOX fuel from LWR');
INSERT INTO "commodities" VALUES ('UPS_MOX_ADV_PUREX_LWR_PU','p','Plutonium from advanced PUREX reprocessing of spent MOX fuel from LWR');
INSERT INTO "commodities" VALUES ('UPS_MOX_ADV_PUREX_LWR_MA','p','MA from advanced PUREX reprocessing of spent MOX fuel from LWR');
INSERT INTO "commodities" VALUES ('UPS_MOX_ADV_PUREX_LWR_HLW','p','HLW from advanced PUREX reprocessing of spent MOX fuel from LWR');
INSERT INTO "commodities" VALUES ('UPS_MOX_ADV_PUREX_FR_MA','p','MA from advanced PUREX reprocessing of spent MOX fuel from FR');
INSERT INTO "commodities" VALUES ('UPS_MOX_ADV_PUREX_FR_HLW','p','HLW from advanced PUREX reprocessing of spent MOX fuel from FR');
INSERT INTO "commodities" VALUES ('UPS_REP_HLW_ABWR_TRU','p','HLW from PYRO reprocessing of spent fuel from ABWR (TRU)');
INSERT INTO "commodities" VALUES ('UPS_REP_HLW_ABWR_UTR','p','HLW from PYRO reprocessing of spent fuel from ABWR (Uranium + TRU)');
INSERT INTO "commodities" VALUES ('UPS_REP_HLW_ADS_TRU','p','HLW from PYRO reprocessing of spent fuel from ADS (TRU)');
INSERT INTO "commodities" VALUES ('UPS_REP_HLW_ADS_MA','p','HLW from PYRO reprocessing of spent fuel from ADS (MA)');
INSERT INTO "commodities" VALUES ('UPS_URA_HLW','p','Uranium component of HLW');
INSERT INTO "commodities" VALUES ('UPS_PU_HLW','p','Plutonium component of HLW');
INSERT INTO "commodities" VALUES ('UPS_MA_HLW','p','MA component of HLW');
INSERT INTO "commodities" VALUES ('UPS_FP_HLW','p','FP component of HLW');
INSERT INTO "commodities" VALUES ('UPS_URA_SPENT','p','Uranium component of spent fuel');
INSERT INTO "commodities" VALUES ('UPS_PU_SPENT','p','Plutonium component of spent fuel');
INSERT INTO "commodities" VALUES ('UPS_MA_SPENT','p','MA component of spent fuel');
INSERT INTO "commodities" VALUES ('UPS_FP_SPENT','p','FP component of spent fuel');
INSERT INTO "commodities" VALUES ('UPS_MA','p','MA for ADS fuel production');
INSERT INTO "commodities" VALUES ('UPS_PU_FR','p','Plutonium for FR MOX fuel production');
INSERT INTO "commodities" VALUES ('UPS_PU_LWR','p','Plutonium for LWR MOX fuel production');
-- Hydrogen
INSERT INTO "commodities" VALUES ('H2_NGA','p','Natural gas (HH2)');
INSERT INTO "commodities" VALUES ('H2_COA','p','Coal (HH2)');
INSERT INTO "commodities" VALUES ('H2_OIL','p','Refined Petroelum Products-Liq (HH2)');
INSERT INTO "commodities" VALUES ('H2_BIO','p','Biofuels (HH2)');
INSERT INTO "commodities" VALUES ('H2_ETH','p','Ethanol from crop (HH2)');
INSERT INTO "commodities" VALUES ('H2_ELC','p','Electricity (HH2)');
INSERT INTO "commodities" VALUES ('H2','p','Hydrogen');
INSERT INTO "commodities" VALUES ('H2_EL','p','Hydrogen from electrolysis');
INSERT INTO "commodities" VALUES ('H2_EL_SOEC','p','Hydrogen from SOEC');
INSERT INTO "commodities" VALUES ('H2_BL','p','Hydrogen for blending');
-- Sequestration
INSERT INTO "commodities" VALUES ('SNK_EOR_ONS_DMY','p','Sequestration - Dummy sink commodity - Enhanced Oil Recovery (onshore)');
INSERT INTO "commodities" VALUES ('SNK_EOR_OFF_DMY','p','Sequestration - Dummy sink commodity - Enhanced Oil Recovery (offshore)');
INSERT INTO "commodities" VALUES ('SNK_DOF_ONS_DMY','p','Sequestration - Dummy sink commodity - Depleted oil fields (onshore)');
--INSERT INTO "commodities" VALUES ('SNK_DGF_ONS_DMY','p','Sequestration - Dummy sink commodity - Depleted gas fields (onshore)');
INSERT INTO "commodities" VALUES ('SNK_DOF_OFF_DMY','p','Sequestration - Dummy sink commodity - Depleted oil fields (offshore)');
INSERT INTO "commodities" VALUES ('SNK_DGF_OFF_DMY','p','Sequestration - Dummy sink commodity - Depleted gas fields (offshore)');
INSERT INTO "commodities" VALUES ('SNK_ECB_DMY','p','Sequestration - Dummy sink commodity - Enhanced Coalbed Methane recovery <1000 m');
INSERT INTO "commodities" VALUES ('SNK_ECB_DEEP_DMY','p','Sequestration - Dummy sink commodity - Enhanced Coalbed Methane recovery >1000 m');
INSERT INTO "commodities" VALUES ('SNK_DSA_ONS_DMY','p','Sequestration - Dummy sink commodity - Deep saline aquifers (onshore)');
INSERT INTO "commodities" VALUES ('SNK_DSA_OFF_DMY','p','Sequestration - Dummy sink commodity - Deep saline aquifers (offshore)');
INSERT INTO "commodities" VALUES ('SNK_AFF_DMY','p','Sequestration - Dummy sink commodity - Afforestation');
INSERT INTO "commodities" VALUES ('SNK_DOC_DMY','p','Sequestration - Dummy sink commodity - Storage in the deep ocean');
INSERT INTO "commodities" VALUES ('SNK_BKS_DMY','p','Sequestration - Dummy sink commodity - Backstop');
INSERT INTO "commodities" VALUES ('SNK_CO2_EM','e','CO2 - Captured CO2 (kt)');
INSERT INTO "commodities" VALUES ('SNK_CO2','p','CO2 - Captured CO2 for utilization (kt)');
-- Emissions
INSERT INTO "commodities" VALUES ('UPS_CO2','e','Upstream emissions - CO2');
INSERT INTO "commodities" VALUES ('UPS_CO2_PRC','e','Upstream emissions - CO2');
INSERT INTO "commodities" VALUES ('UPS_CH4','e','Upstream emissions - CH4');
INSERT INTO "commodities" VALUES ('UPS_N2O','e','Upstream emissions - N2O');
INSERT INTO "commodities" VALUES ('TOT_CO2','e','Total CO2 emission (kt)');
INSERT INTO "commodities" VALUES ('TOT_CH4','e','Total CH4 emission (kt)');
INSERT INTO "commodities" VALUES ('TOT_N2O','e','Total N2O emission (kt)');
INSERT INTO "commodities" VALUES ('GWP_100','e','Global warming potential - 100 years');
-- Electricity sector
---- Sector-specific commodities
INSERT INTO "commodities" VALUES ('ELC_BGS','p','Renewable biogas');
INSERT INTO "commodities" VALUES ('ELC_MUN','p','Municipal waste');
INSERT INTO "commodities" VALUES ('ELC_BIO','p','Biofuels');
INSERT INTO "commodities" VALUES ('ELC_CEN','p','Electricity (centralized)');
INSERT INTO "commodities" VALUES ('ELC_COA','p','Coal');
INSERT INTO "commodities" VALUES ('ELC_CRP','p','Crop');
INSERT INTO "commodities" VALUES ('ELC_DST','p','Electricity (decentralized)');
INSERT INTO "commodities" VALUES ('ELC_GEO','p','Geothermal energy');
INSERT INTO "commodities" VALUES ('ELC_HYD_DAM','p','Hydroelectric energy - Dam');
INSERT INTO "commodities" VALUES ('ELC_HYD_ROR','p','Hydroelectric energy - Run on river');
INSERT INTO "commodities" VALUES ('ELC_NGA','p','Natural gas');
INSERT INTO "commodities" VALUES ('ELC_OIL','p','Oil');
INSERT INTO "commodities" VALUES ('ELC_SOL_PV','p','Solar energy - PV');
INSERT INTO "commodities" VALUES ('ELC_SOL_TH','p','Solar energy - TH');
INSERT INTO "commodities" VALUES ('ELC_SOL_CSP','p','Solar energy - CSP');
INSERT INTO "commodities" VALUES ('ELC_WAV','p','Wave energy');
INSERT INTO "commodities" VALUES ('ELC_TDL','p','Tidal energy');
INSERT INTO "commodities" VALUES ('ELC_WIN_ON','p','Wind energy - Onshore');
INSERT INTO "commodities" VALUES ('ELC_WIN_OFF','p','Wind energy - Offshore');
INSERT INTO "commodities" VALUES ('ELC_H2','p','Hydrogen');
INSERT INTO "commodities" VALUES ('HET','p','Heat');
INSERT INTO "commodities" VALUES ('ELC_CO2','e','Electricity emissions - CO2');
INSERT INTO "commodities" VALUES ('ELC_CH4','e','Electricity emissions - CH4');
INSERT INTO "commodities" VALUES ('ELC_N2O','e','Electricity emissions - N2O');
-- Demand commodities
INSERT INTO "commodities" VALUES('ELC_DEM','d','Electricity Demand');
INSERT INTO "commodities" VALUES('HET_DEM','d','Heat Demand');
-- Materials
INSERT INTO "commodities" VALUES('ALU','m','Aluminum');
INSERT INTO "commodities" VALUES('BOR','m','Boron');
INSERT INTO "commodities" VALUES('CER','m','Cerium');
INSERT INTO "commodities" VALUES('CHR','m','Chromium');
INSERT INTO "commodities" VALUES('COB','m','Cobalt');
INSERT INTO "commodities" VALUES('COP','m','Copper');
INSERT INTO "commodities" VALUES('DYS','m','Dysprosium');
INSERT INTO "commodities" VALUES('EUP','m','Europium');
INSERT INTO "commodities" VALUES('FLU','m','Fluospar');
INSERT INTO "commodities" VALUES('GAD','m','Gadolinium');
INSERT INTO "commodities" VALUES('GAL','m','Gallium');
INSERT INTO "commodities" VALUES('GER','m','Germanium');
INSERT INTO "commodities" VALUES('GRA','m','Graphite');
INSERT INTO "commodities" VALUES('IND','m','Indium');
INSERT INTO "commodities" VALUES('IRI','m','Iridium');
INSERT INTO "commodities" VALUES('LAN','m','Lanthanum');
INSERT INTO "commodities" VALUES('LIT','m','Lithium');
INSERT INTO "commodities" VALUES('MAG','m','Magnesium');
INSERT INTO "commodities" VALUES('MAN','m','Manganese');
INSERT INTO "commodities" VALUES('MOL','m','Molybdenum');
INSERT INTO "commodities" VALUES('NEO','m','Neodymium');
INSERT INTO "commodities" VALUES('NIC','m','Nickel');
INSERT INTO "commodities" VALUES('NIO','m','Niobium');
INSERT INTO "commodities" VALUES('PAL','m','Palladium');
INSERT INTO "commodities" VALUES('PHO','m','Phosphorus');
INSERT INTO "commodities" VALUES('PLA','m','Platinum');
INSERT INTO "commodities" VALUES('PRA','m','Praseodymium');
INSERT INTO "commodities" VALUES('SIL','m','Silicon');
INSERT INTO "commodities" VALUES('SIV','m','Silver');
INSERT INTO "commodities" VALUES('TAN','m','Tantalum');
INSERT INTO "commodities" VALUES('TER','m','Terbium');
INSERT INTO "commodities" VALUES('TIT','m','Titanium');
INSERT INTO "commodities" VALUES('VAN','m','Vanadium');
INSERT INTO "commodities" VALUES('YTT','m','Yttrium');
INSERT INTO "commodities" VALUES('ZIR','m','Zirconium');

CREATE TABLE "commodities_e_moo" (
	"comm_name"	text,
	"notes"		text,
	PRIMARY KEY("comm_name"),
	FOREIGN KEY("comm_name") REFERENCES "commodities"("comm_name")
);
INSERT INTO "commodities_e_moo" VALUES('GWP_100','');

CREATE TABLE "MultiObjectiveSlacked" (
	"objective_name"		text,
	"objective_slack"		real,
	"notes"					text
);

-- Energy supply risk
CREATE TABLE "EnergyCommodityConcentrationIndex" (
    "regions"                   text,
    "comm_name"                 text,
    "periods"                   integer,
    "concentration_index"       real,
    "concentration_index_units" text,
    "concentration_index_notes" text,
	PRIMARY KEY("regions","comm_name","periods"),
	FOREIGN KEY("comm_name") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods")
);
INSERT INTO "EnergyCommodityConcentrationIndex" VALUES('EU','BIO_ETH',2010,0.227,'HHI','Eurostat Comext DS-045409');
INSERT INTO "EnergyCommodityConcentrationIndex" VALUES('EU','BIO_MHV',2010,0.227,'HHI','Eurostat Comext DS-045409');
INSERT INTO "EnergyCommodityConcentrationIndex" VALUES('EU','BIO_WOD',2010,0.227,'HHI','Eurostat Comext DS-045409');
INSERT INTO "EnergyCommodityConcentrationIndex" VALUES('EU','COA_HCO',2010,0.222,'HHI','Eurostat Comext');
INSERT INTO "EnergyCommodityConcentrationIndex" VALUES('EU','GAS_LNG',2010,0.258,'HHI','Eurostat Comext');
INSERT INTO "EnergyCommodityConcentrationIndex" VALUES('EU','GAS_NGA_MIN',2010,0.289,'HHI','Eurostat Comext');
INSERT INTO "EnergyCommodityConcentrationIndex" VALUES('EU','H2',2010,0.237,'HHI','Clean Hydrogen Monitor 2022');
INSERT INTO "EnergyCommodityConcentrationIndex" VALUES('EU','OIL_CRD_MIN',2010,0.079,'HHI','Eurostat Comext');
INSERT INTO "EnergyCommodityConcentrationIndex" VALUES('EU','OIL_FEE',2010,0.079,'HHI','Eurostat Comext');
INSERT INTO "EnergyCommodityConcentrationIndex" VALUES('EU','BIO_OIL',2010,0.227,'HHI','Eurostat Comext DS-045409');
INSERT INTO "EnergyCommodityConcentrationIndex" VALUES('EU','BIO_ISOBUTYL',2010,0.227,'HHI','Eurostat Comext DS-045409');

CREATE TABLE "TechnologyMaterialSupplyRisk" (
	"regions"	        text,
	"tech"	            text,
	"vintage"	        integer,
	"tech_msr"	        real,
	"tech_msr_units"	text,
	"tech_msr_notes"	text,
	PRIMARY KEY("regions","tech","vintage"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods")
);

CREATE TABLE "TechInputSplit" (
	"regions"	TEXT,
	"periods"	integer,
	"input_comm"	text,
	"tech"	text,
	"ti_split"	real,
	"ti_split_notes"	text,
	PRIMARY KEY("regions","periods","input_comm","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("input_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods")
);
-- Upstream sector
-- Fuel technologies
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'OIL_GSL','UPS_FT_OIL_RPP',0.002,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'OIL_DST','UPS_FT_OIL_RPP',0.050,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'OIL_HFO','UPS_FT_OIL_RPP',0.489,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'OIL_NAP','UPS_FT_OIL_RPP',0.009,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'OIL_NSP','UPS_FT_OIL_RPP',0.180,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'OIL_PTC','UPS_FT_OIL_RPP',0.270,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'GAS_RFG','UPS_FT_OIL_RPG',0.977,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'OIL_LPG','UPS_FT_OIL_RPG',0.022,'10.1016/j.fusengdes.2024.114679');
-- Primary energy production
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'OIL_CRD_MIN','UPS_PRI_HFO_1_E',0.995,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_ELC','UPS_PRI_HFO_1_E',0.005,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'OIL_CRD_MIN','UPS_PRI_HFO_2_E',0.995,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_ELC','UPS_PRI_HFO_2_E',0.005,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'OIL_CRD_MIN','UPS_PRI_HFO_3_E',0.995,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_ELC','UPS_PRI_HFO_3_E',0.005,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'OIL_OBI_MIN','UPS_PRI_HOIL_E',0.970,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'OIL_CRD','UPS_PRI_HOIL_E',0.004,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_OIL_LIQ','UPS_PRI_HOIL_E',0.011,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_ELC','UPS_PRI_HOIL_E',0.012,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'GAS_NGA_MIN','UPS_PRI_FIP_NGA_1_E',0.997,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_OIL_LIQ','UPS_PRI_FIP_NGA_1_E',0.001,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_ELC','UPS_PRI_FIP_NGA_1_E',0.002,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'GAS_NGA_MIN','UPS_PRI_FIP_NGA_2_E',0.997,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_OIL_LIQ','UPS_PRI_FIP_NGA_2_E',0.001,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_ELC','UPS_PRI_FIP_NGA_2_E',0.002,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'COA_HCO_MIN','UPS_PRI_COA_HCO_E',0.990,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_ELC','UPS_PRI_COA_HCO_E',0.008,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_HET','UPS_PRI_COA_HCO_E',0.001,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'COA_BCO_MIN','UPS_PRI_COA_BCO_E',0.990,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_ELC','UPS_PRI_COA_BCO_E',0.008,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_HET','UPS_PRI_COA_BCO_E',0.001,'10.1016/j.fusengdes.2024.114679');
-- Secondary transformation
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'COA_HCO','UPS_SEC_COA_OVC',0.890,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'OIL_PTC','UPS_SEC_COA_OVC',0.010,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'GAS_NGA','UPS_SEC_COA_OVC',0.002,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'COA_BCO','UPS_SEC_COA_OVC',0.089,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_OIL_LIQ','UPS_SEC_COA_OVC',0.000,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_OIL_GAS','UPS_SEC_COA_OVC',0.000,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_ELC','UPS_SEC_COA_OVC',0.003,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_HET','UPS_SEC_COA_OVC',0.006,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'COA_BCO','UPS_SEC_GAS_TWN',0.437,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'GAS_NGA','UPS_SEC_GAS_TWN',0.365,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'OIL_LPG','UPS_SEC_GAS_TWN',0.031,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'OIL_DST','UPS_SEC_GAS_TWN',0.052,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_ELC','UPS_SEC_GAS_TWN',0.068,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_HET','UPS_SEC_GAS_TWN',0.046,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'COA_HCO','UPS_SEC_GAS_BFG',0.192,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'COA_OVC','UPS_SEC_GAS_BFG',0.762,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'GAS_COG','UPS_SEC_GAS_BFG',0.005,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'GAS_NGA','UPS_SEC_GAS_BFG',0.001,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'OIL_HFO','UPS_SEC_GAS_BFG',0.040,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'COA_HCO','UPS_SEC_LIQ',0.9748,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'GAS_NGA','UPS_SEC_LIQ',0.0252,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'GAS_RFG','UPS_SEC_REF_FDS',0.056,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'GAS_ETH','UPS_SEC_REF_FDS',0.002,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'OIL_LPG','UPS_SEC_REF_FDS',0.057,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'OIL_GSL','UPS_SEC_REF_FDS',0.014,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'OIL_KER','UPS_SEC_REF_FDS',0.007,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'OIL_DST','UPS_SEC_REF_FDS',0.074,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'OIL_HFO','UPS_SEC_REF_FDS',0.102,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'OIL_NAP','UPS_SEC_REF_FDS',0.664,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'OIL_NSP','UPS_SEC_REF_FDS',0.023,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'GAS_NGA','UPS_SEC_TRA',0.081,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_OIL_LIQ','UPS_SEC_TRA',0.067,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_ELC','UPS_SEC_TRA',0.575,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_HET','UPS_SEC_TRA',0.276,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'OIL_CRD','UPS_SEC_REF_FLX',0.844,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'OIL_FEE','UPS_SEC_REF_FLX',0.075,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'OIL_ADD','UPS_SEC_REF_FLX',0.003,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'GAS_LNG','UPS_SEC_REF_FLX',0.016,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'GAS_NGA','UPS_SEC_REF_FLX',0.004,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_OIL_LIQ','UPS_SEC_REF_FLX',0.018,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_OIL_GAS','UPS_SEC_REF_FLX',0.030,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_ELC','UPS_SEC_REF_FLX',0.004,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_HET','UPS_SEC_REF_FLX',0.006,'10.1016/j.fusengdes.2024.114679');
-- Biofuels
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'BIO_RPS','BIO_REF1_CRUSHING_E',9.980E-01,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_ELC','BIO_REF1_CRUSHING_E',4.400E-04,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_HET','BIO_REF1_CRUSHING_E',5.830E-04,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'BIO_OIL','BIO_REF1_TRANSESTER_E',9.98E-01,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_ELC','BIO_REF1_TRANSESTER_E',2.76E-04,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_HET','BIO_REF1_TRANSESTER_E',1.56E-03,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'BIO_STC','BIO_REF1_ETHAMIDE_E',9.89E-01,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_ELC','BIO_REF1_ETHAMIDE_E',4.26E-03,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_HET','BIO_REF1_ETHAMIDE_E',5.98E-03,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'BIO_SUG','BIO_REF1_ETHSUG_E',9.97E-01,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_ELC','BIO_REF1_ETHSUG_E',9.86E-04,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_HET','BIO_REF1_ETHSUG_E',1.39E-03,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'BIO_ETH','BIO_REF1_ETBE_E',4.40E-01,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'BIO_ISOBUTYL','BIO_REF1_ETBE_E',5.56E-01,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_ELC','BIO_REF1_ETBE_E',2.16E-04,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_HET','BIO_REF1_ETBE_E',2.42E-03,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2015,'BIO_OIL','BIO_REF1_HVO_N',9.90E-01,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2015,'UPS_ELC','BIO_REF1_HVO_N',1.91E-04,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2015,'UPS_HET','BIO_REF1_HVO_N',4.31E-05,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2015,'OIL_HFO','BIO_REF1_HVO_N',5.10E-03,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2015,'H2','BIO_REF1_HVO_N',4.33E-03,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2020,'BIO_GRS','BIO_REF2_DST_N',9.998E-01,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2020,'UPS_NGA','BIO_REF2_DST_N',1.860E-04,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2020,'BIO_GRS','BIO_REF2_KER_N',9.998E-01,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2020,'UPS_NGA','BIO_REF2_KER_N',1.860E-04,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'BIO_GRS','BIO_REF2_DST_CCS_N',9.998E-01,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'UPS_NGA','BIO_REF2_DST_CCS_N',1.860E-04,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'BIO_GRS','BIO_REF2_KER_CCS_N',9.998E-01,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'UPS_NGA','BIO_REF2_KER_CCS_N',1.860E-04,'10.5281/zenodo.3544900');
-- Nuclear fuel cycle
-- Fuel production
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'URA_DEP','UPS_FT_FR_MOX',0.425,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'UPS_PU_FR','UPS_FT_FR_MOX',0.575,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2040,'URA_DEP','UPS_FT_ABWR_TRU',0.501,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2040,'UPS_UOX_UREX_TRU','UPS_FT_ABWR_TRU',0.499,'10.1016/j.fusengdes.2024.114679');
-- Hydrogen
INSERT INTO "TechInputSplit" VALUES ('EU',2015,'H2_NGA','H2_SR_NGA',0.97,'10.1016/j.apenergy.2023.121951');
INSERT INTO "TechInputSplit" VALUES ('EU',2015,'H2_ELC','H2_SR_NGA',0.03,'10.1016/j.apenergy.2023.121951');
INSERT INTO "TechInputSplit" VALUES ('EU',2015,'H2_COA','H2_GS_COA',0.85,'10.1016/j.apenergy.2023.121951');
INSERT INTO "TechInputSplit" VALUES ('EU',2015,'H2_ELC','H2_GS_COA',0.15,'10.1016/j.apenergy.2023.121951');
INSERT INTO "TechInputSplit" VALUES ('EU',2015,'H2_OIL','H2_PO_OIL',0.95,'10.1016/j.apenergy.2023.121951');
INSERT INTO "TechInputSplit" VALUES ('EU',2015,'H2_ELC','H2_PO_OIL',0.05,'10.1016/j.apenergy.2023.121951');
INSERT INTO "TechInputSplit" VALUES ('EU',2015,'H2_BIO','H2_SR_BIO',0.97,'10.1016/j.apenergy.2023.121951');
INSERT INTO "TechInputSplit" VALUES ('EU',2015,'H2_ELC','H2_SR_BIO',0.03,'10.1016/j.apenergy.2023.121951');
INSERT INTO "TechInputSplit" VALUES ('EU',2015,'H2_BIO','H2_GS_BIO',0.94,'10.1016/j.apenergy.2023.121951');
INSERT INTO "TechInputSplit" VALUES ('EU',2015,'H2_ELC','H2_GS_BIO',0.06,'10.1016/j.apenergy.2023.121951');
INSERT INTO "TechInputSplit" VALUES ('EU',2015,'H2_ETH','H2_SR_ETH',0.94,'10.1016/j.apenergy.2023.121951');
INSERT INTO "TechInputSplit" VALUES ('EU',2015,'H2_ELC','H2_SR_ETH',0.06,'10.1016/j.apenergy.2023.121951');
-- CCUS
INSERT INTO "TechInputSplit" VALUES ('EU',2020,'H2_NGA','CCUS_H2_SR_NGA',0.97,'10.1016/j.apenergy.2023.121951');
INSERT INTO "TechInputSplit" VALUES ('EU',2020,'H2_ELC','CCUS_H2_SR_NGA',0.03,'10.1016/j.apenergy.2023.121951');
INSERT INTO "TechInputSplit" VALUES ('EU',2020,'H2_COA','CCUS_H2_GS_COA',0.99,'10.1016/j.apenergy.2023.121951');
INSERT INTO "TechInputSplit" VALUES ('EU',2020,'H2_ELC','CCUS_H2_GS_COA',0.01,'10.1016/j.apenergy.2023.121951');
INSERT INTO "TechInputSplit" VALUES ('EU',2020,'H2_BIO','CCUS_H2_GS_BIO',0.93,'10.1016/j.apenergy.2023.121951');
INSERT INTO "TechInputSplit" VALUES ('EU',2020,'H2_ELC','CCUS_H2_GS_BIO',0.07,'10.1016/j.apenergy.2023.121951');
INSERT INTO "TechInputSplit" VALUES ('EU',2020,'ELC_DST','CCUS_DAC',0.1786,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2020,'HET','CCUS_DAC',0.8214,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2020,'H2','SF_NGA_METH',0.0223,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2020,'SNK_CO2','SF_NGA_METH',0.9777,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'H2','SF_NGA_METH',0.0218,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'SNK_CO2','SF_NGA_METH',0.9782,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2050,'H2','SF_NGA_METH',0.0213,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2050,'SNK_CO2','SF_NGA_METH',0.9787,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2025,'H2','SF_DST_HYDR',0.0170,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2025,'SNK_CO2','SF_DST_HYDR',0.9830,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2025,'H2','SF_DST_COELC',0.0305,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2025,'ELC_CEN','SF_DST_COELC',0.9695,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'H2','SF_DST_COELC',0.0241,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'ELC_CEN','SF_DST_COELC',0.9759,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2025,'H2','SF_KER_HYDR',0.0176,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2025,'SNK_CO2','SF_KER_HYDR',0.9824,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2025,'H2','SF_KER_COELC',0.0316,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2025,'ELC_CEN','SF_KER_COELC',0.9684,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'H2','SF_KER_COELC',0.0250,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'ELC_CEN','SF_KER_COELC',0.9750,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2025,'H2','SF_MEOH_HYDR',0.0173,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2025,'SNK_CO2','SF_MEOH_HYDR',0.9827,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2025,'ELC_CEN','SF_MEOH_COELC',0.0305,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2025,'SNK_CO2','SF_MEOH_COELC',0.9695,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'ELC_CEN','SF_MEOH_COELC',0.0246,'10.5281/zenodo.3544900');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'SNK_CO2','SF_MEOH_COELC',0.9754,'10.5281/zenodo.3544900');
---- Sinks
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'SNK_EOR_ONS_DMY','SEQ_REM_EOR_ONS_N',0.5,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'SNK_CO2','SEQ_REM_EOR_ONS_N',0.5,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'SNK_EOR_OFF_DMY','SEQ_REM_EOR_OFF_N',0.5,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'SNK_CO2','SEQ_REM_EOR_OFF_N',0.5,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'SNK_DOF_ONS_DMY','SEQ_REM_DOF_ONS_N',0.5,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'SNK_CO2','SEQ_REM_DOF_ONS_N',0.5,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'SNK_DOF_OFF_DMY','SEQ_REM_DOF_OFF_N',0.5,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'SNK_CO2','SEQ_REM_DOF_OFF_N',0.5,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'SNK_DGF_OFF_DMY','SEQ_REM_DGF_OFF_N',0.5,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'SNK_CO2','SEQ_REM_DGF_OFF_N',0.5,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'SNK_ECB_DMY','SEQ_REM_ECB_N',0.5,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'SNK_CO2','SEQ_REM_ECB_N',0.5,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'SNK_ECB_DEEP_DMY','SEQ_REM_ECB_DEEP_N',0.5,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'SNK_CO2','SEQ_REM_ECB_DEEP_N',0.5,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'SNK_DSA_ONS_DMY','SEQ_REM_DSA_ONS_N',0.5,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'SNK_CO2','SEQ_REM_DSA_ONS_N',0.5,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'SNK_DSA_OFF_DMY','SEQ_REM_DSA_OFF_N',0.5,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'SNK_CO2','SEQ_REM_DSA_OFF_N',0.5,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'SNK_DOC_DMY','SEQ_REM_DOC_N',0.5,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'SNK_CO2','SEQ_REM_DOC_N',0.5,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'SNK_CO2','SEQ_REM_MIN_N',0.8,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2030,'ELC_CEN','SEQ_REM_MIN_N',0.2,'10.1016/j.fusengdes.2024.114679');

INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_NUC_HET_LWR_UOX','ELC_NUC_FIS_E',0.500,'10.1016/j.fusengdes.2024.114679');

---- New technologies
INSERT INTO "TechInputSplit" VALUES ('EU',2010,'UPS_NUC_HET_LWR_UOX','ELC_NUC_FIS_LWR_N',0.500,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechInputSplit" VALUES ('EU',2020,'UPS_NUC_HET_LWR_UOX','ELC_NUC_FIS_EPR_N',0.500,'10.1016/j.fusengdes.2024.114679');

CREATE TABLE "TechOutputSplit" (
	"regions"	TEXT,
	"periods"	integer,
	"tech"	TEXT,
	"output_comm"	text,
	"to_split"	real,
	"to_split_notes"	text,
	PRIMARY KEY("regions","periods","tech","output_comm"),
	FOREIGN KEY("output_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
-- Micro-CHP
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_CHP_NGA_CI_N','ELC_DST',4.375E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_CHP_NGA_CI_N','HET',5.625E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'COM_CHP_NGA_CI_N','ELC_DST',4.545E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'COM_CHP_NGA_CI_N','HET',5.455E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'COM_CHP_NGA_CI_N','ELC_DST',4.767E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'COM_CHP_NGA_CI_N','HET',5.233E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_NGA_CI_N','ELC_DST',5.102E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_NGA_CI_N','HET',4.898E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_CHP_NGA_MICRO_N','ELC_DST',3.500E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_CHP_NGA_MICRO_N','HET',6.500E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'COM_CHP_NGA_MICRO_N','ELC_DST',3.780E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'COM_CHP_NGA_MICRO_N','HET',6.220E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'COM_CHP_NGA_MICRO_N','ELC_DST',4.186E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'COM_CHP_NGA_MICRO_N','HET',5.814E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_NGA_MICRO_N','ELC_DST',4.783E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_NGA_MICRO_N','HET',5.217E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_CHP_NGA_CC_N','ELC_DST',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_CHP_NGA_CC_N','HET',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'COM_CHP_NGA_CC_N','ELC_DST',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'COM_CHP_NGA_CC_N','HET',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'COM_CHP_NGA_CC_N','ELC_DST',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'COM_CHP_NGA_CC_N','HET',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_NGA_CC_N','ELC_DST',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_NGA_CC_N','HET',5.000E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_CHP_SLB_CI_N','ELC_DST',4.375E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'COM_CHP_SLB_CI_N','HET',5.625E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'COM_CHP_SLB_CI_N','ELC_DST',4.545E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'COM_CHP_SLB_CI_N','HET',5.455E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'COM_CHP_SLB_CI_N','ELC_DST',4.767E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'COM_CHP_SLB_CI_N','HET',5.233E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_SLB_CI_N','ELC_DST',4.926E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_SLB_CI_N','HET',5.074E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'COM_CHP_SLB_CI_N','ELC_DST',4.762E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'COM_CHP_SLB_CI_N','HET',5.238E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'COM_CHP_NGA_SOFC_N','ELC_DST',0.65,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'COM_CHP_NGA_SOFC_N','HET',0.35,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'COM_CHP_NGA_SOFC_N','ELC_DST',0.69,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'COM_CHP_NGA_SOFC_N','HET',0.31,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_NGA_SOFC_N','ELC_DST',0.75,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_NGA_SOFC_N','HET',0.25,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'COM_CHP_H2_PEMFC_N','ELC_DST',0.54,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'COM_CHP_H2_PEMFC_N','HET',0.46,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_H2_PEMFC_N','ELC_DST',0.59,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'COM_CHP_H2_PEMFC_N','HET',0.41,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CHP_NGA_CI_N','ELC_DST',0.438,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'IND_CHP_NGA_CI_N','ELC_DST',0.455,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'IND_CHP_NGA_CI_N','ELC_DST',0.477,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CHP_NGA_CI_N','ELC_DST',0.511,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'IND_CHP_NGA_CI_N','ELC_DST',0.518,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CHP_NGA_TG_N','ELC_DST',0.392,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'IND_CHP_NGA_TG_N','ELC_DST',0.400,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'IND_CHP_NGA_TG_N','ELC_DST',0.414,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CHP_NGA_TG_N','ELC_DST',0.438,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CHP_NGA_TV_N','ELC_DST',0.200,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'IND_CHP_NGA_TV_N','ELC_DST',0.211,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'IND_CHP_NGA_TV_N','ELC_DST',0.225,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CHP_NGA_TV_N','ELC_DST',0.241,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'IND_CHP_BLQ_CI_N','ELC_DST',0.431,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'IND_CHP_BLQ_CI_N','ELC_DST',0.453,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CHP_BLQ_CI_N','ELC_DST',0.466,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'IND_CHP_BLQ_CI_N','ELC_DST',0.483,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CHP_NGA_CI_N','HET',0.562,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'IND_CHP_NGA_CI_N','HET',0.545,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'IND_CHP_NGA_CI_N','HET',0.523,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CHP_NGA_CI_N','HET',0.489,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'IND_CHP_NGA_CI_N','HET',0.482,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CHP_NGA_TG_N','HET',0.608,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'IND_CHP_NGA_TG_N','HET',0.600,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'IND_CHP_NGA_TG_N','HET',0.586,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CHP_NGA_TG_N','HET',0.562,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'IND_CHP_NGA_TV_N','HET',0.800,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'IND_CHP_NGA_TV_N','HET',0.789,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'IND_CHP_NGA_TV_N','HET',0.775,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CHP_NGA_TV_N','HET',0.759,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'IND_CHP_BLQ_CI_N','HET',0.569,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'IND_CHP_BLQ_CI_N','HET',0.547,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'IND_CHP_BLQ_CI_N','HET',0.534,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2050,'IND_CHP_BLQ_CI_N','HET',0.517,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_CHP_NGA_CI_N','ELC_DST',4.375E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'RES_CHP_NGA_CI_N','ELC_DST',4.545E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'RES_CHP_NGA_CI_N','ELC_DST',4.767E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'RES_CHP_NGA_CI_N','ELC_DST',5.102E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_CHP_NGA_CI_N','HET',5.625E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'RES_CHP_NGA_CI_N','HET',5.455E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'RES_CHP_NGA_CI_N','HET',5.233E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'RES_CHP_NGA_CI_N','HET',4.898E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_CHP_NGA_MICRO_N','ELC_DST',3.500E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'RES_CHP_NGA_MICRO_N','ELC_DST',3.780E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'RES_CHP_NGA_MICRO_N','ELC_DST',4.186E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'RES_CHP_NGA_MICRO_N','ELC_DST',4.783E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_CHP_NGA_MICRO_N','HET',6.500E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2014,'RES_CHP_NGA_MICRO_N','HET',6.220E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'RES_CHP_NGA_MICRO_N','HET',5.814E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'RES_CHP_NGA_MICRO_N','HET',5.217E-01,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_CHP_NGA_CC_N','ELC_DST',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2007,'RES_CHP_NGA_CC_N','HET',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'RES_CHP_NGA_STR_N','ELC_DST',0.80,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2022,'RES_CHP_NGA_STR_N','HET',0.20,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'RES_CHP_NGA_STR_N','ELC_DST',0.75,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'RES_CHP_NGA_STR_N','HET',0.25,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'RES_CHP_NGA_SOFC_N','ELC_DST',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'RES_CHP_NGA_SOFC_N','HET',0.50,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'RES_CHP_NGA_SOFC_N','ELC_DST',0.61,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'RES_CHP_NGA_SOFC_N','HET',0.39,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'RES_CHP_H2_PEMFC_N','ELC_DST',0.54,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2020,'RES_CHP_H2_PEMFC_N','HET',0.46,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'RES_CHP_H2_PEMFC_N','ELC_DST',0.53,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2025,'RES_CHP_H2_PEMFC_N','HET',0.47,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'RES_CHP_H2_PEMFC_N','ELC_DST',0.58,'');
INSERT INTO "TechOutputSplit" VALUES ('IT',2030,'RES_CHP_H2_PEMFC_N','HET',0.42,'');
---- Generation 2 biofuels
INSERT INTO "TechOutputSplit" VALUES ('EU',2020,'BIO_REF2_ETH_N','BIO_ETH',0.998,'10.5281/zenodo.3544900');
INSERT INTO "TechOutputSplit" VALUES ('EU',2020,'BIO_REF2_ETH_N','UPS_ELC',0.002,'10.5281/zenodo.3544900');
INSERT INTO "TechOutputSplit" VALUES ('EU',2020,'BIO_REF2_DST_N','BIO_DST',0.987,'10.5281/zenodo.3544900');
INSERT INTO "TechOutputSplit" VALUES ('EU',2020,'BIO_REF2_DST_N','UPS_ELC',0.002,'10.5281/zenodo.3544900');
INSERT INTO "TechOutputSplit" VALUES ('EU',2020,'BIO_REF2_DST_N','BIO_NAP',0.011,'10.5281/zenodo.3544900');
INSERT INTO "TechOutputSplit" VALUES ('EU',2020,'BIO_REF2_KER_N','BIO_KER',0.987,'10.5281/zenodo.3544900');
INSERT INTO "TechOutputSplit" VALUES ('EU',2020,'BIO_REF2_KER_N','UPS_ELC',0.002,'10.5281/zenodo.3544900');
INSERT INTO "TechOutputSplit" VALUES ('EU',2020,'BIO_REF2_KER_N','BIO_NAP',0.011,'10.5281/zenodo.3544900');
INSERT INTO "TechOutputSplit" VALUES ('EU',2030,'BIO_REF2_ETH_CCS_N','BIO_ETH',0.998,'10.5281/zenodo.3544900');
INSERT INTO "TechOutputSplit" VALUES ('EU',2030,'BIO_REF2_ETH_CCS_N','UPS_ELC',0.002,'10.5281/zenodo.3544900');
INSERT INTO "TechOutputSplit" VALUES ('EU',2030,'BIO_REF2_DST_CCS_N','BIO_DST',0.987,'10.5281/zenodo.3544900');
INSERT INTO "TechOutputSplit" VALUES ('EU',2030,'BIO_REF2_DST_CCS_N','UPS_ELC',0.002,'10.5281/zenodo.3544900');
INSERT INTO "TechOutputSplit" VALUES ('EU',2030,'BIO_REF2_DST_CCS_N','BIO_NAP',0.011,'10.5281/zenodo.3544900');
INSERT INTO "TechOutputSplit" VALUES ('EU',2030,'BIO_REF2_KER_CCS_N','BIO_KER',0.987,'10.5281/zenodo.3544900');
INSERT INTO "TechOutputSplit" VALUES ('EU',2030,'BIO_REF2_KER_CCS_N','UPS_ELC',0.002,'10.5281/zenodo.3544900');
INSERT INTO "TechOutputSplit" VALUES ('EU',2030,'BIO_REF2_KER_CCS_N','BIO_NAP',0.011,'10.5281/zenodo.3544900');
-- Upstream sector
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_FT_LWR_URA','URA_ENR',0.123,'10.1016/j.fusengdes.2024.114679');
--INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_FT_LWR_URA','URA_DEP',0.877,'10.1016/j.fusengdes.2024.114679');
-- Primary energy production
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_PRI_FIP_NGA_1_E','GAS_NGA',0.9326,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_PRI_FIP_NGA_1_E','GAS_LNG',0.0674,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_PRI_FIP_NGA_2_E','GAS_NGA',0.9326,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_PRI_FIP_NGA_2_E','GAS_LNG',0.0674,'10.1016/j.fusengdes.2024.114679');
---- Secondary transformation
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_SEC_COA_OVC','COA_OVC',0.813,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_SEC_COA_OVC','GAS_COG',0.187,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_SEC_GAS_BFG','GAS_BFG',0.959,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_SEC_GAS_BFG','GAS_OXY',0.040,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_SEC_LIQ','OIL_NCR',0.973,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_SEC_LIQ','OIL_ADD',0.027,'10.1016/j.fusengdes.2024.114679');
---- Nuclear fuel cycle
---- Reactor core technologies
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_NUC_LWR_UOX_E','UPS_NUC_HET_LWR_UOX',0.812,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_NUC_LWR_UOX_E','UPS_NUC_SPENT_LWR_UOX',0.188,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_NUC_LWR_MOX_E','UPS_NUC_HET_LWR_MOX',0.812,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_NUC_LWR_MOX_E','UPS_NUC_SPENT_LWR_MOX',0.188,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2030,'UPS_NUC_FR_MOX_N','UPS_NUC_HET_FR_MOX',0.987,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2030,'UPS_NUC_FR_MOX_N','UPS_NUC_SPENT_FR_MOX',0.013,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2040,'UPS_NUC_ABWR_TRU_N','UPS_NUC_HET_ABWR_TRU',0.988,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2040,'UPS_NUC_ABWR_TRU_N','UPS_REP_HLW_ABWR_TRU',0.012,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2040,'UPS_NUC_ABWR_UTR_N','UPS_NUC_HET_ABWR_UTR',0.988,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2040,'UPS_NUC_ABWR_UTR_N','UPS_REP_HLW_ABWR_UTR',0.012,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2040,'UPS_NUC_ADS_TRU_N','UPS_NUC_HET_ADS_TRU',0.989,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2040,'UPS_NUC_ADS_TRU_N','UPS_REP_HLW_ADS_TRU',0.011,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2040,'UPS_NUC_ADS_MA_N','UPS_NUC_HET_ADS_MA',0.988,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2040,'UPS_NUC_ADS_MA_N','UPS_REP_HLW_ADS_MA',0.012,'10.1016/j.fusengdes.2024.114679');
---- Reprocessing technologies
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_REP_PUREX_LWR_UOX_E','UPS_UOX_PUREX_URA',0.9812,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_REP_PUREX_LWR_UOX_E','UPS_UOX_PUREX_PU',0.0126,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_REP_PUREX_LWR_UOX_E','UPS_UOX_PUREX_HLW',0.0062,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_REP_UREX_LWR_UOX_E','UPS_UOX_UREX_URA',0.9812,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_REP_UREX_LWR_UOX_E','UPS_UOX_UREX_TRU',0.0142,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_REP_UREX_LWR_UOX_E','UPS_UOX_UREX_HLW',0.0046,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_REP_PUREX_LWR_MOX_E','UPS_MOX_PUREX_URA',0.9307,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_REP_PUREX_LWR_MOX_E','UPS_MOX_PUREX_PU',0.0578,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_REP_PUREX_LWR_MOX_E','UPS_MOX_PUREX_HLW',0.0115,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_REP_ADV_PUREX_LWR_UOX_E','UPS_UOX_ADV_PUREX_LWR_URA',0.9341,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_REP_ADV_PUREX_LWR_UOX_E','UPS_UOX_ADV_PUREX_LWR_PU',0.0120,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_REP_ADV_PUREX_LWR_UOX_E','UPS_UOX_ADV_PUREX_LWR_MA',0.0015,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_REP_ADV_PUREX_LWR_UOX_E','UPS_UOX_ADV_PUREX_LWR_HLW',0.0524,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_REP_ADV_PUREX_LWR_MOX_E','UPS_MOX_ADV_PUREX_LWR_URA',0.8859,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_REP_ADV_PUREX_LWR_MOX_E','UPS_MOX_ADV_PUREX_LWR_PU',0.0551,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_REP_ADV_PUREX_LWR_MOX_E','UPS_MOX_ADV_PUREX_LWR_MA',0.0074,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_REP_ADV_PUREX_LWR_MOX_E','UPS_MOX_ADV_PUREX_LWR_HLW',0.0516,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2030,'UPS_REP_ADV_PUREX_FR_MOX_E','UPS_MOX_ADV_PUREX_FR_MA',0.1285,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2030,'UPS_REP_ADV_PUREX_FR_MOX_E','UPS_MOX_ADV_PUREX_FR_HLW',0.8715,'10.1016/j.fusengdes.2024.114679');
---- Waste deposit
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_WDP_SPENT_LWR_UOX_E','UPS_URA_SPENT',0.935,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_WDP_SPENT_LWR_UOX_E','UPS_PU_SPENT',0.012,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_WDP_SPENT_LWR_UOX_E','UPS_MA_SPENT',0.001,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_WDP_SPENT_LWR_UOX_E','UPS_FP_SPENT',0.051,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_WDP_SPENT_LWR_MOX_E','UPS_URA_SPENT',0.886,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_WDP_SPENT_LWR_MOX_E','UPS_PU_SPENT',0.055,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_WDP_SPENT_LWR_MOX_E','UPS_MA_SPENT',0.007,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_WDP_SPENT_LWR_MOX_E','UPS_FP_SPENT',0.050,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2030,'UPS_WDP_SPENT_FR_MOX_E','UPS_URA_HLW',0.002,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2030,'UPS_WDP_SPENT_FR_MOX_E','UPS_PU_HLW',0.001,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2030,'UPS_WDP_SPENT_FR_MOX_E','UPS_MA_HLW',0.128,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2030,'UPS_WDP_SPENT_FR_MOX_E','UPS_FP_HLW',0.867,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_WDP_HLW_PUREX_LWR_UOX_E','UPS_URA_HLW',0.159,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_WDP_HLW_PUREX_LWR_UOX_E','UPS_PU_HLW',0.002,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_WDP_HLW_PUREX_LWR_UOX_E','UPS_MA_HLW',0.253,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_WDP_HLW_PUREX_LWR_UOX_E','UPS_FP_HLW',0.585,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_WDP_HLW_UREX_LWR_UOX_E','UPS_URA_HLW',0.017,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_WDP_HLW_UREX_LWR_UOX_E','UPS_PU_HLW',0.000,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_WDP_HLW_UREX_LWR_UOX_E','UPS_FP_HLW',0.981,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_WDP_HLW_UREX_LWR_MOX_E','UPS_URA_HLW',0.081,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_WDP_HLW_UREX_LWR_MOX_E','UPS_PU_HLW',0.005,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_WDP_HLW_UREX_LWR_MOX_E','UPS_MA_HLW',0.674,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_WDP_HLW_UREX_LWR_MOX_E','UPS_FP_HLW',0.239,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_WDP_HLW_ADV_PUREX_LWR_UOX_E','UPS_URA_HLW',0.017,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_WDP_HLW_ADV_PUREX_LWR_UOX_E','UPS_PU_HLW',0.000,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_WDP_HLW_ADV_PUREX_LWR_UOX_E','UPS_FP_HLW',0.981,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_WDP_HLW_ADV_PUREX_LWR_MOX_E','UPS_URA_HLW',0.017,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_WDP_HLW_ADV_PUREX_LWR_MOX_E','UPS_PU_HLW',0.001,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_WDP_HLW_ADV_PUREX_LWR_MOX_E','UPS_MA_HLW',0.000,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'UPS_WDP_HLW_ADV_PUREX_LWR_MOX_E','UPS_FP_HLW',0.981,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2030,'UPS_WDP_HLW_ADV_PUREX_FR_MOX_E','UPS_URA_HLW',0.002,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2030,'UPS_WDP_HLW_ADV_PUREX_FR_MOX_E','UPS_PU_HLW',0.001,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2030,'UPS_WDP_HLW_ADV_PUREX_FR_MOX_E','UPS_MA_HLW',0.000,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2030,'UPS_WDP_HLW_ADV_PUREX_FR_MOX_E','UPS_FP_HLW',0.995,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2040,'UPS_WDP_HLW_PYRO_ABWR_TRU_E','UPS_URA_HLW',0.004,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2040,'UPS_WDP_HLW_PYRO_ABWR_TRU_E','UPS_PU_HLW',0.001,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2040,'UPS_WDP_HLW_PYRO_ABWR_TRU_E','UPS_MA_HLW',0.000,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2040,'UPS_WDP_HLW_PYRO_ABWR_TRU_E','UPS_FP_HLW',0.994,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2040,'UPS_WDP_HLW_PYRO_ABWR_UTR_E','UPS_URA_HLW',0.017,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2040,'UPS_WDP_HLW_PYRO_ABWR_UTR_E','UPS_PU_HLW',0.001,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2040,'UPS_WDP_HLW_PYRO_ABWR_UTR_E','UPS_FP_HLW',0.981,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2040,'UPS_WDP_HLW_PYRO_ADS_TRU_E','UPS_URA_HLW',0.000,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2040,'UPS_WDP_HLW_PYRO_ADS_TRU_E','UPS_PU_HLW',0.002,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2040,'UPS_WDP_HLW_PYRO_ADS_TRU_E','UPS_MA_HLW',0.000,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2040,'UPS_WDP_HLW_PYRO_ADS_TRU_E','UPS_FP_HLW',0.997,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2040,'UPS_WDP_HLW_PYRO_ADS_MA_E','UPS_URA_HLW',0.000,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2040,'UPS_WDP_HLW_PYRO_ADS_MA_E','UPS_PU_HLW',0.002,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2040,'UPS_WDP_HLW_PYRO_ADS_MA_E','UPS_MA_HLW',0.002,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2040,'UPS_WDP_HLW_PYRO_ADS_MA_E','UPS_FP_HLW',0.994,'10.1016/j.fusengdes.2024.114679');

-- Electricity sector
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'ELC_CHP_OIL_E','ELC_CEN',0.482,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'ELC_CHP_NGA_E','ELC_CEN',0.478,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'ELC_CHP_COA_E','ELC_CEN',0.553,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'ELC_CHP_BIO_E','ELC_CEN',0.389,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'ELC_CHP_GEO_E','ELC_CEN',0.316,'10.1016/j.fusengdes.2024.114679');

INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'ELC_CHP_OIL_E','HET',1-0.482,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'ELC_CHP_NGA_E','HET',1-0.478,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'ELC_CHP_COA_E','HET',1-0.553,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'ELC_CHP_BIO_E','HET',1-0.389,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'ELC_CHP_GEO_E','HET',1-0.316,'10.1016/j.fusengdes.2024.114679');

INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'ELC_CHP_NGA_N','ELC_CEN',0.588,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'ELC_CHP_NGA_N','HET',0.412,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'ELC_CHP_COA_N','ELC_CEN',0.455,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'ELC_CHP_COA_N','HET',0.545,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2050,'ELC_CHP_COA_N','ELC_CEN',0.526,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2050,'ELC_CHP_COA_N','HET',0.474,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'ELC_CHP_BIO_N','ELC_CEN',0.271,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2010,'ELC_CHP_BIO_N','HET',0.729,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2050,'ELC_CHP_BIO_N','ELC_CEN',0.278,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "TechOutputSplit" VALUES ('EU',2050,'ELC_CHP_BIO_N','HET',0.722,'10.1016/j.fusengdes.2024.114679');

CREATE TABLE "LinkedTechs" (
	"primary_region"	text,
	"primary_tech"	text,
	"emis_comm" text,
 	"linked_tech"	text,
	"tech_linked_notes"	text,
	FOREIGN KEY("primary_tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("linked_tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("emis_comm") REFERENCES "commodities"("comm_name"),
	PRIMARY KEY("primary_region","primary_tech", "emis_comm")
);
INSERT INTO "LinkedTechs" VALUES ('EU','CCUS_H2_SR_NGA','SNK_CO2_EM','CCUS_H2_SR_NGA_LINKED','');
INSERT INTO "LinkedTechs" VALUES ('EU','CCUS_H2_GS_COA','SNK_CO2_EM','CCUS_H2_GS_COA_LINKED','');
INSERT INTO "LinkedTechs" VALUES ('EU','CCUS_H2_GS_BIO','SNK_CO2_EM','CCUS_H2_GS_BIO_LINKED','');
INSERT INTO "LinkedTechs" VALUES ('EU','CCUS_ELC_COA','SNK_CO2_EM','CCUS_ELC_COA_LINKED','');
INSERT INTO "LinkedTechs" VALUES ('EU','CCUS_ELC_NGA','SNK_CO2_EM','CCUS_ELC_NGA_LINKED','');
INSERT INTO "LinkedTechs" VALUES ('EU','ELC_COA_CCO_IG_CCS_N','SNK_CO2_EM','ELC_COA_CCO_IG_CCS_N_LINKED','');
INSERT INTO "LinkedTechs" VALUES ('EU','ELC_COA_CCO_FG_CCS_N','SNK_CO2_EM','ELC_COA_CCO_FG_CCS_N_LINKED','');
INSERT INTO "LinkedTechs" VALUES ('EU','ELC_COA_PUL_FG_CCS_N','SNK_CO2_EM','ELC_COA_PUL_FG_CCS_N_LINKED','');
INSERT INTO "LinkedTechs" VALUES ('EU','ELC_NGA_FG_CCS_N','SNK_CO2_EM','ELC_NGA_FG_CCS_N_LINKED','');
INSERT INTO "LinkedTechs" VALUES ('EU','ELC_NGA_SOFC_CCS_N','SNK_CO2_EM','ELC_NGA_SOFC_CCS_N_LINKED','');
INSERT INTO "LinkedTechs" VALUES ('EU','ELC_BIO_CRP_GSF_CCS_N','SNK_CO2_EM','ELC_BIO_CRP_GSF_CCS_N_LINKED','');
INSERT INTO "LinkedTechs" VALUES ('EU','ELC_BIO_CRP_COM_CCS_N','SNK_CO2_EM','ELC_BIO_CRP_COM_CCS_N_LINKED','');
INSERT INTO "LinkedTechs" VALUES ('EU','ELC_BIO_GSF_CCS_N','SNK_CO2_EM','ELC_BIO_GSF_CCS_N_LINKED','');
INSERT INTO "LinkedTechs" VALUES ('EU','ELC_BIO_COM_CCS_N','SNK_CO2_EM','ELC_BIO_COM_CCS_N_LINKED','');

CREATE TABLE "StorageDuration" (
	"regions"	text,
	"tech"	text,
	"duration"	real,
	"duration_notes"	text,
	PRIMARY KEY("regions","tech")
);
-- Storage
INSERT INTO "StorageDuration" VALUES ('EU','ELC_HYD_PUM_E',10,'');
INSERT INTO "StorageDuration" VALUES ('EU','ELC_HYD_PUM_N',10,'');
INSERT INTO "StorageDuration" VALUES ('EU','ELC_STG_CEN_BTT_N',6,'10.25984/1871952');
INSERT INTO "StorageDuration" VALUES ('EU','ELC_STG_DST_BTT_N',6,'10.25984/1871952');

CREATE TABLE "PlanningReserveMargin" (
	"regions"	text,
	"reserve_margin"	REAL,
	PRIMARY KEY("regions"),
	FOREIGN KEY("regions") REFERENCES "regions"
);
--INSERT INTO "PlanningReserveMargin" VALUES ('EU',0.15);

CREATE TABLE "tech_groups" (
	"tech"	text,
	"notes"	text,
	PRIMARY KEY("tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
-- Micro-CHP
INSERT INTO "tech_groups" VALUES ('COM_CHP_NGA_CI_N','');
INSERT INTO "tech_groups" VALUES ('COM_CHP_NGA_MICRO_N','');
INSERT INTO "tech_groups" VALUES ('COM_CHP_NGA_CC_N','');
INSERT INTO "tech_groups" VALUES ('COM_CHP_SLB_CI_N','');
INSERT INTO "tech_groups" VALUES ('COM_CHP_NGA_SOFC_N','');
INSERT INTO "tech_groups" VALUES ('COM_CHP_H2_PEMFC_N','');
INSERT INTO "tech_groups" VALUES ('IND_CHP_BLQ_CI_N','');
INSERT INTO "tech_groups" VALUES ('RES_CHP_NGA_CI_N','');
INSERT INTO "tech_groups" VALUES ('RES_CHP_NGA_MICRO_N','');
INSERT INTO "tech_groups" VALUES ('RES_CHP_NGA_CC_N','');
INSERT INTO "tech_groups" VALUES ('RES_CHP_NGA_STR_N','');
INSERT INTO "tech_groups" VALUES ('RES_CHP_NGA_SOFC_N','');
INSERT INTO "tech_groups" VALUES ('RES_CHP_H2_PEMFC_N','');
-- Electricity sector
INSERT INTO "tech_groups" VALUES ('ELC_FT_H2','');
INSERT INTO "tech_groups" VALUES ('ELC_COA_E','');
INSERT INTO "tech_groups" VALUES ('ELC_CHP_COA_E','');
INSERT INTO "tech_groups" VALUES ('ELC_COA_PUL_N','');
INSERT INTO "tech_groups" VALUES ('ELC_COA_CCO_N','');
INSERT INTO "tech_groups" VALUES ('ELC_COA_PFB_N','');
--INSERT INTO "tech_groups" VALUES ('ELC_COA_CCO_IG_CCS_N','');
--INSERT INTO "tech_groups" VALUES ('ELC_COA_CCO_FG_CCS_N','');
--INSERT INTO "tech_groups" VALUES ('ELC_COA_PUL_FG_CCS_N','');
INSERT INTO "tech_groups" VALUES ('ELC_CHP_COA_N','');
INSERT INTO "tech_groups" VALUES ('ELC_NGA_E','');
INSERT INTO "tech_groups" VALUES ('ELC_CHP_NGA_E','');
INSERT INTO "tech_groups" VALUES ('ELC_CHP_NGA_N','');
--INSERT INTO "tech_groups" VALUES ('ELC_NGA_FG_CCS_N','');
--INSERT INTO "tech_groups" VALUES ('ELC_NGA_SOFC_CCS_N','');
INSERT INTO "tech_groups" VALUES ('ELC_NGA_CCY_ADV_N','');
INSERT INTO "tech_groups" VALUES ('ELC_NGA_FCE_N','');
INSERT INTO "tech_groups" VALUES ('ELC_OIL_E','');
INSERT INTO "tech_groups" VALUES ('ELC_CHP_OIL_E','');
INSERT INTO "tech_groups" VALUES ('ELC_OIL_MIX_TUR_N','');
INSERT INTO "tech_groups" VALUES ('ELC_OIL_MIX_CCY_N','');
INSERT INTO "tech_groups" VALUES ('ELC_OIL_GBL_N','');
INSERT INTO "tech_groups" VALUES ('ELC_OIL_GPL_N','');
INSERT INTO "tech_groups" VALUES ('ELC_HYD_GEN_E','');
INSERT INTO "tech_groups" VALUES ('ELC_HYD_GEN_DAM_N','');
INSERT INTO "tech_groups" VALUES ('ELC_HYD_GEN_RUN_N','');
INSERT INTO "tech_groups" VALUES ('ELC_FT_OIL','');
INSERT INTO "tech_groups" VALUES ('ELC_FT_COA','');
INSERT INTO "tech_groups" VALUES ('ELC_HYD_PUM_E','');
INSERT INTO "tech_groups" VALUES ('ELC_HYD_PUM_N','');
INSERT INTO "tech_groups" VALUES ('ELC_FT_HYD','');
INSERT INTO "tech_groups" VALUES ('ELC_NUC_FIS_E','');
INSERT INTO "tech_groups" VALUES ('ELC_NUC_FIS_LWR_N','');
INSERT INTO "tech_groups" VALUES ('ELC_NUC_FIS_EPR_N','');
INSERT INTO "tech_groups" VALUES ('ELC_NUC_FIS_FR_N','');
INSERT INTO "tech_groups" VALUES ('ELC_NUC_FIS_ABWR_N','');
INSERT INTO "tech_groups" VALUES ('ELC_NUC_FIS_ADS_TRU_N','');
INSERT INTO "tech_groups" VALUES ('ELC_NUC_FIS_ADS_MA_N','');
INSERT INTO "tech_groups" VALUES ('ELC_CHP_BIO_E','');
INSERT INTO "tech_groups" VALUES ('ELC_BIO_E','');
INSERT INTO "tech_groups" VALUES ('ELC_BIO_GSF_CEN_N','');
INSERT INTO "tech_groups" VALUES ('ELC_BIO_COM_CEN_N','');
INSERT INTO "tech_groups" VALUES ('ELC_BIO_GSF_DEC_N','');
INSERT INTO "tech_groups" VALUES ('ELC_BIO_COM_DEC_N','');
INSERT INTO "tech_groups" VALUES ('ELC_BIO_GAS_N','');
INSERT INTO "tech_groups" VALUES ('ELC_BIO_CRP_GSF_N','');
INSERT INTO "tech_groups" VALUES ('ELC_BIO_CRP_COM_N','');
INSERT INTO "tech_groups" VALUES ('ELC_BIO_MUN_INC_N','');
--INSERT INTO "tech_groups" VALUES ('ELC_BIO_CRP_GSF_CCS_N','');
--INSERT INTO "tech_groups" VALUES ('ELC_BIO_CRP_COM_CCS_N','');
--INSERT INTO "tech_groups" VALUES ('ELC_BIO_GSF_CCS_N','');
--INSERT INTO "tech_groups" VALUES ('ELC_BIO_COM_CCS_N','');
INSERT INTO "tech_groups" VALUES ('ELC_CHP_BIO_N','');
INSERT INTO "tech_groups" VALUES ('ELC_CHP_GEO_E','');
INSERT INTO "tech_groups" VALUES ('ELC_GEO_E','');
INSERT INTO "tech_groups" VALUES ('ELC_GEO_FLS_N','');
INSERT INTO "tech_groups" VALUES ('ELC_GEO_BNY_N','');
INSERT INTO "tech_groups" VALUES ('ELC_GEO_BNY_HIG_N','');
INSERT INTO "tech_groups" VALUES ('ELC_WIN_E','');
INSERT INTO "tech_groups" VALUES ('ELC_WIN_N','');
INSERT INTO "tech_groups" VALUES ('ELC_WIN_OFF_N','');
INSERT INTO "tech_groups" VALUES ('ELC_SOL_E','');
INSERT INTO "tech_groups" VALUES ('ELC_SOL_PV_CEN_N','');
INSERT INTO "tech_groups" VALUES ('ELC_SOL_PV_DST_N','');
INSERT INTO "tech_groups" VALUES ('ELC_SOL_CSP_1_N','');
INSERT INTO "tech_groups" VALUES ('ELC_SOL_CSP_2_N','');
INSERT INTO "tech_groups" VALUES ('ELC_SOL_CSP_3_N','');
INSERT INTO "tech_groups" VALUES ('ELC_SOL_CSP_4_N','');
INSERT INTO "tech_groups" VALUES ('ELC_MAR_E','');
INSERT INTO "tech_groups" VALUES ('ELC_MAR_WAV_N','');
INSERT INTO "tech_groups" VALUES ('ELC_MAR_TDL_N','');
INSERT INTO "tech_groups" VALUES ('ELC_HH2_PEMFC_N','');
INSERT INTO "tech_groups" VALUES ('UPS_SEC_REF_FLX','');
INSERT INTO "tech_groups" VALUES ('H2_FT_COA','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_OIL_USA','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_OIL_CAN','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_OIL_MEX','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_OIL_OLA','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_OIL_BRA','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_OIL_RUS','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_OIL_MEA','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_OIL_AFR','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_OIL_CHI','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_OIL_JPN','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_OIL_ODA','');
INSERT INTO "tech_groups" VALUES ('UPS_LOC_HOIL_1','');
INSERT INTO "tech_groups" VALUES ('UPS_LOC_HOIL_2','');
INSERT INTO "tech_groups" VALUES ('UPS_LOC_HOIL_3','');
INSERT INTO "tech_groups" VALUES ('UPS_LOC_HSAN_1','');
INSERT INTO "tech_groups" VALUES ('UPS_LOC_HSAN_2','');
INSERT INTO "tech_groups" VALUES ('UPS_LOC_HSAN_3','');
INSERT INTO "tech_groups" VALUES ('UPS_GRO_HOIL_1','');
INSERT INTO "tech_groups" VALUES ('UPS_GRO_HOIL_2','');
INSERT INTO "tech_groups" VALUES ('UPS_GRO_HOIL_3','');
INSERT INTO "tech_groups" VALUES ('UPS_REC_HSAN_1','');
INSERT INTO "tech_groups" VALUES ('UPS_REC_HSAN_2','');
INSERT INTO "tech_groups" VALUES ('UPS_REC_HSAN_3','');
INSERT INTO "tech_groups" VALUES ('UPS_DIS_HOIL_1','');
INSERT INTO "tech_groups" VALUES ('UPS_DIS_HOIL_2','');
INSERT INTO "tech_groups" VALUES ('UPS_DIS_HOIL_3','');
INSERT INTO "tech_groups" VALUES ('UPS_SEC_L2G_ON','');
INSERT INTO "tech_groups" VALUES ('UPS_SEC_L2G_OFF','');
INSERT INTO "tech_groups" VALUES ('ELC_COA_CCO_IG_CCS_N','');
INSERT INTO "tech_groups" VALUES ('ELC_COA_CCO_FG_CCS_N','');
INSERT INTO "tech_groups" VALUES ('ELC_COA_PUL_FG_CCS_N','');
INSERT INTO "tech_groups" VALUES ('ELC_NGA_FG_CCS_N','');
INSERT INTO "tech_groups" VALUES ('ELC_NGA_SOFC_CCS_N','');
INSERT INTO "tech_groups" VALUES ('ELC_BIO_CRP_GSF_CCS_N','');
INSERT INTO "tech_groups" VALUES ('ELC_BIO_CRP_COM_CCS_N','');
INSERT INTO "tech_groups" VALUES ('ELC_BIO_GSF_CCS_N','');
INSERT INTO "tech_groups" VALUES ('ELC_BIO_COM_CCS_N','');
INSERT INTO "tech_groups" VALUES ('H2_SR_NGA','');
INSERT INTO "tech_groups" VALUES ('H2_GS_COA','');
INSERT INTO "tech_groups" VALUES ('H2_PO_OIL','');
INSERT INTO "tech_groups" VALUES ('H2_SR_BIO','');
INSERT INTO "tech_groups" VALUES ('H2_GS_BIO','');
INSERT INTO "tech_groups" VALUES ('H2_SR_ETH','');
INSERT INTO "tech_groups" VALUES ('H2_EL_ALK','');
INSERT INTO "tech_groups" VALUES ('H2_EL_PEM','');
INSERT INTO "tech_groups" VALUES ('H2_EL_SOEC','');
INSERT INTO "tech_groups" VALUES ('H2_EL_AEM','');
INSERT INTO "tech_groups" VALUES ('CCUS_H2_SR_NGA','');
INSERT INTO "tech_groups" VALUES ('CCUS_H2_GS_COA','');
INSERT INTO "tech_groups" VALUES ('CCUS_H2_GS_BIO','');
INSERT INTO "tech_groups" VALUES ('UPS_LOC_NGA_1','');
INSERT INTO "tech_groups" VALUES ('UPS_LOC_NGA_2','');
INSERT INTO "tech_groups" VALUES ('UPS_LOC_NGA_3','');
INSERT INTO "tech_groups" VALUES ('UPS_GRO_NGA_1','');
INSERT INTO "tech_groups" VALUES ('UPS_GRO_NGA_2','');
INSERT INTO "tech_groups" VALUES ('UPS_GRO_NGA_3','');
INSERT INTO "tech_groups" VALUES ('UPS_DIS_NGA_1','');
INSERT INTO "tech_groups" VALUES ('UPS_DIS_NGA_2','');
INSERT INTO "tech_groups" VALUES ('UPS_DIS_NGA_3','');
INSERT INTO "tech_groups" VALUES ('UPS_LOC_BCO','');
INSERT INTO "tech_groups" VALUES ('UPS_DIS_BCO','');
INSERT INTO "tech_groups" VALUES ('UPS_LOC_HCO','');
INSERT INTO "tech_groups" VALUES ('UPS_DIS_HCO','');
INSERT INTO "tech_groups" VALUES ('UPS_SEC_COA_OVC','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_COA_AFR','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_COA_CAC','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_COA_AUS','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_COA_CAN','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_COA_OEE','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_COA_RUS','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_COA_ODA','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_COA_USA','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_COA_OLA','');
INSERT INTO "tech_groups" VALUES ('UPS_EXP_COA','');
INSERT INTO "tech_groups" VALUES ('UPS_REP_PUREX_LWR_UOX_E','');
INSERT INTO "tech_groups" VALUES ('UPS_REP_UREX_LWR_UOX_E','');
INSERT INTO "tech_groups" VALUES ('UPS_REP_PUREX_LWR_MOX_E','');
INSERT INTO "tech_groups" VALUES ('UPS_REP_ADV_PUREX_LWR_UOX_E','');
INSERT INTO "tech_groups" VALUES ('UPS_REP_ADV_PUREX_LWR_MOX_E','');
INSERT INTO "tech_groups" VALUES ('UPS_FT_NGA','');
INSERT INTO "tech_groups" VALUES ('H2_FT_NGA','');
INSERT INTO "tech_groups" VALUES ('ELC_FT_NGA','');
--INSERT INTO "tech_groups" VALUES ('ELC_COA_CCO_IG_CCS_N','');
--INSERT INTO "tech_groups" VALUES ('ELC_COA_CCO_FG_CCS_N','');
--INSERT INTO "tech_groups" VALUES ('ELC_COA_PUL_FG_CCS_N','');
--INSERT INTO "tech_groups" VALUES ('ELC_NGA_FG_CCS_N','');
--INSERT INTO "tech_groups" VALUES ('ELC_NGA_SOFC_CCS_N','');
--INSERT INTO "tech_groups" VALUES ('ELC_BIO_CRP_GSF_CCS_N','');
--INSERT INTO "tech_groups" VALUES ('ELC_BIO_CRP_COM_CCS_N','');
--INSERT INTO "tech_groups" VALUES ('ELC_BIO_GSF_CCS_N','');
--INSERT INTO "tech_groups" VALUES ('ELC_BIO_COM_CCS_N','');
INSERT INTO "tech_groups" VALUES ('ELC_STG_CEN_BTT_N','');
INSERT INTO "tech_groups" VALUES ('ELC_STG_DST_BTT_N','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_GAS_PIP_AFR','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_GAS_PIP_RUS','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_GAS_PIP_CAC','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_GAS_PIP_MEA','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_GAS_LNG_AFR','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_GAS_LNG_MEA','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_GAS_LNG_GLB','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_GAS_LNG_OLA','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_GAS_LNG_USA','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_GAS_LNG_RUS','');
INSERT INTO "tech_groups" VALUES ('UPS_BIO_RPS_POT','');
INSERT INTO "tech_groups" VALUES ('UPS_BIO_CRP_STC_POT','');
INSERT INTO "tech_groups" VALUES ('UPS_BIO_CRP_SUG_POT','');
INSERT INTO "tech_groups" VALUES ('UPS_BIO_CRP_GRS_POT','');
INSERT INTO "tech_groups" VALUES ('UPS_BIO_CRP_WOD_1_POT','');
INSERT INTO "tech_groups" VALUES ('UPS_BIO_CRP_WOD_2_POT','');
INSERT INTO "tech_groups" VALUES ('UPS_BIO_AGR_WST_POT','');
INSERT INTO "tech_groups" VALUES ('UPS_BIO_FOR_1_POT','');
INSERT INTO "tech_groups" VALUES ('UPS_BIO_FOR_2_POT','');
INSERT INTO "tech_groups" VALUES ('UPS_BIO_WOD_RES_1_POT','');
INSERT INTO "tech_groups" VALUES ('UPS_BIO_WOD_RES_2_POT','');
INSERT INTO "tech_groups" VALUES ('UPS_BIO_WOD_PRD_1_POT','');
INSERT INTO "tech_groups" VALUES ('UPS_BIO_WOD_PRD_2_POT','');
INSERT INTO "tech_groups" VALUES ('UPS_BIO_MUN_POT','');
INSERT INTO "tech_groups" VALUES ('UPS_BIO_SLU_POT','');
INSERT INTO "tech_groups" VALUES ('UPS_BIO_GAS_POT','');
INSERT INTO "tech_groups" VALUES ('UPS_BIO_LIQ_POT','');
INSERT INTO "tech_groups" VALUES ('BIO_REF1_TRANSESTER_E','');
INSERT INTO "tech_groups" VALUES ('BIO_REF1_ETHAMIDE_E','');
INSERT INTO "tech_groups" VALUES ('BIO_REF1_ETHSUG_E','');
INSERT INTO "tech_groups" VALUES ('BIO_REF1_HVO_N','');
INSERT INTO "tech_groups" VALUES ('BIO_REF2_ETH_N','');
INSERT INTO "tech_groups" VALUES ('BIO_REF2_DST_CCS_N','');
INSERT INTO "tech_groups" VALUES ('BIO_REF2_KER_CCS_N','');
--INSERT INTO "tech_groups" VALUES ('UPS_NUC_LWR_UOX_E','');
--INSERT INTO "tech_groups" VALUES ('UPS_NUC_LWR_MOX_E','');
--INSERT INTO "tech_groups" VALUES ('UPS_NUC_FR_MOX_N','');
--INSERT INTO "tech_groups" VALUES ('UPS_NUC_ABWR_TRU_N','');
--INSERT INTO "tech_groups" VALUES ('UPS_NUC_ABWR_UTR_N','');
--INSERT INTO "tech_groups" VALUES ('UPS_NUC_ADS_TRU_N','');
--INSERT INTO "tech_groups" VALUES ('UPS_NUC_ADS_MA_N','');
INSERT INTO "tech_groups" VALUES ('UPS_MIN_IMP_URA_NAT','');
INSERT INTO "tech_groups" VALUES ('UPS_HYD_POT','');
INSERT INTO "tech_groups" VALUES ('UPS_GEO_POT','');
INSERT INTO "tech_groups" VALUES ('UPS_SOL_PV_POT','');
INSERT INTO "tech_groups" VALUES ('UPS_SOL_CSP_POT','');
INSERT INTO "tech_groups" VALUES ('UPS_SOL_TH_POT','');
INSERT INTO "tech_groups" VALUES ('UPS_TDL_POT','');
INSERT INTO "tech_groups" VALUES ('UPS_WAV_POT','');
INSERT INTO "tech_groups" VALUES ('UPS_WIN_ON_POT','');
INSERT INTO "tech_groups" VALUES ('UPS_WIN_OFF_POT','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_BIO_DST','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_BIO_ETH','');
INSERT INTO "tech_groups" VALUES ('UPS_IMP_BIO_WOD','');
INSERT INTO "tech_groups" VALUES ('UPS_EXP_OIL','');
INSERT INTO "tech_groups" VALUES ('UPS_EXP_GAS','');
INSERT INTO "tech_groups" VALUES ('HET_OIL_E','');
INSERT INTO "tech_groups" VALUES ('HET_NGA_E','');
INSERT INTO "tech_groups" VALUES ('HET_COA_E','');
INSERT INTO "tech_groups" VALUES ('HET_BIO_E','');
INSERT INTO "tech_groups" VALUES ('HET_GEO_E','');
INSERT INTO "tech_groups" VALUES ('HET_SOL_E','');
INSERT INTO "tech_groups" VALUES ('HET_NGA_N','');
INSERT INTO "tech_groups" VALUES ('HET_OIL_N','');
INSERT INTO "tech_groups" VALUES ('HET_BIO_N','');
INSERT INTO "tech_groups" VALUES ('HET_COA_N','');
INSERT INTO "tech_groups" VALUES ('HET_GEO_N','');
INSERT INTO "tech_groups" VALUES ('HET_SOL_N','');
--INSERT INTO "tech_groups" VALUES ('ELC_FT_OIL','');
--INSERT INTO "tech_groups" VALUES ('UPS_FT_OIL_RPG','');
--INSERT INTO "tech_groups" VALUES ('UPS_FT_OIL_RPP','');

CREATE TABLE "groups" (
	"group_name"	text,
	"notes"	text,
	PRIMARY KEY("group_name")
);
INSERT INTO "groups" VALUES ('ELC_FT_H2_GRP','');
INSERT INTO "groups" VALUES ('ELC_HYD_GEN_GRP','');
INSERT INTO "groups" VALUES ('ELC_HYD_PUM_GRP','');
INSERT INTO "groups" VALUES ('ELC_HYD_GRP','');
INSERT INTO "groups" VALUES ('ELC_NUC_FIS_GRP','');
INSERT INTO "groups" VALUES ('ELC_BIO_GRP','');
INSERT INTO "groups" VALUES ('ELC_WST_GRP','');
INSERT INTO "groups" VALUES ('ELC_BIO_WST_GRP','');
INSERT INTO "groups" VALUES ('ELC_GEO_GRP','');
INSERT INTO "groups" VALUES ('ELC_WIN_ON_GRP','');
INSERT INTO "groups" VALUES ('ELC_WIN_OFF_GRP','');
INSERT INTO "groups" VALUES ('ELC_SOL_PV_GRP','');
INSERT INTO "groups" VALUES ('ELC_SOL_CSP_GRP','');
INSERT INTO "groups" VALUES ('ELC_MAR_GRP','');
INSERT INTO "groups" VALUES ('ELC_CCS_GRP','');
INSERT INTO "groups" VALUES ('ELC_FOSSIL_CCS_GRP','');
INSERT INTO "groups" VALUES ('ELC_BIO_CCS_GRP','');
INSERT INTO "groups" VALUES ('ELC_GEN_GRP','');

INSERT INTO "groups" VALUES ('HH2_PRD_ELCSYS_GRP','');
INSERT INTO "groups" VALUES ('HH2_PRD_CCS_GRP','');
INSERT INTO "groups" VALUES ('UPS_SEC_REF_FLX_GRP','');
INSERT INTO "groups" VALUES ('HH2_FT_COA_GRP','');
INSERT INTO "groups" VALUES ('ELC_FT_OIL_GRP','');
INSERT INTO "groups" VALUES ('ELC_FT_COA_GRP','');
INSERT INTO "groups" VALUES ('ELC_FT_HYD_GRP','');

INSERT INTO "groups" VALUES ('ELC_FOSSIL_COA_GRP','');
INSERT INTO "groups" VALUES ('ELC_FOSSIL_NGA_GRP','');
INSERT INTO "groups" VALUES ('ELC_FOSSIL_OIL_GRP','');
INSERT INTO "groups" VALUES ('UPS_FT_NGA_GRP','');
INSERT INTO "groups" VALUES ('H2_FT_NGA_GRP','');
INSERT INTO "groups" VALUES ('ELC_FT_NGA_GRP','');
INSERT INTO "groups" VALUES ('ELC_STG_GRP','');
INSERT INTO "groups" VALUES ('CCS_TECHS_ALL_GRP','');
INSERT INTO "groups" VALUES ('ELC_NUC_FIS_GENIV_GRP','');

INSERT INTO "groups" VALUES ('OIL_TPES_GRP','');
INSERT INTO "groups" VALUES ('COA_TPES_GRP','');
INSERT INTO "groups" VALUES ('NUC_TPES_GRP','');
INSERT INTO "groups" VALUES ('BIO_TPES_GRP','');
INSERT INTO "groups" VALUES ('HYD_TPES_GRP','');
INSERT INTO "groups" VALUES ('ORE_TPES_GRP','');
INSERT INTO "groups" VALUES ('IMP_NGA_GRP','');
INSERT INTO "groups" VALUES ('HET_OIL_GRP','');
INSERT INTO "groups" VALUES ('HET_NGA_GRP','');
INSERT INTO "groups" VALUES ('HET_COA_GRP','');
INSERT INTO "groups" VALUES ('HET_BIO_GRP','');
INSERT INTO "groups" VALUES ('HET_GEO_GRP','');
INSERT INTO "groups" VALUES ('HET_SOL_GRP','');
INSERT INTO "groups" VALUES ('HET_PRD_GRP','');

CREATE TABLE "TechGroupWeight" (
	"tech"	text,
	"group_name"	text,
	"weight"	REAL,
	"tech_desc"	text,
	PRIMARY KEY("tech","group_name")
);
INSERT INTO "TechGroupWeight" VALUES ('UPS_FT_NGA','UPS_FT_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('H2_FT_NGA','H2_FT_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_FT_NGA','ELC_FT_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('H2_FT_COA','HH2_FT_COA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_SEC_REF_FLX','UPS_SEC_REF_FLX_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('ELC_FT_H2','ELC_FT_H2_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_FT_OIL','ELC_FT_OIL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_FT_COA','ELC_FT_COA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_FT_HYD','ELC_FT_HYD_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('H2_EL_ALK','HH2_PRD_ELCSYS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('H2_EL_PEM','HH2_PRD_ELCSYS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('H2_EL_SOEC','HH2_PRD_ELCSYS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('H2_EL_AEM','HH2_PRD_ELCSYS_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('CCUS_H2_SR_NGA','HH2_PRD_CCS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('CCUS_H2_GS_COA','HH2_PRD_CCS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('CCUS_H2_GS_BIO','HH2_PRD_CCS_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('ELC_COA_E','ELC_FOSSIL_COA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_COA_E','ELC_FOSSIL_COA_GRP',0.553,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_COA_PUL_N','ELC_FOSSIL_COA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_COA_CCO_N','ELC_FOSSIL_COA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_COA_PFB_N','ELC_FOSSIL_COA_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('ELC_COA_CCO_IG_CCS_N','ELC_FOSSIL_COA_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('ELC_COA_CCO_FG_CCS_N','ELC_FOSSIL_COA_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('ELC_COA_PUL_FG_CCS_N','ELC_FOSSIL_COA_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_COA_N','ELC_FOSSIL_COA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_COA_N','ELC_FOSSIL_COA_GRP',0.526,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NGA_E','ELC_FOSSIL_NGA_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_NGA_E','ELC_FOSSIL_NGA_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_NGA_N','ELC_FOSSIL_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_NGA_E','ELC_FOSSIL_NGA_GRP',0.478,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_NGA_N','ELC_FOSSIL_NGA_GRP',0.588,'');
--INSERT INTO "TechGroupWeight" VALUES ('ELC_NGA_FG_CCS_N','ELC_FOSSIL_NGA_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('ELC_NGA_SOFC_CCS_N','ELC_FOSSIL_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NGA_CCY_ADV_N','ELC_FOSSIL_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NGA_FCE_N','ELC_FOSSIL_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_OIL_E','ELC_FOSSIL_OIL_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_OIL_E','ELC_FOSSIL_OIL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_OIL_E','ELC_FOSSIL_OIL_GRP',0.482,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_OIL_MIX_TUR_N','ELC_FOSSIL_OIL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_OIL_MIX_CCY_N','ELC_FOSSIL_OIL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_OIL_GBL_N','ELC_FOSSIL_OIL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_OIL_GPL_N','ELC_FOSSIL_OIL_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('ELC_HYD_GEN_E','ELC_HYD_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_HYD_GEN_DAM_N','ELC_HYD_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_HYD_GEN_RUN_N','ELC_HYD_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_HYD_PUM_E','ELC_HYD_PUM_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_HYD_PUM_N','ELC_HYD_PUM_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_HYD_GEN_E','ELC_HYD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_HYD_GEN_DAM_N','ELC_HYD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_HYD_GEN_RUN_N','ELC_HYD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_HYD_PUM_E','ELC_HYD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_HYD_PUM_N','ELC_HYD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NUC_FIS_E','ELC_NUC_FIS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NUC_FIS_LWR_N','ELC_NUC_FIS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NUC_FIS_EPR_N','ELC_NUC_FIS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NUC_FIS_FR_N','ELC_NUC_FIS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NUC_FIS_ABWR_N','ELC_NUC_FIS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NUC_FIS_ADS_TRU_N','ELC_NUC_FIS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NUC_FIS_ADS_MA_N','ELC_NUC_FIS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_BIO_E','ELC_BIO_GRP',0.389,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_E','ELC_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_GSF_CEN_N','ELC_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_COM_CEN_N','ELC_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_GSF_DEC_N','ELC_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_COM_DEC_N','ELC_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_GAS_N','ELC_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_CRP_GSF_N','ELC_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_CRP_COM_N','ELC_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_MUN_INC_N','ELC_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_MUN_INC_N','ELC_WST_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_CRP_GSF_CCS_N','ELC_BIO_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_CRP_COM_CCS_N','ELC_BIO_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_GSF_CCS_N','ELC_BIO_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_COM_CCS_N','ELC_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_BIO_N','ELC_BIO_GRP',0.274,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_BIO_E','ELC_BIO_WST_GRP',0.389,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_E','ELC_BIO_WST_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_GSF_CEN_N','ELC_BIO_WST_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_COM_CEN_N','ELC_BIO_WST_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_GSF_DEC_N','ELC_BIO_WST_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_COM_DEC_N','ELC_BIO_WST_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_GAS_N','ELC_BIO_WST_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_CRP_GSF_N','ELC_BIO_WST_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_CRP_COM_N','ELC_BIO_WST_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_MUN_INC_N','ELC_BIO_WST_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_CRP_GSF_CCS_N','ELC_BIO_WST_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_CRP_COM_CCS_N','ELC_BIO_WST_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_GSF_CCS_N','ELC_BIO_WST_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_COM_CCS_N','ELC_BIO_WST_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_BIO_N','ELC_BIO_WST_GRP',0.274,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_GEO_E','ELC_GEO_GRP',0.316,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_GEO_E','ELC_GEO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_GEO_FLS_N','ELC_GEO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_GEO_BNY_N','ELC_GEO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_GEO_BNY_HIG_N','ELC_GEO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_WIN_E','ELC_WIN_ON_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_WIN_N','ELC_WIN_ON_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_WIN_OFF_N','ELC_WIN_OFF_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_SOL_E','ELC_SOL_PV_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_SOL_PV_CEN_N','ELC_SOL_PV_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_SOL_PV_DST_N','ELC_SOL_PV_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_SOL_CSP_1_N','ELC_SOL_CSP_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_SOL_CSP_2_N','ELC_SOL_CSP_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_SOL_CSP_3_N','ELC_SOL_CSP_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_SOL_CSP_4_N','ELC_SOL_CSP_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_MAR_E','ELC_MAR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_MAR_WAV_N','ELC_MAR_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_MAR_TDL_N','ELC_MAR_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('ELC_COA_CCO_IG_CCS_N','ELC_FOSSIL_CCS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_COA_CCO_FG_CCS_N','ELC_FOSSIL_CCS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_COA_PUL_FG_CCS_N','ELC_FOSSIL_CCS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NGA_FG_CCS_N','ELC_FOSSIL_CCS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NGA_SOFC_CCS_N','ELC_FOSSIL_CCS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_CRP_GSF_CCS_N','ELC_BIO_CCS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_CRP_COM_CCS_N','ELC_BIO_CCS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_GSF_CCS_N','ELC_BIO_CCS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_COM_CCS_N','ELC_BIO_CCS_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('ELC_COA_CCO_IG_CCS_N','ELC_CCS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_COA_CCO_FG_CCS_N','ELC_CCS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_COA_PUL_FG_CCS_N','ELC_CCS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NGA_FG_CCS_N','ELC_CCS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NGA_SOFC_CCS_N','ELC_CCS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_CRP_GSF_CCS_N','ELC_CCS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_CRP_COM_CCS_N','ELC_CCS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_GSF_CCS_N','ELC_CCS_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_COM_CCS_N','ELC_CCS_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('ELC_COA_E','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_COA_E','ELC_GEN_GRP',0.553,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_COA_PUL_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_COA_CCO_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_COA_PFB_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_COA_N','ELC_GEN_GRP',0.455,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NGA_E','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_NGA_E','ELC_GEN_GRP',0.478,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_NGA_N','ELC_GEN_GRP',0.588,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NGA_CCY_ADV_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NGA_FCE_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_OIL_E','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_OIL_E','ELC_GEN_GRP',0.482,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_OIL_MIX_TUR_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_OIL_MIX_CCY_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_OIL_GBL_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_OIL_GPL_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_HYD_GEN_E','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_HYD_PUM_E','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_HYD_GEN_DAM_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_HYD_GEN_RUN_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_HYD_PUM_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NUC_FIS_E','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NUC_FIS_LWR_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NUC_FIS_EPR_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NUC_FIS_FR_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NUC_FIS_ABWR_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NUC_FIS_ADS_TRU_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NUC_FIS_ADS_MA_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_BIO_E','ELC_GEN_GRP',0.389,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_E','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_GSF_CEN_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_COM_CEN_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_GSF_DEC_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_COM_DEC_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_GAS_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_CRP_GSF_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_CRP_COM_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_MUN_INC_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_BIO_N','ELC_GEN_GRP',0.274,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_GEO_E','ELC_GEN_GRP',0.316,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_GEO_E','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_GEO_FLS_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_GEO_BNY_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_GEO_BNY_HIG_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_WIN_E','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_WIN_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_WIN_OFF_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_SOL_E','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_SOL_PV_CEN_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_SOL_PV_DST_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_SOL_CSP_1_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_SOL_CSP_2_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_SOL_CSP_3_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_SOL_CSP_4_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_MAR_E','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_MAR_WAV_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_MAR_TDL_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_COA_CCO_IG_CCS_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_COA_CCO_FG_CCS_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_COA_PUL_FG_CCS_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NGA_FG_CCS_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NGA_SOFC_CCS_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_CRP_GSF_CCS_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_CRP_COM_CCS_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_GSF_CCS_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_COM_CCS_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_STG_CEN_BTT_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_STG_DST_BTT_N','ELC_GEN_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_HH2_PEMFC_N','ELC_GEN_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('UPS_EXP_OIL','UPS_EXP_OIL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_EXP_GAS','EXP_NGA_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('UPS_LOC_HOIL_1','MIN_OIL_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_LOC_HOIL_2','MIN_OIL_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_LOC_HOIL_3','MIN_OIL_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_GRO_HOIL_1','MIN_OIL_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_GRO_HOIL_2','MIN_OIL_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_GRO_HOIL_3','MIN_OIL_PRD_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('UPS_REC_HSAN_1','MIN_OIL_PRD_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('UPS_REC_HSAN_2','MIN_OIL_PRD_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('UPS_REC_HSAN_3','MIN_OIL_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_DIS_HOIL_1','MIN_OIL_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_DIS_HOIL_2','MIN_OIL_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_DIS_HOIL_3','MIN_OIL_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_LOC_HSAN_1','MIN_OIL_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_LOC_HSAN_2','MIN_OIL_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_LOC_HSAN_3','MIN_OIL_PRD_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('UPS_LOC_HOIL_1','MIN_OIL_CRD_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_LOC_HOIL_2','MIN_OIL_CRD_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_LOC_HOIL_3','MIN_OIL_CRD_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_GRO_HOIL_1','MIN_OIL_CRD_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_GRO_HOIL_2','MIN_OIL_CRD_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_GRO_HOIL_3','MIN_OIL_CRD_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_DIS_HOIL_1','MIN_OIL_CRD_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_DIS_HOIL_2','MIN_OIL_CRD_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_DIS_HOIL_3','MIN_OIL_CRD_PRD_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('UPS_LOC_NGA_1','MIN_NGA_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_LOC_NGA_2','MIN_NGA_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_LOC_NGA_3','MIN_NGA_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_GRO_NGA_1','MIN_NGA_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_GRO_NGA_2','MIN_NGA_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_GRO_NGA_3','MIN_NGA_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_DIS_NGA_1','MIN_NGA_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_DIS_NGA_2','MIN_NGA_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_DIS_NGA_3','MIN_NGA_PRD_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('UPS_LOC_HCO','MIN_HCO_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_DIS_HCO','MIN_HCO_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_LOC_BCO','MIN_BCO_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_DIS_BCO','MIN_BCO_PRD_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('UPS_SEC_L2G_ON','IMP_L2G_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_SEC_L2G_OFF','IMP_L2G_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('ELC_COA_CCO_IG_CCS_N','CCS_TECHS_ALL_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('ELC_COA_CCO_FG_CCS_N','CCS_TECHS_ALL_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('ELC_COA_PUL_FG_CCS_N','CCS_TECHS_ALL_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('ELC_NGA_FG_CCS_N','CCS_TECHS_ALL_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('ELC_NGA_SOFC_CCS_N','CCS_TECHS_ALL_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_CRP_GSF_CCS_N','CCS_TECHS_ALL_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_CRP_COM_CCS_N','CCS_TECHS_ALL_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_GSF_CCS_N','CCS_TECHS_ALL_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('ELC_BIO_COM_CCS_N','CCS_TECHS_ALL_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('IND_CH_AMM_NGASR_CCS_N','CCS_TECHS_ALL_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('IND_CH_MTH_NGASR_CCS_N','CCS_TECHS_ALL_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('IND_IS_BOF_BFBOF_CCS_N','CCS_TECHS_ALL_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('IND_IS_BOF_TGR_CCS_N','CCS_TECHS_ALL_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('IND_IS_BOF_HISBOF_CCS_N','CCS_TECHS_ALL_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('IND_IS_DRI_DRIEAF_CCS_N','CCS_TECHS_ALL_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('IND_IS_DRI_ULCORED_CCS_N','CCS_TECHS_ALL_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('IND_NM_CLK_DRY_PCCS_N','CCS_TECHS_ALL_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('IND_NM_CLK_DRY_OCCS_N','CCS_TECHS_ALL_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('ELC_NUC_FIS_FR_N','ELC_NUC_FIS_GENIV_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NUC_FIS_ABWR_N','ELC_NUC_FIS_GENIV_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NUC_FIS_ADS_TRU_N','ELC_NUC_FIS_GENIV_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_NUC_FIS_ADS_MA_N','ELC_NUC_FIS_GENIV_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('ELC_STG_CEN_BTT_N','ELC_STG_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_STG_DST_BTT_N','ELC_STG_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('UPS_LOC_HOIL_1','OIL_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_LOC_HOIL_2','OIL_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_LOC_HOIL_3','OIL_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_GRO_HOIL_1','OIL_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_GRO_HOIL_2','OIL_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_GRO_HOIL_3','OIL_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_DIS_HOIL_1','OIL_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_DIS_HOIL_2','OIL_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_DIS_HOIL_3','OIL_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_LOC_HSAN_1','OIL_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_LOC_HSAN_2','OIL_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_LOC_HSAN_3','OIL_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_REC_HSAN_1','OIL_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_REC_HSAN_2','OIL_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_REC_HSAN_3','OIL_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_OIL_USA','OIL_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_OIL_CAN','OIL_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_OIL_MEX','OIL_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_OIL_OLA','OIL_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_OIL_BRA','OIL_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_OIL_RUS','OIL_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_OIL_MEA','OIL_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_OIL_AFR','OIL_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_OIL_CHI','OIL_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_OIL_JPN','OIL_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_OIL_ODA','OIL_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_EXP_OIL','OIL_TPES_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_GAS_PIP_AFR','IMP_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_GAS_PIP_RUS','IMP_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_GAS_PIP_CAC','IMP_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_GAS_PIP_MEA','IMP_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_GAS_LNG_AFR','IMP_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_GAS_LNG_MEA','IMP_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_GAS_LNG_GLB','IMP_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_GAS_LNG_OLA','IMP_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_GAS_LNG_USA','IMP_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_GAS_LNG_RUS','IMP_NGA_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('UPS_LOC_BCO','COA_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_DIS_BCO','COA_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_LOC_HCO','COA_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_DIS_HCO','COA_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_SEC_COA_OVC','COA_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_COA_AFR','COA_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_COA_CAC','COA_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_COA_AUS','COA_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_COA_CAN','COA_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_COA_OEE','COA_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_COA_RUS','COA_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_COA_ODA','COA_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_COA_USA','COA_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_COA_OLA','COA_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_EXP_COA','COA_TPES_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('UPS_EXP_COA','UPS_EXP_COA_GRP',1.0,'');

--INSERT INTO "TechGroupWeight" VALUES ('UPS_NUC_LWR_UOX_E','NUC_TPES_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('UPS_NUC_LWR_MOX_E','NUC_TPES_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('UPS_NUC_FR_MOX_N','NUC_TPES_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('UPS_NUC_ABWR_TRU_N','NUC_TPES_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('UPS_NUC_ABWR_UTR_N','NUC_TPES_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('UPS_NUC_ADS_TRU_N','NUC_TPES_GRP',1.0,'');
--INSERT INTO "TechGroupWeight" VALUES ('UPS_NUC_ADS_MA_N','NUC_TPES_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('UPS_MIN_IMP_URA_NAT','NUC_TPES_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_BIO_DST','BIO_TPES_GRP',1.0/0.0385,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_BIO_ETH','BIO_TPES_GRP',1.0/0.027,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_IMP_BIO_WOD','BIO_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_BIO_RPS_POT','BIO_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_BIO_CRP_STC_POT','BIO_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_BIO_CRP_SUG_POT','BIO_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_BIO_CRP_GRS_POT','BIO_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_BIO_CRP_WOD_1_POT','BIO_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_BIO_CRP_WOD_2_POT','BIO_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_BIO_AGR_WST_POT','BIO_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_BIO_FOR_1_POT','BIO_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_BIO_FOR_2_POT','BIO_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_BIO_WOD_RES_1_POT','BIO_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_BIO_WOD_RES_2_POT','BIO_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_BIO_WOD_PRD_1_POT','BIO_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_BIO_WOD_PRD_2_POT','BIO_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_BIO_MUN_POT','BIO_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_BIO_SLU_POT','BIO_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_BIO_GAS_POT','BIO_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_BIO_LIQ_POT','BIO_TPES_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('UPS_HYD_POT','HYD_TPES_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('UPS_GEO_POT','ORE_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_SOL_PV_POT','ORE_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_SOL_CSP_POT','ORE_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_SOL_TH_POT','ORE_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_TDL_POT','ORE_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_WAV_POT','ORE_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_WIN_ON_POT','ORE_TPES_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('UPS_WIN_OFF_POT','ORE_TPES_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_COA_E','HET_COA_GRP',1-0.553,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_COA_N','HET_COA_GRP',1-0.455,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_NGA_E','HET_NGA_GRP',1-0.478,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_NGA_N','HET_NGA_GRP',1-0.588,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_OIL_E','HET_OIL_GRP',1-0.482,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_BIO_E','HET_BIO_GRP',1-0.389,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_BIO_N','HET_BIO_GRP',1-0.274,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_GEO_E','HET_GEO_GRP',1-0.316,'');
INSERT INTO "TechGroupWeight" VALUES ('HET_OIL_E','HET_OIL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('HET_NGA_E','HET_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('HET_COA_E','HET_COA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('HET_BIO_E','HET_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('HET_GEO_E','HET_GEO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('HET_SOL_E','HET_SOL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('HET_OIL_N','HET_OIL_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('HET_NGA_N','HET_NGA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('HET_COA_N','HET_COA_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('HET_BIO_N','HET_BIO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('HET_GEO_N','HET_GEO_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('HET_SOL_N','HET_SOL_GRP',1.0,'');

INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_COA_E','HET_PRD_GRP',1-0.553,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_COA_N','HET_PRD_GRP',1-0.455,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_NGA_E','HET_PRD_GRP',1-0.478,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_NGA_N','HET_PRD_GRP',1-0.588,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_OIL_E','HET_PRD_GRP',1-0.482,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_BIO_E','HET_PRD_GRP',1-0.389,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_BIO_N','HET_PRD_GRP',1-0.274,'');
INSERT INTO "TechGroupWeight" VALUES ('ELC_CHP_GEO_E','HET_PRD_GRP',1-0.316,'');
INSERT INTO "TechGroupWeight" VALUES ('HET_OIL_E','HET_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('HET_NGA_E','HET_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('HET_COA_E','HET_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('HET_BIO_E','HET_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('HET_GEO_E','HET_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('HET_SOL_E','HET_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('HET_OIL_N','HET_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('HET_NGA_N','HET_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('HET_COA_N','HET_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('HET_BIO_N','HET_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('HET_GEO_N','HET_PRD_GRP',1.0,'');
INSERT INTO "TechGroupWeight" VALUES ('HET_SOL_N','HET_PRD_GRP',1.0,'');

CREATE TABLE "MaxActivityGroup" (
	"regions"	text,
	"periods"	integer,
	"group_name"	text,
	"max_act_g"	real,
	"notes"	text,
	PRIMARY KEY("regions","periods","group_name")
);
INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'MIN_OIL_PRD_GRP',8091.786,'PJ'); -- IEA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'MIN_OIL_PRD_GRP',6662.960,'PJ'); -- IEA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'MIN_OIL_PRD_GRP',6812.269,'PJ'); -- IEA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2025,'MIN_OIL_PRD_GRP',6471.656,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2030,'MIN_OIL_PRD_GRP',6148.073,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2035,'MIN_OIL_PRD_GRP',5840.669,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2040,'MIN_OIL_PRD_GRP',5548.636,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2045,'MIN_OIL_PRD_GRP',5271.204,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2050,'MIN_OIL_PRD_GRP',5007.644,'PJ');

INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'MIN_OIL_CRD_PRD_GRP',7384.746*1.10,'PJ'); -- IEA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'MIN_OIL_CRD_PRD_GRP',6027.236*1.10,'PJ'); -- IEA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'MIN_OIL_CRD_PRD_GRP',6196.844*1.10,'PJ'); -- IEA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2025,'MIN_OIL_CRD_PRD_GRP',5887.002*1.10,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2030,'MIN_OIL_CRD_PRD_GRP',5592.652*1.10,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2035,'MIN_OIL_CRD_PRD_GRP',5313.019*1.10,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2040,'MIN_OIL_CRD_PRD_GRP',5047.368*1.10,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2045,'MIN_OIL_CRD_PRD_GRP',4795.000*1.10,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2050,'MIN_OIL_CRD_PRD_GRP',4555.250*1.10,'PJ');

INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'OIL_TPES_GRP',63866.228,'PJ'); -- Imports + Production + Exports
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'OIL_TPES_GRP',65020.729,'PJ');  -- Imports + Production + Exports
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'OIL_TPES_GRP',58958.999,'PJ'); -- Imports + Production + Exports

INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'UPS_EXP_OIL_GRP',17983.926,'PJ'); -- https://www.iea.org/data-and-statistics/data-tools/energy-statistics-data-browser?country=OECDEUR&fuel=Imports%2Fexports&indicator=NatGasImportsExports
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'UPS_EXP_OIL_GRP',19356.834,'PJ'); -- https://www.iea.org/data-and-statistics/data-tools/energy-statistics-data-browser?country=OECDEUR&fuel=Imports%2Fexports&indicator=NatGasImportsExports
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'UPS_EXP_OIL_GRP',17799.560,'PJ'); -- https://www.iea.org/data-and-statistics/data-tools/energy-statistics-data-browser?country=OECDEUR&fuel=Imports%2Fexports&indicator=NatGasImportsExports

INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'MIN_NGA_PRD_GRP',11339.231,'PJ'); -- IEA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'MIN_NGA_PRD_GRP',9314.114,'PJ'); -- IEA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'MIN_NGA_PRD_GRP',7693.646,'PJ'); -- IEA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2025,'MIN_NGA_PRD_GRP',6539.599,'PJ'); -- 15% reduction / 5 years;
INSERT INTO "MaxActivityGroup" VALUES ('EU',2030,'MIN_NGA_PRD_GRP',5558.659,'PJ'); -- 15% reduction / 5 years;
INSERT INTO "MaxActivityGroup" VALUES ('EU',2035,'MIN_NGA_PRD_GRP',4724.860,'PJ'); -- 15% reduction / 5 years;
INSERT INTO "MaxActivityGroup" VALUES ('EU',2040,'MIN_NGA_PRD_GRP',4016.131,'PJ'); -- 15% reduction / 5 years;
INSERT INTO "MaxActivityGroup" VALUES ('EU',2045,'MIN_NGA_PRD_GRP',3413.712,'PJ'); -- 15% reduction / 5 years;
INSERT INTO "MaxActivityGroup" VALUES ('EU',2050,'MIN_NGA_PRD_GRP',2901.655,'PJ'); -- 15% reduction / 5 years;

INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'EXP_NGA_GRP',8181.324,'PJ'); -- https://www.iea.org/data-and-statistics/data-tools/energy-statistics-data-browser?country=OECDEUR&fuel=Imports%2Fexports&indicator=NatGasImportsExports
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'EXP_NGA_GRP',8584.532,'PJ'); -- https://www.iea.org/data-and-statistics/data-tools/energy-statistics-data-browser?country=OECDEUR&fuel=Imports%2Fexports&indicator=NatGasImportsExports
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'EXP_NGA_GRP',7355.055,'PJ'); -- https://www.iea.org/data-and-statistics/data-tools/energy-statistics-data-browser?country=OECDEUR&fuel=Imports%2Fexports&indicator=NatGasImportsExports

--INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'COA_TPES_GRP',12601.680,'PJ'); -- IEA
--INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'COA_TPES_GRP',11962.944,'PJ'); -- IEA
--INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'COA_TPES_GRP',7647.131,'PJ'); -- IEA

INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'MIN_HCO_PRD_GRP',789.178+2318.146+117.167+55.835,'PJ'); -- IEA (Coking coal + Other bituminous coal + Sub-bituminous coal + Anthracite)
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'MIN_HCO_PRD_GRP',635.307+1778.289+65.221+36.618,'PJ'); -- IEA (Coking coal + Other bituminous coal + Sub-bituminous coal + Anthracite)
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'MIN_HCO_PRD_GRP',423.960+1023.410+0.000+44.396,'PJ'); -- IEA (Coking coal + Other bituminous coal + Sub-bituminous coal + Anthracite)
INSERT INTO "MaxActivityGroup" VALUES ('EU',2025,'MIN_HCO_PRD_GRP',1193.413,'PJ'); -- 20% reduction / 5 years
INSERT INTO "MaxActivityGroup" VALUES ('EU',2030,'MIN_HCO_PRD_GRP',954.730,'PJ'); -- 20% reduction / 5 years
INSERT INTO "MaxActivityGroup" VALUES ('EU',2035,'MIN_HCO_PRD_GRP',763.784,'PJ'); -- 20% reduction / 5 years
INSERT INTO "MaxActivityGroup" VALUES ('EU',2040,'MIN_HCO_PRD_GRP',611.027,'PJ'); -- 20% reduction / 5 years
INSERT INTO "MaxActivityGroup" VALUES ('EU',2045,'MIN_HCO_PRD_GRP',488.822,'PJ'); -- 20% reduction / 5 years
INSERT INTO "MaxActivityGroup" VALUES ('EU',2050,'MIN_HCO_PRD_GRP',391.058,'PJ'); -- 20% reduction / 5 years

INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'MIN_BCO_PRD_GRP',3638.040,'PJ'); -- IEA (Lignite)
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'MIN_BCO_PRD_GRP',3443.583,'PJ'); -- IEA (Lignite)
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'MIN_BCO_PRD_GRP',2430.211,'PJ'); -- IEA (Lignite)
INSERT INTO "MaxActivityGroup" VALUES ('EU',2025,'MIN_BCO_PRD_GRP',2187.190,'PJ');  -- 10% reduction / 5 years
INSERT INTO "MaxActivityGroup" VALUES ('EU',2030,'MIN_BCO_PRD_GRP',1968.471,'PJ');  -- 10% reduction / 5 years
INSERT INTO "MaxActivityGroup" VALUES ('EU',2035,'MIN_BCO_PRD_GRP',1771.624,'PJ');  -- 10% reduction / 5 years
INSERT INTO "MaxActivityGroup" VALUES ('EU',2040,'MIN_BCO_PRD_GRP',1594.461,'PJ');  -- 10% reduction / 5 years
INSERT INTO "MaxActivityGroup" VALUES ('EU',2045,'MIN_BCO_PRD_GRP',1435.015,'PJ');  -- 10% reduction / 5 years
INSERT INTO "MaxActivityGroup" VALUES ('EU',2050,'MIN_BCO_PRD_GRP',1291.514,'PJ');  -- 10% reduction / 5 years

INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'UPS_EXP_COA_GRP',931.790,'PJ'); -- https://www.iea.org/data-and-statistics/data-tools/energy-statistics-data-browser?country=OECDEUR&fuel=Imports%2Fexports&indicator=NatGasImportsExports
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'UPS_EXP_COA_GRP',763.401,'PJ'); -- https://www.iea.org/data-and-statistics/data-tools/energy-statistics-data-browser?country=OECDEUR&fuel=Imports%2Fexports&indicator=NatGasImportsExports
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'UPS_EXP_COA_GRP',571.756,'PJ'); -- https://www.iea.org/data-and-statistics/data-tools/energy-statistics-data-browser?country=OECDEUR&fuel=Imports%2Fexports&indicator=NatGasImportsExports

INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'IMP_NGA_GRP',18444.369,'PJ'); -- IEA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'IMP_NGA_GRP',17838.476,'PJ'); -- IEA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'IMP_NGA_GRP',18722.659,'PJ'); -- IEA

--INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'NUC_TPES_GRP',9998.927,'PJ'); -- IEA
--INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'NUC_TPES_GRP',9310.969,'PJ'); -- IEA
--INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'NUC_TPES_GRP',7695.172,'PJ'); -- IEA

INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'BIO_TPES_GRP',5713.492,'PJ'); -- IEA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'BIO_TPES_GRP',6309.243,'PJ'); -- IEA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'BIO_TPES_GRP',7059.634,'PJ'); -- IEA

--INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'HYD_TPES_GRP',2016.271,'PJ'); -- IEA
--INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'HYD_TPES_GRP',2052.350,'PJ'); -- IEA
--INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'HYD_TPES_GRP',2157.069,'PJ'); -- IEA

INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'ORE_TPES_GRP',1209.825,'PJ'); -- IEA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'ORE_TPES_GRP',2354.692,'PJ'); -- IEA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'ORE_TPES_GRP',3548.619,'PJ'); -- IEA

INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'ELC_FOSSIL_COA_GRP',3142.95,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'ELC_FOSSIL_COA_GRP',3100.46,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'ELC_FOSSIL_COA_GRP',1696.07,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2025,'ELC_FOSSIL_COA_GRP',216.32*31.536*0.45,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2030,'ELC_FOSSIL_COA_GRP',198.25*31.536*0.45,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2035,'ELC_FOSSIL_COA_GRP',180.18*31.536*0.45,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2040,'ELC_FOSSIL_COA_GRP',162.12*31.536*0.45,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2045,'ELC_FOSSIL_COA_GRP',144.05*31.536*0.45,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2050,'ELC_FOSSIL_COA_GRP',125.99*31.536*0.45,'PJ');

INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'ELC_FOSSIL_OIL_GRP',291.24,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'ELC_FOSSIL_OIL_GRP',222.84,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'ELC_FOSSIL_OIL_GRP',160.54,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2025,'ELC_FOSSIL_OIL_GRP',37.91*31.536*0.30,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2030,'ELC_FOSSIL_OIL_GRP',37.23*31.536*0.30,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2035,'ELC_FOSSIL_OIL_GRP',36.55*31.536*0.30,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2040,'ELC_FOSSIL_OIL_GRP',35.87*31.536*0.30,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2045,'ELC_FOSSIL_OIL_GRP',35.19*31.536*0.30,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2050,'ELC_FOSSIL_OIL_GRP',34.52*31.536*0.30,'PJ');

INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'ELC_FOSSIL_NGA_GRP',3083.89,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'ELC_FOSSIL_NGA_GRP',2109.05,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'ELC_FOSSIL_NGA_GRP',2619.37,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2025,'ELC_FOSSIL_NGA_GRP',371.77*31.536*0.35,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2030,'ELC_FOSSIL_NGA_GRP',390.36*31.536*0.35,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2035,'ELC_FOSSIL_NGA_GRP',409.88*31.536*0.35,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2040,'ELC_FOSSIL_NGA_GRP',430.37*31.536*0.35,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2045,'ELC_FOSSIL_NGA_GRP',451.89*31.536*0.35,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2050,'ELC_FOSSIL_NGA_GRP',474.49*31.536*0.35,'PJ');

INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'ELC_HYD_GRP',2131.98,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'ELC_HYD_GRP',2166.57,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'ELC_HYD_GRP',2274.21,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'ELC_HYD_PUM_GRP',43.20,'PJ'); -- EIA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'ELC_HYD_PUM_GRP',43.20,'PJ'); -- EIA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'ELC_HYD_PUM_GRP',43.20,'PJ'); -- EIA

INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'ELC_BIO_GRP',524.70,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'ELC_BIO_GRP',735.31,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'ELC_BIO_GRP',836.95,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'ELC_WST_GRP',137.54,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'ELC_WST_GRP',163.92,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'ELC_WST_GRP',186.24,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2025,'ELC_BIO_WST_GRP',60.37*31.536*0.65,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2030,'ELC_BIO_WST_GRP',70.59*31.536*0.65,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2035,'ELC_BIO_WST_GRP',80.81*31.536*0.65,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2040,'ELC_BIO_WST_GRP',91.02*31.536*0.65,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2045,'ELC_BIO_WST_GRP',101.24*31.536*0.65,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2050,'ELC_BIO_WST_GRP',111.46*31.536*0.65,'PJ');

INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'ELC_GEO_GRP',38.65,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'ELC_GEO_GRP',54.15,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'ELC_GEO_GRP',81.40,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'ELC_WIN_ON_GRP',550.08,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'ELC_WIN_ON_GRP',983.02,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'ELC_WIN_ON_GRP',1530.69,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'ELC_WIN_OFF_GRP',0.00,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'ELC_WIN_OFF_GRP',126.62,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'ELC_WIN_OFF_GRP',259.57,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'ELC_SOL_PV_GRP',164.23,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'ELC_SOL_PV_GRP',361.68,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'ELC_SOL_PV_GRP',583.68,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'ELC_SOL_CSP_GRP',2.74,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'ELC_SOL_CSP_GRP',20.13,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'ELC_SOL_CSP_GRP',20.46,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'ELC_MAR_GRP',1.72,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'ELC_MAR_GRP',1.76,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'ELC_MAR_GRP',1.85,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2025,'ELC_MAR_GRP',1.41*31.536*0.05,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2030,'ELC_MAR_GRP',1.53*31.536*0.05,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2035,'ELC_MAR_GRP',1.66*31.536*0.05,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2040,'ELC_MAR_GRP',1.78*31.536*0.05,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2045,'ELC_MAR_GRP',1.90*31.536*0.05,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2050,'ELC_MAR_GRP',2.02*31.536*0.05,'PJ');
-- Fission (historical data)
INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'ELC_NUC_FIS_GRP',3297.88,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'ELC_NUC_FIS_GRP',3071.11,'PJ');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'ELC_NUC_FIS_GRP',2626.99,'PJ');
-- Fission (extrapolation)
INSERT INTO "MaxActivityGroup" VALUES ('EU',2025,'ELC_NUC_FIS_GRP',110.99*31.536*0.85,'PJ'); -- -1.7% wrt 2020
INSERT INTO "MaxActivityGroup" VALUES ('EU',2030,'ELC_NUC_FIS_GRP',106.32*31.536*0.85,'PJ'); -- -5.9% wrt 2020
INSERT INTO "MaxActivityGroup" VALUES ('EU',2035,'ELC_NUC_FIS_GRP',101.85*31.536*0.85,'PJ'); -- -9.8% wrt 2020
INSERT INTO "MaxActivityGroup" VALUES ('EU',2040,'ELC_NUC_FIS_GRP',97.57*31.536*0.85,'PJ'); -- -13.6% wrt 2020
INSERT INTO "MaxActivityGroup" VALUES ('EU',2045,'ELC_NUC_FIS_GRP',93.46*31.536*0.85,'PJ'); -- -17.2% wrt 2020
INSERT INTO "MaxActivityGroup" VALUES ('EU',2050,'ELC_NUC_FIS_GRP',89.53*31.536*0.85,'PJ'); -- -20.7% wrt 2020
-- Fission (stable)
--INSERT INTO "MaxActivityGroup" VALUES ('EU',2025,'ELC_NUC_FIS_GRP',110.99*31.536*0.85,'PJ');
--INSERT INTO "MaxActivityGroup" VALUES ('EU',2030,'ELC_NUC_FIS_GRP',110.99*31.536*0.85,'PJ');
--INSERT INTO "MaxActivityGroup" VALUES ('EU',2035,'ELC_NUC_FIS_GRP',110.99*31.536*0.85,'PJ');
--INSERT INTO "MaxActivityGroup" VALUES ('EU',2040,'ELC_NUC_FIS_GRP',110.99*31.536*0.85,'PJ');
--INSERT INTO "MaxActivityGroup" VALUES ('EU',2045,'ELC_NUC_FIS_GRP',110.99*31.536*0.85,'PJ');
--INSERT INTO "MaxActivityGroup" VALUES ('EU',2050,'ELC_NUC_FIS_GRP',110.99*31.536*0.85,'PJ');
-- Fission (increase)
--INSERT INTO "MaxActivityGroup" VALUES ('EU',2025,'ELC_NUC_FIS_GRP',110.67*31.536*0.85,'PJ');
--INSERT INTO "MaxActivityGroup" VALUES ('EU',2030,'ELC_NUC_FIS_GRP',122.10*31.536*0.85,'PJ'); -- *1.10
--INSERT INTO "MaxActivityGroup" VALUES ('EU',2035,'ELC_NUC_FIS_GRP',134.30*31.536*0.85,'PJ'); -- *1.21
--INSERT INTO "MaxActivityGroup" VALUES ('EU',2040,'ELC_NUC_FIS_GRP',147.73*31.536*0.85,'PJ'); -- *1.33
--INSERT INTO "MaxActivityGroup" VALUES ('EU',2045,'ELC_NUC_FIS_GRP',162.50*31.536*0.85,'PJ'); -- *1.46
--INSERT INTO "MaxActivityGroup" VALUES ('EU',2050,'ELC_NUC_FIS_GRP',178.75*31.536*0.85,'PJ'); -- *1.61

INSERT INTO "MaxActivityGroup" VALUES ('EU',2025,'ELC_HYD_PUM_GRP',43.20,'GW');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2030,'ELC_HYD_PUM_GRP',43.20,'GW');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2035,'ELC_HYD_PUM_GRP',43.20,'GW');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2040,'ELC_HYD_PUM_GRP',43.20,'GW');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2045,'ELC_HYD_PUM_GRP',43.20,'GW');
INSERT INTO "MaxActivityGroup" VALUES ('EU',2050,'ELC_HYD_PUM_GRP',43.20,'GW');

--INSERT INTO "MaxActivityGroup" VALUES ('EU',2030,'CCS_TECHS_ALL_GRP',0.00,'PJ');
--INSERT INTO "MaxActivityGroup" VALUES ('EU',2035,'CCS_TECHS_ALL_GRP',0.00,'PJ');
--INSERT INTO "MaxActivityGroup" VALUES ('EU',2040,'CCS_TECHS_ALL_GRP',0.00,'PJ');
--INSERT INTO "MaxActivityGroup" VALUES ('EU',2045,'CCS_TECHS_ALL_GRP',0.00,'PJ');
--INSERT INTO "MaxActivityGroup" VALUES ('EU',2050,'CCS_TECHS_ALL_GRP',0.00,'PJ');

INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'HET_SOL_GRP',0.206,'PJ'); -- IEA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'HET_SOL_GRP',1.062,'PJ'); -- IEA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'HET_SOL_GRP',2.844,'PJ'); -- IEA

INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'HET_OIL_GRP',173.601,'PJ'); -- IEA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'HET_OIL_GRP',92.486,'PJ'); -- IEA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'HET_OIL_GRP',75.256,'PJ'); -- IEA

INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'HET_NGA_GRP',1067.875,'PJ'); -- IEA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'HET_NGA_GRP',826.629,'PJ'); -- IEA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'HET_NGA_GRP',810.314,'PJ'); -- IEA

INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'HET_COA_GRP',774.232,'PJ'); -- IEA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'HET_COA_GRP',616.477,'PJ'); -- IEA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'HET_COA_GRP',468.211,'PJ'); -- IEA

INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'HET_BIO_GRP',336.674+189.855,'PJ'); -- IEA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'HET_BIO_GRP',436.835+252.117,'PJ'); -- IEA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'HET_BIO_GRP',522.312+281.119,'PJ'); -- IEA

INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'HET_GEO_GRP',31.160,'PJ'); -- IEA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'HET_GEO_GRP',41.429,'PJ'); -- IEA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'HET_GEO_GRP',49.156,'PJ'); -- IEA

INSERT INTO "MaxActivityGroup" VALUES ('EU',2010,'HET_PRD_GRP',2573.603*1.05,'PJ'); -- IEA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2015,'HET_PRD_GRP',2267.035*1.05,'PJ'); -- IEA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2020,'HET_PRD_GRP',2209.212*1.05,'PJ'); -- IEA
INSERT INTO "MaxActivityGroup" VALUES ('EU',2025,'HET_PRD_GRP',2209.212*1.25,'PJ'); -- IEA

CREATE TABLE "MinActivityGroup" (
	"regions"	text,
	"periods"	integer,
	"group_name"	text,
	"min_act_g"	real,
	"notes"	text,
	PRIMARY KEY("regions","periods","group_name")
);
INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'MIN_OIL_PRD_GRP',8091.786,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'MIN_OIL_PRD_GRP',6662.960,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'MIN_OIL_PRD_GRP',6812.269,'PJ');

INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'MIN_OIL_CRD_PRD_GRP',7384.746,'PJ'); -- IEA
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'MIN_OIL_CRD_PRD_GRP',6027.236,'PJ'); -- IEA
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'MIN_OIL_CRD_PRD_GRP',6196.844,'PJ'); -- IEA

INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'MIN_NGA_PRD_GRP',11339.231,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'MIN_NGA_PRD_GRP',9314.114,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'MIN_NGA_PRD_GRP',7693.646,'PJ');

INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'EXP_NGA_GRP',8181.324,'PJ'); -- https://www.iea.org/data-and-statistics/data-tools/energy-statistics-data-browser?country=OECDEUR&fuel=Imports%2Fexports&indicator=NatGasImportsExports
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'EXP_NGA_GRP',8584.532,'PJ'); -- https://www.iea.org/data-and-statistics/data-tools/energy-statistics-data-browser?country=OECDEUR&fuel=Imports%2Fexports&indicator=NatGasImportsExports
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'EXP_NGA_GRP',7355.055,'PJ'); -- https://www.iea.org/data-and-statistics/data-tools/energy-statistics-data-browser?country=OECDEUR&fuel=Imports%2Fexports&indicator=NatGasImportsExports

INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'OIL_TPES_GRP',63866.228,'PJ'); -- Imports + Production + Exports
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'OIL_TPES_GRP',65020.729*0.95,'PJ');  -- Imports + Production + Exports
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'OIL_TPES_GRP',58958.999,'PJ'); -- Imports + Production + Exports

INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'UPS_EXP_OIL_GRP',17983.926,'PJ'); -- https://www.iea.org/data-and-statistics/data-tools/energy-statistics-data-browser?country=OECDEUR&fuel=Imports%2Fexports&indicator=NatGasImportsExports
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'UPS_EXP_OIL_GRP',19356.834,'PJ'); -- https://www.iea.org/data-and-statistics/data-tools/energy-statistics-data-browser?country=OECDEUR&fuel=Imports%2Fexports&indicator=NatGasImportsExports
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'UPS_EXP_OIL_GRP',17799.560,'PJ'); -- https://www.iea.org/data-and-statistics/data-tools/energy-statistics-data-browser?country=OECDEUR&fuel=Imports%2Fexports&indicator=NatGasImportsExports

--INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'COA_TPES_GRP',12601.680,'PJ'); -- IEA
--INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'COA_TPES_GRP',11962.944,'PJ'); -- IEA
--INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'COA_TPES_GRP',7647.131,'PJ'); -- IEA

INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'MIN_HCO_PRD_GRP',789.178+2318.146+117.167+55.835,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'MIN_HCO_PRD_GRP',635.307+1778.289+65.221+36.618,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'MIN_HCO_PRD_GRP',423.960+1023.410+0.000+44.396,'PJ');

INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'MIN_BCO_PRD_GRP',3638.040,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'MIN_BCO_PRD_GRP',3443.583,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'MIN_BCO_PRD_GRP',2430.211,'PJ');

INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'UPS_EXP_COA_GRP',931.790,'PJ'); -- https://www.iea.org/data-and-statistics/data-tools/energy-statistics-data-browser?country=OECDEUR&fuel=Imports%2Fexports&indicator=NatGasImportsExports
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'UPS_EXP_COA_GRP',763.401,'PJ'); -- https://www.iea.org/data-and-statistics/data-tools/energy-statistics-data-browser?country=OECDEUR&fuel=Imports%2Fexports&indicator=NatGasImportsExports
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'UPS_EXP_COA_GRP',571.756,'PJ'); -- https://www.iea.org/data-and-statistics/data-tools/energy-statistics-data-browser?country=OECDEUR&fuel=Imports%2Fexports&indicator=NatGasImportsExports

INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'IMP_NGA_GRP',18444.369,'PJ'); -- IEA
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'IMP_NGA_GRP',17838.476,'PJ'); -- IEA
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'IMP_NGA_GRP',18722.659,'PJ'); -- IEA

--INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'NUC_TPES_GRP',9998.927,'PJ'); -- IEA
--INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'NUC_TPES_GRP',9310.969,'PJ'); -- IEA
--INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'NUC_TPES_GRP',7695.172,'PJ'); -- IEA

INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'BIO_TPES_GRP',5713.492,'PJ'); -- IEA
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'BIO_TPES_GRP',6309.243,'PJ'); -- IEA
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'BIO_TPES_GRP',7059.634,'PJ'); -- IEA

--INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'HYD_TPES_GRP',2016.271,'PJ'); -- IEA
--INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'HYD_TPES_GRP',2052.350,'PJ'); -- IEA
--INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'HYD_TPES_GRP',2157.069,'PJ'); -- IEA

INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'ORE_TPES_GRP',1209.825,'PJ'); -- IEA
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'ORE_TPES_GRP',2354.692,'PJ'); -- IEA
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'ORE_TPES_GRP',3548.619,'PJ'); -- IEA

INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'ELC_FOSSIL_COA_GRP',3142.95,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'ELC_FOSSIL_COA_GRP',3100.46,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'ELC_FOSSIL_COA_GRP',1696.07,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'ELC_FOSSIL_OIL_GRP',291.24,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'ELC_FOSSIL_OIL_GRP',222.84,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'ELC_FOSSIL_OIL_GRP',160.54,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'ELC_FOSSIL_NGA_GRP',3083.89,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'ELC_FOSSIL_NGA_GRP',2109.05,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'ELC_FOSSIL_NGA_GRP',2619.37,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'ELC_HYD_GRP',2131.98,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'ELC_HYD_GRP',2166.57,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'ELC_HYD_GRP',2274.21,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'ELC_HYD_PUM_GRP',43.20,'PJ'); -- EIA
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'ELC_HYD_PUM_GRP',43.20,'PJ'); -- EIA
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'ELC_HYD_PUM_GRP',43.20,'PJ'); -- EIA
INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'ELC_NUC_FIS_GRP',3297.88,'GW');
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'ELC_NUC_FIS_GRP',3071.11,'GW');
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'ELC_NUC_FIS_GRP',2626.99,'GW');
INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'ELC_BIO_GRP',524.70,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'ELC_BIO_GRP',735.31,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'ELC_BIO_GRP',836.95,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'ELC_WST_GRP',137.54,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'ELC_WST_GRP',163.92,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'ELC_WST_GRP',186.24,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'ELC_GEO_GRP',38.65,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'ELC_GEO_GRP',54.15,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'ELC_GEO_GRP',81.40,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'ELC_WIN_ON_GRP',550.08,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'ELC_WIN_ON_GRP',983.02,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'ELC_WIN_ON_GRP',1530.69,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'ELC_WIN_OFF_GRP',0.00,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'ELC_WIN_OFF_GRP',126.62,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'ELC_WIN_OFF_GRP',259.57,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'ELC_SOL_PV_GRP',164.23,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'ELC_SOL_PV_GRP',361.68,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'ELC_SOL_PV_GRP',583.68,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'ELC_SOL_CSP_GRP',2.74,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'ELC_SOL_CSP_GRP',20.13,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'ELC_SOL_CSP_GRP',20.46,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'ELC_MAR_GRP',1.72,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'ELC_MAR_GRP',1.76,'PJ');
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'ELC_MAR_GRP',1.85,'PJ');

INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'HET_SOL_GRP',0.206,'PJ'); -- IEA
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'HET_SOL_GRP',1.062,'PJ'); -- IEA
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'HET_SOL_GRP',2.844,'PJ'); -- IEA

INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'HET_OIL_GRP',173.601,'PJ'); -- IEA
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'HET_OIL_GRP',92.486,'PJ'); -- IEA
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'HET_OIL_GRP',75.256,'PJ'); -- IEA

INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'HET_NGA_GRP',1067.875,'PJ'); -- IEA
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'HET_NGA_GRP',826.629,'PJ'); -- IEA
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'HET_NGA_GRP',810.314,'PJ'); -- IEA

INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'HET_COA_GRP',774.232,'PJ'); -- IEA
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'HET_COA_GRP',616.477,'PJ'); -- IEA
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'HET_COA_GRP',468.211,'PJ'); -- IEA

INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'HET_BIO_GRP',336.674+189.855,'PJ'); -- IEA
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'HET_BIO_GRP',436.835+252.117,'PJ'); -- IEA
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'HET_BIO_GRP',522.312+281.119,'PJ'); -- IEA

INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'HET_GEO_GRP',31.160,'PJ'); -- IEA
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'HET_GEO_GRP',41.429,'PJ'); -- IEA
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'HET_GEO_GRP',49.156,'PJ'); -- IEA

INSERT INTO "MinActivityGroup" VALUES ('EU',2010,'HET_PRD_GRP',2573.603,'PJ'); -- IEA
INSERT INTO "MinActivityGroup" VALUES ('EU',2015,'HET_PRD_GRP',2267.035,'PJ'); -- IEA
INSERT INTO "MinActivityGroup" VALUES ('EU',2020,'HET_PRD_GRP',2209.212,'PJ'); -- IEA

CREATE TABLE "MaxCapacityGroup" (
	"regions"	text,
	"periods"	integer,
	"group_name"	text,
	"max_cap_g"	real,
	"notes"	text,
	PRIMARY KEY("regions","periods","group_name")
);
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2025,'ELC_HYD_GEN_GRP',171.98,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2030,'ELC_HYD_GEN_GRP',177.29,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2035,'ELC_HYD_GEN_GRP',182.76,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2040,'ELC_HYD_GEN_GRP',188.40,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2045,'ELC_HYD_GEN_GRP',194.22,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2050,'ELC_HYD_GEN_GRP',200.22,'GW');

--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2025,'ELC_HYD_PUM_GRP',58.59,'GW');
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2030,'ELC_HYD_PUM_GRP',60.50,'GW');
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2035,'ELC_HYD_PUM_GRP',62.46,'GW');
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2040,'ELC_HYD_PUM_GRP',64.50,'GW');
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2045,'ELC_HYD_PUM_GRP',66.60,'GW');
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2050,'ELC_HYD_PUM_GRP',68.78,'GW');

INSERT INTO "MaxCapacityGroup" VALUES ('EU',2025,'ELC_GEO_GRP',4.16,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2030,'ELC_GEO_GRP',4.88,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2035,'ELC_GEO_GRP',5.61,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2040,'ELC_GEO_GRP',6.33,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2045,'ELC_GEO_GRP',7.06,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2050,'ELC_GEO_GRP',7.78,'GW');

INSERT INTO "MaxCapacityGroup" VALUES ('EU',2025,'ELC_WIN_ON_GRP',265.96,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2030,'ELC_WIN_ON_GRP',320.13,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2035,'ELC_WIN_ON_GRP',332.38,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2040,'ELC_WIN_ON_GRP',332.38,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2045,'ELC_WIN_ON_GRP',332.38,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2050,'ELC_WIN_ON_GRP',332.38,'GW');

INSERT INTO "MaxCapacityGroup" VALUES ('EU',2025,'ELC_WIN_OFF_GRP',69.45,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2030,'ELC_WIN_OFF_GRP',157.41,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2035,'ELC_WIN_OFF_GRP',299.62,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2040,'ELC_WIN_OFF_GRP',475.90,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2045,'ELC_WIN_OFF_GRP',626.51,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2050,'ELC_WIN_OFF_GRP',678.61,'GW');

---- Solar PV (high)
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2025,'ELC_SOL_PV_GRP',353.17,'GW');
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2030,'ELC_SOL_PV_GRP',681.36,'GW');
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2035,'ELC_SOL_PV_GRP',1140.53,'GW');
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2040,'ELC_SOL_PV_GRP',1649.56,'GW');
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2045,'ELC_SOL_PV_GRP',1917.96,'GW');
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2050,'ELC_SOL_PV_GRP',2186.37,'GW');

----Solar PV (low)
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2025,'ELC_SOL_PV_GRP',309.82,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2030,'ELC_SOL_PV_GRP',495.18,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2035,'ELC_SOL_PV_GRP',714.13,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2040,'ELC_SOL_PV_GRP',927.27,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2045,'ELC_SOL_PV_GRP',1081.61,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2050,'ELC_SOL_PV_GRP',1130.72,'GW');

---- Solar CSP (stagnation)
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2025,'ELC_SOL_CSP_GRP',2.33,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2030,'ELC_SOL_CSP_GRP',2.34,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2035,'ELC_SOL_CSP_GRP',2.34,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2040,'ELC_SOL_CSP_GRP',2.35,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2045,'ELC_SOL_CSP_GRP',2.36,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2050,'ELC_SOL_CSP_GRP',2.37,'GW');

------ Solar CSP (saturation capacity 1 TW)
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2025,'ELC_SOL_CSP_GRP',18.54,'GW');
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2030,'ELC_SOL_CSP_GRP',109.24,'GW');
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2035,'ELC_SOL_CSP_GRP',255.45,'GW');
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2040,'ELC_SOL_CSP_GRP',401.65,'GW');
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2045,'ELC_SOL_CSP_GRP',547.77,'GW');
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2050,'ELC_SOL_CSP_GRP',693.45,'GW');

-- Fossil w/ CCS (Saturation capacity 500 GW)
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2030,'ELC_FOSSIL_CCS_GRP',0.03,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2035,'ELC_FOSSIL_CCS_GRP',0.20,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2040,'ELC_FOSSIL_CCS_GRP',1.24,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2045,'ELC_FOSSIL_CCS_GRP',7.72,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2050,'ELC_FOSSIL_CCS_GRP',45.52,'GW');

-- Biomass w/ CCS (Saturation capacity 500 GW)
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2030,'ELC_BIO_CCS_GRP',0.03,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2035,'ELC_BIO_CCS_GRP',0.20,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2040,'ELC_BIO_CCS_GRP',1.24,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2045,'ELC_BIO_CCS_GRP',7.72,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2050,'ELC_BIO_CCS_GRP',45.52,'GW');

---- Biomass w/ CCS
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2030,'ELC_BIO_CCS_GRP',0,'GW');
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2035,'ELC_BIO_CCS_GRP',0,'GW');
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2040,'ELC_BIO_CCS_GRP',0,'GW');
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2045,'ELC_BIO_CCS_GRP',0,'GW');
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2050,'ELC_BIO_CCS_GRP',0,'GW');

INSERT INTO "MaxCapacityGroup" VALUES ('EU',2020,'HH2_PRD_ELCSYS_GRP',0.60,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2025,'HH2_PRD_ELCSYS_GRP',3.70,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2030,'HH2_PRD_ELCSYS_GRP',23.02,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2035,'HH2_PRD_ELCSYS_GRP',135.58,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2040,'HH2_PRD_ELCSYS_GRP',313.28,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2045,'HH2_PRD_ELCSYS_GRP',464.52,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2050,'HH2_PRD_ELCSYS_GRP',451.24,'GW');

INSERT INTO "MaxCapacityGroup" VALUES ('EU',2030,'HH2_PRD_CCS_GRP',0.05,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2035,'HH2_PRD_CCS_GRP',0.30,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2040,'HH2_PRD_CCS_GRP',1.86,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2045,'HH2_PRD_CCS_GRP',11.59,'GW');
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2050,'HH2_PRD_CCS_GRP',68.27,'GW');

INSERT INTO "MaxCapacityGroup" VALUES ('EU',2020,'ELC_STG_GRP',0.12,'GW'); -- European Commission, Recommendations on energy storage, 2023, https://energy.ec.europa.eu/topics/research-and-technology/energy-storage/recommendations-energy-storage_en
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2025,'ELC_STG_GRP',0.72,'GW'); -- European Commission, Recommendations on energy storage, 2023, https://energy.ec.europa.eu/topics/research-and-technology/energy-storage/recommendations-energy-storage_en
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2030,'ELC_STG_GRP',4.47,'GW'); -- European Commission, Recommendations on energy storage, 2023, https://energy.ec.europa.eu/topics/research-and-technology/energy-storage/recommendations-energy-storage_en
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2035,'ELC_STG_GRP',27.79,'GW'); -- European Commission, Recommendations on energy storage, 2023, https://energy.ec.europa.eu/topics/research-and-technology/energy-storage/recommendations-energy-storage_en
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2040,'ELC_STG_GRP',163.77,'GW'); -- European Commission, Recommendations on energy storage, 2023, https://energy.ec.europa.eu/topics/research-and-technology/energy-storage/recommendations-energy-storage_en
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2045,'ELC_STG_GRP',382.59,'GW'); -- European Commission, Recommendations on energy storage, 2023, https://energy.ec.europa.eu/topics/research-and-technology/energy-storage/recommendations-energy-storage_en
INSERT INTO "MaxCapacityGroup" VALUES ('EU',2050,'ELC_STG_GRP',598.80,'GW'); -- European Commission, Recommendations on energy storage, 2023, https://energy.ec.europa.eu/topics/research-and-technology/energy-storage/recommendations-energy-storage_en

--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2020,'ELC_STG_GRP',0,'GW');
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2025,'ELC_STG_GRP',0,'GW');
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2030,'ELC_STG_GRP',0,'GW');
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2035,'ELC_STG_GRP',0,'GW');
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2040,'ELC_STG_GRP',0,'GW');
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2045,'ELC_STG_GRP',0,'GW');
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2050,'ELC_STG_GRP',0,'GW');

--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2030,'ELC_NUC_FIS_GENIV_GRP',0.06,'GW');
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2035,'ELC_NUC_FIS_GENIV_GRP',0.34,'GW');
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2040,'ELC_NUC_FIS_GENIV_GRP',2.13,'GW');
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2045,'ELC_NUC_FIS_GENIV_GRP',13.24,'GW');
--INSERT INTO "MaxCapacityGroup" VALUES ('EU',2050,'ELC_NUC_FIS_GENIV_GRP',78.03,'GW');

CREATE TABLE "MinCapacityGroup" (
	"regions"	text,
	"periods"	integer,
	"group_name"	text,
	"min_cap_g"	real,
	"notes"	text,
	PRIMARY KEY("regions","periods","group_name")
);
INSERT INTO "MinCapacityGroup" VALUES ('EU',2010,'ELC_FOSSIL_OIL_GRP',42.30,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2015,'ELC_FOSSIL_OIL_GRP',38.88,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2020,'ELC_FOSSIL_OIL_GRP',38.05,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2010,'ELC_FOSSIL_COA_GRP',279.84,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2015,'ELC_FOSSIL_COA_GRP',261.51,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2020,'ELC_FOSSIL_COA_GRP',225.23,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2010,'ELC_FOSSIL_NGA_GRP',279.96,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2015,'ELC_FOSSIL_NGA_GRP',336.00,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2020,'ELC_FOSSIL_NGA_GRP',354.07,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2010,'ELC_HYD_GEN_GRP',141.92,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2015,'ELC_HYD_GEN_GRP',156.79,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2020,'ELC_HYD_GEN_GRP',166.50,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2010,'ELC_BIO_GRP',32.07,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2015,'ELC_BIO_GRP',42.23,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2020,'ELC_BIO_GRP',50.16,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2010,'ELC_GEO_GRP',1.50,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2015,'ELC_GEO_GRP',2.24,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2020,'ELC_GEO_GRP',3.43,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2010,'ELC_WIN_ON_GRP',85.78,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2015,'ELC_WIN_ON_GRP',136.14,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2020,'ELC_WIN_ON_GRP',190.25,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2010,'ELC_WIN_OFF_GRP',0.00,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2015,'ELC_WIN_OFF_GRP',10.84,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2020,'ELC_WIN_OFF_GRP',24.77,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2010,'ELC_SOL_PV_GRP',30.87,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2015,'ELC_SOL_PV_GRP',96.69,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2020,'ELC_SOL_PV_GRP',160.31,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2010,'ELC_SOL_CSP_GRP',0.00,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2015,'ELC_SOL_CSP_GRP',2.31,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2020,'ELC_SOL_CSP_GRP',2.32,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2010,'ELC_MAR_GRP',1.16,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2015,'ELC_MAR_GRP',1.19,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2020,'ELC_MAR_GRP',1.29,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2010,'ELC_NUC_FIS_GRP',130.96,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2015,'ELC_NUC_FIS_GRP',120.41,'GW');
INSERT INTO "MinCapacityGroup" VALUES ('EU',2020,'ELC_NUC_FIS_GRP',112.94,'GW');

CREATE TABLE "MaxInputGroup" (
	"regions"	      text,
	"periods"	      integer,
	"input_comm"	  text,
	"group_name" 	  text,
	"gi_max"	      real,
	"gi_max_notes"    text,
	FOREIGN KEY("group_name") REFERENCES "groups"("group_name"),
	FOREIGN KEY("input_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	PRIMARY KEY("regions","periods","input_comm","group_name")
);
INSERT INTO "MaxInputGroup" VALUES ('EU',2020,'ELC_CEN','ELC_FT_H2_GRP',0.06,'');
INSERT INTO "MaxInputGroup" VALUES ('EU',2050,'ELC_CEN','ELC_FT_H2_GRP',0.06,'');

INSERT INTO "MaxInputGroup" VALUES ('EU',2010,'OIL_CRD','ELC_FT_OIL_GRP',0.002,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxInputGroup" VALUES ('EU',2010,'OIL_DST','ELC_FT_OIL_GRP',0.450,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxInputGroup" VALUES ('EU',2010,'OIL_NSP','ELC_FT_OIL_GRP',0.005,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxInputGroup" VALUES ('EU',2010,'OIL_HFO','ELC_FT_OIL_GRP',0.890,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxInputGroup" VALUES ('EU',2010,'OIL_PTC','ELC_FT_OIL_GRP',0.031,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxInputGroup" VALUES ('EU',2010,'OIL_LPG','ELC_FT_OIL_GRP',0.001,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxInputGroup" VALUES ('EU',2010,'GAS_RFG','ELC_FT_OIL_GRP',0.007,'10.1016/j.fusengdes.2024.114679');
--INSERT INTO "MaxInputGroup" VALUES ('EU',2020,'BIO_DST','ELC_FT_OIL_GRP',0.100,'');
--INSERT INTO "MaxInputGroup" VALUES ('EU',2030,'BIO_DST','ELC_FT_OIL_GRP',0.200,'');

INSERT INTO "MaxInputGroup" VALUES ('EU',2050,'OIL_CRD','ELC_FT_OIL_GRP',0.002,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxInputGroup" VALUES ('EU',2050,'OIL_DST','ELC_FT_OIL_GRP',0.450,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxInputGroup" VALUES ('EU',2050,'OIL_NSP','ELC_FT_OIL_GRP',0.005,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxInputGroup" VALUES ('EU',2050,'OIL_HFO','ELC_FT_OIL_GRP',0.890,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxInputGroup" VALUES ('EU',2050,'OIL_PTC','ELC_FT_OIL_GRP',0.031,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxInputGroup" VALUES ('EU',2050,'OIL_LPG','ELC_FT_OIL_GRP',0.001,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxInputGroup" VALUES ('EU',2050,'GAS_RFG','ELC_FT_OIL_GRP',0.007,'10.1016/j.fusengdes.2024.114679');

INSERT INTO "MaxInputGroup" VALUES ('EU',2010,'COA_HCO','ELC_FT_COA_GRP',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxInputGroup" VALUES ('EU',2010,'COA_BCO','ELC_FT_COA_GRP',0.50,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxInputGroup" VALUES ('EU',2010,'GAS_BFG','ELC_FT_COA_GRP',0.015,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxInputGroup" VALUES ('EU',2010,'GAS_COG','ELC_FT_COA_GRP',0.004,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxInputGroup" VALUES ('EU',2010,'GAS_OXY','ELC_FT_COA_GRP',0.001,'10.1016/j.fusengdes.2024.114679');

INSERT INTO "MaxInputGroup" VALUES ('EU',2050,'COA_HCO','ELC_FT_COA_GRP',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxInputGroup" VALUES ('EU',2050,'COA_BCO','ELC_FT_COA_GRP',0.50,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxInputGroup" VALUES ('EU',2050,'GAS_BFG','ELC_FT_COA_GRP',0.015,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxInputGroup" VALUES ('EU',2050,'GAS_COG','ELC_FT_COA_GRP',0.004,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxInputGroup" VALUES ('EU',2050,'GAS_OXY','ELC_FT_COA_GRP',0.001,'10.1016/j.fusengdes.2024.114679');

--INSERT INTO "MaxInputGroup" VALUES ('EU',2010,'SYN_NGA','UPS_FT_NGA_GRP',0.00,'10.1016/j.apenergy.2023.121951');
--INSERT INTO "MaxInputGroup" VALUES ('EU',2030,'SYN_NGA','UPS_FT_NGA_GRP',0.05,'10.1016/j.apenergy.2023.121951');
--INSERT INTO "MaxInputGroup" VALUES ('EU',2050,'SYN_NGA','UPS_FT_NGA_GRP',1.00,'10.1016/j.apenergy.2023.121951');
INSERT INTO "MaxInputGroup" VALUES ('EU',2010,'BIO_GAS','UPS_FT_NGA_GRP',0.05,'10.1016/j.apenergy.2023.121951');
INSERT INTO "MaxInputGroup" VALUES ('EU',2020,'BIO_GAS','UPS_FT_NGA_GRP',0.20,'10.1016/j.apenergy.2023.121951');
INSERT INTO "MaxInputGroup" VALUES ('EU',2050,'BIO_GAS','UPS_FT_NGA_GRP',1.00,'10.1016/j.apenergy.2023.121951');
INSERT INTO "MaxInputGroup" VALUES ('EU',2020,'H2_BL','UPS_FT_NGA_GRP',0.01,'10.1016/j.apenergy.2023.121951');
INSERT INTO "MaxInputGroup" VALUES ('EU',2050,'H2_BL','UPS_FT_NGA_GRP',0.06,'10.1016/j.apenergy.2023.121951');

--INSERT INTO "MaxInputGroup" VALUES ('EU',2010,'SYN_NGA','H2_FT_NGA_GRP',0.00,'10.1016/j.apenergy.2023.121951');
--INSERT INTO "MaxInputGroup" VALUES ('EU',2030,'SYN_NGA','H2_FT_NGA_GRP',0.05,'10.1016/j.apenergy.2023.121951');
--INSERT INTO "MaxInputGroup" VALUES ('EU',2050,'SYN_NGA','H2_FT_NGA_GRP',1.00,'10.1016/j.apenergy.2023.121951');
INSERT INTO "MaxInputGroup" VALUES ('EU',2015,'BIO_GAS','H2_FT_NGA_GRP',0.16875,'10.1016/j.apenergy.2023.121951');
INSERT INTO "MaxInputGroup" VALUES ('EU',2020,'BIO_GAS','H2_FT_NGA_GRP',0.20,'10.1016/j.apenergy.2023.121951');
INSERT INTO "MaxInputGroup" VALUES ('EU',2050,'BIO_GAS','H2_FT_NGA_GRP',1.00,'10.1016/j.apenergy.2023.121951');
INSERT INTO "MaxInputGroup" VALUES ('EU',2020,'H2_BL','H2_FT_NGA_GRP',0.01,'10.1016/j.apenergy.2023.121951');
INSERT INTO "MaxInputGroup" VALUES ('EU',2050,'H2_BL','H2_FT_NGA_GRP',0.06,'10.1016/j.apenergy.2023.121951');

--INSERT INTO "MaxInputGroup" VALUES ('EU',2010,'SYN_NGA','ELC_FT_NGA_GRP',0.00,'10.1016/j.apenergy.2023.121951');
--INSERT INTO "MaxInputGroup" VALUES ('EU',2030,'SYN_NGA','ELC_FT_NGA_GRP',0.05,'10.1016/j.apenergy.2023.121951');
--INSERT INTO "MaxInputGroup" VALUES ('EU',2050,'SYN_NGA','ELC_FT_NGA_GRP',1.00,'10.1016/j.apenergy.2023.121951');
INSERT INTO "MaxInputGroup" VALUES ('EU',2010,'BIO_GAS','ELC_FT_NGA_GRP',0.05,'10.1016/j.apenergy.2023.121951');
INSERT INTO "MaxInputGroup" VALUES ('EU',2020,'BIO_GAS','ELC_FT_NGA_GRP',0.20,'10.1016/j.apenergy.2023.121951');
INSERT INTO "MaxInputGroup" VALUES ('EU',2050,'BIO_GAS','ELC_FT_NGA_GRP',1.00,'10.1016/j.apenergy.2023.121951');
INSERT INTO "MaxInputGroup" VALUES ('EU',2020,'H2_BL','ELC_FT_NGA_GRP',0.01,'10.1016/j.apenergy.2023.121951');
INSERT INTO "MaxInputGroup" VALUES ('EU',2050,'H2_BL','ELC_FT_NGA_GRP',0.06,'10.1016/j.apenergy.2023.121951');

INSERT INTO "MaxInputGroup" VALUES ('EU',2010,'ELC_HYD_DAM','ELC_HYD_GEN_GRP',0.900,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxInputGroup" VALUES ('EU',2050,'ELC_HYD_DAM','ELC_HYD_GEN_GRP',0.900,'10.1016/j.fusengdes.2024.114679');

--INSERT INTO "MaxInputGroup" VALUES ('EU',2010,'OIL_CRD_MIN','UPS_EXP_OIL_GRP',0.80,'');
--INSERT INTO "MaxInputGroup" VALUES ('EU',2025,'OIL_CRD_MIN','UPS_EXP_OIL_GRP',0.80,'');

INSERT INTO "MaxInputGroup" VALUES ('EU',2010,'GAS_LNG','EXP_NGA_GRP',0.06,'');
INSERT INTO "MaxInputGroup" VALUES ('EU',2050,'GAS_LNG','EXP_NGA_GRP',0.06,'');

CREATE TABLE "MinInputGroup" (
	"regions"	      text,
	"periods"	      integer,
	"input_comm"	  text,
	"group_name" 	  text,
	"gi_min"	      real,
	"gi_min_notes"    text,
	FOREIGN KEY("group_name") REFERENCES "group_name"("group_name"),
	FOREIGN KEY("input_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	PRIMARY KEY("regions","periods","input_comm","group_name")
);
INSERT INTO "MinInputGroup" VALUES ('EU',2010,'OIL_CRD_MIN','UPS_EXP_OIL_GRP',0.70,'');
INSERT INTO "MinInputGroup" VALUES ('EU',2050,'OIL_CRD_MIN','UPS_EXP_OIL_GRP',0.70,'');

INSERT INTO "MinInputGroup" VALUES ('EU',2010,'GAS_LNG','EXP_NGA_GRP',0.04,'');
INSERT INTO "MinInputGroup" VALUES ('EU',2050,'GAS_LNG','EXP_NGA_GRP',0.04,'');

--INSERT INTO "MinInputGroup" VALUES ('EU',2010,'BIO_GAS','UPS_FT_NGA_GRP',0.05,'');
--INSERT INTO "MinInputGroup" VALUES ('EU',2050,'BIO_GAS','UPS_FT_NGA_GRP',0.10,'');
--
--INSERT INTO "MinInputGroup" VALUES ('EU',2015,'BIO_GAS','H2_FT_NGA_GRP',0.05,'');
--INSERT INTO "MinInputGroup" VALUES ('EU',2050,'BIO_GAS','H2_FT_NGA_GRP',0.10,'');

-- Electricity sector
INSERT INTO "MinInputGroup" VALUES ('EU',2020,'ELC_CEN','ELC_FT_H2_GRP',0.06,'');
INSERT INTO "MinInputGroup" VALUES ('EU',2050,'ELC_CEN','ELC_FT_H2_GRP',0.06,'');

CREATE TABLE "MaxOutputGroup" (
	"regions"	      text,
	"periods"	      integer,
	"output_comm"	  text,
	"group_name" 	  text,
	"go_max"	      real,
	"go_max_notes"    text,
	FOREIGN KEY("group_name") REFERENCES "groups"("group_name"),
	FOREIGN KEY("output_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	PRIMARY KEY("regions","periods","output_comm","group_name")
);
INSERT INTO "MaxOutputGroup" VALUES ('EU',2010,'GAS_RFG','UPS_SEC_REF_FLX_GRP',0.50,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2010,'GAS_ETH','UPS_SEC_REF_FLX_GRP',0.50,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2010,'OIL_LPG','UPS_SEC_REF_FLX_GRP',0.50,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2010,'OIL_GSL','UPS_SEC_REF_FLX_GRP',0.50,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2010,'OIL_KER','UPS_SEC_REF_FLX_GRP',0.50,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2010,'OIL_DST','UPS_SEC_REF_FLX_GRP',0.50,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2010,'OIL_HFO','UPS_SEC_REF_FLX_GRP',0.50,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2010,'OIL_NAP','UPS_SEC_REF_FLX_GRP',0.50,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2010,'OIL_WSP','UPS_SEC_REF_FLX_GRP',0.50,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2010,'OIL_LUB','UPS_SEC_REF_FLX_GRP',0.50,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2010,'OIL_ASP','UPS_SEC_REF_FLX_GRP',0.50,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2010,'OIL_WAX','UPS_SEC_REF_FLX_GRP',0.50,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2010,'OIL_PTC','UPS_SEC_REF_FLX_GRP',0.50,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2050,'GAS_RFG','UPS_SEC_REF_FLX_GRP',0.50,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2050,'GAS_ETH','UPS_SEC_REF_FLX_GRP',0.50,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2050,'OIL_LPG','UPS_SEC_REF_FLX_GRP',0.50,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2050,'OIL_GSL','UPS_SEC_REF_FLX_GRP',0.50,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2050,'OIL_KER','UPS_SEC_REF_FLX_GRP',0.50,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2050,'OIL_DST','UPS_SEC_REF_FLX_GRP',0.50,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2050,'OIL_HFO','UPS_SEC_REF_FLX_GRP',0.50,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2050,'OIL_NAP','UPS_SEC_REF_FLX_GRP',0.50,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2050,'OIL_WSP','UPS_SEC_REF_FLX_GRP',0.50,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2050,'OIL_LUB','UPS_SEC_REF_FLX_GRP',0.50,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2050,'OIL_ASP','UPS_SEC_REF_FLX_GRP',0.50,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2050,'OIL_WAX','UPS_SEC_REF_FLX_GRP',0.50,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2050,'OIL_PTC','UPS_SEC_REF_FLX_GRP',0.50,'10.1016/j.fusengdes.2024.114679');

--INSERT INTO "MaxOutputGroup" VALUES ('EU',2010,'ELC_HYD_DAM','ELC_FT_HYD_GRP',0.950,'10.1016/j.fusengdes.2024.114679');
--INSERT INTO "MaxOutputGroup" VALUES ('EU',2010,'ELC_HYD_ROR','ELC_FT_HYD_GRP',0.100,'10.1016/j.fusengdes.2024.114679');
--INSERT INTO "MaxOutputGroup" VALUES ('EU',2050,'ELC_HYD_DAM','ELC_FT_HYD_GRP',0.950,'10.1016/j.fusengdes.2024.114679');
--INSERT INTO "MaxOutputGroup" VALUES ('EU',2050,'ELC_HYD_ROR','ELC_FT_HYD_GRP',0.100,'10.1016/j.fusengdes.2024.114679');

INSERT INTO "MaxOutputGroup" VALUES ('EU',2010,'ELC_DST','ELC_GEN_GRP',0.036,'');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2015,'ELC_DST','ELC_GEN_GRP',0.094,'');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2020,'ELC_DST','ELC_GEN_GRP',0.152,'');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2025,'ELC_DST','ELC_GEN_GRP',0.210,'');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2030,'ELC_DST','ELC_GEN_GRP',0.268,'');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2035,'ELC_DST','ELC_GEN_GRP',0.326,'');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2040,'ELC_DST','ELC_GEN_GRP',0.384,'');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2045,'ELC_DST','ELC_GEN_GRP',0.442,'');
INSERT INTO "MaxOutputGroup" VALUES ('EU',2050,'ELC_DST','ELC_GEN_GRP',0.500,'');

--INSERT INTO "MaxOutputGroup" VALUES ('EU',2010,'ELC_DST','ELC_GEN_GRP',0.036,'');
--INSERT INTO "MaxOutputGroup" VALUES ('EU',2015,'ELC_DST','ELC_GEN_GRP',0.047,'');
--INSERT INTO "MaxOutputGroup" VALUES ('EU',2020,'ELC_DST','ELC_GEN_GRP',0.061,'');
--INSERT INTO "MaxOutputGroup" VALUES ('EU',2025,'ELC_DST','ELC_GEN_GRP',0.079,'');
--INSERT INTO "MaxOutputGroup" VALUES ('EU',2030,'ELC_DST','ELC_GEN_GRP',0.103,'');
--INSERT INTO "MaxOutputGroup" VALUES ('EU',2035,'ELC_DST','ELC_GEN_GRP',0.134,'');
--INSERT INTO "MaxOutputGroup" VALUES ('EU',2040,'ELC_DST','ELC_GEN_GRP',0.174,'');
--INSERT INTO "MaxOutputGroup" VALUES ('EU',2045,'ELC_DST','ELC_GEN_GRP',0.226,'');
--INSERT INTO "MaxOutputGroup" VALUES ('EU',2050,'ELC_DST','ELC_GEN_GRP',0.294,'');

--INSERT INTO "MaxOutputGroup" VALUES ('EU',2010,'ELC_CEN','ELC_SOL_PV_GRP',1-0.40,'');
--INSERT INTO "MaxOutputGroup" VALUES ('EU',2020,'ELC_CEN','ELC_SOL_PV_GRP',1-0.40,'');
--INSERT INTO "MaxOutputGroup" VALUES ('EU',2025,'ELC_CEN','ELC_SOL_PV_GRP',1-0.50,'');
--INSERT INTO "MaxOutputGroup" VALUES ('EU',2050,'ELC_CEN','ELC_SOL_PV_GRP',1-0.50,'');

CREATE TABLE "MinOutputGroup" (
	"regions"	      text,
	"periods"	      integer,
	"output_comm"	  text,
	"group_name" 	  text,
	"go_min"	      real,
	"go_min_notes"    text,
	FOREIGN KEY("group_name") REFERENCES "groups"("group_name"),
	FOREIGN KEY("output_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	PRIMARY KEY("regions","periods","output_comm","group_name")
);

CREATE TABLE "LifetimeTech" (
	"regions"	text,
	"tech"	text,
	"life"	real,
	"life_notes"	text,
	PRIMARY KEY("regions","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
-- Micro-CHP
INSERT INTO "LifetimeTech" VALUES ('IT','COM_CHP_NGA_CI_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_CHP_SLB_CI_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_CHP_NGA_SOFC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','COM_CHP_H2_PEMFC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CHP_NGA_CI_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CHP_NGA_TV_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('IT','IND_CHP_BLQ_CI_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_CHP_NGA_CI_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_CHP_NGA_STR_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_CHP_NGA_SOFC_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('IT','RES_CHP_H2_PEMFC_N',20,'');
-- Upstream sector
INSERT INTO "LifetimeTech" VALUES ('EU','UPS_SEC_L2G_ON',50,'');
INSERT INTO "LifetimeTech" VALUES ('EU','UPS_SEC_L2G_OFF',50,'');
INSERT INTO "LifetimeTech" VALUES ('EU','UPS_HET_GAS_NGA',35,'');
INSERT INTO "LifetimeTech" VALUES ('EU','UPS_HET_OIL_RPP',35,'');
INSERT INTO "LifetimeTech" VALUES ('EU','UPS_HET_OIL_RPG',35,'');
INSERT INTO "LifetimeTech" VALUES ('EU','UPS_SEC_REF_FDS',35,'');
INSERT INTO "LifetimeTech" VALUES ('EU','UPS_SEC_REF_FLX',35,'');
INSERT INTO "LifetimeTech" VALUES ('EU','BIO_REF1_CRUSHING_E',50,'');
INSERT INTO "LifetimeTech" VALUES ('EU','BIO_REF1_TRANSESTER_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('EU','BIO_REF1_ETHAMIDE_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('EU','BIO_REF1_ETHSUG_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('EU','BIO_REF1_HVO_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('EU','BIO_REF2_ETH_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('EU','BIO_REF2_DST_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('EU','BIO_REF2_KER_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('EU','BIO_REF2_ETH_CCS_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('EU','BIO_REF2_DST_CCS_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('EU','BIO_REF2_KER_CCS_N',20,'');
-- Hydrogen
INSERT INTO "LifetimeTech" VALUES ('EU','H2_SR_NGA',20,'10.1016/j.apenergy.2023.121951');
INSERT INTO "LifetimeTech" VALUES ('EU','H2_GS_COA',20,'10.1016/j.apenergy.2023.121951');
INSERT INTO "LifetimeTech" VALUES ('EU','H2_PO_OIL',25,'10.1016/j.apenergy.2023.121951');
INSERT INTO "LifetimeTech" VALUES ('EU','H2_SR_BIO',20,'10.1016/j.apenergy.2023.121951');
INSERT INTO "LifetimeTech" VALUES ('EU','H2_GS_BIO',20,'10.1016/j.apenergy.2023.121951');
INSERT INTO "LifetimeTech" VALUES ('EU','H2_SR_ETH',10,'10.1016/j.apenergy.2023.121951');
INSERT INTO "LifetimeTech" VALUES ('EU','H2_BL_DMY',30,'10.1016/j.apenergy.2023.121951');
-- CCUS
INSERT INTO "LifetimeTech" VALUES ('EU','CCUS_H2_SR_NGA',20,'10.1016/j.apenergy.2023.121951');
INSERT INTO "LifetimeTech" VALUES ('EU','CCUS_H2_SR_NGA_LINKED',20,'10.1016/j.apenergy.2023.121951');
INSERT INTO "LifetimeTech" VALUES ('EU','CCUS_H2_GS_COA',20,'10.1016/j.apenergy.2023.121951');
INSERT INTO "LifetimeTech" VALUES ('EU','CCUS_H2_GS_COA_LINKED',20,'10.1016/j.apenergy.2023.121951');
INSERT INTO "LifetimeTech" VALUES ('EU','CCUS_H2_GS_BIO',20,'10.1016/j.apenergy.2023.121951');
INSERT INTO "LifetimeTech" VALUES ('EU','CCUS_H2_GS_BIO_LINKED',20,'10.1016/j.apenergy.2023.121951');
INSERT INTO "LifetimeTech" VALUES ('EU','CCUS_ELC_COA',30,'NREL');
INSERT INTO "LifetimeTech" VALUES ('EU','CCUS_ELC_COA_LINKED',30,'NREL');
INSERT INTO "LifetimeTech" VALUES ('EU','CCUS_ELC_NGA',30,'NREL');
INSERT INTO "LifetimeTech" VALUES ('EU','CCUS_ELC_NGA_LINKED',30,'NREL');
INSERT INTO "LifetimeTech" VALUES ('EU','CCUS_DAC',25,'10.5281/zenodo.3544900');
INSERT INTO "LifetimeTech" VALUES ('EU','SF_NGA_METH',25,'10.5281/zenodo.3544900');
INSERT INTO "LifetimeTech" VALUES ('EU','SF_DST_HYDR',20,'10.5281/zenodo.3544900');
INSERT INTO "LifetimeTech" VALUES ('EU','SF_DST_COELC',20,'10.5281/zenodo.3544900');
INSERT INTO "LifetimeTech" VALUES ('EU','SF_KER_HYDR',20,'10.5281/zenodo.3544900');
INSERT INTO "LifetimeTech" VALUES ('EU','SF_KER_COELC',20,'10.5281/zenodo.3544900');
INSERT INTO "LifetimeTech" VALUES ('EU','SF_DSTKER_DAC',20,'10.5281/zenodo.3544900');
INSERT INTO "LifetimeTech" VALUES ('EU','SF_MEOH_HYDR',20,'10.5281/zenodo.3544900');
INSERT INTO "LifetimeTech" VALUES ('EU','SF_MEOH_COELC',20,'10.5281/zenodo.3544900');
INSERT INTO "LifetimeTech" VALUES ('EU','SF_MEOH_DAC',20,'10.5281/zenodo.3544900');
INSERT INTO "LifetimeTech" VALUES ('EU','SEQ_REM_EOR_ONS_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('EU','SEQ_REM_EOR_OFF_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('EU','SEQ_REM_DOF_ONS_N',10,'');
--INSERT INTO "LifetimeTech" VALUES ('EU','SEQ_REM_DGF_ONS_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('EU','SEQ_REM_DOF_OFF_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('EU','SEQ_REM_DGF_OFF_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('EU','SEQ_REM_ECB_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('EU','SEQ_REM_ECB_DEEP_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('EU','SEQ_REM_DSA_ONS_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('EU','SEQ_REM_DSA_OFF_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('EU','SEQ_REM_DOC_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('EU','SEQ_REM_MIN_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('EU','SEQ_REM_AFF_N',10,'');
INSERT INTO "LifetimeTech" VALUES ('EU','SEQ_REM_CO2_BKS_N',10,'');
-- Electricity sector
-- Fuel technologies
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_FT_H2',20,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_OIL_E',35,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_NGA_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_COA_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_BIO_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_HYD_PUM_E',50,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_HYD_GEN_E',40,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_NUC_FIS_E',50,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_GEO_E',40,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_WIN_E',15,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_SOL_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_MAR_E',20,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_CHP_OIL_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_CHP_NGA_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_CHP_COA_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_CHP_BIO_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_CHP_GEO_E',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','HET_OIL_E',35,'');
INSERT INTO "LifetimeTech" VALUES ('EU','HET_NGA_E',35,'');
INSERT INTO "LifetimeTech" VALUES ('EU','HET_COA_E',35,'');
INSERT INTO "LifetimeTech" VALUES ('EU','HET_BIO_E',35,'');
INSERT INTO "LifetimeTech" VALUES ('EU','HET_GEO_E',35,'');
INSERT INTO "LifetimeTech" VALUES ('EU','HET_SOL_E',35,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_COA_PUL_N',40,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_COA_CCO_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_COA_PFB_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_OIL_MIX_TUR_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_OIL_MIX_CCY_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_NGA_CCY_ADV_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_NGA_FCE_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_NUC_FIS_LWR_N',70,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_NUC_FIS_EPR_N',70,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_NUC_FIS_FR_N',70,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_NUC_FIS_ABWR_N',70,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_NUC_FIS_ADS_TRU_N',70,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_NUC_FIS_ADS_MA_N',70,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_OIL_GBL_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_OIL_GPL_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_BIO_GSF_CEN_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_BIO_COM_CEN_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_BIO_GSF_DEC_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_BIO_COM_DEC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_BIO_GAS_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_BIO_CRP_GSF_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_BIO_CRP_COM_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_BIO_MUN_INC_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_HYD_GEN_DAM_N',70,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_HYD_GEN_RUN_N',40,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_GEO_FLS_N',40,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_GEO_BNY_N',40,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_GEO_BNY_HIG_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_WIN_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_WIN_OFF_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_SOL_PV_CEN_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_SOL_PV_DST_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_MAR_WAV_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_MAR_TDL_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('EU','HET_NGA_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','HET_OIL_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','HET_BIO_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','HET_COA_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','HET_GEO_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('EU','HET_SOL_N',20,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_CHP_NGA_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_CHP_COA_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_CHP_BIO_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_SOL_CSP_1_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_SOL_CSP_2_N',25,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_SOL_CSP_3_N',40,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_SOL_CSP_4_N',40,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_HYD_PUM_N',50,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_HH2_PEMFC_N',15,'');
---- Sequestration technologies
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_COA_CCO_IG_CCS_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_COA_CCO_FG_CCS_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_COA_PUL_FG_CCS_N',40,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_NGA_FG_CCS_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_NGA_SOFC_CCS_N',15,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_BIO_CRP_GSF_CCS_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_BIO_CRP_COM_CCS_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_BIO_GSF_CCS_N',30,'');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_BIO_COM_CCS_N',30,'');
---- Storage technologies
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_STG_CEN_BTT_N',15,'10.25984/1871952');
INSERT INTO "LifetimeTech" VALUES ('EU','ELC_STG_DST_BTT_N',15,'10.25984/1871952');
-- Import/Export
INSERT INTO "LifetimeTech" VALUES ('EU','UPS_IMP_ELC_AFR',10,'');
INSERT INTO "LifetimeTech" VALUES ('EU','UPS_IMP_ELC_OEE',10,'');
INSERT INTO "LifetimeTech" VALUES ('EU','UPS_IMP_ELC_RUS',10,'');
INSERT INTO "LifetimeTech" VALUES ('EU','UPS_IMP_ELC_MEA',10,'');
INSERT INTO "LifetimeTech" VALUES ('EU','UPS_IMP_ELC_CAC',10,'');

CREATE TABLE "LifetimeProcess" (
	"regions"	text,
	"tech"	text,
	"vintage"	integer,
	"life_process"	real,
	"life_process_notes"	text,
	PRIMARY KEY("regions","tech","vintage"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
-- Micro-CHP
INSERT INTO "LifetimeProcess" VALUES ('IT','COM_CHP_NGA_MICRO_N',2007,12,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','COM_CHP_NGA_MICRO_N',2014,13,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','COM_CHP_NGA_MICRO_N',2022,16,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','COM_CHP_NGA_MICRO_N',2030,20,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','COM_CHP_NGA_CC_N',2007,15,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','COM_CHP_NGA_CC_N',2014,18,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','COM_CHP_NGA_CC_N',2022,20,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','COM_CHP_NGA_CC_N',2030,20,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','RES_CHP_NGA_MICRO_N',2007,12,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','RES_CHP_NGA_MICRO_N',2014,13,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','RES_CHP_NGA_MICRO_N',2022,16,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','RES_CHP_NGA_MICRO_N',2030,20,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','RES_CHP_NGA_CC_N',2007,15,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','RES_CHP_NGA_CC_N',2014,18,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','RES_CHP_NGA_CC_N',2022,20,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','IND_CHP_NGA_TG_N',2007,20,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','IND_CHP_NGA_TG_N',2014,22,'');
INSERT INTO "LifetimeProcess" VALUES ('IT','IND_CHP_NGA_TG_N',2030,25,'');
-- Hydrogen
INSERT INTO "LifetimeProcess" VALUES ('EU','H2_EL_ALK',2020,8,'');
INSERT INTO "LifetimeProcess" VALUES ('EU','H2_EL_ALK',2030,11,'');
INSERT INTO "LifetimeProcess" VALUES ('EU','H2_EL_ALK',2050,14,'');
INSERT INTO "LifetimeProcess" VALUES ('EU','H2_EL_PEM',2020,7,'');
INSERT INTO "LifetimeProcess" VALUES ('EU','H2_EL_PEM',2030,8,'');
INSERT INTO "LifetimeProcess" VALUES ('EU','H2_EL_PEM',2050,14,'');
INSERT INTO "LifetimeProcess" VALUES ('EU','H2_EL_SOEC',2020,2,'');
INSERT INTO "LifetimeProcess" VALUES ('EU','H2_EL_SOEC',2030,5,'');
INSERT INTO "LifetimeProcess" VALUES ('EU','H2_EL_SOEC',2050,10,'');
INSERT INTO "LifetimeProcess" VALUES ('EU','H2_EL_AEM',2050,10,'');

-- Controllare bilanci EUROSTAT versione excel
CREATE TABLE "Efficiency" (
	"regions"	text,
	"input_comm"	text,
	"tech"	text,
	"vintage"	integer,
	"output_comm"	text,
	"efficiency"	real CHECK("efficiency" > 0),
	"eff_notes"	text,
	PRIMARY KEY("regions","input_comm","tech","vintage","output_comm"),
	FOREIGN KEY("output_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("input_comm") REFERENCES "commodities"("comm_name")
);
-- Import, mining and primary renewable resources
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_ELC_AFR',2005,'ELC_CEN',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_ELC_OEE',2005,'ELC_CEN',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_ELC_RUS',2005,'ELC_CEN',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_ELC_MEA',2010,'ELC_CEN',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_ELC_CAC',2050,'ELC_CEN',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_OIL_USA',2005,'OIL_CRD_MIN',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_OIL_CAN',2005,'OIL_CRD_MIN',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_OIL_MEX',2005,'OIL_CRD_MIN',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_OIL_OLA',2005,'OIL_CRD_MIN',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_OIL_BRA',2005,'OIL_CRD_MIN',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_OIL_RUS',2005,'OIL_CRD_MIN',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_OIL_MEA',2005,'OIL_CRD_MIN',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_OIL_AFR',2005,'OIL_CRD_MIN',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_OIL_CHI',2005,'OIL_CRD_MIN',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_OIL_JPN',2010,'OIL_CRD_MIN',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_OIL_ODA',2005,'OIL_CRD_MIN',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_OIL_FEE',2005,'OIL_FEE',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','OIL_CRD_MIN','UPS_EXP_OIL',2005,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','OIL_OBI_MIN','UPS_EXP_OIL',2005,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_GAS_PIP_AFR',2005,'GAS_NGA',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_GAS_PIP_RUS',2005,'GAS_NGA',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_GAS_PIP_CAC',2005,'GAS_NGA',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_GAS_PIP_MEA',2030,'GAS_NGA',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA','UPS_EXP_GAS',2005,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','GAS_LNG','UPS_EXP_GAS',2005,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_GAS_LNG_AFR',2005,'GAS_LNG',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_GAS_LNG_MEA',2005,'GAS_LNG',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_GAS_LNG_GLB',2010,'GAS_LNG',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_GAS_LNG_OLA',2005,'GAS_LNG',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_GAS_LNG_USA',2010,'GAS_LNG',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_GAS_LNG_RUS',2020,'GAS_LNG',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_H2',2025,'H2',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_COA_AFR',2005,'COA_HCO',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_COA_CAC',2010,'COA_HCO',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_COA_AUS',2005,'COA_HCO',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_COA_CAN',2005,'COA_HCO',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_COA_OEE',2005,'COA_HCO',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_COA_RUS',2005,'COA_HCO',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_COA_ODA',2005,'COA_HCO',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_COA_USA',2005,'COA_HCO',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_COA_OLA',2005,'COA_HCO',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','COA_BCO_MIN','UPS_EXP_COA',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','COA_HCO_MIN','UPS_EXP_COA',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_BIO_DST',2005,'BIO_DST',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_BIO_WOD',2005,'BIO_WOD',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_BIO_ETH',2005,'BIO_ETH',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_BIO_OIL',2010,'BIO_OIL',1.00,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_BIO_SUG',2010,'BIO_SUG',1.00,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_IMP_BIO_ISOBUT',2010,'BIO_ISOBUTYL',1.00,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_LOC_HOIL_1',2005,'OIL_CRD_MIN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_LOC_HOIL_2',2005,'OIL_CRD_MIN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_LOC_HOIL_3',2005,'OIL_CRD_MIN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_GRO_HOIL_1',2005,'OIL_CRD_MIN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_GRO_HOIL_2',2005,'OIL_CRD_MIN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_GRO_HOIL_3',2005,'OIL_CRD_MIN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_DIS_HOIL_1',2005,'OIL_CRD_MIN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_DIS_HOIL_2',2005,'OIL_CRD_MIN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_DIS_HOIL_3',2005,'OIL_CRD_MIN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_LOC_HSAN_1',2005,'OIL_OBI_MIN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_LOC_HSAN_2',2005,'OIL_OBI_MIN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_LOC_HSAN_3',2005,'OIL_OBI_MIN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_REC_HSAN_1',2005,'OIL_OBI_MIN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_REC_HSAN_2',2005,'OIL_OBI_MIN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_REC_HSAN_3',2005,'OIL_OBI_MIN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_LOC_NGA_1',2005,'GAS_NGA_MIN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_LOC_NGA_2',2005,'GAS_NGA_MIN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_LOC_NGA_3',2005,'GAS_NGA_MIN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_GRO_NGA_1',2005,'GAS_NGA_MIN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_GRO_NGA_2',2005,'GAS_NGA_MIN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_GRO_NGA_3',2005,'GAS_NGA_MIN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_DIS_NGA_1',2005,'GAS_NGA_MIN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_DIS_NGA_2',2005,'GAS_NGA_MIN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_DIS_NGA_3',2005,'GAS_NGA_MIN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_LOC_BCO',2005,'COA_BCO_MIN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_DIS_BCO',2005,'COA_BCO_MIN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_LOC_HCO',2005,'COA_HCO_MIN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_DIS_HCO',2005,'COA_HCO_MIN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_HYD_POT',2010,'HYD',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_GEO_POT',2010,'GEO',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_SOL_PV_POT',2010,'SOL_PV',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_SOL_TH_POT',2010,'SOL_TH',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_SOL_CSP_POT',2010,'SOL_CSP',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_TDL_POT',2010,'TDL',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_WAV_POT',2010,'WAV',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_WIN_ON_POT',2010,'WIN_ON',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_WIN_OFF_POT',2010,'WIN_OFF',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_BIO_RPS_POT',2005,'BIO_RPS',1.00,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_BIO_CRP_STC_POT',2005,'BIO_STC',1.00,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_BIO_CRP_SUG_POT',2005,'BIO_SUG',1.00,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_BIO_CRP_GRS_POT',2010,'BIO_GRS',1.00,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_BIO_CRP_WOD_1_POT',2010,'BIO_WOD',1.00,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_BIO_CRP_WOD_2_POT',2010,'BIO_WOD',1.00,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_BIO_AGR_WST_POT',2005,'BIO_WOD',1.00,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_BIO_FOR_1_POT',2010,'BIO_WOD',1.00,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_BIO_FOR_2_POT',2005,'BIO_WOD',1.00,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_BIO_WOD_RES_1_POT',2005,'BIO_WOD',1.00,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_BIO_WOD_RES_2_POT',2005,'BIO_WOD',1.00,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_BIO_WOD_PRD_1_POT',2005,'BIO_WOD',1.00,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_BIO_WOD_PRD_2_POT',2010,'BIO_WOD',1.00,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_BIO_MUN_POT',2005,'BIO_MUN',1.00,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_BIO_SLU_POT',2005,'BIO_SLU',1.00,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_BIO_GAS_POT',2005,'BIO_GAS',1.00,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_BIO_LIQ_POT',2010,'BIO_LIQ',1.00,'10.5281/zenodo.3544900');
-- Upstream sector
-- Fuel technologies
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA','UPS_FT_NGA',2010,'UPS_NGA',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','SYN_NGA','UPS_FT_NGA',2010,'UPS_NGA',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','BIO_GAS','UPS_FT_NGA',2010,'UPS_NGA',0.50,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','H2_BL','UPS_FT_NGA',2020,'UPS_NGA',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_GSL','UPS_FT_OIL_RPP',2010,'UPS_OIL_LIQ',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_DST','UPS_FT_OIL_RPP',2010,'UPS_OIL_LIQ',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_HFO','UPS_FT_OIL_RPP',2010,'UPS_OIL_LIQ',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_NAP','UPS_FT_OIL_RPP',2010,'UPS_OIL_LIQ',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_NSP','UPS_FT_OIL_RPP',2010,'UPS_OIL_LIQ',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_PTC','UPS_FT_OIL_RPP',2010,'UPS_OIL_LIQ',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_RFG','UPS_FT_OIL_RPG',2010,'UPS_OIL_GAS',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_LPG','UPS_FT_OIL_RPG',2010,'UPS_OIL_GAS',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_CEN','UPS_FT_ELC',2010,'UPS_ELC',0.95,'10.1016/j.fusengdes.2024.114679');
-- Primary production
INSERT INTO "Efficiency" VALUES ('EU','OIL_CRD_MIN','UPS_PRI_HFO_1_E',2005,'OIL_CRD_PRI',0.9825,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','UPS_PRI_HFO_1_E',2005,'OIL_CRD_PRI',0.9825,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_CRD_MIN','UPS_PRI_HFO_2_E',2005,'OIL_CRD_PRI',0.9825,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','UPS_PRI_HFO_2_E',2005,'OIL_CRD_PRI',0.9825,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_CRD_MIN','UPS_PRI_HFO_3_E',2005,'OIL_CRD_PRI',0.9825,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','UPS_PRI_HFO_3_E',2005,'OIL_CRD_PRI',0.9825,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_OBI_MIN','UPS_PRI_HOIL_E',2005,'OIL_CRDU',0.8729,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_CRD','UPS_PRI_HOIL_E',2005,'OIL_CRDU',0.8729,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_LIQ','UPS_PRI_HOIL_E',2005,'OIL_CRDU',0.8729,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','UPS_PRI_HOIL_E',2005,'OIL_CRDU',0.8729,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_NCR','UPS_PRI_MIX_OIL_CRD_E',2010,'OIL_CRD',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_CRD_PRI','UPS_PRI_MIX_OIL_CRD_E',2010,'OIL_CRD',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_CRDU','UPS_PRI_MIX_OIL_CRD_E',2010,'OIL_CRD',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA_MIN','UPS_PRI_FIP_NGA_1_E',2005,'GAS_NGA',1.0134,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_LIQ','UPS_PRI_FIP_NGA_1_E',2005,'GAS_NGA',1.0134,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','UPS_PRI_FIP_NGA_1_E',2005,'GAS_NGA',1.0134,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA_MIN','UPS_PRI_FIP_NGA_1_E',2005,'GAS_LNG',1.0134,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_LIQ','UPS_PRI_FIP_NGA_1_E',2005,'GAS_LNG',1.0134,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','UPS_PRI_FIP_NGA_1_E',2005,'GAS_LNG',1.0134,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA_MIN','UPS_PRI_FIP_NGA_2_E',2005,'GAS_NGA',1.0134,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_LIQ','UPS_PRI_FIP_NGA_2_E',2005,'GAS_NGA',1.0134,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','UPS_PRI_FIP_NGA_2_E',2005,'GAS_NGA',1.0134,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA_MIN','UPS_PRI_FIP_NGA_2_E',2005,'GAS_LNG',1.0134,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_LIQ','UPS_PRI_FIP_NGA_2_E',2005,'GAS_LNG',1.0134,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','UPS_PRI_FIP_NGA_2_E',2005,'GAS_LNG',1.0134,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','COA_HCO_MIN','UPS_PRI_COA_HCO_E',2005,'COA_HCO',0.9600,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','UPS_PRI_COA_HCO_E',2005,'COA_HCO',0.9600,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_HET','UPS_PRI_COA_HCO_E',2005,'COA_HCO',0.9600,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','COA_BCO_MIN','UPS_PRI_COA_BCO_E',2005,'COA_BCO',0.9600,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','UPS_PRI_COA_BCO_E',2005,'COA_BCO',0.9600,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_HET','UPS_PRI_COA_BCO_E',2005,'COA_BCO',0.9600,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_CRD','UPS_PRI_ADD_E',2005,'OIL_ADD',1.00,'10.1016/j.fusengdes.2024.114679');
---- Secondary transformation
INSERT INTO "Efficiency" VALUES ('EU','GAS_LNG','UPS_SEC_L2G_ON',2005,'GAS_NGA',0.98,'');
INSERT INTO "Efficiency" VALUES ('EU','GAS_LNG','UPS_SEC_L2G_OFF',2010,'GAS_NGA',0.98,'');
INSERT INTO "Efficiency" VALUES ('EU','COA_HCO','UPS_SEC_COA_OVC',2005,'COA_OVC',0.820,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_PTC','UPS_SEC_COA_OVC',2005,'COA_OVC',0.820,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA','UPS_SEC_COA_OVC',2005,'COA_OVC',0.820,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','COA_BCO','UPS_SEC_COA_OVC',2005,'COA_OVC',0.820,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_LIQ','UPS_SEC_COA_OVC',2005,'COA_OVC',0.820,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_GAS','UPS_SEC_COA_OVC',2005,'COA_OVC',0.820,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','UPS_SEC_COA_OVC',2005,'COA_OVC',0.820,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_HET','UPS_SEC_COA_OVC',2005,'COA_OVC',0.820,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','COA_HCO','UPS_SEC_COA_OVC',2005,'GAS_COG',0.820,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_PTC','UPS_SEC_COA_OVC',2005,'GAS_COG',0.820,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA','UPS_SEC_COA_OVC',2005,'GAS_COG',0.820,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','COA_BCO','UPS_SEC_COA_OVC',2005,'GAS_COG',0.820,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_LIQ','UPS_SEC_COA_OVC',2005,'GAS_COG',0.820,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_GAS','UPS_SEC_COA_OVC',2005,'GAS_COG',0.820,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','UPS_SEC_COA_OVC',2005,'GAS_COG',0.820,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_HET','UPS_SEC_COA_OVC',2005,'GAS_COG',0.820,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','COA_BCO','UPS_SEC_GAS_TWN',2005,'GAS_GWG',0.355,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA','UPS_SEC_GAS_TWN',2005,'GAS_GWG',0.355,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_LPG','UPS_SEC_GAS_TWN',2005,'GAS_GWG',0.355,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_DST','UPS_SEC_GAS_TWN',2005,'GAS_GWG',0.355,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','UPS_SEC_GAS_TWN',2005,'GAS_GWG',0.355,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_HET','UPS_SEC_GAS_TWN',2005,'GAS_GWG',0.355,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','COA_HCO','UPS_SEC_GAS_BFG',2005,'GAS_BFG',0.386,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','COA_OVC','UPS_SEC_GAS_BFG',2005,'GAS_BFG',0.386,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_COG','UPS_SEC_GAS_BFG',2005,'GAS_BFG',0.386,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA','UPS_SEC_GAS_BFG',2005,'GAS_BFG',0.386,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_HFO','UPS_SEC_GAS_BFG',2005,'GAS_BFG',0.386,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','COA_HCO','UPS_SEC_GAS_BFG',2005,'GAS_OXY',0.386,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','COA_OVC','UPS_SEC_GAS_BFG',2005,'GAS_OXY',0.386,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_COG','UPS_SEC_GAS_BFG',2005,'GAS_OXY',0.386,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA','UPS_SEC_GAS_BFG',2005,'GAS_OXY',0.386,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_HFO','UPS_SEC_GAS_BFG',2005,'GAS_OXY',0.386,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_RFG','UPS_SEC_REF_FDS',2005,'OIL_FEE',0.984,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_ETH','UPS_SEC_REF_FDS',2005,'OIL_FEE',0.984,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_LPG','UPS_SEC_REF_FDS',2005,'OIL_FEE',0.984,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_GSL','UPS_SEC_REF_FDS',2005,'OIL_FEE',0.984,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_KER','UPS_SEC_REF_FDS',2005,'OIL_FEE',0.984,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_DST','UPS_SEC_REF_FDS',2005,'OIL_FEE',0.984,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_HFO','UPS_SEC_REF_FDS',2005,'OIL_FEE',0.984,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_NAP','UPS_SEC_REF_FDS',2005,'OIL_FEE',0.984,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_NSP','UPS_SEC_REF_FDS',2005,'OIL_FEE',0.984,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','COA_HCO','UPS_SEC_LIQ',2005,'OIL_NCR',0.746,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','COA_HCO','UPS_SEC_LIQ',2005,'OIL_ADD',0.746,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA','UPS_SEC_LIQ',2005,'OIL_NCR',0.746,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA','UPS_SEC_LIQ',2005,'OIL_ADD',0.746,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA','UPS_SEC_TRA',2005,'OIL_NCR',0.0195,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_LIQ','UPS_SEC_TRA',2005,'OIL_NCR',0.0195,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','UPS_SEC_TRA',2005,'OIL_NCR',0.0195,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_HET','UPS_SEC_TRA',2005,'OIL_NCR',0.0195,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_CRD','UPS_SEC_REF_FLX',2005,'GAS_RFG',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_FEE','UPS_SEC_REF_FLX',2005,'GAS_RFG',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_ADD','UPS_SEC_REF_FLX',2005,'GAS_RFG',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_LNG','UPS_SEC_REF_FLX',2005,'GAS_RFG',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA','UPS_SEC_REF_FLX',2005,'GAS_RFG',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_LIQ','UPS_SEC_REF_FLX',2005,'GAS_RFG',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_GAS','UPS_SEC_REF_FLX',2005,'GAS_RFG',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','UPS_SEC_REF_FLX',2005,'GAS_RFG',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_HET','UPS_SEC_REF_FLX',2005,'GAS_RFG',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_CRD','UPS_SEC_REF_FLX',2005,'GAS_ETH',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_FEE','UPS_SEC_REF_FLX',2005,'GAS_ETH',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_ADD','UPS_SEC_REF_FLX',2005,'GAS_ETH',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_LNG','UPS_SEC_REF_FLX',2005,'GAS_ETH',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA','UPS_SEC_REF_FLX',2005,'GAS_ETH',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_LIQ','UPS_SEC_REF_FLX',2005,'GAS_ETH',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_GAS','UPS_SEC_REF_FLX',2005,'GAS_ETH',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','UPS_SEC_REF_FLX',2005,'GAS_ETH',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_HET','UPS_SEC_REF_FLX',2005,'GAS_ETH',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_CRD','UPS_SEC_REF_FLX',2005,'OIL_LPG',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_FEE','UPS_SEC_REF_FLX',2005,'OIL_LPG',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_ADD','UPS_SEC_REF_FLX',2005,'OIL_LPG',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_LNG','UPS_SEC_REF_FLX',2005,'OIL_LPG',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA','UPS_SEC_REF_FLX',2005,'OIL_LPG',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_LIQ','UPS_SEC_REF_FLX',2005,'OIL_LPG',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_GAS','UPS_SEC_REF_FLX',2005,'OIL_LPG',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','UPS_SEC_REF_FLX',2005,'OIL_LPG',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_HET','UPS_SEC_REF_FLX',2005,'OIL_LPG',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_CRD','UPS_SEC_REF_FLX',2005,'OIL_GSL',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_FEE','UPS_SEC_REF_FLX',2005,'OIL_GSL',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_ADD','UPS_SEC_REF_FLX',2005,'OIL_GSL',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_LNG','UPS_SEC_REF_FLX',2005,'OIL_GSL',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA','UPS_SEC_REF_FLX',2005,'OIL_GSL',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_LIQ','UPS_SEC_REF_FLX',2005,'OIL_GSL',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_GAS','UPS_SEC_REF_FLX',2005,'OIL_GSL',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','UPS_SEC_REF_FLX',2005,'OIL_GSL',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_HET','UPS_SEC_REF_FLX',2005,'OIL_GSL',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_CRD','UPS_SEC_REF_FLX',2005,'OIL_KER',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_FEE','UPS_SEC_REF_FLX',2005,'OIL_KER',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_ADD','UPS_SEC_REF_FLX',2005,'OIL_KER',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_LNG','UPS_SEC_REF_FLX',2005,'OIL_KER',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA','UPS_SEC_REF_FLX',2005,'OIL_KER',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_LIQ','UPS_SEC_REF_FLX',2005,'OIL_KER',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_GAS','UPS_SEC_REF_FLX',2005,'OIL_KER',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','UPS_SEC_REF_FLX',2005,'OIL_KER',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_HET','UPS_SEC_REF_FLX',2005,'OIL_KER',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_CRD','UPS_SEC_REF_FLX',2005,'OIL_DST',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_FEE','UPS_SEC_REF_FLX',2005,'OIL_DST',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_ADD','UPS_SEC_REF_FLX',2005,'OIL_DST',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_LNG','UPS_SEC_REF_FLX',2005,'OIL_DST',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA','UPS_SEC_REF_FLX',2005,'OIL_DST',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_LIQ','UPS_SEC_REF_FLX',2005,'OIL_DST',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_GAS','UPS_SEC_REF_FLX',2005,'OIL_DST',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','UPS_SEC_REF_FLX',2005,'OIL_DST',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_HET','UPS_SEC_REF_FLX',2005,'OIL_DST',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_CRD','UPS_SEC_REF_FLX',2005,'OIL_HFO',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_FEE','UPS_SEC_REF_FLX',2005,'OIL_HFO',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_ADD','UPS_SEC_REF_FLX',2005,'OIL_HFO',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_LNG','UPS_SEC_REF_FLX',2005,'OIL_HFO',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA','UPS_SEC_REF_FLX',2005,'OIL_HFO',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_LIQ','UPS_SEC_REF_FLX',2005,'OIL_HFO',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_GAS','UPS_SEC_REF_FLX',2005,'OIL_HFO',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','UPS_SEC_REF_FLX',2005,'OIL_HFO',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_HET','UPS_SEC_REF_FLX',2005,'OIL_HFO',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_CRD','UPS_SEC_REF_FLX',2005,'OIL_NAP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_FEE','UPS_SEC_REF_FLX',2005,'OIL_NAP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_ADD','UPS_SEC_REF_FLX',2005,'OIL_NAP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_LNG','UPS_SEC_REF_FLX',2005,'OIL_NAP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA','UPS_SEC_REF_FLX',2005,'OIL_NAP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_LIQ','UPS_SEC_REF_FLX',2005,'OIL_NAP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_GAS','UPS_SEC_REF_FLX',2005,'OIL_NAP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','UPS_SEC_REF_FLX',2005,'OIL_NAP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_HET','UPS_SEC_REF_FLX',2005,'OIL_NAP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_CRD','UPS_SEC_REF_FLX',2005,'OIL_WSP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_FEE','UPS_SEC_REF_FLX',2005,'OIL_WSP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_ADD','UPS_SEC_REF_FLX',2005,'OIL_WSP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_LNG','UPS_SEC_REF_FLX',2005,'OIL_WSP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA','UPS_SEC_REF_FLX',2005,'OIL_WSP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_LIQ','UPS_SEC_REF_FLX',2005,'OIL_WSP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_GAS','UPS_SEC_REF_FLX',2005,'OIL_WSP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','UPS_SEC_REF_FLX',2005,'OIL_WSP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_HET','UPS_SEC_REF_FLX',2005,'OIL_WSP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_CRD','UPS_SEC_REF_FLX',2005,'OIL_LUB',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_FEE','UPS_SEC_REF_FLX',2005,'OIL_LUB',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_ADD','UPS_SEC_REF_FLX',2005,'OIL_LUB',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_LNG','UPS_SEC_REF_FLX',2005,'OIL_LUB',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA','UPS_SEC_REF_FLX',2005,'OIL_LUB',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_LIQ','UPS_SEC_REF_FLX',2005,'OIL_LUB',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_GAS','UPS_SEC_REF_FLX',2005,'OIL_LUB',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','UPS_SEC_REF_FLX',2005,'OIL_LUB',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_HET','UPS_SEC_REF_FLX',2005,'OIL_LUB',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_CRD','UPS_SEC_REF_FLX',2005,'OIL_ASP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_FEE','UPS_SEC_REF_FLX',2005,'OIL_ASP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_ADD','UPS_SEC_REF_FLX',2005,'OIL_ASP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_LNG','UPS_SEC_REF_FLX',2005,'OIL_ASP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA','UPS_SEC_REF_FLX',2005,'OIL_ASP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_LIQ','UPS_SEC_REF_FLX',2005,'OIL_ASP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_GAS','UPS_SEC_REF_FLX',2005,'OIL_ASP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','UPS_SEC_REF_FLX',2005,'OIL_ASP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_HET','UPS_SEC_REF_FLX',2005,'OIL_ASP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_CRD','UPS_SEC_REF_FLX',2005,'OIL_WAX',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_FEE','UPS_SEC_REF_FLX',2005,'OIL_WAX',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_ADD','UPS_SEC_REF_FLX',2005,'OIL_WAX',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_LNG','UPS_SEC_REF_FLX',2005,'OIL_WAX',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA','UPS_SEC_REF_FLX',2005,'OIL_WAX',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_LIQ','UPS_SEC_REF_FLX',2005,'OIL_WAX',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_GAS','UPS_SEC_REF_FLX',2005,'OIL_WAX',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','UPS_SEC_REF_FLX',2005,'OIL_WAX',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_HET','UPS_SEC_REF_FLX',2005,'OIL_WAX',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_CRD','UPS_SEC_REF_FLX',2005,'OIL_PTC',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_FEE','UPS_SEC_REF_FLX',2005,'OIL_PTC',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_ADD','UPS_SEC_REF_FLX',2005,'OIL_PTC',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_LNG','UPS_SEC_REF_FLX',2005,'OIL_PTC',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA','UPS_SEC_REF_FLX',2005,'OIL_PTC',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_LIQ','UPS_SEC_REF_FLX',2005,'OIL_PTC',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_GAS','UPS_SEC_REF_FLX',2005,'OIL_PTC',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','UPS_SEC_REF_FLX',2005,'OIL_PTC',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_HET','UPS_SEC_REF_FLX',2005,'OIL_PTC',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_CRD','UPS_SEC_REF_FLX',2005,'OIL_NSP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_FEE','UPS_SEC_REF_FLX',2005,'OIL_NSP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_ADD','UPS_SEC_REF_FLX',2005,'OIL_NSP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_LNG','UPS_SEC_REF_FLX',2005,'OIL_NSP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA','UPS_SEC_REF_FLX',2005,'OIL_NSP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_LIQ','UPS_SEC_REF_FLX',2005,'OIL_NSP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_GAS','UPS_SEC_REF_FLX',2005,'OIL_NSP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','UPS_SEC_REF_FLX',2005,'OIL_NSP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_HET','UPS_SEC_REF_FLX',2005,'OIL_NSP',0.9317,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NGA','UPS_HET_GAS_NGA',2005,'UPS_HET',0.800,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_LIQ','UPS_HET_OIL_RPP',2005,'UPS_HET',0.800,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_OIL_GAS','UPS_HET_OIL_RPG',2005,'UPS_HET',0.800,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','BIO_RPS','BIO_REF1_CRUSHING_E',2010,'BIO_OIL',0.540,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','BIO_REF1_CRUSHING_E',2010,'BIO_OIL',0.540,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','UPS_HET','BIO_REF1_CRUSHING_E',2010,'BIO_OIL',0.540,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','BIO_OIL','BIO_REF1_TRANSESTER_E',2005,'BIO_MHV',0.935,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','BIO_REF1_TRANSESTER_E',2005,'BIO_MHV',0.935,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','UPS_HET','BIO_REF1_TRANSESTER_E',2005,'BIO_MHV',0.935,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','BIO_STC','BIO_REF1_ETHAMIDE_E',2005,'BIO_ETH',0.336,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','BIO_REF1_ETHAMIDE_E',2005,'BIO_ETH',0.336,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','UPS_HET','BIO_REF1_ETHAMIDE_E',2005,'BIO_ETH',0.336,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','BIO_SUG','BIO_REF1_ETHSUG_E',2005,'BIO_ETH',0.113,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','BIO_REF1_ETHSUG_E',2005,'BIO_ETH',0.113,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','UPS_HET','BIO_REF1_ETHSUG_E',2005,'BIO_ETH',0.113,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','BIO_ETH','BIO_REF1_ETBE_E',2010,'BIO_ETB',0.920,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','BIO_ISOBUTYL','BIO_REF1_ETBE_E',2010,'BIO_ETB',0.920,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','BIO_REF1_ETBE_E',2010,'BIO_ETB',0.920,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','UPS_HET','BIO_REF1_ETBE_E',2010,'BIO_ETB',0.920,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','BIO_OIL','BIO_REF1_HVO_N',2015,'BIO_HVO',0.812,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','BIO_REF1_HVO_N',2015,'BIO_HVO',0.812,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','UPS_HET','BIO_REF1_HVO_N',2015,'BIO_HVO',0.812,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','OIL_HFO','BIO_REF1_HVO_N',2015,'BIO_HVO',0.812,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','H2','BIO_REF1_HVO_N',2015,'BIO_HVO',0.812,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','BIO_GRS','BIO_REF2_ETH_N',2020,'BIO_ETH',0.370,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','BIO_GRS','BIO_REF2_ETH_N',2020,'UPS_ELC',0.370,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','BIO_GRS','BIO_REF2_DST_N',2020,'BIO_DST',0.630,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NGA','BIO_REF2_DST_N',2020,'BIO_DST',0.630,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','BIO_GRS','BIO_REF2_DST_N',2020,'UPS_ELC',0.630,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NGA','BIO_REF2_DST_N',2020,'UPS_ELC',0.630,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','BIO_GRS','BIO_REF2_DST_N',2020,'BIO_NAP',0.630,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NGA','BIO_REF2_DST_N',2020,'BIO_NAP',0.630,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','BIO_GRS','BIO_REF2_KER_N',2020,'BIO_KER',0.630,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NGA','BIO_REF2_KER_N',2020,'BIO_KER',0.630,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','BIO_GRS','BIO_REF2_KER_N',2020,'UPS_ELC',0.630,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NGA','BIO_REF2_KER_N',2020,'UPS_ELC',0.630,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','BIO_GRS','BIO_REF2_KER_N',2020,'BIO_NAP',0.630,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NGA','BIO_REF2_KER_N',2020,'BIO_NAP',0.630,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','BIO_GRS','BIO_REF2_ETH_CCS_N',2030,'BIO_ETH',0.37,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','BIO_GRS','BIO_REF2_ETH_CCS_N',2030,'UPS_ELC',0.37,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','BIO_GRS','BIO_REF2_DST_CCS_N',2030,'BIO_DST',0.630,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NGA','BIO_REF2_DST_CCS_N',2030,'BIO_DST',0.630,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','BIO_GRS','BIO_REF2_DST_CCS_N',2030,'UPS_ELC',0.630,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NGA','BIO_REF2_DST_CCS_N',2030,'UPS_ELC',0.630,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','BIO_GRS','BIO_REF2_DST_CCS_N',2030,'BIO_NAP',0.630,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NGA','BIO_REF2_DST_CCS_N',2030,'BIO_NAP',0.630,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','BIO_GRS','BIO_REF2_KER_CCS_N',2030,'BIO_KER',0.630,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NGA','BIO_REF2_KER_CCS_N',2030,'BIO_KER',0.630,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','BIO_GRS','BIO_REF2_KER_CCS_N',2030,'UPS_ELC',0.630,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NGA','BIO_REF2_KER_CCS_N',2030,'UPS_ELC',0.630,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','BIO_GRS','BIO_REF2_KER_CCS_N',2030,'BIO_NAP',0.630,'10.5281/zenodo.3544900');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NGA','BIO_REF2_KER_CCS_N',2030,'BIO_NAP',0.630,'10.5281/zenodo.3544900');
-- Micro-CHP
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CI_N',2007,'ELC_DST',0.350,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CI_N',2007,'HET',0.450,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CI_N',2014,'ELC_DST',0.375,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CI_N',2014,'HET',0.450,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CI_N',2022,'ELC_DST',0.410,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CI_N',2022,'HET',0.450,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CI_N',2030,'ELC_DST',0.450,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CI_N',2030,'HET',0.432,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2007,'ELC_DST',0.280,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2007,'HET',0.520,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2014,'ELC_DST',0.310,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2014,'HET',0.510,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2022,'ELC_DST',0.360,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2022,'HET',0.500,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2030,'ELC_DST',0.440,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_MICRO_N',2030,'HET',0.480,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CC_N',2007,'ELC_DST',0.400,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CC_N',2007,'HET',0.400,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CC_N',2014,'ELC_DST',0.400,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CC_N',2014,'HET',0.400,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CC_N',2022,'ELC_DST',0.400,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CC_N',2022,'HET',0.400,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CC_N',2030,'ELC_DST',0.400,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_CC_N',2030,'HET',0.400,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB','COM_CHP_SLB_CI_N',2007,'ELC_DST',0.350,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB','COM_CHP_SLB_CI_N',2007,'HET',0.450,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB','COM_CHP_SLB_CI_N',2014,'ELC_DST',0.360,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB','COM_CHP_SLB_CI_N',2014,'HET',0.432,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB','COM_CHP_SLB_CI_N',2022,'ELC_DST',0.375,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB','COM_CHP_SLB_CI_N',2022,'HET',0.412,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB','COM_CHP_SLB_CI_N',2030,'ELC_DST',0.390,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_SLB','COM_CHP_SLB_CI_N',2030,'HET',0.402,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_SOFC_N',2020,'ELC_DST',0.90,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','COM_CHP_NGA_SOFC_N',2020,'HET',0.90,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','COM_CHP_H2_PEMFC_N',2025,'ELC_DST',0.94,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','COM_CHP_H2_PEMFC_N',2025,'HET',0.94,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','COM_CHP_H2_PEMFC_N',2030,'ELC_DST',0.96,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','COM_CHP_H2_PEMFC_N',2030,'HET',0.96,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_CI_N',2007,'ELC_DST',0.800,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_CI_N',2014,'ELC_DST',0.825,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_CI_N',2022,'ELC_DST',0.860,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_CI_N',2030,'ELC_DST',0.880,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_CI_N',2050,'ELC_DST',0.907,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TG_N',2007,'ELC_DST',0.740,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TG_N',2014,'ELC_DST',0.750,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TG_N',2022,'ELC_DST',0.750,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TG_N',2030,'ELC_DST',0.800,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TV_N',2007,'ELC_DST',0.750,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TV_N',2014,'ELC_DST',0.760,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TV_N',2022,'ELC_DST',0.774,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TV_N',2030,'ELC_DST',0.790,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2014,'ELC_DST',0.870,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2022,'ELC_DST',0.905,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2030,'ELC_DST',0.923,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2050,'ELC_DST',0.931,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_CI_N',2007,'HET',0.800,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_CI_N',2014,'HET',0.825,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_CI_N',2022,'HET',0.860,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_CI_N',2030,'HET',0.880,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_CI_N',2050,'HET',0.907,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TG_N',2007,'HET',0.740,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TG_N',2014,'HET',0.750,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TG_N',2022,'HET',0.750,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TG_N',2030,'HET',0.800,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TV_N',2007,'HET',0.750,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TV_N',2014,'HET',0.760,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TV_N',2022,'HET',0.774,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','IND_CHP_NGA_TV_N',2030,'HET',0.790,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2014,'HET',0.870,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2022,'HET',0.905,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2030,'HET',0.923,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_BLQ','IND_CHP_BLQ_CI_N',2050,'HET',0.931,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CI_N',2007,'ELC_DST',0.350,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CI_N',2014,'ELC_DST',0.375,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CI_N',2022,'ELC_DST',0.410,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CI_N',2030,'ELC_DST',0.450,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CI_N',2007,'HET',0.450,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CI_N',2014,'HET',0.450,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CI_N',2022,'HET',0.450,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CI_N',2030,'HET',0.432,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2007,'ELC_DST',0.280,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2014,'ELC_DST',0.310,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2022,'ELC_DST',0.360,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2030,'ELC_DST',0.440,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2007,'HET',0.520,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2014,'HET',0.510,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2022,'HET',0.500,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_MICRO_N',2030,'HET',0.480,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CC_N',2007,'ELC_DST',0.40,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CC_N',2007,'HET',0.40,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CC_N',2014,'ELC_DST',0.40,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CC_N',2014,'HET',0.40,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CC_N',2022,'ELC_DST',0.40,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_CC_N',2022,'HET',0.40,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_STR_N',2022,'ELC_DST',0.16,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_STR_N',2022,'HET',0.64,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_STR_N',2030,'ELC_DST',0.20,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_STR_N',2030,'HET',0.60,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_SOFC_N',2020,'ELC_DST',0.90,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_NGA','RES_CHP_NGA_SOFC_N',2020,'HET',0.90,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','RES_CHP_H2_PEMFC_N',2020,'ELC_DST',0.92,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','RES_CHP_H2_PEMFC_N',2020,'HET',0.92,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','RES_CHP_H2_PEMFC_N',2025,'ELC_DST',0.94,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','RES_CHP_H2_PEMFC_N',2025,'HET',0.94,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','RES_CHP_H2_PEMFC_N',2030,'ELC_DST',0.96,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('IT','ELC_H2','RES_CHP_H2_PEMFC_N',2030,'HET',0.96,'PJ/PJ');
-- Nuclear fuel cycle
-- Fuel production
INSERT INTO "Efficiency" VALUES ('EU','ethos','UPS_MIN_IMP_URA_NAT',2010,'URA_NAT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','URA_NAT','UPS_FT_LWR_URA',2010,'URA_ENR',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','URA_NAT','UPS_FT_LWR_URA',2010,'URA_DEP',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','URA_ENR','UPS_FT_LWR_UOX',2010,'LWR_UOX',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','URA_DEP','UPS_FT_LWR_MOX',2010,'LWR_MOX',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_PU_LWR','UPS_FT_LWR_MOX',2010,'LWR_MOX',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','URA_DEP','UPS_FT_FR_MOX',2010,'FR_MOX',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_PU_FR','UPS_FT_FR_MOX',2010,'FR_MOX',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','URA_DEP','UPS_FT_ABWR_TRU',2010,'ABWR_TRU',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_UOX_UREX_TRU','UPS_FT_ABWR_TRU',2010,'ABWR_TRU',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','URA_NAT','UPS_FT_ABWR_NAU',2010,'ABWR_UTR',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_UOX_UREX_TRU','UPS_FT_ADS_TRU',2010,'ADS_TRU',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_MA','UPS_FT_ADS_MA',2010,'ADS_MA',1.00,'10.1016/j.fusengdes.2024.114679');
-- Reactor core technologies
INSERT INTO "Efficiency" VALUES ('EU','LWR_UOX','UPS_NUC_LWR_UOX_E',2010,'UPS_NUC_HET_LWR_UOX',5.320*0.95,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','LWR_UOX','UPS_NUC_LWR_UOX_E',2010,'UPS_NUC_SPENT_LWR_UOX',5.320*0.95,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','LWR_MOX','UPS_NUC_LWR_MOX_E',2010,'UPS_NUC_HET_LWR_MOX',5.320*0.95,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','LWR_MOX','UPS_NUC_LWR_MOX_E',2010,'UPS_NUC_SPENT_LWR_MOX',5.320*0.95,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','FR_MOX','UPS_NUC_FR_MOX_N',2030,'UPS_NUC_HET_FR_MOX',76.246,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','FR_MOX','UPS_NUC_FR_MOX_N',2030,'UPS_NUC_SPENT_FR_MOX',76.246,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ABWR_TRU','UPS_NUC_ABWR_TRU_N',2040,'UPS_NUC_HET_ABWR_TRU',85.516,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ABWR_TRU','UPS_NUC_ABWR_TRU_N',2040,'UPS_REP_HLW_ABWR_TRU',85.516,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ABWR_UTR','UPS_NUC_ABWR_UTR_N',2040,'UPS_NUC_HET_ABWR_UTR',84.769,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ABWR_UTR','UPS_NUC_ABWR_UTR_N',2040,'UPS_REP_HLW_ABWR_UTR',84.769,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ADS_TRU','UPS_NUC_ADS_TRU_N',2040,'UPS_NUC_HET_ADS_TRU',87.521,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ADS_TRU','UPS_NUC_ADS_TRU_N',2040,'UPS_REP_HLW_ADS_TRU',87.521,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ADS_MA','UPS_NUC_ADS_MA_N',2040,'UPS_NUC_HET_ADS_MA',86.345,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ADS_MA','UPS_NUC_ADS_MA_N',2040,'UPS_REP_HLW_ADS_MA',86.345,'10.1016/j.fusengdes.2024.114679');
-- Reprocessing technologies
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_LWR_UOX','UPS_REP_PUREX_LWR_UOX_E',2010,'UPS_UOX_PUREX_URA',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_LWR_UOX','UPS_REP_PUREX_LWR_UOX_E',2010,'UPS_UOX_PUREX_PU',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_LWR_UOX','UPS_REP_PUREX_LWR_UOX_E',2010,'UPS_UOX_PUREX_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_LWR_UOX','UPS_REP_UREX_LWR_UOX_E',2010,'UPS_UOX_UREX_URA',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_LWR_UOX','UPS_REP_UREX_LWR_UOX_E',2010,'UPS_UOX_UREX_TRU',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_LWR_UOX','UPS_REP_UREX_LWR_UOX_E',2010,'UPS_UOX_UREX_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_LWR_MOX','UPS_REP_PUREX_LWR_MOX_E',2010,'UPS_MOX_PUREX_URA',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_LWR_MOX','UPS_REP_PUREX_LWR_MOX_E',2010,'UPS_MOX_PUREX_PU',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_LWR_MOX','UPS_REP_PUREX_LWR_MOX_E',2010,'UPS_MOX_PUREX_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_LWR_UOX','UPS_REP_ADV_PUREX_LWR_UOX_E',2010,'UPS_UOX_ADV_PUREX_LWR_URA',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_LWR_UOX','UPS_REP_ADV_PUREX_LWR_UOX_E',2010,'UPS_UOX_ADV_PUREX_LWR_PU',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_LWR_UOX','UPS_REP_ADV_PUREX_LWR_UOX_E',2010,'UPS_UOX_ADV_PUREX_LWR_MA',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_LWR_UOX','UPS_REP_ADV_PUREX_LWR_UOX_E',2010,'UPS_UOX_ADV_PUREX_LWR_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_LWR_MOX','UPS_REP_ADV_PUREX_LWR_MOX_E',2010,'UPS_MOX_ADV_PUREX_LWR_URA',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_LWR_MOX','UPS_REP_ADV_PUREX_LWR_MOX_E',2010,'UPS_MOX_ADV_PUREX_LWR_PU',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_LWR_MOX','UPS_REP_ADV_PUREX_LWR_MOX_E',2010,'UPS_MOX_ADV_PUREX_LWR_MA',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_LWR_MOX','UPS_REP_ADV_PUREX_LWR_MOX_E',2010,'UPS_MOX_ADV_PUREX_LWR_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_FR_MOX','UPS_REP_ADV_PUREX_FR_MOX_E',2010,'UPS_MOX_ADV_PUREX_FR_MA',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_FR_MOX','UPS_REP_ADV_PUREX_FR_MOX_E',2010,'UPS_MOX_ADV_PUREX_FR_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
-- Transformation technologies
INSERT INTO "Efficiency" VALUES ('EU','UPS_UOX_ADV_PUREX_LWR_MA','UPS_TRA_ADS_MA_E',2010,'UPS_MA',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_MOX_ADV_PUREX_LWR_MA','UPS_TRA_ADS_MA_E',2010,'UPS_MA',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_MOX_ADV_PUREX_FR_MA','UPS_TRA_ADS_MA_E',2010,'UPS_MA',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_MOX_PUREX_PU','UPS_TRA_FR_MOX_E',2010,'UPS_PU_FR',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_MOX_ADV_PUREX_LWR_PU','UPS_TRA_FR_MOX_E',2010,'UPS_PU_FR',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_UOX_PUREX_PU','UPS_TRA_LWR_MOX_E',2010,'UPS_PU_LWR',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_UOX_ADV_PUREX_LWR_PU','UPS_TRA_LWR_MOX_E',2010,'UPS_PU_LWR',1.00,'10.1016/j.fusengdes.2024.114679');
-- Waste deposit
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_LWR_UOX','UPS_WDP_SPENT_LWR_UOX_E',2010,'UPS_URA_SPENT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_LWR_UOX','UPS_WDP_SPENT_LWR_UOX_E',2010,'UPS_PU_SPENT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_LWR_UOX','UPS_WDP_SPENT_LWR_UOX_E',2010,'UPS_MA_SPENT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_LWR_UOX','UPS_WDP_SPENT_LWR_UOX_E',2010,'UPS_FP_SPENT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_LWR_MOX','UPS_WDP_SPENT_LWR_MOX_E',2010,'UPS_URA_SPENT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_LWR_MOX','UPS_WDP_SPENT_LWR_MOX_E',2010,'UPS_PU_SPENT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_LWR_MOX','UPS_WDP_SPENT_LWR_MOX_E',2010,'UPS_MA_SPENT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_LWR_MOX','UPS_WDP_SPENT_LWR_MOX_E',2010,'UPS_FP_SPENT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_FR_MOX','UPS_WDP_SPENT_FR_MOX_E',2010,'UPS_URA_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_FR_MOX','UPS_WDP_SPENT_FR_MOX_E',2010,'UPS_PU_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_FR_MOX','UPS_WDP_SPENT_FR_MOX_E',2010,'UPS_MA_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_SPENT_FR_MOX','UPS_WDP_SPENT_FR_MOX_E',2010,'UPS_FP_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_UOX_PUREX_HLW','UPS_WDP_HLW_PUREX_LWR_UOX_E',2010,'UPS_URA_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_UOX_PUREX_HLW','UPS_WDP_HLW_PUREX_LWR_UOX_E',2010,'UPS_PU_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_UOX_PUREX_HLW','UPS_WDP_HLW_PUREX_LWR_UOX_E',2010,'UPS_MA_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_UOX_PUREX_HLW','UPS_WDP_HLW_PUREX_LWR_UOX_E',2010,'UPS_FP_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_UOX_UREX_HLW','UPS_WDP_HLW_UREX_LWR_UOX_E',2010,'UPS_URA_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_UOX_UREX_HLW','UPS_WDP_HLW_UREX_LWR_UOX_E',2010,'UPS_PU_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_UOX_UREX_HLW','UPS_WDP_HLW_UREX_LWR_UOX_E',2010,'UPS_FP_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_MOX_PUREX_HLW','UPS_WDP_HLW_UREX_LWR_MOX_E',2010,'UPS_URA_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_MOX_PUREX_HLW','UPS_WDP_HLW_UREX_LWR_MOX_E',2010,'UPS_PU_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_MOX_PUREX_HLW','UPS_WDP_HLW_UREX_LWR_MOX_E',2010,'UPS_MA_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_MOX_PUREX_HLW','UPS_WDP_HLW_UREX_LWR_MOX_E',2010,'UPS_FP_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_UOX_ADV_PUREX_LWR_HLW','UPS_WDP_HLW_ADV_PUREX_LWR_UOX_E',2010,'UPS_URA_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_UOX_ADV_PUREX_LWR_HLW','UPS_WDP_HLW_ADV_PUREX_LWR_UOX_E',2010,'UPS_PU_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_UOX_ADV_PUREX_LWR_HLW','UPS_WDP_HLW_ADV_PUREX_LWR_UOX_E',2010,'UPS_FP_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_MOX_ADV_PUREX_LWR_HLW','UPS_WDP_HLW_ADV_PUREX_LWR_MOX_E',2010,'UPS_URA_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_MOX_ADV_PUREX_LWR_HLW','UPS_WDP_HLW_ADV_PUREX_LWR_MOX_E',2010,'UPS_PU_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_MOX_ADV_PUREX_LWR_HLW','UPS_WDP_HLW_ADV_PUREX_LWR_MOX_E',2010,'UPS_MA_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_MOX_ADV_PUREX_LWR_HLW','UPS_WDP_HLW_ADV_PUREX_LWR_MOX_E',2010,'UPS_FP_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_MOX_ADV_PUREX_FR_HLW','UPS_WDP_HLW_ADV_PUREX_FR_MOX_E',2010,'UPS_URA_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_MOX_ADV_PUREX_FR_HLW','UPS_WDP_HLW_ADV_PUREX_FR_MOX_E',2010,'UPS_PU_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_MOX_ADV_PUREX_FR_HLW','UPS_WDP_HLW_ADV_PUREX_FR_MOX_E',2010,'UPS_MA_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_MOX_ADV_PUREX_FR_HLW','UPS_WDP_HLW_ADV_PUREX_FR_MOX_E',2010,'UPS_FP_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_REP_HLW_ABWR_TRU','UPS_WDP_HLW_PYRO_ABWR_TRU_E',2010,'UPS_URA_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_REP_HLW_ABWR_TRU','UPS_WDP_HLW_PYRO_ABWR_TRU_E',2010,'UPS_PU_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_REP_HLW_ABWR_TRU','UPS_WDP_HLW_PYRO_ABWR_TRU_E',2010,'UPS_MA_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_REP_HLW_ABWR_TRU','UPS_WDP_HLW_PYRO_ABWR_TRU_E',2010,'UPS_FP_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_REP_HLW_ABWR_UTR','UPS_WDP_HLW_PYRO_ABWR_UTR_E',2010,'UPS_URA_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_REP_HLW_ABWR_UTR','UPS_WDP_HLW_PYRO_ABWR_UTR_E',2010,'UPS_PU_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_REP_HLW_ABWR_UTR','UPS_WDP_HLW_PYRO_ABWR_UTR_E',2010,'UPS_FP_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_REP_HLW_ADS_TRU','UPS_WDP_HLW_PYRO_ADS_TRU_E',2010,'UPS_URA_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_REP_HLW_ADS_TRU','UPS_WDP_HLW_PYRO_ADS_TRU_E',2010,'UPS_PU_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_REP_HLW_ADS_TRU','UPS_WDP_HLW_PYRO_ADS_TRU_E',2010,'UPS_MA_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_REP_HLW_ADS_TRU','UPS_WDP_HLW_PYRO_ADS_TRU_E',2010,'UPS_FP_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_REP_HLW_ADS_MA','UPS_WDP_HLW_PYRO_ADS_MA_E',2010,'UPS_URA_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_REP_HLW_ADS_MA','UPS_WDP_HLW_PYRO_ADS_MA_E',2010,'UPS_PU_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_REP_HLW_ADS_MA','UPS_WDP_HLW_PYRO_ADS_MA_E',2010,'UPS_MA_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_REP_HLW_ADS_MA','UPS_WDP_HLW_PYRO_ADS_MA_E',2010,'UPS_FP_HLW',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_UOX_PUREX_URA','UPS_WDP_PUREX_UREX_E',2010,'UPS_URA_SPENT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_UOX_UREX_URA','UPS_WDP_PUREX_UREX_E',2010,'UPS_URA_SPENT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_MOX_PUREX_URA','UPS_WDP_PUREX_UREX_E',2010,'UPS_URA_SPENT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_UOX_ADV_PUREX_LWR_URA','UPS_WDP_PUREX_UREX_E',2010,'UPS_URA_SPENT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_MOX_ADV_PUREX_LWR_URA','UPS_WDP_PUREX_UREX_E',2010,'UPS_URA_SPENT',1.00,'10.1016/j.fusengdes.2024.114679');
-- Hydrogen
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA','H2_FT_NGA',2015,'H2_NGA',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','SYN_NGA','H2_FT_NGA',2015,'H2_NGA',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','BIO_GAS','H2_FT_NGA',2015,'H2_NGA',0.50,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','H2_BL','H2_FT_NGA',2020,'H2_NGA',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','COA_HCO','H2_FT_COA',2015,'H2_COA',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','COA_BCO','H2_FT_COA',2015,'H2_COA',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_GSL','H2_FT_OIL',2015,'H2_OIL',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_DST','H2_FT_OIL',2015,'H2_OIL',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_HFO','H2_FT_OIL',2015,'H2_OIL',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_NAP','H2_FT_OIL',2015,'H2_OIL',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','BIO_NAP','H2_FT_OIL',2015,'H2_OIL',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_NSP','H2_FT_OIL',2015,'H2_OIL',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_PTC','H2_FT_OIL',2015,'H2_OIL',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','BIO_ETH','H2_FT_ETH',2015,'H2_ETH',0.027,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','BIO_GAS','H2_FT_BIO',2015,'H2_BIO',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','BIO_WOD','H2_FT_BIO',2015,'H2_BIO',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','BIO_SLU','H2_FT_BIO',2015,'H2_BIO',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_CEN','H2_FT_ELC',2015,'H2_ELC',0.90,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_DST','H2_FT_ELC',2015,'H2_ELC',0.95,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','H2_ELC','H2_SR_NGA',2015,'H2',0.63,'10.1016/j.apenergy.2023.121951');
INSERT INTO "Efficiency" VALUES ('EU','H2_NGA','H2_SR_NGA',2015,'H2',0.63,'10.1016/j.apenergy.2023.121951');
INSERT INTO "Efficiency" VALUES ('EU','H2_ELC','H2_SR_NGA',2025,'H2',0.66,'10.1016/j.apenergy.2023.121951');
INSERT INTO "Efficiency" VALUES ('EU','H2_NGA','H2_SR_NGA',2025,'H2',0.66,'10.1016/j.apenergy.2023.121951');
INSERT INTO "Efficiency" VALUES ('EU','H2_ELC','H2_SR_NGA',2030,'H2',0.71,'10.1016/j.apenergy.2023.121951');
INSERT INTO "Efficiency" VALUES ('EU','H2_NGA','H2_SR_NGA',2030,'H2',0.71,'10.1016/j.apenergy.2023.121951');
INSERT INTO "Efficiency" VALUES ('EU','H2_ELC','H2_GS_COA',2015,'H2',0.56,'10.1016/j.apenergy.2023.121951');
INSERT INTO "Efficiency" VALUES ('EU','H2_COA','H2_GS_COA',2015,'H2',0.56,'10.1016/j.apenergy.2023.121951');
INSERT INTO "Efficiency" VALUES ('EU','H2_ELC','H2_GS_COA',2025,'H2',0.56,'10.1016/j.apenergy.2023.121951');
INSERT INTO "Efficiency" VALUES ('EU','H2_COA','H2_GS_COA',2025,'H2',0.56,'10.1016/j.apenergy.2023.121951');
INSERT INTO "Efficiency" VALUES ('EU','H2_ELC','H2_GS_COA',2030,'H2',0.68,'10.1016/j.apenergy.2023.121951');
INSERT INTO "Efficiency" VALUES ('EU','H2_COA','H2_GS_COA',2030,'H2',0.68,'10.1016/j.apenergy.2023.121951');
INSERT INTO "Efficiency" VALUES ('EU','H2_ELC','H2_PO_OIL',2015,'H2',0.73,'10.1016/j.apenergy.2023.121951');
INSERT INTO "Efficiency" VALUES ('EU','H2_OIL','H2_PO_OIL',2015,'H2',0.73,'10.1016/j.apenergy.2023.121951');
INSERT INTO "Efficiency" VALUES ('EU','H2_ELC','H2_SR_BIO',2015,'H2',0.71,'10.1016/j.apenergy.2023.121951');
INSERT INTO "Efficiency" VALUES ('EU','H2_BIO','H2_SR_BIO',2015,'H2',0.71,'10.1016/j.apenergy.2023.121951');
INSERT INTO "Efficiency" VALUES ('EU','H2_ELC','H2_GS_BIO',2015,'H2',0.32,'10.1016/j.apenergy.2023.121951');
INSERT INTO "Efficiency" VALUES ('EU','H2_BIO','H2_GS_BIO',2015,'H2',0.32,'10.1016/j.apenergy.2023.121951');
INSERT INTO "Efficiency" VALUES ('EU','H2_ELC','H2_SR_ETH',2015,'H2',0.36,'10.1016/j.apenergy.2023.121951');
INSERT INTO "Efficiency" VALUES ('EU','H2_ETH','H2_SR_ETH',2015,'H2',0.36,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('EU','H2_ELC','H2_EL_ALK',2020,'H2_EL',0.62,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('EU','H2_ELC','H2_EL_ALK',2030,'H2_EL',0.67,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('EU','H2_ELC','H2_EL_ALK',2050,'H2_EL',0.67,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('EU','H2_ELC','H2_EL_PEM',2020,'H2_EL',0.60,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('EU','H2_ELC','H2_EL_PEM',2025,'H2_EL',0.68,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('EU','H2_ELC','H2_EL_PEM',2050,'H2_EL',0.68,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('EU','H2_ELC','H2_EL_SOEC',2020,'H2_EL_SOEC',0.80,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('EU','H2_ELC','H2_EL_SOEC',2030,'H2_EL_SOEC',0.88,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('EU','H2_ELC','H2_EL_SOEC',2050,'H2_EL_SOEC',0.94,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('EU','H2_ELC','H2_EL_AEM',2050,'H2_EL',0.59,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('EU','H2_EL','H2_DMY',2020,'H2',1.000,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','H2','H2_BL_DMY',2020,'H2_BL',1.000,'10.1016/j.fusengdes.2024.114679');
-- CCUS
INSERT INTO "Efficiency" VALUES ('EU','H2_ELC','CCUS_H2_SR_NGA',2020,'H2',0.55,'10.1016/j.apenergy.2023.121951');
INSERT INTO "Efficiency" VALUES ('EU','H2_NGA','CCUS_H2_SR_NGA',2020,'H2',0.55,'10.1016/j.apenergy.2023.121951');
INSERT INTO "Efficiency" VALUES ('EU','H2_ELC','CCUS_H2_SR_NGA',2030,'H2',0.63,'10.1016/j.apenergy.2023.121951');
INSERT INTO "Efficiency" VALUES ('EU','H2_NGA','CCUS_H2_SR_NGA',2030,'H2',0.63,'10.1016/j.apenergy.2023.121951');
INSERT INTO "Efficiency" VALUES ('EU','H2_ELC','CCUS_H2_GS_COA',2020,'H2',0.56,'10.1016/j.apenergy.2023.121951');
INSERT INTO "Efficiency" VALUES ('EU','H2_COA','CCUS_H2_GS_COA',2020,'H2',0.56,'10.1016/j.apenergy.2023.121951');
INSERT INTO "Efficiency" VALUES ('EU','H2_ELC','CCUS_H2_GS_COA',2030,'H2',0.60,'10.1016/j.apenergy.2023.121951');
INSERT INTO "Efficiency" VALUES ('EU','H2_COA','CCUS_H2_GS_COA',2030,'H2',0.60,'10.1016/j.apenergy.2023.121951');
INSERT INTO "Efficiency" VALUES ('EU','H2_ELC','CCUS_H2_GS_BIO',2020,'H2',0.51,'10.1016/j.apenergy.2023.121951');
INSERT INTO "Efficiency" VALUES ('EU','H2_BIO','CCUS_H2_GS_BIO',2020,'H2',0.51,'10.1016/j.apenergy.2023.121951');
INSERT INTO "Efficiency" VALUES ('EU','ethos','CCUS_H2_SR_NGA_LINKED',2020,'SNK_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','CCUS_H2_GS_COA_LINKED',2020,'SNK_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','CCUS_H2_GS_BIO_LINKED',2020,'SNK_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ELC_COA','CCUS_ELC_COA',2020,'ELC_CEN',0.32,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('EU','ELC_COA','CCUS_ELC_COA',2035,'ELC_CEN',0.35,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('EU','ELC_NGA','CCUS_ELC_NGA',2020,'ELC_CEN',0.48,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('EU','ELC_NGA','CCUS_ELC_NGA',2035,'ELC_CEN',0.55,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('EU','ethos','CCUS_ELC_COA_LINKED',2020,'SNK_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','CCUS_ELC_NGA_LINKED',2020,'SNK_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ELC_DST','CCUS_DAC',2020,'SNK_CO2',89.29,'kt/PJ');
INSERT INTO "Efficiency" VALUES ('EU','HET','CCUS_DAC',2020,'SNK_CO2',89.29,'kt/PJ');
INSERT INTO "Efficiency" VALUES ('EU','ELC_DST','CCUS_DAC',2030,'SNK_CO2',111.61,'kt/PJ');
INSERT INTO "Efficiency" VALUES ('EU','HET','CCUS_DAC',2030,'SNK_CO2',111.61,'kt/PJ');
INSERT INTO "Efficiency" VALUES ('EU','ELC_DST','CCUS_DAC',2050,'SNK_CO2',139.51,'kt/PJ');
INSERT INTO "Efficiency" VALUES ('EU','HET','CCUS_DAC',2050,'SNK_CO2',139.51,'kt/PJ');
INSERT INTO "Efficiency" VALUES ('EU','H2','SF_NGA_METH',2020,'SYN_NGA',0.01743,'');
INSERT INTO "Efficiency" VALUES ('EU','SNK_CO2','SF_NGA_METH',2020,'SYN_NGA',0.01743,'');
INSERT INTO "Efficiency" VALUES ('EU','H2','SF_NGA_METH',2030,'SYN_NGA',0.01744,'');
INSERT INTO "Efficiency" VALUES ('EU','SNK_CO2','SF_NGA_METH',2030,'SYN_NGA',0.01744,'');
INSERT INTO "Efficiency" VALUES ('EU','H2','SF_NGA_METH',2050,'SYN_NGA',0.01745,'');
INSERT INTO "Efficiency" VALUES ('EU','SNK_CO2','SF_NGA_METH',2050,'SYN_NGA',0.01745,'');
INSERT INTO "Efficiency" VALUES ('EU','H2','SF_DST_HYDR',2025,'SYN_DST',0.01327,'');
INSERT INTO "Efficiency" VALUES ('EU','SNK_CO2','SF_DST_HYDR',2025,'SYN_DST',0.01327,'');
INSERT INTO "Efficiency" VALUES ('EU','ELC_CEN','SF_DST_COELC',2025,'SYN_DST',0.01309,'');
INSERT INTO "Efficiency" VALUES ('EU','SNK_CO2','SF_DST_COELC',2025,'SYN_DST',0.01309,'');
INSERT INTO "Efficiency" VALUES ('EU','ELC_CEN','SF_DST_COELC',2030,'SYN_DST',0.01318,'');
INSERT INTO "Efficiency" VALUES ('EU','SNK_CO2','SF_DST_COELC',2030,'SYN_DST',0.01318,'');
INSERT INTO "Efficiency" VALUES ('EU','H2','SF_KER_HYDR',2025,'SYN_KER',0.01374,'');
INSERT INTO "Efficiency" VALUES ('EU','SNK_CO2','SF_KER_HYDR',2025,'SYN_KER',0.01374,'');
INSERT INTO "Efficiency" VALUES ('EU','ELC_CEN','SF_KER_COELC',2025,'SYN_KER',0.01354,'');
INSERT INTO "Efficiency" VALUES ('EU','SNK_CO2','SF_KER_COELC',2025,'SYN_KER',0.01354,'');
INSERT INTO "Efficiency" VALUES ('EU','ELC_CEN','SF_KER_COELC',2030,'SYN_KER',0.01364,'');
INSERT INTO "Efficiency" VALUES ('EU','SNK_CO2','SF_KER_COELC',2030,'SYN_KER',0.01364,'');
INSERT INTO "Efficiency" VALUES ('EU','ELC_CEN','SF_DSTKER_DAC',2025,'SYN_DST',0.33,'');
INSERT INTO "Efficiency" VALUES ('EU','ELC_CEN','SF_DSTKER_DAC',2025,'SYN_KER',0.33,'');
INSERT INTO "Efficiency" VALUES ('EU','H2','SF_MEOH_HYDR',2025,'SYN_GSL',0.01418,'');
INSERT INTO "Efficiency" VALUES ('EU','SNK_CO2','SF_MEOH_HYDR',2025,'SYN_GSL',0.01418,'');
INSERT INTO "Efficiency" VALUES ('EU','ELC_CEN','SF_MEOH_COELC',2025,'SYN_GSL',0.01399,'');
INSERT INTO "Efficiency" VALUES ('EU','SNK_CO2','SF_MEOH_COELC',2025,'SYN_GSL',0.01399,'');
INSERT INTO "Efficiency" VALUES ('EU','ELC_CEN','SF_MEOH_COELC',2030,'SYN_GSL',0.01408,'');
INSERT INTO "Efficiency" VALUES ('EU','SNK_CO2','SF_MEOH_COELC',2030,'SYN_GSL',0.01408,'');
INSERT INTO "Efficiency" VALUES ('EU','ELC_CEN','SF_MEOH_DAC',2025,'SYN_GSL',0.33,'');
-- Sequestration
---- Potential of storage and transportation costs
INSERT INTO "Efficiency" VALUES ('EU','ethos','SEQ_SNK_EOR_ONS_N',2030,'SNK_EOR_ONS_DMY',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','SEQ_SNK_EOR_OFF_N',2030,'SNK_EOR_OFF_DMY',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','SEQ_SNK_DOF_ONS_N',2030,'SNK_DOF_ONS_DMY',1.00,'10.1016/j.fusengdes.2024.114679');
--INSERT INTO "Efficiency" VALUES ('EU','ethos','SEQ_SNK_DGF_ONS_N',2030,'SNK_DGF_ONS_DMY',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','SEQ_SNK_DOF_OFF_N',2030,'SNK_DOF_OFF_DMY',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','SEQ_SNK_DGF_OFF_N',2030,'SNK_DGF_OFF_DMY',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','SEQ_SNK_ECB_N',2030,'SNK_ECB_DMY',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','SEQ_SNK_ECB_DEEP_N',2030,'SNK_ECB_DEEP_DMY',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','SEQ_SNK_DSA_ONS_N',2030,'SNK_DSA_ONS_DMY',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','SEQ_SNK_DSA_OFF_N',2030,'SNK_DSA_OFF_DMY',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','SEQ_SNK_DOC_N',2030,'SNK_DOC_DMY',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','SEQ_SNK_AFF_1_N',2010,'SNK_AFF_DMY',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','SEQ_SNK_AFF_2_N',2010,'SNK_AFF_DMY',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','SEQ_SNK_AFF_3_N',2010,'SNK_AFF_DMY',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','SEQ_SNK_AFF_4_N',2010,'SNK_AFF_DMY',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ethos','SEQ_SNK_CO2_BKS_N',2010,'SNK_BKS_DMY',1.00,'10.1016/j.fusengdes.2024.114679');
---- Storage technologies
INSERT INTO "Efficiency" VALUES ('EU','SNK_EOR_ONS_DMY','SEQ_REM_EOR_ONS_N',2030,'DMY_OUT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','SNK_CO2','SEQ_REM_EOR_ONS_N',2030,'DMY_OUT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','SNK_EOR_OFF_DMY','SEQ_REM_EOR_OFF_N',2030,'DMY_OUT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','SNK_CO2','SEQ_REM_EOR_OFF_N',2030,'DMY_OUT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','SNK_DOF_ONS_DMY','SEQ_REM_DOF_ONS_N',2030,'DMY_OUT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','SNK_CO2','SEQ_REM_DOF_ONS_N',2030,'DMY_OUT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','SNK_DOF_OFF_DMY','SEQ_REM_DOF_OFF_N',2030,'DMY_OUT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','SNK_CO2','SEQ_REM_DOF_OFF_N',2030,'DMY_OUT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','SNK_DGF_OFF_DMY','SEQ_REM_DGF_OFF_N',2030,'DMY_OUT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','SNK_CO2','SEQ_REM_DGF_OFF_N',2030,'DMY_OUT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','SNK_ECB_DMY','SEQ_REM_ECB_N',2030,'DMY_OUT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','SNK_CO2','SEQ_REM_ECB_N',2030,'DMY_OUT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','SNK_ECB_DEEP_DMY','SEQ_REM_ECB_DEEP_N',2030,'DMY_OUT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','SNK_CO2','SEQ_REM_ECB_DEEP_N',2030,'DMY_OUT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','SNK_DSA_ONS_DMY','SEQ_REM_DSA_ONS_N',2030,'DMY_OUT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','SNK_CO2','SEQ_REM_DSA_ONS_N',2030,'DMY_OUT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','SNK_DSA_OFF_DMY','SEQ_REM_DSA_OFF_N',2030,'DMY_OUT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','SNK_CO2','SEQ_REM_DSA_OFF_N',2030,'DMY_OUT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','SNK_DOC_DMY','SEQ_REM_DOC_N',2030,'DMY_OUT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','SNK_CO2','SEQ_REM_DOC_N',2030,'DMY_OUT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','SNK_CO2','SEQ_REM_MIN_N',2030,'DMY_OUT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_CEN','SEQ_REM_MIN_N',2030,'DMY_OUT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','SNK_AFF_DMY','SEQ_REM_AFF_N',2010,'DMY_OUT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','SNK_CO2','SEQ_REM_AFF_N',2010,'DMY_OUT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','SNK_BKS_DMY','SEQ_REM_CO2_BKS_N',2010,'DMY_OUT',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','SNK_CO2','SEQ_REM_CO2_BKS_N',2010,'DMY_OUT',1.00,'10.1016/j.fusengdes.2024.114679');
-- Electricity sector
---- Fuel technologies
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA','ELC_FT_NGA',2010,'ELC_NGA',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','SYN_NGA','ELC_FT_NGA',2010,'ELC_NGA',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','BIO_GAS','ELC_FT_NGA',2010,'ELC_NGA',0.50,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','H2_BL','ELC_FT_NGA',2020,'ELC_NGA',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_CRD','ELC_FT_OIL',2010,'ELC_OIL',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_DST','ELC_FT_OIL',2010,'ELC_OIL',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_NSP','ELC_FT_OIL',2010,'ELC_OIL',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_HFO','ELC_FT_OIL',2010,'ELC_OIL',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_PTC','ELC_FT_OIL',2010,'ELC_OIL',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','OIL_LPG','ELC_FT_OIL',2010,'ELC_OIL',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','BIO_DST','ELC_FT_OIL',2020,'ELC_OIL',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_RFG','ELC_FT_OIL',2010,'ELC_OIL',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','COA_BCO','ELC_FT_COA',2010,'ELC_COA',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','COA_HCO','ELC_FT_COA',2010,'ELC_COA',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_BFG','ELC_FT_COA',2010,'ELC_COA',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_COG','ELC_FT_COA',2010,'ELC_COA',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GAS_OXY','ELC_FT_COA',2010,'ELC_COA',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','BIO_SLU','ELC_FT_BIO',2010,'ELC_BIO',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','BIO_WOD','ELC_FT_BIO',2010,'ELC_BIO',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','BIO_GAS','ELC_FT_BIO',2010,'ELC_BIO',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','BIO_MUN','ELC_FT_BIO',2010,'ELC_BIO',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','BIO_GAS','ELC_FT_BGS',2010,'ELC_BGS',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','BIO_STC','ELC_FT_CRP',2010,'ELC_CRP',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','BIO_SUG','ELC_FT_CRP',2010,'ELC_CRP',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','BIO_GRS','ELC_FT_CRP',2010,'ELC_CRP',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','BIO_MUN','ELC_FT_MUN',2010,'ELC_MUN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','BIO_SLU','ELC_FT_MUN',2010,'ELC_MUN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','HYD','ELC_FT_HYD',2010,'ELC_HYD_DAM',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','HYD','ELC_FT_HYD',2010,'ELC_HYD_ROR',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','GEO','ELC_FT_GEO',2010,'ELC_GEO',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','SOL_PV','ELC_FT_SOL_PV',2010,'ELC_SOL_PV',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','SOL_TH','ELC_FT_SOL_TH',2010,'ELC_SOL_TH',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','SOL_CSP','ELC_FT_SOL_CSP',2010,'ELC_SOL_CSP',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','WAV','ELC_FT_WAV',2010,'ELC_WAV',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','TDL','ELC_FT_TDL',2010,'ELC_TDL',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','WIN_ON','ELC_FT_WIN_ON',2010,'ELC_WIN_ON',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','WIN_OFF','ELC_FT_WIN_OFF',2010,'ELC_WIN_OFF',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','H2','ELC_FT_H2',2020,'ELC_H2',0.94,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('EU','H2_EL','ELC_FT_H2',2020,'ELC_H2',0.94,'PJ/PJ');
INSERT INTO "Efficiency" VALUES ('EU','ELC_CEN','ELC_FT_H2',2020,'ELC_H2',0.94,'PJ/PJ');

---- Base year technologies
INSERT INTO "Efficiency" VALUES ('EU','ELC_OIL','ELC_OIL_E',2005,'ELC_CEN',0.348,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_NGA','ELC_NGA_E',2005,'ELC_CEN',0.477*1.15,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_COA','ELC_COA_E',2005,'ELC_CEN',0.380,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_BIO','ELC_BIO_E',2005,'ELC_CEN',0.267,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_HYD_DAM','ELC_HYD_GEN_E',2005,'ELC_CEN',1.000,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_HYD_ROR','ELC_HYD_GEN_E',2005,'ELC_CEN',1.000,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_CEN','ELC_HYD_PUM_E',2005,'ELC_CEN',0.75,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_HET_LWR_UOX','ELC_NUC_FIS_E',2005,'ELC_CEN',0.311,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_HET_LWR_MOX','ELC_NUC_FIS_E',2005,'ELC_CEN',0.311,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_GEO','ELC_GEO_E',2005,'ELC_CEN',1.000,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_WIN_ON','ELC_WIN_E',2005,'ELC_CEN',1.000,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_SOL_PV','ELC_SOL_E',2005,'ELC_CEN',1.000,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_WAV','ELC_MAR_E',2005,'ELC_CEN',1.000,'10.1016/j.fusengdes.2024.114679');

INSERT INTO "Efficiency" VALUES ('EU','ELC_OIL','ELC_CHP_OIL_E',2005,'ELC_CEN',0.516,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_OIL','ELC_CHP_OIL_E',2005,'HET',0.516,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_NGA','ELC_CHP_NGA_E',2005,'ELC_CEN',0.428,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_NGA','ELC_CHP_NGA_E',2005,'HET',0.428,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_COA','ELC_CHP_COA_E',2005,'ELC_CEN',0.330,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_COA','ELC_CHP_COA_E',2005,'HET',0.330,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_BIO','ELC_CHP_BIO_E',2005,'ELC_CEN',0.242,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_BIO','ELC_CHP_BIO_E',2005,'HET',0.242,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_GEO','ELC_CHP_GEO_E',2005,'ELC_CEN',0.095,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_GEO','ELC_CHP_GEO_E',2005,'HET',0.095,'10.1016/j.fusengdes.2024.114679');

INSERT INTO "Efficiency" VALUES ('EU','ELC_OIL','HET_OIL_E',2005,'HET',0.732,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_NGA','HET_NGA_E',2005,'HET',0.901,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_COA','HET_COA_E',2005,'HET',0.818,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_BIO','HET_BIO_E',2005,'HET',0.701,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_GEO','HET_GEO_E',2005,'HET',0.556,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_SOL_TH','HET_SOL_E',2005,'HET',0.950,'10.1016/j.fusengdes.2024.114679');

INSERT INTO "Efficiency" VALUES ('EU','ELC_COA','ELC_COA_PUL_N',2010,'ELC_CEN',0.420,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_COA','ELC_COA_CCO_N',2010,'ELC_CEN',0.470,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_COA','ELC_COA_CCO_N',2020,'ELC_CEN',0.500,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_COA','ELC_COA_CCO_N',2030,'ELC_CEN',0.530,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_COA','ELC_COA_PFB_N',2010,'ELC_CEN',0.420,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_COA','ELC_COA_PFB_N',2020,'ELC_CEN',0.460,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_COA','ELC_COA_PFB_N',2040,'ELC_CEN',0.480,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_OIL','ELC_OIL_MIX_TUR_N',2010,'ELC_CEN',0.380,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_OIL','ELC_OIL_MIX_CCY_N',2010,'ELC_CEN',0.540,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_NGA','ELC_NGA_CCY_ADV_N',2010,'ELC_CEN',0.580,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_NGA','ELC_NGA_CCY_ADV_N',2020,'ELC_CEN',0.610,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_NGA','ELC_NGA_CCY_ADV_N',2030,'ELC_CEN',0.640,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_NGA','ELC_NGA_CCY_ADV_N',2040,'ELC_CEN',0.670,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_NGA','ELC_NGA_FCE_N',2010,'ELC_CEN',0.500,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_HET_LWR_UOX','ELC_NUC_FIS_LWR_N',2010,'ELC_CEN',0.342,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_HET_LWR_MOX','ELC_NUC_FIS_LWR_N',2010,'ELC_CEN',0.342,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_HET_LWR_UOX','ELC_NUC_FIS_EPR_N',2020,'ELC_CEN',0.360,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_HET_LWR_MOX','ELC_NUC_FIS_EPR_N',2020,'ELC_CEN',0.360,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_HET_FR_MOX','ELC_NUC_FIS_FR_N',2030,'ELC_CEN',0.403,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_HET_ABWR_TRU','ELC_NUC_FIS_ABWR_N',2040,'ELC_CEN',0.381,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_HET_ABWR_UTR','ELC_NUC_FIS_ABWR_N',2040,'ELC_CEN',0.381,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_HET_ADS_TRU','ELC_NUC_FIS_ADS_TRU_N',2040,'ELC_CEN',0.327,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','UPS_NUC_HET_ADS_MA','ELC_NUC_FIS_ADS_MA_N',2040,'ELC_CEN',0.315,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_OIL','ELC_OIL_GBL_N',2010,'ELC_CEN',0.370,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_OIL','ELC_OIL_GPL_N',2010,'ELC_CEN',0.325,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_BIO','ELC_BIO_GSF_CEN_N',2010,'ELC_CEN',0.350,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_BIO','ELC_BIO_GSF_CEN_N',2050,'ELC_CEN',0.380,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_BIO','ELC_BIO_COM_CEN_N',2010,'ELC_CEN',0.250,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_BIO','ELC_BIO_GSF_DEC_N',2010,'ELC_DST',0.350,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_BIO','ELC_BIO_GSF_DEC_N',2050,'ELC_CEN',0.380,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_BIO','ELC_BIO_COM_DEC_N',2010,'ELC_DST',0.250,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_BGS','ELC_BIO_GAS_N',2010,'ELC_CEN',0.357,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_CRP','ELC_BIO_CRP_GSF_N',2010,'ELC_CEN',0.350,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_CRP','ELC_BIO_CRP_GSF_N',2050,'ELC_CEN',0.380,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_CRP','ELC_BIO_CRP_COM_N',2010,'ELC_CEN',0.250,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_MUN','ELC_BIO_MUN_INC_N',2010,'ELC_CEN',0.380,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_HYD_DAM','ELC_HYD_GEN_DAM_N',2010,'ELC_CEN',1.000,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_HYD_ROR','ELC_HYD_GEN_RUN_N',2010,'ELC_CEN',1.000,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_GEO','ELC_GEO_FLS_N',2010,'ELC_CEN',1.00,'Assumption');
INSERT INTO "Efficiency" VALUES ('EU','ELC_GEO','ELC_GEO_BNY_N',2010,'ELC_CEN',1.00,'Assumption');
INSERT INTO "Efficiency" VALUES ('EU','ELC_GEO','ELC_GEO_BNY_HIG_N',2010,'ELC_CEN',1.00,'Assumption');
INSERT INTO "Efficiency" VALUES ('EU','ELC_WIN_ON','ELC_WIN_N',2010,'ELC_CEN',1.00,'Assumption');
INSERT INTO "Efficiency" VALUES ('EU','ELC_WIN_OFF','ELC_WIN_OFF_N',2010,'ELC_CEN',1.00,'Assumption');
INSERT INTO "Efficiency" VALUES ('EU','ELC_SOL_PV','ELC_SOL_PV_CEN_N',2010,'ELC_CEN',1.00,'Assumption');
INSERT INTO "Efficiency" VALUES ('EU','ELC_SOL_PV','ELC_SOL_PV_DST_N',2010,'ELC_DST',1.00,'Assumption');
INSERT INTO "Efficiency" VALUES ('EU','ELC_SOL_CSP','ELC_SOL_CSP_1_N',2010,'ELC_CEN',1.00,'Assumption');
INSERT INTO "Efficiency" VALUES ('EU','ELC_SOL_CSP','ELC_SOL_CSP_2_N',2010,'ELC_CEN',1.00,'Assumption');
INSERT INTO "Efficiency" VALUES ('EU','ELC_SOL_CSP','ELC_SOL_CSP_3_N',2010,'ELC_CEN',1.00,'Assumption');
INSERT INTO "Efficiency" VALUES ('EU','ELC_SOL_CSP','ELC_SOL_CSP_4_N',2010,'ELC_CEN',1.00,'Assumption');
INSERT INTO "Efficiency" VALUES ('EU','ELC_WAV','ELC_MAR_WAV_N',2010,'ELC_CEN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_TDL','ELC_MAR_TDL_N',2010,'ELC_CEN',1.00,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_CEN','ELC_HYD_PUM_N',2010,'ELC_CEN',0.80,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_H2','ELC_HH2_PEMFC_N',2025,'ELC_DST',0.45,'');
------ Sequestration technologies
INSERT INTO "Efficiency" VALUES ('EU','ELC_COA','ELC_COA_CCO_IG_CCS_N',2030,'ELC_CEN',0.403,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_COA','ELC_COA_CCO_FG_CCS_N',2030,'ELC_CEN',0.403,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_COA','ELC_COA_PUL_FG_CCS_N',2030,'ELC_CEN',0.381,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_NGA','ELC_NGA_FG_CCS_N',2030,'ELC_CEN',0.524,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_NGA','ELC_NGA_SOFC_CCS_N',2030,'ELC_CEN',0.670,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_CRP','ELC_BIO_CRP_GSF_CCS_N',2030,'ELC_CEN',0.345,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_CRP','ELC_BIO_CRP_COM_CCS_N',2030,'ELC_CEN',0.328,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_BIO','ELC_BIO_GSF_CCS_N',2030,'ELC_CEN',0.345,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_BIO','ELC_BIO_COM_CCS_N',2030,'ELC_CEN',0.328,'10.1016/j.fusengdes.2024.114679');
---- Heat
INSERT INTO "Efficiency" VALUES ('EU','ELC_NGA','HET_NGA_N',2010,'HET',0.952,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_OIL','HET_OIL_N',2010,'HET',0.952,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_BIO','HET_BIO_N',2010,'HET',0.847,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_COA','HET_COA_N',2010,'HET',0.952,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_GEO','HET_GEO_N',2010,'HET',0.800,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_SOL_TH','HET_SOL_N',2010,'HET',0.980,'');

---- CHP
INSERT INTO "Efficiency" VALUES ('EU','ELC_NGA','ELC_CHP_NGA_N',2010,'ELC_CEN',0.450,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_NGA','ELC_CHP_NGA_N',2010,'HET',0.450,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_NGA','ELC_CHP_NGA_N',2050,'ELC_CEN',0.559,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_NGA','ELC_CHP_NGA_N',2050,'HET',0.559,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_COA','ELC_CHP_COA_N',2010,'ELC_CEN',0.342,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_COA','ELC_CHP_COA_N',2010,'HET',0.342,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_COA','ELC_CHP_COA_N',2050,'ELC_CEN',0.476,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_COA','ELC_CHP_COA_N',2050,'HET',0.476,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_BIO','ELC_CHP_BIO_N',2010,'ELC_CEN',0.244,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_BIO','ELC_CHP_BIO_N',2010,'HET',0.244,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_BIO','ELC_CHP_BIO_N',2050,'ELC_CEN',0.250,'10.1016/j.fusengdes.2024.114679');
INSERT INTO "Efficiency" VALUES ('EU','ELC_BIO','ELC_CHP_BIO_N',2050,'HET',0.250,'10.1016/j.fusengdes.2024.114679');
-- Storage technologies
INSERT INTO "Efficiency" VALUES ('EU','ELC_CEN','ELC_STG_CEN_BTT_N',2020,'ELC_CEN',0.85,'10.25984/1871952');
INSERT INTO "Efficiency" VALUES ('EU','ELC_DST','ELC_STG_DST_BTT_N',2020,'ELC_DST',0.85,'10.25984/1871952');
-- Dummy demand technology
INSERT INTO "Efficiency" VALUES ('EU','ethos','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','HET','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','UPS_HET','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','UPS_ELC','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','OIL_NAP','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','BIO_NAP','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ELC_CEN','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ELC_DST','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','H2','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','UPS_FP_HLW','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','UPS_URA_SPENT','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','UPS_PU_SPENT','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','UPS_MA_SPENT','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','UPS_FP_SPENT','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','UPS_URA_HLW','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','UPS_PU_HLW','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','UPS_MA_HLW','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','URA_DEP','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','OIL_CRD_PRI','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','OIL_CRD','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','OIL_DST','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','OIL_NSP','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','OIL_HFO','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','OIL_PTC','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','OIL_LPG','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','GAS_LNG','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','OIL_NCR','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','OIL_ADD','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','GAS_NGA','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','GAS_RFG','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','GAS_BFG','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');;
INSERT INTO "Efficiency" VALUES ('EU','GAS_OXY','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','COA_OVC','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','GAS_COG','DMY_OUT_TECH',2010,'DMY_OUT',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','DMY_PHY_NON_ANNUAL',2010,'SYN_DST',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','DMY_PHY_NON_ANNUAL',2010,'SYN_GSL',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','DMY_PHY_NON_ANNUAL',2010,'SYN_KER',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','DMY_PHY_NON_ANNUAL',2010,'SYN_NGA',1.00,'');

-- Linked technologies
INSERT INTO "Efficiency" VALUES ('EU','ethos','ELC_COA_CCO_IG_CCS_N_LINKED',2030,'SNK_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','ELC_COA_CCO_FG_CCS_N_LINKED',2030,'SNK_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','ELC_COA_PUL_FG_CCS_N_LINKED',2030,'SNK_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','ELC_NGA_FG_CCS_N_LINKED',2030,'SNK_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','ELC_NGA_SOFC_CCS_N_LINKED',2030,'SNK_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','ELC_BIO_CRP_GSF_CCS_N_LINKED',2030,'SNK_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','ELC_BIO_CRP_COM_CCS_N_LINKED',2030,'SNK_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','ELC_BIO_GSF_CCS_N_LINKED',2030,'SNK_CO2',1.00,'');
INSERT INTO "Efficiency" VALUES ('EU','ethos','ELC_BIO_COM_CCS_N_LINKED',2030,'SNK_CO2',1.00,'');
-- Distrib and demand
INSERT INTO "Efficiency" VALUES ('IT','ELC_CEN','DISTR_ELC',2007,'ELC_DST',0.95,'');
INSERT INTO "Efficiency" VALUES ('IT','ELC_DST','END_USES_ELC',2007,'ELC_DEM',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','HET','END_USES_HET',2007,'HET_DEM',1.00,'');
-- Dummy
INSERT INTO "Efficiency" VALUES ('IT','ethos','DMY_OUT_TECH',2007,'DMY_OUT',1.00,'');
-- Other sectors and dummies (not required in the whole database)
INSERT INTO "Efficiency" VALUES ('IT','SNK_ELC_CO2','DMY_ELC_TECH',2007,'DMY_OUT',1.00,'');
-- Materials
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_ALU',2007,'ALU',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_BOR',2007,'BOR',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_CER',2007,'CER',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_CHR',2007,'CHR',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_COB',2007,'COB',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_COP',2007,'COP',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_DYS',2007,'DYS',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_EUP',2007,'EUP',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_FLU',2007,'FLU',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_GAD',2007,'GAD',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_GAL',2007,'GAL',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_GER',2007,'GER',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_GRA',2007,'GRA',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_IND',2007,'IND',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_IRI',2007,'IRI',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_LAN',2007,'LAN',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_LIT',2007,'LIT',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_MAG',2007,'MAG',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_MAN',2007,'MAN',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_MOL',2007,'MOL',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_NEO',2007,'NEO',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_NIC',2007,'NIC',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_NIO',2007,'NIO',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_PAL',2007,'PAL',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_PHO',2007,'PHO',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_PLA',2007,'PLA',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_PRA',2007,'PRA',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_SIL',2007,'SIL',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_SIV',2007,'SIV',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_TAN',2007,'TAN',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_TER',2007,'TER',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_TIT',2007,'TIT',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_VAN',2007,'VAN',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_YTT',2007,'YTT',1.00,'');
INSERT INTO "Efficiency" VALUES ('IT','ethos','MAT_SUP_ZIR',2007,'ZIR',1.00,'');

CREATE TABLE "ExistingCapacity" (
	"regions"	text,
	"tech"	text,
	"vintage"	integer,
	"exist_cap"	real,
	"exist_cap_units"	text,
	"exist_cap_notes"	text,
	PRIMARY KEY("regions","tech","vintage"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods")
);
---- Import
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_BIO_DST',2005,7013.0*0.0385,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_BIO_ETH',2005,6573.7*0.027,'PJ','');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_BIO_WOD',2005,283.0,'PJ','');

INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_ELC_AFR',2005,0.55,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_ELC_OEE',2005,3.90,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_ELC_RUS',2005,2.60,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_OIL_USA',2005,71.770,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_OIL_CAN',2005,34.955,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_OIL_MEX',2005,441.091,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_OIL_OLA',2005,646.722,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_OIL_BRA',2005,295.924,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_OIL_RUS',2005,10628.103,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_OIL_MEA',2005,6569.433,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_OIL_AFR',2005,5585.593,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_OIL_CHI',2005,4.369,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_OIL_ODA',2005,266.533,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_OIL_FEE',2005,1602.423,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_EXP_OIL',2005,11895.702+8693.412,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_GAS_PIP_AFR',2005,2283.528,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_GAS_PIP_RUS',2005,6990.903,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_GAS_PIP_CAC',2005,36.628,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_GAS_LNG_AFR',2005,1190.230,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_GAS_LNG_MEA',2005,1185.770,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_GAS_LNG_OLA',2005,228.520,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_EXP_GAS',2005,6526.164,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_COA_AFR',2005,447.240,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_COA_AUS',2005,424.667,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_COA_CAN',2005,119.584,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_COA_OEE',2005,118.768,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_COA_RUS',2005,1130.197,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_COA_ODA',2005,284.870,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_COA_USA',2005,666.473,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_IMP_COA_OLA',2005,944.024,'','10.1016/j.fusengdes.2024.114679');

-- Upstream sector
-- Non-renewable primary energy sources
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_LOC_HOIL_1',2005,96114.274,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_LOC_HOIL_2',2005,57668.565,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_LOC_HOIL_3',2005,38445.710,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_LOC_HSAN_1',2005,478.300,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_LOC_HSAN_2',2005,478.300,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_LOC_HSAN_3',2005,239.150,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_LOC_NGA_1',2005,3335.857,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_LOC_NGA_2',2005,3558.247,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_LOC_NGA_3',2005,2001.514,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_LOC_BCO',2005,144619.242,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_LOC_HCO',2005,54680.751,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_GRO_HOIL_1',2005,47646.307,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_GRO_HOIL_2',2005,28587.784,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_GRO_HOIL_3',2005,19058.523,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_GRO_NGA_1',2005,735.285,'','WEO11, WEO12');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_GRO_NGA_2',2005,980.381,'','WEO11, WEO12');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_GRO_NGA_3',2005,735.285,'','WEO11, WEO12');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_REC_HSAN_1',2005,972.543,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_REC_HSAN_2',2005,972.543,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_REC_HSAN_3',2005,486.272,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_DIS_HOIL_1',2005,192811.853,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_DIS_HOIL_2',2005,115687.112,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_DIS_HOIL_3',2005,77124.741,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_DIS_NGA_1',2005,1084.751,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_DIS_NGA_2',2005,1446.335,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_DIS_NGA_3',2005,1084.751,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_DIS_BCO',2005,971161.167,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_DIS_HCO',2005,367330.132,'','10.1016/j.fusengdes.2024.114679');
---- Primary renewable sources
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_BIO_RPS_POT',2005,373.6,'','');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_BIO_CRP_STC_POT',2005,172.7,'','');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_BIO_CRP_SUG_POT',2005,346.6,'','');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_BIO_AGR_WST_POT',2005,1109.8,'','');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_BIO_FOR_2_POT',2005,533.3,'','');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_BIO_WOD_RES_1_POT',2005,110.6,'','');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_BIO_WOD_RES_2_POT',2005,156.2,'','');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_BIO_WOD_PRD_1_POT',2005,977.3,'','');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_BIO_MUN_POT',2005,424.3,'','');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_BIO_SLU_POT',2005,24.1,'','');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_BIO_GAS_POT',2005,1246.0,'','');
---- Generation 1 biofuels
INSERT INTO "ExistingCapacity" VALUES ('EU','BIO_REF1_TRANSESTER_E',2005,4228.00*0.0385,'PJ','10.5281/zenodo.3544900');
INSERT INTO "ExistingCapacity" VALUES ('EU','BIO_REF1_ETHAMIDE_E',2005,1012.07*0.027,'PJ','10.5281/zenodo.3544900');
INSERT INTO "ExistingCapacity" VALUES ('EU','BIO_REF1_ETHSUG_E',2005,497.31*0.027,'PJ','10.5281/zenodo.3544900');
---- Primary energy production
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_PRI_HFO_1_E',2005,13795.657,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_PRI_HFO_2_E',2005,224.320,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_PRI_HFO_3_E',2005,0.123,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_PRI_HOIL_E',2005,27.597,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_PRI_FIP_NGA_1_E',2005,10724.049,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_PRI_FIP_NGA_2_E',2005,1795.373,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_PRI_COA_HCO_E',2005,4402.811,'','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_PRI_COA_BCO_E',2005,4132.524,'','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_PRI_ADD_E',2005,77.691,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_SEC_L2G_ON',2005,3801.877,'','Gas Infrastructure Europe, "Securing gas supplies for Europe: Developing infrastructure for LNG", 2012'); 
---- Secondary transformation
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_SEC_COA_OVC',2005,1834.620,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_SEC_GAS_TWN',2005,22.332,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_SEC_GAS_BFG',2005,575.222,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_SEC_REF_FDS',2005,487.650,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_SEC_LIQ',2005,15.861,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_SEC_TRA',2005,8.693,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_SEC_REF_FLX',2005,3.287E+04,'','10.1016/j.fusengdes.2024.114679');
---- Heat production in the refinery sector
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_HET_GAS_NGA',2005,0.101,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_HET_OIL_RPP',2005,0.493,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','UPS_HET_OIL_RPG',2005,0.808,'','10.1016/j.fusengdes.2024.114679');
-- Electricity sector
INSERT INTO "ExistingCapacity" VALUES ('EU','ELC_OIL_E',2005,38.594,'GW','EMBER, Global Electricity Review 2022, 2023');
INSERT INTO "ExistingCapacity" VALUES ('EU','ELC_NGA_E',2005,185.139,'GW','EMBER, Global Electricity Review 2022, 2023');
INSERT INTO "ExistingCapacity" VALUES ('EU','ELC_COA_E',2005,230.98,'GW','EMBER, Global Electricity Review 2022, 2023');
INSERT INTO "ExistingCapacity" VALUES ('EU','ELC_BIO_E',2005,13.940,'GW','');
INSERT INTO "ExistingCapacity" VALUES ('EU','ELC_HYD_GEN_E',2005,134.758,'GW','EIA');
INSERT INTO "ExistingCapacity" VALUES ('EU','ELC_HYD_PUM_E',2005,53.209,'GW','EIA');
INSERT INTO "ExistingCapacity" VALUES ('EU','ELC_NUC_FIS_E',2005,134.501,'GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','ELC_GEO_E',2005,0.900,'GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','ELC_WIN_E',2005,40.574,'GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','ELC_SOL_E',2005,2.334,'GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','ELC_MAR_E',2005,1.210,'GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','ELC_CHP_OIL_E',2005,(68.47+66.30)/31.536/0.30,'GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','ELC_CHP_NGA_E',2005,(670.18+658.63)/31.536/0.35,'GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','ELC_CHP_COA_E',2005,(839.35+611.91)/31.536/0.40,'GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','ELC_CHP_BIO_E',2005,(110.05+155.62)/31.536/0.60,'GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','ELC_CHP_GEO_E',2005,(4.14+8.07)/31.536/0.80,'GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','HET_OIL_E',2005,262.45*0.31,'PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','HET_NGA_E',2005,2174.25*0.21,'PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','HET_COA_E',2005,854.46*0.16,'PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','HET_BIO_E',2005,(226.767+45.917)*0.38,'PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','HET_GEO_E',2005,23.81*0.21,'PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "ExistingCapacity" VALUES ('EU','HET_SOL_E',2005,0.55,'PJ','10.1016/j.fusengdes.2024.114679');

CREATE TABLE "CostInvest" (
	"regions"	text,
	"tech"	text,
	"vintage"	integer,
	"cost_invest"	real,
	"cost_invest_units"	text,
	"cost_invest_notes"	text,
	PRIMARY KEY("regions","tech","vintage"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods")
);
-- Micro-CHP
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_CI_N',2007,1100.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_CI_N',2014,1050.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_CI_N',2022,980.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_CI_N',2030,900.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_CI_N',2050,900.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_MICRO_N',2007,1500.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_MICRO_N',2014,1350.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_MICRO_N',2022,1160.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_MICRO_N',2030,1000.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_MICRO_N',2050,1000.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_CC_N',2007,1300.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_CC_N',2014,1300.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_CC_N',2022,1300.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_CC_N',2030,1300.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_CC_N',2050,1300.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_SLB_CI_N',2007,1870.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_SLB_CI_N',2014,1785.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_SLB_CI_N',2022,1666.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_SLB_CI_N',2030,1530.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_SLB_CI_N',2050,1350.0,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_SOFC_N',2020,10000,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_SOFC_N',2025,7750,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_NGA_SOFC_N',2030,2250,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_H2_PEMFC_N',2025,1500,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','COM_CHP_H2_PEMFC_N',2030,1050,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CHP_NGA_CI_N',2007,1.10E+03,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CHP_NGA_CI_N',2014,1.05E+03,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CHP_NGA_CI_N',2022,1.03E+03,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CHP_NGA_CI_N',2030,9.45E+02,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CHP_NGA_TG_N',2007,8.00E+02,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CHP_NGA_TV_N',2007,1.50E+03,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CHP_BLQ_CI_N',2014,2.10E+03,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CHP_BLQ_CI_N',2022,2.06E+03,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CHP_BLQ_CI_N',2030,1.89E+03,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','IND_CHP_BLQ_CI_N',2050,1.80E+03,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_CI_N',2007,1100,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_CI_N',2014,1050,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_CI_N',2022,980,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_CI_N',2030,900,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_MICRO_N',2007,1500,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_MICRO_N',2014,1350,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_MICRO_N',2022,1160,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_MICRO_N',2030,1000,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_CC_N',2007,1300,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_CC_N',2014,1300,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_CC_N',2022,1300,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_STR_N',2022,2180,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_STR_N',2030,2100,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_SOFC_N',2020,10000,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_SOFC_N',2025,8000,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_NGA_SOFC_N',2030,3500,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_H2_PEMFC_N',2020,6000,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_H2_PEMFC_N',2025,5000,'M€/GW','');
INSERT INTO "CostInvest" VALUES ('IT','RES_CHP_H2_PEMFC_N',2030,4000,'M€/GW','');

INSERT INTO "CostInvest" VALUES ('EU','ELC_FT_H2',2020,30.29,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('EU','ELC_OIL_E',2010,1E6,'','');
INSERT INTO "CostInvest" VALUES ('EU','ELC_NGA_E',2010,1E6,'','');
INSERT INTO "CostInvest" VALUES ('EU','ELC_COA_E',2010,1E6,'','');
INSERT INTO "CostInvest" VALUES ('EU','ELC_BIO_E',2010,1E6,'','');
INSERT INTO "CostInvest" VALUES ('EU','ELC_HYD_GEN_E',2010,1E6,'','');
INSERT INTO "CostInvest" VALUES ('EU','ELC_HYD_PUM_E',2010,1E6,'','');
INSERT INTO "CostInvest" VALUES ('EU','ELC_NUC_FIS_E',2010,1E6,'','');
INSERT INTO "CostInvest" VALUES ('EU','ELC_GEO_E',2010,1E6,'','');
INSERT INTO "CostInvest" VALUES ('EU','ELC_WIN_E',2010,1E6,'','');
INSERT INTO "CostInvest" VALUES ('EU','ELC_SOL_E',2010,1E6,'','');
INSERT INTO "CostInvest" VALUES ('EU','ELC_MAR_E',2010,1E6,'','');
INSERT INTO "CostInvest" VALUES ('EU','ELC_CHP_OIL_E',2010,1E6,'','');
INSERT INTO "CostInvest" VALUES ('EU','ELC_CHP_NGA_E',2010,1E6,'','');
INSERT INTO "CostInvest" VALUES ('EU','ELC_CHP_COA_E',2010,1E6,'','');
INSERT INTO "CostInvest" VALUES ('EU','ELC_CHP_BIO_E',2010,1E6,'','');
INSERT INTO "CostInvest" VALUES ('EU','ELC_CHP_GEO_E',2010,1E6,'','');
INSERT INTO "CostInvest" VALUES ('EU','HET_OIL_E',2010,1E6,'','');
INSERT INTO "CostInvest" VALUES ('EU','HET_NGA_E',2010,1E6,'','');
INSERT INTO "CostInvest" VALUES ('EU','HET_COA_E',2010,1E6,'','');
INSERT INTO "CostInvest" VALUES ('EU','HET_BIO_E',2010,1E6,'','');
INSERT INTO "CostInvest" VALUES ('EU','HET_GEO_E',2010,1E6,'','');
INSERT INTO "CostInvest" VALUES ('EU','HET_SOL_E',2010,1E6,'','');
---- Secondary transformation
INSERT INTO "CostInvest" VALUES ('EU','UPS_SEC_REF_FLX',2010,4.58,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostInvest" VALUES ('EU','UPS_HET_OIL_RPP',2010,150,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostInvest" VALUES ('EU','UPS_HET_OIL_RPG',2010,150,'M€/PJ','10.1016/j.fusengdes.2024.114679');
---- Gas pipelines
INSERT INTO "CostInvest" VALUES ('EU','UPS_IMP_GAS_PIP_MEA',2030,9.70,'M€/PJ','Based on NordStream');
---- Regasification
INSERT INTO "CostInvest" VALUES ('EU','UPS_SEC_L2G_ON',2010,3.50,'M€/PJ','10.1007/978-3-030-86884-0_2');
INSERT INTO "CostInvest" VALUES ('EU','UPS_SEC_L2G_ON',2015,4.50,'M€/PJ','10.1007/978-3-030-86884-0_2');
INSERT INTO "CostInvest" VALUES ('EU','UPS_SEC_L2G_ON',2020,4.90,'M€/PJ','10.1007/978-3-030-86884-0_2');
INSERT INTO "CostInvest" VALUES ('EU','UPS_SEC_L2G_OFF',2010,2.00,'M€/PJ','10.1007/978-3-030-86884-0_2');
-- Biofuels
INSERT INTO "CostInvest" VALUES ('EU','BIO_REF1_TRANSESTER_E',2010,1.497,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','BIO_REF1_TRANSESTER_E',2020,1.337,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','BIO_REF1_TRANSESTER_E',2030,1.283,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','BIO_REF1_ETHAMIDE_E',2010,22.612,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','BIO_REF1_ETHAMIDE_E',2015,20.634,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','BIO_REF1_ETHAMIDE_E',2020,18.694,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','BIO_REF1_ETHAMIDE_E',2025,16.978,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','BIO_REF1_ETHAMIDE_E',2030,15.746,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','BIO_REF1_ETHSUG_E',2010,8.220,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','BIO_REF1_ETHSUG_E',2015,7.507,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','BIO_REF1_ETHSUG_E',2020,6.791,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','BIO_REF1_ETHSUG_E',2025,6.168,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','BIO_REF1_ETHSUG_E',2030,5.720,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','BIO_REF1_HVO_N',2015,19.03,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','BIO_REF1_HVO_N',2020,19.03,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','BIO_REF1_HVO_N',2030,14.27,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','BIO_REF2_ETH_N',2020,87.20,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','BIO_REF2_DST_N',2020,112.57,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','BIO_REF2_KER_N',2020,112.57,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','BIO_REF2_ETH_N',2030,65.40,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','BIO_REF2_DST_N',2030,84.43,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','BIO_REF2_KER_N',2030,84.43,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','BIO_REF2_ETH_CCS_N',2030,68.67,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','BIO_REF2_DST_CCS_N',2030,88.65,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','BIO_REF2_KER_CCS_N',2030,88.65,'M€/PJ','10.5281/zenodo.3544900');
-- Hydrogen
INSERT INTO "CostInvest" VALUES ('EU','H2_SR_NGA',2015,23.52,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostInvest" VALUES ('EU','H2_SR_NGA',2025,21.03,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostInvest" VALUES ('EU','H2_SR_NGA',2030,16.15,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostInvest" VALUES ('EU','H2_GS_COA',2015,16.42,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostInvest" VALUES ('EU','H2_GS_COA',2025,16.42,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostInvest" VALUES ('EU','H2_GS_COA',2030,14.65,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostInvest" VALUES ('EU','H2_PO_OIL',2015,13.69,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostInvest" VALUES ('EU','H2_SR_BIO',2015,16.47,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostInvest" VALUES ('EU','H2_GS_BIO',2015,106.84,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostInvest" VALUES ('EU','H2_GS_BIO',2020,69.60,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostInvest" VALUES ('EU','H2_SR_ETH',2015,233.99,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostInvest" VALUES ('EU','H2_EL_ALK',2020,46.63,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('EU','H2_EL_ALK',2030,28.42,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('EU','H2_EL_ALK',2050,23.57,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('EU','H2_EL_PEM',2020,62.62,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('EU','H2_EL_PEM',2030,35.28,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('EU','H2_EL_PEM',2040,25.74,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('EU','H2_EL_PEM',2050,22.54,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('EU','H2_EL_SOEC',2020,90.54,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('EU','H2_EL_SOEC',2025,47.06,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('EU','H2_EL_SOEC',2030,36.58,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('EU','H2_EL_SOEC',2050,32.50,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('EU','H2_EL_AEM',2050,35.92,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('EU','H2_BL_DMY',2020,2.7,'M€/PJ','');
INSERT INTO "CostInvest" VALUES ('EU','H2_BL_DMY',2025,2.5,'M€/PJ','');
-- CCUS
INSERT INTO "CostInvest" VALUES ('EU','CCUS_H2_SR_NGA',2020,20.63,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostInvest" VALUES ('EU','CCUS_H2_GS_COA',2020,16.24,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostInvest" VALUES ('EU','CCUS_H2_GS_BIO',2020,41.51,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostInvest" VALUES ('EU','CCUS_ELC_COA',2020,5542,'M€/GW','10.25984/1871952');
INSERT INTO "CostInvest" VALUES ('EU','CCUS_ELC_COA',2030,3416,'M€/GW','10.25984/1871952');
INSERT INTO "CostInvest" VALUES ('EU','CCUS_ELC_NGA',2020,2630,'M€/GW','10.25984/1871952');
INSERT INTO "CostInvest" VALUES ('EU','CCUS_ELC_NGA',2050,1582,'M€/GW','10.25984/1871952');
INSERT INTO "CostInvest" VALUES ('EU','CCUS_DAC',2020,2.32,'M€/kt','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','CCUS_DAC',2030,1.86,'M€/kt','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','CCUS_DAC',2050,1.48,'M€/kt','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','SF_NGA_METH',2020,19.03,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','SF_NGA_METH',2030,14.27,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','SF_NGA_METH',2050,7.93,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','SF_DST_HYDR',2025,15.47,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','SF_DST_HYDR',2030,12.43,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','SF_DST_COELC',2025,31.57,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','SF_DST_COELC',2030,28.22,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','SF_KER_HYDR',2025,15.47,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','SF_KER_HYDR',2030,12.43,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','SF_KER_COELC',2025,31.57,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','SF_KER_COELC',2030,28.22,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','SF_DSTKER_DAC',2025,126.26,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','SF_DSTKER_DAC',2030,112.86,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','SF_MEOH_HYDR',2025,26.94,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','SF_MEOH_COELC',2025,59.42,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostInvest" VALUES ('EU','SF_MEOH_DAC',2025,237.68,'M€/PJ','10.5281/zenodo.3544900');
---- Storage technologies
INSERT INTO "CostInvest" VALUES ('EU','SEQ_REM_EOR_ONS_N',2030,0.0033,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostInvest" VALUES ('EU','SEQ_REM_EOR_OFF_N',2030,0.0070,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostInvest" VALUES ('EU','SEQ_REM_DOF_ONS_N',2030,0.0033,'','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "CostInvest" VALUES ('EU','SEQ_REM_DGF_ONS_N',2030,0.0033,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostInvest" VALUES ('EU','SEQ_REM_DOF_OFF_N',2030,0.0070,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostInvest" VALUES ('EU','SEQ_REM_DGF_OFF_N',2030,0.0070,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostInvest" VALUES ('EU','SEQ_REM_ECB_N',2030,0.0050,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostInvest" VALUES ('EU','SEQ_REM_ECB_DEEP_N',2030,0.0100,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostInvest" VALUES ('EU','SEQ_REM_DSA_ONS_N',2030,0.0050,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostInvest" VALUES ('EU','SEQ_REM_DSA_OFF_N',2030,0.0105,'','10.1016/j.fusengdes.2024.114679');

---- New technologies
INSERT INTO "CostInvest" VALUES ('EU','ELC_COA_PUL_N',2010,1800,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_COA_PUL_N',2020,1700,'M€/GW','WEO22,WEO23');
--INSERT INTO "CostInvest" VALUES ('EU','ELC_COA_PUL_N',2030,1600,'M€/GW','WEO22,WEO23');
--INSERT INTO "CostInvest" VALUES ('EU','ELC_COA_PUL_N',2040,1500,'M€/GW','WEO22,WEO23');
--INSERT INTO "CostInvest" VALUES ('EU','ELC_COA_PUL_N',2050,1414,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_COA_CCO_N',2010,2000,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_COA_CCO_N',2020,1800,'M€/GW','WEO22,WEO23');
--INSERT INTO "CostInvest" VALUES ('EU','ELC_COA_CCO_N',2030,1700,'M€/GW','WEO22,WEO23');
--INSERT INTO "CostInvest" VALUES ('EU','ELC_COA_CCO_N',2040,1600,'M€/GW','WEO22,WEO23');
--INSERT INTO "CostInvest" VALUES ('EU','ELC_COA_CCO_N',2050,1542,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_COA_PFB_N',2010,2357,'M€/GW','WEO22,WEO23');
--INSERT INTO "CostInvest" VALUES ('EU','ELC_COA_PFB_N',2030,1980,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_OIL_MIX_TUR_N',2010,513,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_OIL_MIX_CCY_N',2010,878,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_NGA_CCY_ADV_N',2010,846,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_NGA_CCY_ADV_N',2020,790,'M€/GW','WEO22,WEO23');
--INSERT INTO "CostInvest" VALUES ('EU','ELC_NGA_CCY_ADV_N',2030,733,'M€/GW','WEO22,WEO23');
--INSERT INTO "CostInvest" VALUES ('EU','ELC_NGA_CCY_ADV_N',2040,677,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_NGA_FCE_N',2010,5000,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_NGA_FCE_N',2020,3000,'M€/GW','WEO22,WEO23');
--INSERT INTO "CostInvest" VALUES ('EU','ELC_NGA_FCE_N',2050,2368,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_NUC_FIS_LWR_N',2010,3200,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_NUC_FIS_EPR_N',2020,6600,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_NUC_FIS_EPR_N',2030,5100,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_NUC_FIS_EPR_N',2050,4500,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_NUC_FIS_FR_N',2030,3200*3,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_NUC_FIS_FR_N',2040,2900*3,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_NUC_FIS_FR_N',2050,2645*3,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_NUC_FIS_ABWR_N',2040,2900*3,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_NUC_FIS_ABWR_N',2050,2650*3,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_NUC_FIS_ADS_TRU_N',2040,2900*3,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_NUC_FIS_ADS_TRU_N',2050,2650*3,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_NUC_FIS_ADS_MA_N',2040,2900*3,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_NUC_FIS_ADS_MA_N',2050,2650*3,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_OIL_GBL_N',2010,599,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_OIL_GPL_N',2010,538,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_BIO_GSF_CEN_N',2010,2902,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_BIO_GSF_CEN_N',2020,2371,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_BIO_COM_CEN_N',2010,1974,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_BIO_COM_CEN_N',2020,1612,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_BIO_GSF_DEC_N',2010,2902,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_BIO_GSF_DEC_N',2020,2371,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_BIO_COM_DEC_N',2010,1974,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_BIO_COM_DEC_N',2020,1612,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_BIO_GAS_N',2010,3773,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_BIO_CRP_GSF_N',2010,2902,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_BIO_CRP_GSF_N',2020,2371,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_BIO_CRP_COM_N',2010,1974,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_BIO_CRP_COM_N',2020,1612,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_BIO_MUN_INC_N',2010,2263,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_BIO_MUN_INC_N',2020,1956,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_HYD_GEN_DAM_N',2010,1260,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_HYD_GEN_DAM_N',2050,1710,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_HYD_GEN_RUN_N',2010,2500,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_HYD_PUM_N',2010,947.65,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_GEO_FLS_N',2010,1175,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_GEO_FLS_N',2050,1710,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_GEO_BNY_N',2010,2981,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_GEO_BNY_N',2050,3475,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_GEO_BNY_HIG_N',2010,3639,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_GEO_BNY_HIG_N',2050,4271,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_WIN_N',2010,1425,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_WIN_N',2020,1053,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_WIN_OFF_N',2010,4500,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_WIN_OFF_N',2020,3600,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_WIN_OFF_N',2030,2020,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_SOL_PV_CEN_N',2010,2200,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_SOL_PV_CEN_N',2020,500,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_SOL_PV_DST_N',2010,2400,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_SOL_PV_DST_N',2020,700,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_SOL_CSP_1_N',2010,5400,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_SOL_CSP_2_N',2010,4647,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_SOL_CSP_3_N',2010,9227,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_SOL_CSP_4_N',2010,16535,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_SOL_CSP_1_N',2020,2862,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_SOL_CSP_2_N',2020,2565,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_SOL_CSP_3_N',2020,5517,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_SOL_CSP_4_N',2020,9127,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_MAR_WAV_N',2010,3340,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_MAR_WAV_N',2050,2060,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_MAR_TDL_N',2010,2400,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_MAR_TDL_N',2050,1440,'M€/GW','WEO22,WEO23');
INSERT INTO "CostInvest" VALUES ('EU','ELC_HH2_PEMFC_N',2025,3000,'M€/GW','');
--INSERT INTO "CostInvest" VALUES ('EU','ELC_HH2_PEMFC_N',2030,2000,'M€/GW','');
--INSERT INTO "CostInvest" VALUES ('EU','ELC_HH2_PEMFC_N',2040,1500,'M€/GW','');
--INSERT INTO "CostInvest" VALUES ('EU','ELC_HH2_PEMFC_N',2050,1000,'M€/GW','');
---- Sequestration technologies
INSERT INTO "CostInvest" VALUES ('EU','ELC_COA_CCO_IG_CCS_N',2030,2820.58,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostInvest" VALUES ('EU','ELC_COA_CCO_FG_CCS_N',2030,2693.22,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostInvest" VALUES ('EU','ELC_COA_PUL_FG_CCS_N',2030,2567.06,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostInvest" VALUES ('EU','ELC_NGA_FG_CCS_N',2030,1427.87,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostInvest" VALUES ('EU','ELC_NGA_SOFC_CCS_N',2030,5158.00,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostInvest" VALUES ('EU','ELC_BIO_CRP_GSF_CCS_N',2030,3601.32,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostInvest" VALUES ('EU','ELC_BIO_CRP_COM_CCS_N',2030,3344.11,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostInvest" VALUES ('EU','ELC_BIO_GSF_CCS_N',2030,3538.42,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostInvest" VALUES ('EU','ELC_BIO_COM_CCS_N',2030,2627.10,'','10.1016/j.fusengdes.2024.114679');

--INSERT INTO "CostInvest" VALUES ('EU','ELC_COA_CCO_IG_CCS_N',2040,2640.22,'','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "CostInvest" VALUES ('EU','ELC_COA_CCO_FG_CCS_N',2040,2517.42,'','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "CostInvest" VALUES ('EU','ELC_COA_PUL_FG_CCS_N',2040,2408.33,'','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "CostInvest" VALUES ('EU','ELC_NGA_FG_CCS_N',2040,1338.43,'','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "CostInvest" VALUES ('EU','ELC_NGA_SOFC_CCS_N',2040,3316.00,'','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "CostInvest" VALUES ('EU','ELC_BIO_CRP_GSF_CCS_N',2040,3272.65,'','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "CostInvest" VALUES ('EU','ELC_BIO_CRP_COM_CCS_N',2040,3130.83,'','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "CostInvest" VALUES ('EU','ELC_BIO_GSF_CCS_N',2040,3272.65,'','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "CostInvest" VALUES ('EU','ELC_BIO_COM_CCS_N',2040,2408.33,'','10.1016/j.fusengdes.2024.114679');

---- Heat production
INSERT INTO "CostInvest" VALUES ('EU','HET_NGA_N',2010,110,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostInvest" VALUES ('EU','HET_OIL_N',2010,110,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostInvest" VALUES ('EU','HET_BIO_N',2010,330,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostInvest" VALUES ('EU','HET_COA_N',2010,110,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostInvest" VALUES ('EU','HET_GEO_N',2010,120,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostInvest" VALUES ('EU','HET_SOL_N',2010,100,'M€/PJ','');
---- CHP
INSERT INTO "CostInvest" VALUES ('EU','ELC_CHP_NGA_N',2010,950,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostInvest" VALUES ('EU','ELC_CHP_COA_N',2010,1200,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostInvest" VALUES ('EU','ELC_CHP_BIO_N',2010,2400,'M€/GW','10.1016/j.fusengdes.2024.114679');
---- Storage
INSERT INTO "CostInvest" VALUES ('EU','ELC_STG_CEN_BTT_N',2020,2466,'M€/GW','10.25984/1871952');
INSERT INTO "CostInvest" VALUES ('EU','ELC_STG_CEN_BTT_N',2030,1210,'M€/GW','10.25984/1871952');
INSERT INTO "CostInvest" VALUES ('EU','ELC_STG_CEN_BTT_N',2050,908,'M€/GW','10.25984/1871952');
INSERT INTO "CostInvest" VALUES ('EU','ELC_STG_DST_BTT_N',2020,2869,'M€/GW','10.25984/1871952');
INSERT INTO "CostInvest" VALUES ('EU','ELC_STG_DST_BTT_N',2030,1337,'M€/GW','10.25984/1871952');
INSERT INTO "CostInvest" VALUES ('EU','ELC_STG_DST_BTT_N',2050,1002,'M€/GW','10.25984/1871952');
-- Distrib and demand
INSERT INTO "CostInvest" VALUES ('IT','DISTR_ELC',2025,20,'M€/GW','Assumption');

CREATE TABLE "CostFixed" (
	"regions"	text NOT NULL,
	"periods"	integer NOT NULL,
	"tech"	text NOT NULL,
	"vintage"	integer NOT NULL,
	"cost_fixed"	real,
	"cost_fixed_units"	text,
	"cost_fixed_notes"	text,
	PRIMARY KEY("regions","periods","tech","vintage"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods")
);
-- Upstream sector
-- Primary production
INSERT INTO "CostFixed" VALUES ('EU',2005,'UPS_PRI_HFO_3_E',2005,8.00,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2005,'UPS_PRI_HOIL_E',2005,3.00,'M€/PJ','10.1016/j.fusengdes.2024.114679');
-- Secondary transformation
INSERT INTO "CostFixed" VALUES ('EU',2005,'UPS_SEC_REF_FLX',2005,0.0458,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'UPS_SEC_L2G_ON',2010,0.11,'M€/PJ','10.1007/978-3-030-86884-0_2');
INSERT INTO "CostFixed" VALUES ('EU',2015,'UPS_SEC_L2G_ON',2015,0.14,'M€/PJ','10.1007/978-3-030-86884-0_2');
INSERT INTO "CostFixed" VALUES ('EU',2010,'UPS_SEC_L2G_OFF',2015,0.10,'M€/PJ','10.1007/978-3-030-86884-0_2');
INSERT INTO "CostFixed" VALUES ('EU',2010,'UPS_HET_GAS_NGA',2010,10.0,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'UPS_HET_OIL_RPP',2010,10.0,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'UPS_HET_OIL_RPG',2010,11.0,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'BIO_REF1_CRUSHING_E',2010,0.790,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostFixed" VALUES ('EU',2005,'BIO_REF1_TRANSESTER_E',2005,0.449,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostFixed" VALUES ('EU',2005,'BIO_REF1_ETHAMIDE_E',2005,4.567,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostFixed" VALUES ('EU',2005,'BIO_REF1_ETHSUG_E',2005,1.791,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostFixed" VALUES ('EU',2015,'BIO_REF1_HVO_N',2015,1.217,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostFixed" VALUES ('EU',2020,'BIO_REF2_ETH_N',2020,7.556,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostFixed" VALUES ('EU',2020,'BIO_REF2_DST_N',2020,12.548,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostFixed" VALUES ('EU',2020,'BIO_REF2_KER_N',2020,12.548,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostFixed" VALUES ('EU',2030,'BIO_REF2_ETH_CCS_N',2030,7.556,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostFixed" VALUES ('EU',2030,'BIO_REF2_DST_CCS_N',2030,12.548,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostFixed" VALUES ('EU',2030,'BIO_REF2_KER_CCS_N',2030,12.548,'M€/PJ','10.5281/zenodo.3544900');
-- Hydrogen
INSERT INTO "CostFixed" VALUES ('EU',2015,'H2_SR_NGA',2015,0.78,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostFixed" VALUES ('EU',2030,'H2_SR_NGA',2030,0.68,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostFixed" VALUES ('EU',2015,'H2_GS_COA',2015,0.66,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostFixed" VALUES ('EU',2030,'H2_GS_COA',2030,0.58,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostFixed" VALUES ('EU',2015,'H2_PO_OIL',2015,0.68,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostFixed" VALUES ('EU',2015,'H2_SR_BIO',2015,0.66,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostFixed" VALUES ('EU',2015,'H2_GS_BIO',2015,2.31,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostFixed" VALUES ('EU',2020,'H2_EL_ALK',2020,1.40,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('EU',2030,'H2_EL_ALK',2030,0.85,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('EU',2050,'H2_EL_ALK',2050,0.71,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('EU',2020,'H2_EL_PEM',2020,1.88,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('EU',2030,'H2_EL_PEM',2030,1.06,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('EU',2040,'H2_EL_PEM',2040,0.77,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('EU',2050,'H2_EL_PEM',2050,0.68,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('EU',2020,'H2_EL_SOEC',2020,2.72,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('EU',2030,'H2_EL_SOEC',2030,1.41,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('EU',2050,'H2_EL_SOEC',2050,0.98,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('EU',2050,'H2_EL_AEM',2050,1.08,'M€/PJ','');
INSERT INTO "CostFixed" VALUES ('EU',2020,'H2_BL_DMY',2020,0.2,'M€/PJ','');
-- CCUS
INSERT INTO "CostFixed" VALUES ('EU',2020,'CCUS_H2_SR_NGA',2020,1.17,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostFixed" VALUES ('EU',2020,'CCUS_H2_GS_COA',2020,0.80,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostFixed" VALUES ('EU',2020,'CCUS_H2_GS_BIO',2020,2.07,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostFixed" VALUES ('EU',2020,'CCUS_ELC_COA',2020,125,'M€/GW','10.25984/1871952');
INSERT INTO "CostFixed" VALUES ('EU',2035,'CCUS_ELC_COA',2035,108,'M€/GW','10.25984/1871952');
INSERT INTO "CostFixed" VALUES ('EU',2020,'CCUS_ELC_NGA',2020,67,'M€/GW','10.25984/1871952');
INSERT INTO "CostFixed" VALUES ('EU',2035,'CCUS_ELC_NGA',2035,60,'M€/GW','10.25984/1871952');
INSERT INTO "CostFixed" VALUES ('EU',2020,'CCUS_DAC',2020,0.09,'M€/kt','10.5281/zenodo.3544900');
INSERT INTO "CostFixed" VALUES ('EU',2030,'CCUS_DAC',2030,0.09,'M€/kt','10.5281/zenodo.3544900');
INSERT INTO "CostFixed" VALUES ('EU',2050,'CCUS_DAC',2050,0.09,'M€/kt','10.5281/zenodo.3544900');
INSERT INTO "CostFixed" VALUES ('EU',2020,'SF_NGA_METH',2020,0.95,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostFixed" VALUES ('EU',2030,'SF_NGA_METH',2030,0.71,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostFixed" VALUES ('EU',2050,'SF_NGA_METH',2050,0.40,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostFixed" VALUES ('EU',2025,'SF_DST_HYDR',2025,2.85,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostFixed" VALUES ('EU',2030,'SF_DST_HYDR',2030,0.33,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostFixed" VALUES ('EU',2025,'SF_DST_COELC',2025,5.70,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostFixed" VALUES ('EU',2030,'SF_DST_COELC',2030,0.66,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostFixed" VALUES ('EU',2025,'SF_KER_HYDR',2025,2.85,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostFixed" VALUES ('EU',2030,'SF_KER_HYDR',2030,0.33,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostFixed" VALUES ('EU',2025,'SF_KER_COELC',2025,5.70,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostFixed" VALUES ('EU',2030,'SF_KER_COELC',2030,0.66,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostFixed" VALUES ('EU',2025,'SF_DSTKER_DAC',2025,22.81,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostFixed" VALUES ('EU',2030,'SF_DSTKER_DAC',2030,2.63,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostFixed" VALUES ('EU',2025,'SF_MEOH_HYDR',2025,1.72,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostFixed" VALUES ('EU',2025,'SF_MEOH_COELC',2025,3.26,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostFixed" VALUES ('EU',2025,'SF_MEOH_DAC',2025,13.06,'M€/PJ','10.5281/zenodo.3544900');
-- Storage technologies
INSERT INTO "CostFixed" VALUES ('EU',2030,'SEQ_REM_EOR_ONS_N',2030,1.70E-04,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2030,'SEQ_REM_EOR_OFF_N',2030,3.50E-04,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2030,'SEQ_REM_DOF_ONS_N',2030,1.70E-04,'€/kt','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "CostFixed" VALUES ('EU',2030,'SEQ_REM_DGF_ONS_N',2030,1.70E-04,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2030,'SEQ_REM_DOF_OFF_N',2030,3.50E-04,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2030,'SEQ_REM_DGF_OFF_N',2030,3.50E-04,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'SEQ_REM_ECB_N',2030,2.50E-04,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2030,'SEQ_REM_ECB_DEEP_N',2030,5.00E-04,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2030,'SEQ_REM_DSA_ONS_N',2030,2.50E-04,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2030,'SEQ_REM_DSA_OFF_N',2030,5.15E-04,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2030,'SEQ_REM_DOC_N',2030,5.00E-04,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2030,'SEQ_REM_MIN_N',2030,1.00E-02,'€/kt','10.1016/j.fusengdes.2024.114679');
-- Electricity sector
INSERT INTO "CostFixed" VALUES ('EU',2020,'ELC_FT_H2',2020,1.57,'M€/PJ','');
-- Electricity generation
INSERT INTO "CostFixed" VALUES ('EU',2005,'ELC_OIL_E',2005,25,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('EU',2005,'ELC_NGA_E',2005,25,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('EU',2005,'ELC_COA_E',2005,50,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('EU',2005,'ELC_BIO_E',2005,90,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('EU',2005,'ELC_HYD_GEN_E',2005,40,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('EU',2005,'ELC_NUC_FIS_E',2005,40,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('EU',2005,'ELC_GEO_E',2005,200,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('EU',2005,'ELC_WIN_E',2005,20,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('EU',2005,'ELC_SOL_E',2005,70,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('EU',2005,'ELC_MAR_E',2005,150,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_COA_PUL_N',2010,44.4,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2020,'ELC_COA_PUL_N',2020,38.7,'M€/GW','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "CostFixed" VALUES ('EU',2030,'ELC_COA_PUL_N',2030,34.3,'M€/GW','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "CostFixed" VALUES ('EU',2050,'ELC_COA_PUL_N',2050,31.6,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_COA_CCO_N',2010,58.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2020,'ELC_COA_CCO_N',2020,54.5,'M€/GW','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "CostFixed" VALUES ('EU',2030,'ELC_COA_CCO_N',2030,51.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "CostFixed" VALUES ('EU',2040,'ELC_COA_CCO_N',2040,47.5,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2050,'ELC_COA_CCO_N',2050,43.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_COA_PFB_N',2010,58.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "CostFixed" VALUES ('EU',2020,'ELC_COA_PFB_N',2020,54.5,'M€/GW','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "CostFixed" VALUES ('EU',2030,'ELC_COA_PFB_N',2030,51.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "CostFixed" VALUES ('EU',2040,'ELC_COA_PFB_N',2040,47.5,'M€/GW','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "CostFixed" VALUES ('EU',2050,'ELC_COA_PFB_N',2050,43.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_OIL_MIX_TUR_N',2010,22.4,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_OIL_MIX_CCY_N',2010,16.8,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_NGA_CCY_ADV_N',2010,20.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_NGA_FCE_N',2010,100.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "CostFixed" VALUES ('EU',2020,'ELC_NGA_FCE_N',2020,50.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "CostFixed" VALUES ('EU',2050,'ELC_NGA_FCE_N',2050,30.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_NUC_FIS_LWR_N',2010,35.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2020,'ELC_NUC_FIS_EPR_N',2020,35.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2030,'ELC_NUC_FIS_FR_N',2030,55.8,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2040,'ELC_NUC_FIS_ABWR_N',2040,112.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2040,'ELC_NUC_FIS_ADS_TRU_N',2040,122.5,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2040,'ELC_NUC_FIS_ADS_MA_N',2040,122.5,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_OIL_GBL_N',2010,3.9,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_OIL_GPL_N',2010,12.1,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_BIO_GSF_CEN_N',2010,50.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_BIO_COM_CEN_N',2010,80.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_BIO_GSF_DEC_N',2010,50.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_BIO_COM_DEC_N',2010,80.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_BIO_GAS_N',2010,39.3,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_BIO_CRP_GSF_N',2010,50.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_BIO_CRP_COM_N',2010,80.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_BIO_MUN_INC_N',2010,50.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_HYD_GEN_DAM_N',2010,10.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_HYD_GEN_RUN_N',2010,30.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_GEO_FLS_N',2010,180.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "CostFixed" VALUES ('EU',2050,'ELC_GEO_FLS_N',2050,162.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_GEO_BNY_N',2010,180.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "CostFixed" VALUES ('EU',2050,'ELC_GEO_BNY_N',2050,129.7,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_GEO_BNY_HIG_N',2010,180.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "CostFixed" VALUES ('EU',2050,'ELC_GEO_BNY_HIG_N',2050,130.6,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_WIN_N',2010,15.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_WIN_OFF_N',2010,15.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_SOL_CSP_1_N',2010,36.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2030,'ELC_SOL_CSP_1_N',2030,20.7,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2050,'ELC_SOL_CSP_1_N',2050,17.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_SOL_PV_CEN_N',2010,47.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2020,'ELC_SOL_PV_CEN_N',2020,13.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2030,'ELC_SOL_PV_CEN_N',2030,12.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2050,'ELC_SOL_PV_CEN_N',2050,10.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_SOL_PV_DST_N',2010,51.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2020,'ELC_SOL_PV_DST_N',2020,16.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2030,'ELC_SOL_PV_DST_N',2030,13.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2050,'ELC_SOL_PV_DST_N',2050,10.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_MAR_WAV_N',2010,120.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_MAR_TDL_N',2010,60.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_SOL_CSP_2_N',2010,77.00,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_SOL_CSP_3_N',2010,113.00,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_SOL_CSP_4_N',2010,204.00,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_HYD_PUM_N',2010,75.86,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2030,'ELC_COA_CCO_IG_CCS_N',2030,142.29,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2030,'ELC_COA_CCO_FG_CCS_N',2030,137.14,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2030,'ELC_COA_PUL_FG_CCS_N',2030,125.37,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2030,'ELC_NGA_FG_CCS_N',2030,67.69,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2030,'ELC_NGA_SOFC_CCS_N',2030,22.50,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2030,'ELC_BIO_CRP_GSF_CCS_N',2030,75.00,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2030,'ELC_BIO_CRP_COM_CCS_N',2030,60.00,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2030,'ELC_BIO_GSF_CCS_N',2030,77.00,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2030,'ELC_BIO_COM_CCS_N',2030,60.00,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2040,'ELC_COA_CCO_IG_CCS_N',2040,139.47,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2040,'ELC_COA_CCO_FG_CCS_N',2040,133.02,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2040,'ELC_COA_PUL_FG_CCS_N',2040,121.25,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2040,'ELC_NGA_FG_CCS_N',2040,64.74,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2040,'ELC_NGA_SOFC_CCS_N',2040,20.00,'M€/GW','10.1016/j.fusengdes.2024.114679');
-- Heat production
INSERT INTO "CostFixed" VALUES ('EU',2005,'HET_OIL_E',2005,4.0,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('EU',2005,'HET_NGA_E',2005,4.0,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('EU',2005,'HET_COA_E',2005,4.0,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('EU',2005,'HET_BIO_E',2005,6.5,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('EU',2005,'HET_GEO_E',2005,4.0,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('EU',2005,'HET_SOL_E',2005,4.0,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('EU',2010,'HET_NGA_N',2010,4.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'HET_OIL_N',2010,4.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'HET_BIO_N',2010,6.5,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'HET_COA_N',2010,4.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'HET_GEO_N',2010,4.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'HET_SOL_N',2010,4.0,'M€/GW','');
-- Base year technologies
INSERT INTO "CostFixed" VALUES ('EU',2005,'ELC_CHP_OIL_E',2005,25,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('EU',2005,'ELC_CHP_NGA_E',2005,110,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('EU',2005,'ELC_CHP_COA_E',2005,50,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('EU',2005,'ELC_CHP_BIO_E',2005,90,'M€/GW','');
INSERT INTO "CostFixed" VALUES ('EU',2005,'ELC_CHP_GEO_E',2005,200,'M€/GW','');
-- New technologies
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_CHP_NGA_N',2010,100.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_CHP_COA_N',2010,40.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostFixed" VALUES ('EU',2010,'ELC_CHP_BIO_N',2010,80.0,'M€/GW','10.1016/j.fusengdes.2024.114679');
-- Storage
INSERT INTO "CostFixed" VALUES ('EU',2020,'ELC_STG_CEN_BTT_N',2020,62,'M€/GW','10.25984/1871952');
INSERT INTO "CostFixed" VALUES ('EU',2030,'ELC_STG_CEN_BTT_N',2030,30,'M€/GW','10.25984/1871952');
INSERT INTO "CostFixed" VALUES ('EU',2050,'ELC_STG_CEN_BTT_N',2050,23,'M€/GW','10.25984/1871952');
INSERT INTO "CostFixed" VALUES ('EU',2020,'ELC_STG_DST_BTT_N',2020,72,'M€/GW','10.25984/1871952');
INSERT INTO "CostFixed" VALUES ('EU',2030,'ELC_STG_DST_BTT_N',2030,33,'M€/GW','10.25984/1871952');
INSERT INTO "CostFixed" VALUES ('EU',2050,'ELC_STG_DST_BTT_N',2050,25,'M€/GW','10.25984/1871952');
--Distrib and demand
INSERT INTO "CostFixed" VALUES ('IT',2025,'DISTR_ELC',2025,0.02*20,'M€/GW','Assumption');

CREATE TABLE "CostVariable" (
	"regions"	text NOT NULL,
	"periods"	integer NOT NULL,
	"tech"	text NOT NULL,
	"vintage"	integer NOT NULL,
	"cost_variable"	real,
	"cost_variable_units"	text,
	"cost_variable_notes"	text,
	PRIMARY KEY("regions","periods","tech","vintage"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods")
);
-- Import, mining and primary renewable resources
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_ELC_AFR',2010,56,'M€/PJ','Assuming 200 €/MWh as the import price for electricity from non-EU countries');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_ELC_OEE',2010,56,'M€/PJ','Assuming 200 €/MWh as the import price for electricity from non-EU countries');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_ELC_MEA',2010,56,'M€/PJ','Assuming 200 €/MWh as the import price for electricity from non-EU countries');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_IMP_ELC_CAC',2050,56,'M€/PJ','Assuming 200 €/MWh as the import price for electricity from non-EU countries');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_ELC_RUS',2010,56,'M€/PJ','Assuming 200 €/MWh as the import price for electricity from non-EU countries');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_OIL_USA',2010,13.55+0.182,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_OIL_CAN',2010,13.48+0.135,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_OIL_MEX',2010,13.48+0.241,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_OIL_OLA',2010,13.48+0.201,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_OIL_BRA',2010,13.48+0.201,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_OIL_RUS',2010,13.59+0.502,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_OIL_MEA',2010,13.32+0.502,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_OIL_AFR',2010,13.48+0.244,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_OIL_CHI',2010,13.48+0.459,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_OIL_JPN',2010,13.48+0.545,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_OIL_ODA',2010,13.48+0.402,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2015,'UPS_IMP_OIL_USA',2015,8.31+0.182,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2015,'UPS_IMP_OIL_CAN',2015,8.66+0.135,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2015,'UPS_IMP_OIL_MEX',2015,8.66+0.241,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2015,'UPS_IMP_OIL_OLA',2015,8.66+0.201,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2015,'UPS_IMP_OIL_BRA',2015,8.66+0.201,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2015,'UPS_IMP_OIL_RUS',2015,8.93+0.502,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2015,'UPS_IMP_OIL_MEA',2015,8.73+0.502,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2015,'UPS_IMP_OIL_AFR',2015,8.66+0.244,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2015,'UPS_IMP_OIL_CHI',2015,8.66+0.459,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2015,'UPS_IMP_OIL_JPN',2015,8.66+0.545,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2015,'UPS_IMP_OIL_ODA',2015,8.66+0.402,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_OIL_USA',2020,6.71+0.182,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_OIL_CAN',2020,7.04+0.135,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_OIL_MEX',2020,7.04+0.241,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_OIL_OLA',2020,7.04+0.201,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_OIL_BRA',2020,7.04+0.201,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_OIL_RUS',2020,7.22+0.502,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_OIL_MEA',2020,7.19+0.502,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_OIL_AFR',2020,7.04+0.244,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_OIL_CHI',2020,7.04+0.459,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_OIL_JPN',2020,7.04+0.545,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_OIL_ODA',2020,7.04+0.402,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_IMP_OIL_USA',2025,12.75+0.182,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_IMP_OIL_CAN',2025,13.11+0.135,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_IMP_OIL_MEX',2025,13.11+0.241,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_IMP_OIL_OLA',2025,13.11+0.201,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_IMP_OIL_BRA',2025,13.11+0.201,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_IMP_OIL_RUS',2025,13.48+0.502,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_IMP_OIL_MEA',2025,13.10+0.502,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_IMP_OIL_AFR',2025,13.11+0.244,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_IMP_OIL_CHI',2025,13.11+0.459,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_IMP_OIL_JPN',2025,13.11+0.545,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_IMP_OIL_ODA',2025,13.11+0.402,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_GAS_PIP_AFR',2010,8.74+0.185,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_GAS_PIP_RUS',2010,8.74+0.240,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_GAS_PIP_CAC',2010,8.74+0.414,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2015,'UPS_IMP_GAS_PIP_AFR',2015,7.20+0.185,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2015,'UPS_IMP_GAS_PIP_RUS',2015,7.20+0.240,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2015,'UPS_IMP_GAS_PIP_CAC',2015,7.20+0.414,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_GAS_PIP_AFR',2020,3.42+0.185,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_GAS_PIP_RUS',2020,3.42+0.240,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_GAS_PIP_CAC',2020,3.42+0.414,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_IMP_GAS_PIP_AFR',2025,11.08+0.185,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_IMP_GAS_PIP_RUS',2025,11.08+0.240,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_IMP_GAS_PIP_CAC',2025,11.08+0.414,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_IMP_GAS_PIP_AFR',2030,8.74+0.185,'M€/PJ','WEO22');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_IMP_GAS_PIP_RUS',2030,8.74+0.240,'M€/PJ','WEO22');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_IMP_GAS_PIP_CAC',2030,8.74+0.414,'M€/PJ','WEO22');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_IMP_GAS_PIP_MEA',2030,8.74+0.414,'M€/PJ','WEO22');
INSERT INTO "CostVariable" VALUES ('EU',2040,'UPS_IMP_GAS_PIP_AFR',2040,6.82+0.185,'M€/PJ','WEO22');
INSERT INTO "CostVariable" VALUES ('EU',2040,'UPS_IMP_GAS_PIP_RUS',2040,6.82+0.240,'M€/PJ','WEO22');
INSERT INTO "CostVariable" VALUES ('EU',2040,'UPS_IMP_GAS_PIP_CAC',2040,6.82+0.414,'M€/PJ','WEO22');
INSERT INTO "CostVariable" VALUES ('EU',2040,'UPS_IMP_GAS_PIP_MEA',2040,6.82+0.414,'M€/PJ','WEO22');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_IMP_GAS_PIP_AFR',2050,7.09+0.185,'M€/PJ','WEO22');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_IMP_GAS_PIP_RUS',2050,7.09+0.240,'M€/PJ','WEO22');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_IMP_GAS_PIP_CAC',2050,7.09+0.414,'M€/PJ','WEO22');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_IMP_GAS_PIP_MEA',2050,7.09+0.414,'M€/PJ','WEO22');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_GAS_LNG_AFR',2010,11.44+0.071,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_GAS_LNG_MEA',2010,11.44+0.178,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_GAS_LNG_GLB',2010,11.44+1.142,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_GAS_LNG_OLA',2010,11.44+0.500,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_GAS_LNG_USA',2010,11.44+0.500,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2015,'UPS_IMP_GAS_LNG_AFR',2015,11.53+0.071,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2015,'UPS_IMP_GAS_LNG_MEA',2015,11.53+0.178,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2015,'UPS_IMP_GAS_LNG_GLB',2015,11.53+1.142,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2015,'UPS_IMP_GAS_LNG_OLA',2015,11.53+0.500,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2015,'UPS_IMP_GAS_LNG_USA',2015,11.53+0.500,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_GAS_LNG_AFR',2020,8.77+0.071,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_GAS_LNG_MEA',2020,8.77+0.178,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_GAS_LNG_GLB',2020,8.77+1.142,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_GAS_LNG_OLA',2020,8.77+0.500,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_GAS_LNG_RUS',2020,8.77+0.178,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_GAS_LNG_USA',2020,8.77+0.500,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_IMP_GAS_LNG_AFR',2025,14.24+0.071,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_IMP_GAS_LNG_MEA',2025,14.24+0.178,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_IMP_GAS_LNG_GLB',2025,14.24+1.142,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_IMP_GAS_LNG_OLA',2025,14.24+0.500,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_IMP_GAS_LNG_RUS',2025,14.24+0.178,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_IMP_GAS_LNG_USA',2025,14.24+0.500,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_IMP_GAS_LNG_AFR',2030,11.58+0.071,'M€/PJ','WEO22');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_IMP_GAS_LNG_MEA',2030,11.58+0.178,'M€/PJ','WEO22');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_IMP_GAS_LNG_GLB',2030,11.58+1.142,'M€/PJ','WEO22');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_IMP_GAS_LNG_OLA',2030,11.58+0.500,'M€/PJ','WEO22');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_IMP_GAS_LNG_RUS',2030,11.58+0.178,'M€/PJ','WEO22');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_IMP_GAS_LNG_USA',2030,11.58+0.500,'M€/PJ','WEO22');
INSERT INTO "CostVariable" VALUES ('EU',2040,'UPS_IMP_GAS_LNG_AFR',2040,11.42+0.071,'M€/PJ','WEO22');
INSERT INTO "CostVariable" VALUES ('EU',2040,'UPS_IMP_GAS_LNG_MEA',2040,11.42+0.178,'M€/PJ','WEO22');
INSERT INTO "CostVariable" VALUES ('EU',2040,'UPS_IMP_GAS_LNG_GLB',2040,11.42+1.142,'M€/PJ','WEO22');
INSERT INTO "CostVariable" VALUES ('EU',2040,'UPS_IMP_GAS_LNG_OLA',2040,11.42+0.500,'M€/PJ','WEO22');
INSERT INTO "CostVariable" VALUES ('EU',2040,'UPS_IMP_GAS_LNG_RUS',2040,11.42+0.178,'M€/PJ','WEO22');
INSERT INTO "CostVariable" VALUES ('EU',2040,'UPS_IMP_GAS_LNG_USA',2040,11.42+0.500,'M€/PJ','WEO22');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_IMP_GAS_LNG_AFR',2050,11.26+0.071,'M€/PJ','WEO22');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_IMP_GAS_LNG_MEA',2050,11.26+0.178,'M€/PJ','WEO22');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_IMP_GAS_LNG_GLB',2050,11.26+1.142,'M€/PJ','WEO22');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_IMP_GAS_LNG_OLA',2050,11.26+0.500,'M€/PJ','WEO22');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_IMP_GAS_LNG_RUS',2050,11.26+0.178,'M€/PJ','WEO22');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_IMP_GAS_LNG_USA',2050,11.26+0.500,'M€/PJ','WEO22');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_COA_AFR',2010,3.13+0.87,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_COA_CAC',2010,3.25+4.57,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_COA_AUS',2010,3.38+1.13,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_COA_CAN',2010,3.25+0.41,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_COA_OEE',2010,3.25+1.96,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_COA_RUS',2010,3.25+4.57,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_COA_ODA',2010,3.25+1.39,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_COA_USA',2010,3.25+0.61,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_COA_OLA',2010,3.25+0.61,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2015,'UPS_IMP_COA_AFR',2015,1.93+0.87,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2015,'UPS_IMP_COA_CAC',2015,1.97+4.57,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2015,'UPS_IMP_COA_AUS',2015,2.01+1.13,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2015,'UPS_IMP_COA_CAN',2015,1.97+0.41,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2015,'UPS_IMP_COA_OEE',2015,1.97+1.96,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2015,'UPS_IMP_COA_RUS',2015,1.97+4.57,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2015,'UPS_IMP_COA_ODA',2015,1.97+1.39,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2015,'UPS_IMP_COA_USA',2015,1.97+0.61,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2015,'UPS_IMP_COA_OLA',2015,1.97+0.61,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_COA_AFR',2020,2.24+0.87,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_COA_CAC',2020,2.16+4.57,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_COA_AUS',2020,2.07+1.13,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_COA_CAN',2020,2.16+0.41,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_COA_OEE',2020,2.16+1.96,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_COA_RUS',2020,2.16+4.57,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_COA_ODA',2020,2.16+1.39,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_COA_USA',2020,2.16+0.61,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_COA_OLA',2020,2.16+0.61,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_IMP_COA_AFR',2025,2.62+0.87,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_IMP_COA_CAC',2025,3.19+4.57,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_IMP_COA_AUS',2025,3.75+1.13,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_IMP_COA_CAN',2025,3.19+0.41,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_IMP_COA_OEE',2025,3.19+1.96,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_IMP_COA_RUS',2025,3.19+4.57,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_IMP_COA_ODA',2025,3.19+1.39,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_IMP_COA_USA',2025,3.19+0.61,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_IMP_COA_OLA',2025,3.19+0.61,'M€/PJ','World Bank data - Update April 2024 + transport cost as in EUROfusion WPSES, EUROfusion TIMES Model, 2023');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_IMP_H2',2025,41.7,'M€/PJ','Assuming 5 €/kg');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_IMP_H2',2050,2*41.7,'M€/PJ','Assuming 10 €/kg');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_BIO_OIL',2010,25.00,'M€/kt','10.5281/zenodo.3544900');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_BIO_SUG',2010,3.00,'M€/kt','10.5281/zenodo.3544900');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_IMP_BIO_ISOBUT',2010,0.64/0.033,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_IMP_BIO_ISOBUT',2030,0.96/0.033,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_IMP_BIO_DST',2005,0.532/0.0385,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_BIO_DST',2020,0.532/0.0385,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_IMP_BIO_DST',2030,0.472/0.0385,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_IMP_BIO_WOD',2005,7.094,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_IMP_BIO_ETH',2005,0.883/0.0268,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_IMP_BIO_ETH',2020,0.883/0.0268,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_IMP_BIO_ETH',2030,0.670/0.0268,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_LOC_HOIL_1',2005,2.50,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_LOC_HOIL_2',2005,2.67,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_LOC_HOIL_3',2005,3.09,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_GRO_HOIL_1',2005,4.21,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_GRO_HOIL_2',2005,4.66,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_GRO_HOIL_3',2005,5.11,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_DIS_HOIL_1',2005,6.93,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_DIS_HOIL_2',2005,8.88,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_DIS_HOIL_3',2005,8.85,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_LOC_HSAN_1',2005,1.00,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_LOC_HSAN_2',2005,1.50,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_LOC_HSAN_3',2005,2.00,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_LOC_HCO',2005,4.01,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_LOC_BCO',2005,3.65,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_REC_HSAN_1',2005,2.50,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_REC_HSAN_2',2005,3.00,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_REC_HSAN_3',2005,3.50,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_DIS_BCO',2005,4.00,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_DIS_HCO',2005,4.34,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_LOC_NGA_1',2005,2.64,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_LOC_NGA_2',2005,3.31,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_LOC_NGA_3',2005,3.97,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_GRO_NGA_1',2005,7.05,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_GRO_NGA_2',2005,8.02,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_GRO_NGA_3',2005,9.00,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_DIS_NGA_1',2005,12.65,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_DIS_NGA_2',2005,14.57,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_DIS_NGA_3',2005,16.49,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_BIO_RPS_POT',2005,11.0,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_BIO_RPS_POT',2010,11.0,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_BIO_RPS_POT',2020,11.6,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_BIO_RPS_POT',2030,17.1,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2040,'UPS_BIO_RPS_POT',2040,17.9,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_BIO_RPS_POT',2050,17.0,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_BIO_CRP_STC_POT',2005,14.3,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_BIO_CRP_STC_POT',2010,14.3,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_BIO_CRP_STC_POT',2020,15.2,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_BIO_CRP_STC_POT',2030,20.1,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2040,'UPS_BIO_CRP_STC_POT',2040,21.0,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_BIO_CRP_STC_POT',2050,21.9,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_BIO_CRP_SUG_POT',2005,4.5,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_BIO_CRP_SUG_POT',2010,4.5,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_BIO_CRP_SUG_POT',2020,4.3,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_BIO_CRP_SUG_POT',2030,4.5,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2040,'UPS_BIO_CRP_SUG_POT',2040,4.7,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_BIO_CRP_SUG_POT',2050,4.8,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_BIO_CRP_GRS_POT',2010,4.4,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_BIO_CRP_GRS_POT',2020,4.7,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_BIO_CRP_GRS_POT',2030,4.5,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2040,'UPS_BIO_CRP_GRS_POT',2040,4.7,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_BIO_CRP_GRS_POT',2050,4.4,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_BIO_CRP_WOD_1_POT',2010,7.2,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_BIO_CRP_WOD_1_POT',2020,7.2,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_BIO_CRP_WOD_1_POT',2030,6.9,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2040,'UPS_BIO_CRP_WOD_1_POT',2040,7.4,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_BIO_CRP_WOD_1_POT',2050,7.0,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_BIO_CRP_WOD_2_POT',2010,4.0,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_BIO_CRP_WOD_2_POT',2020,4.0,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_BIO_CRP_WOD_2_POT',2030,3.9,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2040,'UPS_BIO_CRP_WOD_2_POT',2040,4.1,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_BIO_CRP_WOD_2_POT',2050,4.4,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_BIO_AGR_WST_POT',2005,4.0,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_BIO_AGR_WST_POT',2010,4.0,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_BIO_AGR_WST_POT',2020,4.0,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_BIO_AGR_WST_POT',2030,3.7,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2040,'UPS_BIO_AGR_WST_POT',2040,3.5,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_BIO_AGR_WST_POT',2050,3.3,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_BIO_FOR_1_POT',2010,4.0,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_BIO_FOR_1_POT',2020,3.7,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_BIO_FOR_1_POT',2030,3.3,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2040,'UPS_BIO_FOR_1_POT',2040,3.0,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_BIO_FOR_1_POT',2050,2.8,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_BIO_FOR_2_POT',2005,7.2,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_BIO_FOR_2_POT',2010,7.2,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_BIO_FOR_2_POT',2020,6.6,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_BIO_FOR_2_POT',2030,5.9,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2040,'UPS_BIO_FOR_2_POT',2040,5.4,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_BIO_FOR_2_POT',2050,4.9,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_BIO_WOD_RES_1_POT',2005,4.4,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_BIO_WOD_RES_1_POT',2010,4.4,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_BIO_WOD_RES_1_POT',2020,4.1,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_BIO_WOD_RES_1_POT',2030,3.7,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2040,'UPS_BIO_WOD_RES_1_POT',2040,3.4,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_BIO_WOD_RES_1_POT',2050,3.1,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_BIO_WOD_RES_2_POT',2005,3.2,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_BIO_WOD_RES_2_POT',2010,3.2,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_BIO_WOD_RES_2_POT',2020,3.0,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_BIO_WOD_RES_2_POT',2030,2.8,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2040,'UPS_BIO_WOD_RES_2_POT',2040,2.6,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_BIO_WOD_RES_2_POT',2050,2.4,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_BIO_WOD_PRD_1_POT',2005,4.0,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_BIO_WOD_PRD_1_POT',2010,4.0,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_BIO_WOD_PRD_1_POT',2020,3.7,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_BIO_WOD_PRD_1_POT',2030,3.3,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2040,'UPS_BIO_WOD_PRD_1_POT',2040,3.0,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_BIO_WOD_PRD_1_POT',2050,2.8,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_BIO_WOD_PRD_2_POT',2010,7.2,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_BIO_WOD_PRD_2_POT',2020,6.6,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_BIO_WOD_PRD_2_POT',2030,5.9,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2040,'UPS_BIO_WOD_PRD_2_POT',2040,5.4,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_BIO_WOD_PRD_2_POT',2050,4.9,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_BIO_MUN_POT',2005,0.054,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_BIO_MUN_POT',2010,0.054,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_BIO_MUN_POT',2020,0.055,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_BIO_MUN_POT',2030,0.047,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2040,'UPS_BIO_MUN_POT',2040,0.040,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_BIO_MUN_POT',2050,0.034,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_BIO_SLU_POT',2005,6.2,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_BIO_SLU_POT',2010,6.2,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_BIO_SLU_POT',2020,7.1,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_BIO_SLU_POT',2030,6.4,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2040,'UPS_BIO_SLU_POT',2040,5.7,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_BIO_SLU_POT',2050,5.2,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_BIO_GAS_POT',2005,4.8,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_BIO_GAS_POT',2010,4.8,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_BIO_GAS_POT',2020,4.8,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_BIO_GAS_POT',2030,4.9,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2040,'UPS_BIO_GAS_POT',2040,4.9,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_BIO_GAS_POT',2050,4.9,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_BIO_LIQ_POT',2010,7.5,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2015,'UPS_BIO_LIQ_POT',2015,7.9,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_BIO_LIQ_POT',2020,9.5,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2025,'UPS_BIO_LIQ_POT',2025,10.6,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_BIO_LIQ_POT',2030,11.0,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_BIO_LIQ_POT',2050,11.0,'M€/PJ','');
-- Dummy
--INSERT INTO "CostVariable" VALUES ('EU',2007,'DMY_DEM_ANNUAL',2007,5E6,'M€/PJ','');
--INSERT INTO "CostVariable" VALUES ('EU',2007,'DMY_PHY_ANNUAL',2007,5E4,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2010,'DMY_PHY_NON_ANNUAL',2010,5E4,'M€/PJ','');
-- Primary production
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_PRI_FIP_NGA_1_E',2005,2.60,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_PRI_FIP_NGA_2_E',2005,3.10,'M€/PJ','10.1016/j.fusengdes.2024.114679');
-- Secondary transformation
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_SEC_COA_OVC',2005,2.00,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_SEC_GAS_TWN',2005,5.00,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_SEC_GAS_BFG',2005,2.00,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_SEC_LIQ',2005,50.00,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_SEC_TRA',2005,5.00,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2005,'UPS_SEC_REF_FLX',2005,1.30,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'BIO_REF1_CRUSHING_E',2010,0.049,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostVariable" VALUES ('EU',2005,'BIO_REF1_TRANSESTER_E',2005,0.078+0.191,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostVariable" VALUES ('EU',2005,'BIO_REF1_ETHAMIDE_E',2005,0.362+0.826,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostVariable" VALUES ('EU',2005,'BIO_REF1_ETHSUG_E',2005,0.364+0.119,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostVariable" VALUES ('EU',2015,'BIO_REF1_HVO_N',2015,0.055,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostVariable" VALUES ('EU',2020,'BIO_REF2_ETH_N',2020,0.425+4.102+2.105,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostVariable" VALUES ('EU',2020,'BIO_REF2_DST_N',2020,0.359+1.236,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostVariable" VALUES ('EU',2020,'BIO_REF2_KER_N',2020,0.359+1.236,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostVariable" VALUES ('EU',2030,'BIO_REF2_ETH_CCS_N',2030,0.425+4.102+2.105,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostVariable" VALUES ('EU',2030,'BIO_REF2_DST_CCS_N',2030,0.359+1.236,'M€/PJ','10.5281/zenodo.3544900');
INSERT INTO "CostVariable" VALUES ('EU',2030,'BIO_REF2_KER_CCS_N',2030,0.359+1.236,'M€/PJ','10.5281/zenodo.3544900');
-- Nuclear fuel cycle
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_MIN_IMP_URA_NAT',2010,0.20,'M€/PJ','80 €/kg https://euratom-supply.ec.europa.eu/activities/market-observatory_en');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_MIN_IMP_URA_NAT',2020,0.30,'M€/PJ','120 €/kg https://euratom-supply.ec.europa.eu/activities/market-observatory_en');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_MIN_IMP_URA_NAT',2030,0.40,'M€/PJ','160 €/kg https://euratom-supply.ec.europa.eu/activities/market-observatory_en');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_FT_LWR_URA',2010,0.132,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_FT_LWR_UOX',2010,0.200,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_FT_LWR_MOX',2010,1.300,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_FT_FR_MOX',2010,14.301,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_FT_ABWR_TRU',2010,38.145,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_FT_ABWR_NAU',2010,46.087,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_FT_ADS_TRU',2010,78.175,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_FT_ADS_MA',2010,117.570,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_REP_PUREX_LWR_UOX_E',2010,0.90,'M€/t','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_REP_UREX_LWR_UOX_E',2010,0.90,'M€/t','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_REP_PUREX_LWR_MOX_E',2010,0.90,'M€/t','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_REP_ADV_PUREX_LWR_UOX_E',2010,0.90,'M€/t','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_REP_ADV_PUREX_LWR_MOX_E',2010,0.90,'M€/t','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_REP_ADV_PUREX_FR_MOX_E',2010,0.90,'M€/t','10.1016/j.fusengdes.2024.114679');
-- Hydrogen
INSERT INTO "CostVariable" VALUES ('EU',2015,'H2_SR_NGA',2015,0.23,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostVariable" VALUES ('EU',2025,'H2_SR_NGA',2025,0.21,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostVariable" VALUES ('EU',2030,'H2_SR_NGA',2030,0.05,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostVariable" VALUES ('EU',2015,'H2_GS_COA',2015,0.19,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostVariable" VALUES ('EU',2025,'H2_GS_COA',2025,0.19,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostVariable" VALUES ('EU',2030,'H2_GS_COA',2030,0.17,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostVariable" VALUES ('EU',2015,'H2_PO_OIL',2015,0.14,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostVariable" VALUES ('EU',2015,'H2_SR_BIO',2015,0.18,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostVariable" VALUES ('EU',2015,'H2_GS_BIO',2015,1.14,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostVariable" VALUES ('EU',2015,'H2_SR_ETH',2015,19.65,'M€/PJ','10.1016/j.apenergy.2023.121951');
-- CCUS
INSERT INTO "CostVariable" VALUES ('EU',2020,'CCUS_H2_SR_NGA',2020,0.06,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostVariable" VALUES ('EU',2020,'CCUS_H2_GS_COA',2020,0.19,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostVariable" VALUES ('EU',2020,'CCUS_H2_GS_BIO',2020,0.46,'M€/PJ','10.1016/j.apenergy.2023.121951');
INSERT INTO "CostVariable" VALUES ('EU',2020,'CCUS_ELC_COA',2020,15,'M€/PJ','ATB 2022');
INSERT INTO "CostVariable" VALUES ('EU',2020,'CCUS_ELC_NGA',2020,6,'M€/PJ','ATB 2022');
INSERT INTO "CostVariable" VALUES ('EU',2020,'CCUS_DAC',2020,8.00E-05,'M€/kt','JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('EU',2030,'CCUS_DAC',2030,6.40E-05,'M€/kt','JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('EU',2050,'CCUS_DAC',2050,5.10E-05,'M€/kt','JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('EU',2025,'SF_DST_HYDR',2025,0.27,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('EU',2025,'SF_DST_COELC',2025,0.33,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('EU',2025,'SF_KER_HYDR',2025,0.26,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('EU',2025,'SF_KER_COELC',2025,0.32,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('EU',2025,'SF_DSTKER_DAC',2025,0.46,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('EU',2025,'SF_MEOH_HYDR',2025,0.29,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('EU',2025,'SF_MEOH_COELC',2025,0.41,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('EU',2025,'SF_MEOH_DAC',2025,0.87,'M€/PJ','JRC-EU-TIMES');
INSERT INTO "CostVariable" VALUES ('EU',2010,'SEQ_REM_CO2_BKS_N',2010,5.00,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2030,'SEQ_REM_EOR_ONS_N',2030,9.00E-04,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2030,'SEQ_REM_EOR_OFF_N',2030,1.80E-03,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2030,'SEQ_REM_DOF_ONS_N',2030,9.00E-04,'€/kt','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "CostVariable" VALUES ('EU',2030,'SEQ_REM_DGF_ONS_N',2030,9.00E-04,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2030,'SEQ_REM_DOF_OFF_N',2030,1.80E-03,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2030,'SEQ_REM_DGF_OFF_N',2030,1.80E-03,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2030,'SEQ_REM_ECB_N',2030,5.00E-04,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2030,'SEQ_REM_ECB_DEEP_N',2030,5.00E-04,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2030,'SEQ_REM_DSA_ONS_N',2030,1.80E-04,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2030,'SEQ_REM_DSA_OFF_N',2030,2.00E-04,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2030,'SEQ_REM_DOC_N',2030,5.00E-02,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2030,'SEQ_REM_MIN_N',2030,1.50E-03,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'SEQ_REM_AFF_N',2010,1.00E-01,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2030,'SEQ_SNK_EOR_ONS_N',2030,0.0052+0.010,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2030,'SEQ_SNK_EOR_OFF_N',2030,0.0078,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2030,'SEQ_SNK_DOF_ONS_N',2030,0.0052+0.010,'€/kt','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "CostVariable" VALUES ('EU',2030,'SEQ_SNK_DGF_ONS_N',2030,0.0052,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2030,'SEQ_SNK_DOF_OFF_N',2030,0.0078+0.010,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2030,'SEQ_SNK_DGF_OFF_N',2030,0.0078+0.010,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2030,'SEQ_SNK_ECB_N',2030,0.0052+0.030,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2030,'SEQ_SNK_ECB_DEEP_N',2030,0.0052+0.030,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2030,'SEQ_SNK_DSA_ONS_N',2030,0.0052+0.010,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2030,'SEQ_SNK_DSA_OFF_N',2030,0.0078,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2030,'SEQ_SNK_DOC_N',2030,0.01,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'SEQ_SNK_AFF_1_N',2010,0.00545,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'SEQ_SNK_AFF_2_N',2010,0.01364,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'SEQ_SNK_AFF_3_N',2010,0.02455,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'SEQ_SNK_AFF_4_N',2010,0.03709,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2050,'SEQ_SNK_AFF_2_N',2050,0.01909,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2050,'SEQ_SNK_AFF_3_N',2050,0.02727,'€/kt','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2050,'SEQ_SNK_AFF_4_N',2050,0.04773,'€/kt','10.1016/j.fusengdes.2024.114679');
-- Electricity sector
INSERT INTO "CostVariable" VALUES ('EU',2010,'ELC_COA_PUL_N',2010,0.30,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2010,'ELC_COA_CCO_N',2010,0.30,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2010,'ELC_COA_PFB_N',2010,0.30,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2010,'ELC_OIL_MIX_TUR_N',2010,0.35,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2010,'ELC_OIL_MIX_CCY_N',2010,0.20,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'ELC_NGA_CCY_ADV_N',2010,0.65,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'ELC_NGA_FCE_N',2010,5.00,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'ELC_OIL_GBL_N',2010,4.04,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'ELC_OIL_GPL_N',2010,6.17,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'ELC_BIO_GSF_CEN_N',2010,4.10,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'ELC_BIO_GSF_CEN_N',2020,3.80,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'ELC_BIO_COM_CEN_N',2010,0.70,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'ELC_BIO_GSF_DEC_N',2010,4.10,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'ELC_BIO_GSF_DEC_N',2020,3.80,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'ELC_BIO_COM_DEC_N',2010,0.70,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'ELC_BIO_GAS_N',2010,1.00,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'ELC_BIO_CRP_GSF_N',2010,4.10,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'ELC_BIO_CRP_GSF_N',2020,3.80,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'ELC_BIO_CRP_COM_N',2010,0.70,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'ELC_BIO_MUN_INC_N',2010,5.00,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'ELC_HYD_GEN_DAM_N',2010,1.40,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'ELC_HYD_GEN_RUN_N',2010,1.11,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2025,'ELC_HH2_PEMFC_N',2025,29.17,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2030,'ELC_HH2_PEMFC_N',2030,22.22,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2040,'ELC_HH2_PEMFC_N',2040,18.06,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2050,'ELC_HH2_PEMFC_N',2050,8.33,'M€/PJ','');
INSERT INTO "CostVariable" VALUES ('EU',2010,'ELC_CHP_NGA_N',2010,0.42,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'ELC_CHP_COA_N',2010,0.50,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2010,'ELC_CHP_BIO_N',2010,0.70,'M€/PJ','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2030,'ELC_COA_CCO_IG_CCS_N',2030,0.60,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2030,'ELC_COA_CCO_FG_CCS_N',2030,0.78,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2030,'ELC_COA_PUL_FG_CCS_N',2030,0.90,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2030,'ELC_NGA_FG_CCS_N',2030,0.54,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2030,'ELC_NGA_SOFC_CCS_N',2030,2.00,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2030,'ELC_BIO_CRP_GSF_CCS_N',2030,2.00,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2030,'ELC_BIO_CRP_COM_CCS_N',2030,2.00,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2030,'ELC_BIO_GSF_CCS_N',2030,3.00,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "CostVariable" VALUES ('EU',2030,'ELC_BIO_COM_CCS_N',2030,3.00,'','10.1016/j.fusengdes.2024.114679');
-- Fuel technologies (distribution costs, excises and ETS)
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_FT_NGA',2010,0.30+0.010*53.06*1.055,'M€/PJ','EU Excise Duties on Energy - Taxation and Customs Union + ETS');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_FT_NGA',2020,0.30+0.080*53.06*1.055,'M€/PJ','EU Excise Duties on Energy - Taxation and Customs Union + ETS');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_FT_NGA',2030,0.30+0.090*53.06*1.055,'M€/PJ','EU Excise Duties on Energy - Taxation and Customs Union + ETS');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_FT_NGA',2050,0.30+0.150*53.06*1.055,'M€/PJ','EU Excise Duties on Energy - Taxation and Customs Union + ETS');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_FT_OIL_RPP',2010,0.60+0.010*74.54*1.055,'M€/PJ','EU Excise Duties on Energy - Taxation and Customs Union + ETS');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_FT_OIL_RPP',2020,0.60+0.080*74.54*1.055,'M€/PJ','EU Excise Duties on Energy - Taxation and Customs Union + ETS');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_FT_OIL_RPP',2030,0.60+0.090*74.54*1.055,'M€/PJ','EU Excise Duties on Energy - Taxation and Customs Union + ETS');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_FT_OIL_RPP',2050,0.60+0.150*74.54*1.055,'M€/PJ','EU Excise Duties on Energy - Taxation and Customs Union + ETS');
INSERT INTO "CostVariable" VALUES ('EU',2010,'UPS_FT_OIL_RPG',2010,0.60+0.010*61.71*1.055,'M€/PJ','EU Excise Duties on Energy - Taxation and Customs Union + ETS');
INSERT INTO "CostVariable" VALUES ('EU',2020,'UPS_FT_OIL_RPG',2020,0.60+0.080*61.71*1.055,'M€/PJ','EU Excise Duties on Energy - Taxation and Customs Union + ETS');
INSERT INTO "CostVariable" VALUES ('EU',2030,'UPS_FT_OIL_RPG',2030,0.60+0.090*61.71*1.055,'M€/PJ','EU Excise Duties on Energy - Taxation and Customs Union + ETS');
INSERT INTO "CostVariable" VALUES ('EU',2050,'UPS_FT_OIL_RPG',2050,0.60+0.150*61.71*1.055,'M€/PJ','EU Excise Duties on Energy - Taxation and Customs Union + ETS');
INSERT INTO "CostVariable" VALUES ('EU',2020,'ELC_FT_H2',2020,0.32,'M€/PJ','Distribution');
INSERT INTO "CostVariable" VALUES ('EU',2010,'ELC_FT_NGA',2010,0.30+0.010*53.06*1.055,'M€/PJ','EU Excise Duties on Energy - Taxation and Customs Union + ETS');
INSERT INTO "CostVariable" VALUES ('EU',2020,'ELC_FT_NGA',2020,0.30+0.080*53.06*1.055,'M€/PJ','EU Excise Duties on Energy - Taxation and Customs Union + ETS');
INSERT INTO "CostVariable" VALUES ('EU',2030,'ELC_FT_NGA',2030,0.30+0.090*53.06*1.055,'M€/PJ','EU Excise Duties on Energy - Taxation and Customs Union + ETS');
INSERT INTO "CostVariable" VALUES ('EU',2050,'ELC_FT_NGA',2050,0.30+0.150*53.06*1.055,'M€/PJ','EU Excise Duties on Energy - Taxation and Customs Union + ETS');
INSERT INTO "CostVariable" VALUES ('EU',2010,'ELC_FT_OIL',2010,0.60+0.010*74.54*1.055,'M€/PJ','EU Excise Duties on Energy - Taxation and Customs Union + ETS');
INSERT INTO "CostVariable" VALUES ('EU',2020,'ELC_FT_OIL',2020,0.60+0.080*74.54*1.055,'M€/PJ','EU Excise Duties on Energy - Taxation and Customs Union + ETS');
INSERT INTO "CostVariable" VALUES ('EU',2030,'ELC_FT_OIL',2030,0.60+0.090*74.54*1.055,'M€/PJ','EU Excise Duties on Energy - Taxation and Customs Union + ETS');
INSERT INTO "CostVariable" VALUES ('EU',2050,'ELC_FT_OIL',2050,0.60+0.150*74.54*1.055,'M€/PJ','EU Excise Duties on Energy - Taxation and Customs Union + ETS');
INSERT INTO "CostVariable" VALUES ('EU',2010,'ELC_FT_COA',2010,0.30+0.010*94.67*1.055,'M€/PJ','EU Excise Duties on Energy - Taxation and Customs Union + ETS');
INSERT INTO "CostVariable" VALUES ('EU',2020,'ELC_FT_COA',2020,0.30+0.080*94.67*1.055,'M€/PJ','EU Excise Duties on Energy - Taxation and Customs Union + ETS');
INSERT INTO "CostVariable" VALUES ('EU',2030,'ELC_FT_COA',2030,0.30+0.090*94.67*1.055,'M€/PJ','EU Excise Duties on Energy - Taxation and Customs Union + ETS');
INSERT INTO "CostVariable" VALUES ('EU',2050,'ELC_FT_COA',2050,0.30+0.150*94.67*1.055,'M€/PJ','EU Excise Duties on Energy - Taxation and Customs Union + ETS');
INSERT INTO "CostVariable" VALUES ('EU',2015,'H2_FT_NGA',2015,0.30,'M€/PJ','EU Excise Duties on Energy - Taxation and Customs Union');
INSERT INTO "CostVariable" VALUES ('EU',2015,'H2_FT_COA',2015,0.30,'M€/PJ','EU Excise Duties on Energy - Taxation and Customs Union');
INSERT INTO "CostVariable" VALUES ('EU',2015,'H2_FT_ELC',2015,0.30,'M€/PJ','EU Excise Duties on Energy - Taxation and Customs Union');

CREATE TABLE "CostEmission" (
    "regions"  text NOT NULL,
    "periods"  integer NOT NULL,
    "emis_comm" text NOT NULL,
    "cost_emission"    real,
    "cost_emission_units"  text,
    "cost_emission_notes"  text,
    FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
    FOREIGN KEY("emis_comm") REFERENCES "commodities"("comm_name"),
    PRIMARY KEY("regions","periods","emis_comm")
);

CREATE TABLE "Currency" (
	"curr"	text,
	"value"	real,
	"ref"   text,
	PRIMARY KEY("curr","value")
);
INSERT INTO "Currency" VALUES ('EUR00',1.45,'');
INSERT INTO "Currency" VALUES ('EUR01',1.40,'');
INSERT INTO "Currency" VALUES ('EUR02',1.36,'');
INSERT INTO "Currency" VALUES ('EUR03',1.33,'');
INSERT INTO "Currency" VALUES ('EUR04',1.30,'');
INSERT INTO "Currency" VALUES ('EUR05',1.27,'');
INSERT INTO "Currency" VALUES ('EUR06',1.24,'');
INSERT INTO "Currency" VALUES ('EUR07',1.21,'');
INSERT INTO "Currency" VALUES ('EUR08',1.17,'');
INSERT INTO "Currency" VALUES ('EUR09',1.16,'');
INSERT INTO "Currency" VALUES ('EUR10',1.14,'');
INSERT INTO "Currency" VALUES ('EUR11',1.11,'');
INSERT INTO "Currency" VALUES ('EUR12',1.08,'');
INSERT INTO "Currency" VALUES ('EUR13',1.06,'');
INSERT INTO "Currency" VALUES ('EUR14',1.06,'');
INSERT INTO "Currency" VALUES ('EUR15',1.06,'');
INSERT INTO "Currency" VALUES ('EUR16',1.06,'');
INSERT INTO "Currency" VALUES ('EUR17',1.04,'');
INSERT INTO "Currency" VALUES ('EUR18',1.02,'');
INSERT INTO "Currency" VALUES ('EUR19',1.01,'');
INSERT INTO "Currency" VALUES ('EUR20',1.00,'REF');
INSERT INTO "Currency" VALUES ('EUR21',0.97,'');
INSERT INTO "Currency" VALUES ('EUR22',0.92,'')
INSERT INTO "Currency" VALUES ('USD00',1.57,'');
INSERT INTO "Currency" VALUES ('USD01',1.55,'');
INSERT INTO "Currency" VALUES ('USD02',1.43,'');
INSERT INTO "Currency" VALUES ('USD03',1.07,'');
INSERT INTO "Currency" VALUES ('USD04',1.03,'');
INSERT INTO "Currency" VALUES ('USD05',0.93,'');
INSERT INTO "Currency" VALUES ('USD06',0.98,'');
INSERT INTO "Currency" VALUES ('USD07',0.88,'');
INSERT INTO "Currency" VALUES ('USD08',0.79,'');
INSERT INTO "Currency" VALUES ('USD09',0.83,'');
INSERT INTO "Currency" VALUES ('USD10',0.85,'');
INSERT INTO "Currency" VALUES ('USD11',0.80,'');
INSERT INTO "Currency" VALUES ('USD12',0.83,'');
INSERT INTO "Currency" VALUES ('USD13',0.80,'');
INSERT INTO "Currency" VALUES ('USD14',0.80,'');
INSERT INTO "Currency" VALUES ('USD15',0.95,'');
INSERT INTO "Currency" VALUES ('USD16',0.95,'');
INSERT INTO "Currency" VALUES ('USD17',0.92,'');
INSERT INTO "Currency" VALUES ('USD18',0.87,'');
INSERT INTO "Currency" VALUES ('USD19',0.90,'');
INSERT INTO "Currency" VALUES ('USD20',0.88,'');
INSERT INTO "Currency" VALUES ('USD21',0.82,'');
INSERT INTO "Currency" VALUES ('USD22',0.86,'');

CREATE TABLE "CurrencyTech" (
	"tech"	text,
	"curr"	text,
	PRIMARY KEY("tech","curr")
);
-- Micro-CHP
INSERT INTO "CurrencyTech" VALUES ('COM_CHP_NGA_CI_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('COM_CHP_NGA_MICRO_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('COM_CHP_NGA_CC_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('COM_CHP_SLB_CI_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('COM_CHP_NGA_SOFC_N','EUR20');
INSERT INTO "CurrencyTech" VALUES ('COM_CHP_H2_PEMFC_N','EUR20');
INSERT INTO "CurrencyTech" VALUES ('IND_CHP_NGA_CI_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('IND_CHP_NGA_TG_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('IND_CHP_NGA_TV_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('IND_CHP_BLQ_CI_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('RES_CHP_NGA_CI_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('RES_CHP_NGA_MICRO_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('RES_CHP_NGA_CC_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('RES_CHP_NGA_STR_N','EUR09');
INSERT INTO "CurrencyTech" VALUES ('RES_CHP_NGA_SOFC_N','EUR20');
INSERT INTO "CurrencyTech" VALUES ('RES_CHP_H2_PEMFC_N','EUR20');
-- Hydrogen
INSERT INTO "CurrencyTech" VALUES ('H2_SR_NGA','EUR10');
INSERT INTO "CurrencyTech" VALUES ('H2_GS_COA','EUR10');
INSERT INTO "CurrencyTech" VALUES ('H2_PO_OIL','EUR10');
INSERT INTO "CurrencyTech" VALUES ('H2_SR_BIO','EUR10');
INSERT INTO "CurrencyTech" VALUES ('H2_GS_BIO','EUR10');
INSERT INTO "CurrencyTech" VALUES ('H2_SR_ETH','EUR10');
INSERT INTO "CurrencyTech" VALUES ('H2_BL_DMY','EUR12');
-- CCUS
INSERT INTO "CurrencyTech" VALUES ('CCUS_H2_SR_NGA','EUR10');
INSERT INTO "CurrencyTech" VALUES ('CCUS_H2_GS_COA','EUR10');
INSERT INTO "CurrencyTech" VALUES ('CCUS_H2_GS_BIO','EUR10');
INSERT INTO "CurrencyTech" VALUES ('CCUS_ELC_COA','USD20');
INSERT INTO "CurrencyTech" VALUES ('CCUS_ELC_NGA','USD20');
INSERT INTO "CurrencyTech" VALUES ('SF_NGA_METH','EUR10');
INSERT INTO "CurrencyTech" VALUES ('SF_DST_HYDR','EUR10');
INSERT INTO "CurrencyTech" VALUES ('SF_DST_COELC','EUR10');
INSERT INTO "CurrencyTech" VALUES ('SF_KER_HYDR','EUR10');
INSERT INTO "CurrencyTech" VALUES ('SF_KER_COELC','EUR10');
INSERT INTO "CurrencyTech" VALUES ('SF_DSTKER_DAC','EUR10');
INSERT INTO "CurrencyTech" VALUES ('SF_MEOH_HYDR','EUR10');
INSERT INTO "CurrencyTech" VALUES ('SF_MEOH_COELC','EUR10');
INSERT INTO "CurrencyTech" VALUES ('SF_MEOH_DAC','EUR10');
-- Electricity sector
INSERT INTO "CurrencyTech" VALUES ('ELC_FT_H2','EUR12');

CREATE TABLE "CapacityFactor" (
	"regions"	text,
	"tech"	text,
	"vintage"	integer,
	"cf"	real,
	"cf_notes"	text,
	PRIMARY KEY("regions","tech","vintage"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods")
);
-- Micro-CHP
INSERT INTO "CapacityFactor" VALUES ('IT','COM_CHP_NGA_CI_N',2007,0.34,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_CHP_NGA_MICRO_N',2007,0.34,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_CHP_SLB_CI_N',2007,0.34,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_CHP_NGA_CC_N',2007,0.34,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_CHP_NGA_SOFC_N',2020,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','COM_CHP_H2_PEMFC_N',2025,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CHP_NGA_CI_N',2007,0.57,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CHP_NGA_TG_N',2007,0.74,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CHP_NGA_TV_N',2007,0.63,'');
INSERT INTO "CapacityFactor" VALUES ('IT','IND_CHP_BLQ_CI_N',2014,0.57,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_CHP_NGA_CI_N',2007,0.34,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_CHP_NGA_MICRO_N',2007,0.34,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_CHP_NGA_CC_N',2007,0.34,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_CHP_NGA_STR_N',2022,0.34,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_CHP_NGA_SOFC_N',2020,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('IT','RES_CHP_H2_PEMFC_N',2020,0.90,'');
-- Upstream sector
INSERT INTO "CapacityFactor" VALUES ('EU','UPS_SEC_L2G_ON',2005,0.50,'');
INSERT INTO "CapacityFactor" VALUES ('EU','UPS_SEC_L2G_OFF',2010,0.40,'');
INSERT INTO "CapacityFactor" VALUES ('EU','UPS_HET_GAS_NGA',2005,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('EU','UPS_HET_OIL_RPP',2005,0.70,'');
INSERT INTO "CapacityFactor" VALUES ('EU','UPS_HET_OIL_RPG',2005,0.70,'');
-- Hydrogen
INSERT INTO "CapacityFactor" VALUES ('EU','H2_SR_NGA',2015,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('EU','H2_GS_COA',2015,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('EU','H2_PO_OIL',2015,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('EU','H2_SR_BIO',2015,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('EU','H2_GS_BIO',2015,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('EU','H2_SR_ETH',2015,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('EU','H2_EL_ALK',2020,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('EU','H2_EL_PEM',2020,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('EU','H2_EL_SOEC',2020,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('EU','H2_EL_AEM',2050,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('EU','H2_BL_DMY',2020,0.70,'Assumption');
-- CCUS
INSERT INTO "CapacityFactor" VALUES ('EU','CCUS_H2_SR_NGA',2020,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('EU','CCUS_H2_GS_COA',2020,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('EU','CCUS_H2_GS_BIO',2020,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('EU','CCUS_ELC_COA',2020,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('EU','CCUS_ELC_NGA',2020,0.90,'Assumption');
INSERT INTO "CapacityFactor" VALUES ('EU','CCUS_DAC',2020,0.90,'10.5281/zenodo.3544900');
INSERT INTO "CapacityFactor" VALUES ('EU','SF_NGA_METH',2020,0.95,'10.5281/zenodo.3544900');
INSERT INTO "CapacityFactor" VALUES ('EU','SF_DST_HYDR',2025,0.90,'10.5281/zenodo.3544900');
INSERT INTO "CapacityFactor" VALUES ('EU','SF_DST_COELC',2025,0.90,'10.5281/zenodo.3544900');
INSERT INTO "CapacityFactor" VALUES ('EU','SF_KER_HYDR',2025,0.90,'10.5281/zenodo.3544900');
INSERT INTO "CapacityFactor" VALUES ('EU','SF_KER_COELC',2025,0.90,'10.5281/zenodo.3544900');
INSERT INTO "CapacityFactor" VALUES ('EU','SF_DSTKER_DAC',2025,0.90,'10.5281/zenodo.3544900');
INSERT INTO "CapacityFactor" VALUES ('EU','SF_MEOH_HYDR',2025,0.90,'10.5281/zenodo.3544900');
INSERT INTO "CapacityFactor" VALUES ('EU','SF_MEOH_COELC',2025,0.90,'10.5281/zenodo.3544900');
INSERT INTO "CapacityFactor" VALUES ('EU','SF_MEOH_DAC',2025,0.90,'10.5281/zenodo.3544900');
-- Electricity sector
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_FT_H2',2020,0.75,'');
-- Electricity production
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_OIL_E',2005,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_CHP_OIL_E',2005,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_OIL_MIX_TUR_N',2010,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_OIL_MIX_CCY_N',2010,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_OIL_GBL_N',2010,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_OIL_GPL_N',2010,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_NGA_E',2005,0.35,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_CHP_NGA_E',2005,0.35,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_NGA_CCY_ADV_N',2010,0.35,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_NGA_FCE_N',2010,0.35,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_CHP_NGA_N',2010,0.35,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_NGA_FG_CCS_N',2030,0.40,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_NGA_SOFC_CCS_N',2030,0.40,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_COA_E',2005,0.40,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_CHP_COA_E',2005,0.40,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_COA_PUL_N',2010,0.45,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_COA_CCO_N',2010,0.45,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_COA_PFB_N',2010,0.45,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_CHP_COA_N',2010,0.45,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_COA_CCO_IG_CCS_N',2030,0.50,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_COA_CCO_FG_CCS_N',2030,0.50,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_COA_PUL_FG_CCS_N',2030,0.50,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_BIO_E',2005,0.60,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_HYD_PUM_E',2005,0.25,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_NUC_FIS_E',2005,0.80,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_GEO_E',2005,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_MAR_E',2005,0.05,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_CHP_BIO_E',2005,0.60,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_CHP_GEO_E',2005,0.80,'');
INSERT INTO "CapacityFactor" VALUES ('EU','HET_OIL_E',2005,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('EU','HET_NGA_E',2005,0.40,'');
INSERT INTO "CapacityFactor" VALUES ('EU','HET_COA_E',2005,0.50,'');
INSERT INTO "CapacityFactor" VALUES ('EU','HET_BIO_E',2005,0.60,'');
INSERT INTO "CapacityFactor" VALUES ('EU','HET_GEO_E',2005,0.80,'');
INSERT INTO "CapacityFactor" VALUES ('EU','HET_NGA_N',2010,0.40,'');
INSERT INTO "CapacityFactor" VALUES ('EU','HET_OIL_N',2010,0.30,'');
INSERT INTO "CapacityFactor" VALUES ('EU','HET_BIO_N',2010,0.60,'');
INSERT INTO "CapacityFactor" VALUES ('EU','HET_COA_N',2010,0.50,'');
INSERT INTO "CapacityFactor" VALUES ('EU','HET_GEO_N',2010,0.80,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_NUC_FIS_LWR_N',2010,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_NUC_FIS_EPR_N',2020,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_NUC_FIS_FR_N',2030,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_NUC_FIS_ABWR_N',2040,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_NUC_FIS_ADS_TRU_N',2040,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_NUC_FIS_ADS_MA_N',2040,0.85,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_BIO_GSF_CEN_N',2010,0.65,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_BIO_COM_CEN_N',2010,0.65,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_BIO_GSF_DEC_N',2010,0.65,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_BIO_COM_DEC_N',2010,0.65,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_BIO_GAS_N',2010,0.65,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_BIO_CRP_GSF_N',2010,0.65,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_BIO_CRP_COM_N',2010,0.65,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_BIO_MUN_INC_N',2010,0.65,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_GEO_FLS_N',2010,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_GEO_BNY_N',2010,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_GEO_BNY_HIG_N',2010,0.90,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_MAR_WAV_N',2010,0.20,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_MAR_TDL_N',2010,0.20,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_HYD_PUM_N',2010,0.25,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_HH2_PEMFC_N',2025,0.90,'');
-- Sequestration technologies
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_BIO_CRP_GSF_CCS_N',2030,0.65,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_BIO_CRP_COM_CCS_N',2030,0.65,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_BIO_GSF_CCS_N',2030,0.65,'');
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_BIO_COM_CCS_N',2030,0.65,'');
-- CHP
INSERT INTO "CapacityFactor" VALUES ('EU','ELC_CHP_BIO_N',2010,0.55,'');

CREATE TABLE "CapacityFactorTech" (
	"regions"	text,
	"season_name"	text,
	"time_of_day_name"	text,
	"tech"	text,
	"cf_tech"	real CHECK("cf_tech" >= 0
	 AND "cf_tech" <= 1),
	"cf_tech_notes"	text,
	PRIMARY KEY("regions","season_name","time_of_day_name","tech"),
	FOREIGN KEY("season_name") REFERENCES "time_season"("t_season"),
	FOREIGN KEY("time_of_day_name") REFERENCES "time_of_day"("t_day"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
-- Upstream sector
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','day','UPS_SOL_TH_POT',0.29*1.25,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','night','UPS_SOL_TH_POT',0.00*1.25,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','day','UPS_SOL_TH_POT',0.36*1.25,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','night','UPS_SOL_TH_POT',0.00*1.25,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','day','UPS_SOL_TH_POT',0.12*1.25,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','night','UPS_SOL_TH_POT',0.00*1.25,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','peak','UPS_SOL_TH_POT',0.110,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','peak','UPS_SOL_TH_POT',0.110,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','peak','UPS_SOL_TH_POT',0.110,'');
-- Electricity sector
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','day','HET_SOL_E',0.261,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','night','HET_SOL_E',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','day','HET_SOL_E',0.324,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','night','HET_SOL_E',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','day','HET_SOL_E',0.108,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','night','HET_SOL_E',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','peak','HET_SOL_E',0.110,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','peak','HET_SOL_E',0.110,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','peak','HET_SOL_E',0.110,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','day','HET_SOL_N',0.29*1.25,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','night','HET_SOL_N',0.00*1.25,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','day','HET_SOL_N',0.36*1.25,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','night','HET_SOL_N',0.00*1.25,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','day','HET_SOL_N',0.12*1.25,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','night','HET_SOL_N',0.00*1.25,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','peak','HET_SOL_N',0.110,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','peak','HET_SOL_N',0.110,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','peak','HET_SOL_N',0.110,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','day','ELC_WIN_E',0.210,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','night','ELC_WIN_E',0.210,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','day','ELC_WIN_E',0.175,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','night','ELC_WIN_E',0.175,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','day','ELC_WIN_E',0.252,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','night','ELC_WIN_E',0.252,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','day','ELC_SOL_E',0.261,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','night','ELC_SOL_E',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','day','ELC_SOL_E',0.324,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','night','ELC_SOL_E',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','day','ELC_SOL_E',0.108,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','night','ELC_SOL_E',0.000,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','day','ELC_SOL_PV_CEN_N',0.29*1.25,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','night','ELC_SOL_PV_CEN_N',0.00*1.25,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','day','ELC_SOL_PV_CEN_N',0.36*1.25,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','night','ELC_SOL_PV_CEN_N',0.00*1.25,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','day','ELC_SOL_PV_CEN_N',0.12*1.25,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','night','ELC_SOL_PV_CEN_N',0.00*1.25,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','day','ELC_SOL_PV_DST_N',0.36,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','night','ELC_SOL_PV_DST_N',0.00,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','day','ELC_SOL_PV_DST_N',0.29,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','night','ELC_SOL_PV_DST_N',0.00,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','day','ELC_SOL_PV_DST_N',0.12,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','night','ELC_SOL_PV_DST_N',0.00,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','day','ELC_HYD_GEN_E',0.40,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','night','ELC_HYD_GEN_E',0.40,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','day','ELC_HYD_GEN_E',0.50,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','night','ELC_HYD_GEN_E',0.50,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','day','ELC_HYD_GEN_E',0.45,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','night','ELC_HYD_GEN_E',0.45,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','day','ELC_HYD_GEN_DAM_N',0.40-0.05,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','night','ELC_HYD_GEN_DAM_N',0.40-0.05,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','day','ELC_HYD_GEN_DAM_N',0.50-0.05,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','night','ELC_HYD_GEN_DAM_N',0.50-0.05,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','day','ELC_HYD_GEN_DAM_N',0.45-0.05,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','night','ELC_HYD_GEN_DAM_N',0.45-0.05,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','day','ELC_HYD_GEN_RUN_N',0.40,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','night','ELC_HYD_GEN_RUN_N',0.40,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','day','ELC_HYD_GEN_RUN_N',0.50,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','night','ELC_HYD_GEN_RUN_N',0.50,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','day','ELC_HYD_GEN_RUN_N',0.45,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','night','ELC_HYD_GEN_RUN_N',0.45,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','day','ELC_SOL_CSP_1_N',0.23,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','night','ELC_SOL_CSP_1_N',0.00,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','day','ELC_SOL_CSP_1_N',0.25,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','night','ELC_SOL_CSP_1_N',0.00,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','day','ELC_SOL_CSP_1_N',0.21,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','night','ELC_SOL_CSP_1_N',0.00,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','day','ELC_SOL_CSP_2_N',0.3,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','night','ELC_SOL_CSP_2_N',0,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','day','ELC_SOL_CSP_2_N',0.49,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','night','ELC_SOL_CSP_2_N',0,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','day','ELC_SOL_CSP_2_N',0.42,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','night','ELC_SOL_CSP_2_N',0,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','day','ELC_SOL_CSP_3_N',1,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','night','ELC_SOL_CSP_3_N',0.02,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','day','ELC_SOL_CSP_3_N',0.92,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','night','ELC_SOL_CSP_3_N',0,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','day','ELC_SOL_CSP_3_N',0.96,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','night','ELC_SOL_CSP_3_N',0,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','day','ELC_SOL_CSP_4_N',1,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','intermediate','night','ELC_SOL_CSP_4_N',0.51,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','day','ELC_SOL_CSP_4_N',1,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','summer','night','ELC_SOL_CSP_4_N',0.71,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','day','ELC_SOL_CSP_4_N',1,'');
INSERT INTO "CapacityFactorTech" VALUES ('EU','winter','night','ELC_SOL_CSP_4_N',0.59,'');

CREATE TABLE "CapacityFactorProcess" (
	"regions"	text,
	"season_name"	text,
	"time_of_day_name"	text,
	"tech"	text,
	"vintage"	integer,
	"cf_process"	real CHECK("cf_process" >= 0 AND "cf_process" <= 1),
	"cf_process_notes"	text,
	PRIMARY KEY("regions","season_name","time_of_day_name","tech","vintage"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("season_name") REFERENCES "time_season"("t_season"),
	FOREIGN KEY("time_of_day_name") REFERENCES "time_of_day"("t_day")
);
INSERT INTO "CapacityFactorProcess" VALUES ('EU','intermediate','day','ELC_WIN_N',2010,0.285,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','intermediate','night','ELC_WIN_N',2010,0.285,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','summer','day','ELC_WIN_N',2010,0.238,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','summer','night','ELC_WIN_N',2010,0.238,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','winter','day','ELC_WIN_N',2010,0.342,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','winter','night','ELC_WIN_N',2010,0.342,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','intermediate','day','ELC_WIN_N',2030,0.299,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','intermediate','night','ELC_WIN_N',2030,0.299,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','summer','day','ELC_WIN_N',2030,0.249,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','summer','night','ELC_WIN_N',2030,0.249,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','winter','day','ELC_WIN_N',2030,0.359,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','winter','night','ELC_WIN_N',2030,0.359,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','intermediate','day','ELC_WIN_N',2050,0.333,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','intermediate','night','ELC_WIN_N',2050,0.333,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','summer','day','ELC_WIN_N',2050,0.277,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','summer','night','ELC_WIN_N',2050,0.277,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','winter','day','ELC_WIN_N',2050,0.399,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','winter','night','ELC_WIN_N',2050,0.399,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','intermediate','day','ELC_WIN_OFF_N',2010,0.45*0.9,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','intermediate','night','ELC_WIN_OFF_N',2010,0.50*0.9,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','summer','day','ELC_WIN_OFF_N',2010,0.41*0.9,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','summer','night','ELC_WIN_OFF_N',2010,0.39*0.9,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','winter','day','ELC_WIN_OFF_N',2010,0.57*0.9,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','winter','night','ELC_WIN_OFF_N',2010,0.42*0.9,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','intermediate','day','ELC_WIN_OFF_N',2030,0.47*0.9,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','intermediate','night','ELC_WIN_OFF_N',2030,0.52*0.9,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','summer','day','ELC_WIN_OFF_N',2030,0.43*0.9,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','summer','night','ELC_WIN_OFF_N',2030,0.41*0.9,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','winter','day','ELC_WIN_OFF_N',2030,0.60*0.9,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','winter','night','ELC_WIN_OFF_N',2030,0.44*0.9,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','intermediate','day','ELC_WIN_OFF_N',2050,0.57*0.9,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','intermediate','night','ELC_WIN_OFF_N',2050,0.62*0.9,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','summer','day','ELC_WIN_OFF_N',2050,0.57*0.9,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','summer','night','ELC_WIN_OFF_N',2050,0.62*0.9,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','winter','day','ELC_WIN_OFF_N',2050,0.72*0.9,'');
INSERT INTO "CapacityFactorProcess" VALUES ('EU','winter','night','ELC_WIN_OFF_N',2050,0.53*0.9,'');

CREATE TABLE "CapacityToActivity" (
	"regions"	text,
	"tech"	text,
	"c2a"	real,
	"c2a_notes"	TEXT,
	PRIMARY KEY("regions","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
-- Import, mining and primary renewable resources
INSERT INTO "CapacityToActivity" VALUES ('EU','UPS_IMP_ELC_AFR',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','UPS_IMP_ELC_OEE',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','UPS_IMP_ELC_RUS',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','UPS_IMP_ELC_MEA',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','UPS_IMP_ELC_CAC',31.536,'');
-- Upstream sector
INSERT INTO "CapacityToActivity" VALUES ('EU','UPS_SOL_TH_POT',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','UPS_HET_OIL_RPP',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','UPS_HET_OIL_RPG',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','UPS_HET_GAS_NGA',31.536,'');
-- Micro-CHP
INSERT INTO "CapacityToActivity" VALUES ('IT','COM_CHP_NGA_CI_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','COM_CHP_NGA_MICRO_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','COM_CHP_SLB_CI_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','COM_CHP_NGA_CC_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','COM_CHP_NGA_SOFC_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','COM_CHP_H2_PEMFC_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','IND_CHP_NGA_CI_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','IND_CHP_NGA_TG_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','IND_CHP_NGA_TV_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','IND_CHP_BLQ_CI_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_CHP_NGA_CI_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_CHP_NGA_MICRO_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_CHP_NGA_CC_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_CHP_NGA_STR_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_CHP_NGA_SOFC_N',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','RES_CHP_H2_PEMFC_N',31.536,'PJ/GW');
-- Electricity sector
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_OIL_E',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_NGA_E',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_COA_E',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_BIO_E',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_HYD_GEN_E',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_HYD_PUM_E',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_NUC_FIS_E',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_GEO_E',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_WIN_E',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_SOL_E',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_MAR_E',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_CHP_OIL_E',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_CHP_NGA_E',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_CHP_COA_E',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_CHP_BIO_E',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_CHP_GEO_E',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_COA_PUL_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_COA_CCO_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_COA_PFB_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_OIL_MIX_TUR_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_OIL_MIX_CCY_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_NGA_CCY_ADV_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_NGA_FCE_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_NUC_FIS_LWR_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_NUC_FIS_EPR_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_NUC_FIS_FR_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_NUC_FIS_ABWR_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_NUC_FIS_ADS_TRU_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_NUC_FIS_ADS_MA_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_OIL_GBL_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_OIL_GPL_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_BIO_GSF_CEN_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_BIO_COM_CEN_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_BIO_GSF_DEC_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_BIO_COM_DEC_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_BIO_GAS_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_BIO_CRP_GSF_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_BIO_CRP_COM_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_BIO_MUN_INC_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_HYD_GEN_DAM_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_HYD_GEN_RUN_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_HYD_PUM_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_GEO_FLS_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_GEO_BNY_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_GEO_BNY_HIG_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_WIN_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_WIN_OFF_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_SOL_CSP_1_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_SOL_PV_CEN_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_SOL_PV_DST_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_MAR_WAV_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_MAR_TDL_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_SOL_CSP_2_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_SOL_CSP_3_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_SOL_CSP_4_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_HH2_PEMFC_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_COA_CCO_IG_CCS_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_COA_CCO_FG_CCS_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_COA_PUL_FG_CCS_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_NGA_FG_CCS_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_NGA_SOFC_CCS_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_BIO_CRP_GSF_CCS_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_BIO_CRP_COM_CCS_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_BIO_GSF_CCS_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_BIO_COM_CCS_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_CHP_NGA_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_CHP_COA_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_CHP_BIO_N',31.536,'');
-- Storage
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_STG_CEN_BTT_N',31.536,'');
INSERT INTO "CapacityToActivity" VALUES ('EU','ELC_STG_DST_BTT_N',31.536,'');
-- Distrib and demand
INSERT INTO "CapacityToActivity" VALUES ('IT','DISTR_ELC',31.536,'PJ/GW');
INSERT INTO "CapacityToActivity" VALUES ('IT','END_USES_ELC',31.536,'PJ/GW');

CREATE TABLE "CapacityCredit" (
	"regions"	text,
	"periods"	integer,
	"tech"	text,
	"vintage" integer,
	"cf_tech"	real CHECK("cf_tech" >= 0 AND "cf_tech" <= 1),
	"cf_tech_notes"	text,
	PRIMARY KEY("regions","periods","tech","vintage")
);
-- Micro-CHP
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'COM_CHP_NGA_CI_N',2007,0.20,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'COM_CHP_NGA_MICRO_N',2007,0.20,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'COM_CHP_SLB_CI_N',2007,0.20,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'COM_CHP_NGA_CC_N',2007,0.20,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2020,'COM_CHP_NGA_SOFC_N',2020,0.20,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('IT',2025,'COM_CHP_H2_PEMFC_N',2025,0.20,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'RES_CHP_NGA_CI_N',2007,0.20,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'RES_CHP_NGA_MICRO_N',2007,0.20,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2007,'RES_CHP_NGA_CC_N',2007,0.20,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2022,'RES_CHP_NGA_STR_N',2022,0.20,'TIMES-Italy');
INSERT INTO "CapacityCredit" VALUES ('IT',2020,'RES_CHP_NGA_SOFC_N',2020,0.20,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('IT',2020,'RES_CHP_H2_PEMFC_N',2020,0.20,'Assumption');
-- Electricity sector
INSERT INTO "CapacityCredit" VALUES ('EU',2005,'ELC_OIL_E',2005,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2005,'ELC_NGA_E',2005,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2005,'ELC_COA_E',2005,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2005,'ELC_BIO_E',2005,0.70,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2005,'ELC_HYD_GEN_E',2005,0.50,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2005,'ELC_NUC_FIS_E',2005,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2005,'ELC_GEO_E',2005,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2005,'ELC_WIN_E',2005,0.30,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2005,'ELC_SOL_E',2005,0.15,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2005,'ELC_MAR_E',2005,0.15,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2005,'ELC_CHP_OIL_E',2005,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2005,'ELC_CHP_NGA_E',2005,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2005,'ELC_CHP_COA_E',2005,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2005,'ELC_CHP_BIO_E',2005,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2005,'ELC_CHP_GEO_E',2005,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_COA_PUL_N',2010,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_COA_CCO_N',2010,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_COA_PFB_N',2010,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_NGA_CCY_ADV_N',2010,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_NGA_FCE_N',2010,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_NUC_FIS_LWR_N',2010,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2020,'ELC_NUC_FIS_EPR_N',2020,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2030,'ELC_NUC_FIS_FR_N',2030,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2040,'ELC_NUC_FIS_ABWR_N',2040,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2040,'ELC_NUC_FIS_ADS_TRU_N',2040,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2040,'ELC_NUC_FIS_ADS_MA_N',2040,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_OIL_MIX_TUR_N',2010,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_OIL_MIX_CCY_N',2010,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_OIL_GBL_N',2010,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_OIL_GPL_N',2010,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_BIO_GSF_CEN_N',2010,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_BIO_COM_CEN_N',2010,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_BIO_GSF_DEC_N',2010,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_BIO_COM_DEC_N',2010,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_BIO_GAS_N',2010,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_BIO_CRP_GSF_N',2010,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_BIO_CRP_COM_N',2010,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_BIO_MUN_INC_N',2010,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_HYD_GEN_DAM_N',2010,0.30,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_HYD_GEN_RUN_N',2010,0.30,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_GEO_FLS_N',2010,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_GEO_BNY_N',2010,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_GEO_BNY_HIG_N',2010,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_WIN_N',2010,0.30,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_WIN_OFF_N',2010,0.30,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_SOL_PV_CEN_N',2010,0.15,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_SOL_PV_DST_N',2010,0.15,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_SOL_CSP_1_N',2010,0.15,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_SOL_CSP_2_N',2010,0.15,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_SOL_CSP_3_N',2010,0.15,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_SOL_CSP_4_N',2010,0.15,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_MAR_WAV_N',2010,0.15,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_MAR_TDL_N',2010,0.15,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2025,'ELC_HH2_PEMFC_N',2025,0.50,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2030,'ELC_COA_CCO_IG_CCS_N',2030,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2030,'ELC_COA_CCO_FG_CCS_N',2030,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2030,'ELC_COA_PUL_FG_CCS_N',2030,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2030,'ELC_NGA_FG_CCS_N',2030,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2030,'ELC_NGA_SOFC_CCS_N',2030,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2030,'ELC_BIO_CRP_GSF_CCS_N',2030,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2030,'ELC_BIO_CRP_COM_CCS_N',2030,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2030,'ELC_BIO_GSF_CCS_N',2030,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2030,'ELC_BIO_COM_CCS_N',2030,1.00,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_CHP_NGA_N',2010,0.70,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_CHP_COA_N',2010,0.70,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_CHP_BIO_N',2010,0.70,'Assumption');
-- Storage
INSERT INTO "CapacityCredit" VALUES ('EU',2005,'ELC_HYD_PUM_E',2005,0.70,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2010,'ELC_HYD_PUM_N',2010,0.70,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2020,'ELC_STG_CEN_BTT_N',2020,0.70,'Assumption');
INSERT INTO "CapacityCredit" VALUES ('EU',2020,'ELC_STG_DST_BTT_N',2020,0.70,'Assumption');

CREATE TABLE "GlobalDiscountRate" (
	"rate"	real
);
INSERT INTO "GlobalDiscountRate" VALUES (0.05);

CREATE TABLE "DiscountRate" (
	"regions"	text,
	"tech"	text,
	"vintage"	integer,
	"tech_rate"	real,
	"tech_rate_notes"	text,
	PRIMARY KEY("regions","tech","vintage"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods")
);
-- Upstream
INSERT INTO "DiscountRate" VALUES ('EU','BIO_REF1_TRANSESTER_E',2010,0.10,'');
INSERT INTO "DiscountRate" VALUES ('EU','BIO_REF1_ETHAMIDE_E',2010,0.10,'');
INSERT INTO "DiscountRate" VALUES ('EU','BIO_REF1_ETHSUG_E',2010,0.10,'');
INSERT INTO "DiscountRate" VALUES ('EU','BIO_REF1_HVO_N',2015,0.10,'');
INSERT INTO "DiscountRate" VALUES ('EU','BIO_REF2_ETH_N',2020,0.10,'');
INSERT INTO "DiscountRate" VALUES ('EU','BIO_REF2_DST_N',2020,0.10,'');
INSERT INTO "DiscountRate" VALUES ('EU','BIO_REF2_KER_N',2020,0.10,'');
INSERT INTO "DiscountRate" VALUES ('EU','BIO_REF2_ETH_CCS_N',2030,0.10,'');
INSERT INTO "DiscountRate" VALUES ('EU','BIO_REF2_DST_CCS_N',2030,0.10,'');
INSERT INTO "DiscountRate" VALUES ('EU','BIO_REF2_KER_CCS_N',2030,0.10,'');
-- Hydrogen
INSERT INTO "DiscountRate" VALUES ('EU','H2_SR_NGA',2015,0.080,'');
INSERT INTO "DiscountRate" VALUES ('EU','H2_GS_COA',2015,0.080,'');
INSERT INTO "DiscountRate" VALUES ('EU','H2_PO_OIL',2015,0.080,'');
INSERT INTO "DiscountRate" VALUES ('EU','H2_SR_BIO',2015,0.080,'');
INSERT INTO "DiscountRate" VALUES ('EU','H2_GS_BIO',2015,0.080,'');
INSERT INTO "DiscountRate" VALUES ('EU','H2_SR_ETH',2015,0.080,'');
INSERT INTO "DiscountRate" VALUES ('EU','H2_EL_ALK',2020,0.080,'');
INSERT INTO "DiscountRate" VALUES ('EU','H2_EL_PEM',2020,0.080,'');
INSERT INTO "DiscountRate" VALUES ('EU','H2_EL_SOEC',2020,0.080,'');
INSERT INTO "DiscountRate" VALUES ('EU','H2_EL_AEM',2050,0.080,'');
-- CCUS
INSERT INTO "DiscountRate" VALUES ('EU','CCUS_H2_SR_NGA',2020,0.080,'');
INSERT INTO "DiscountRate" VALUES ('EU','CCUS_H2_GS_COA',2020,0.080,'');
INSERT INTO "DiscountRate" VALUES ('EU','CCUS_H2_GS_BIO',2020,0.080,'');
-- Electricity sector
INSERT INTO "DiscountRate" VALUES ('EU','ELC_COA_PUL_N',2010,0.08,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_COA_CCO_N',2010,0.08,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_COA_PFB_N',2010,0.08,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_OIL_MIX_TUR_N',2010,0.08,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_OIL_MIX_CCY_N',2010,0.08,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_NGA_CCY_ADV_N',2010,0.08,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_NGA_FCE_N',2010,0.08,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_NUC_FIS_LWR_N',2010,0.08,'Assumption');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_NUC_FIS_EPR_N',2020,0.08,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_NUC_FIS_FR_N',2030,0.10,'Assumpiton');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_NUC_FIS_ABWR_N',2040,0.10,'Assumption');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_NUC_FIS_ADS_TRU_N',2040,0.10,'Assumption');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_NUC_FIS_ADS_MA_N',2040,0.10,'Assumption');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_BIO_GSF_CEN_N',2010,0.08,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_BIO_COM_CEN_N',2010,0.08,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_BIO_GSF_DEC_N',2010,0.08,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_BIO_COM_DEC_N',2010,0.08,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_BIO_GAS_N',2010,0.08,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_BIO_CRP_GSF_N',2010,0.08,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_BIO_CRP_COM_N',2010,0.08,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_BIO_MUN_INC_N',2010,0.08,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_HYD_GEN_DAM_N',2010,0.05,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_HYD_GEN_RUN_N',2010,0.05,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_HYD_PUM_N',2010,0.10,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_GEO_FLS_N',2010,0.05,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_GEO_BNY_N',2010,0.05,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_GEO_BNY_HIG_N',2010,0.05,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_WIN_N',2010,0.076,'10.1016/j.apenergy.2024.124633');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_WIN_OFF_N',2010,0.086,'10.1016/j.apenergy.2024.124633');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_SOL_PV_CEN_N',2010,0.057,'10.1016/j.apenergy.2024.124633');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_SOL_PV_DST_N',2010,0.057,'10.1016/j.apenergy.2024.124633');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_SOL_CSP_1_N',2010,0.057,'10.1016/j.apenergy.2024.124633');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_SOL_CSP_2_N',2010,0.057,'10.1016/j.apenergy.2024.124633');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_SOL_CSP_3_N',2010,0.057,'10.1016/j.apenergy.2024.124633');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_SOL_CSP_4_N',2010,0.057,'10.1016/j.apenergy.2024.124633');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_MAR_WAV_N',2010,0.05,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_MAR_TDL_N',2010,0.05,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_COA_CCO_IG_CCS_N',2030,0.15,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_COA_CCO_FG_CCS_N',2030,0.15,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_COA_PUL_FG_CCS_N',2030,0.15,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_NGA_FG_CCS_N',2030,0.15,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_NGA_SOFC_CCS_N',2030,0.15,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_BIO_CRP_GSF_CCS_N',2030,0.15,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_BIO_CRP_COM_CCS_N',2030,0.15,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_BIO_GSF_CCS_N',2030,0.15,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_BIO_COM_CCS_N',2030,0.15,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_CHP_NGA_N',2010,0.08,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_CHP_COA_N',2010,0.08,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_CHP_BIO_N',2010,0.08,'WEO22,WEO23');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_STG_CEN_BTT_N',2020,0.10,'Assumption');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_STG_DST_BTT_N',2020,0.10,'Assumption');
INSERT INTO "DiscountRate" VALUES ('EU','ELC_HH2_PEMFC_N',2025,0.05,'Assumption');

CREATE TABLE "DemandSpecificDistribution" (
	"regions"	text,
	"season_name"	text,
	"time_of_day_name"	text,
	"demand_name"	text,
	"dds"	real CHECK("dds" >= 0 AND "dds" <= 1),
	"dds_notes"	text,
	PRIMARY KEY("regions","season_name","time_of_day_name","demand_name"),
	FOREIGN KEY("season_name") REFERENCES "time_season"("t_season"),
	FOREIGN KEY("time_of_day_name") REFERENCES "time_of_day"("t_day"),
	FOREIGN KEY("demand_name") REFERENCES "commodities"("comm_name")
);

CREATE TABLE "Allocation" (
    "regions"       text,
	"demand_comm"	text,
	"driver_name"	text,
	"allocation_notes"  text,
	PRIMARY KEY("regions", "demand_comm", "driver_name"),
	FOREIGN KEY("regions") REFERENCES "regions"("regions"),
	FOREIGN KEY("demand_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("driver_name") REFERENCES "Driver"("driver_name")
);
-- Other sectors and dummies (not required in the whole database)
INSERT INTO "Allocation" VALUES ('IT','DMY_OUT','GDP','');

CREATE TABLE "Driver" (
    "regions"       text,
    "periods"   	integer,
	"driver_name"	text,
	"driver"        real,
	"driver_notes"  text,
	PRIMARY KEY("regions", "periods", "driver_name"),
	FOREIGN KEY("regions") REFERENCES "regions"("regions"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods")
);
INSERT INTO "Driver" VALUES ('EU',2005,'GDP',1.000,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2010,'GDP',1.028,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2015,'GDP',1.116,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2020,'GDP',1.147,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2025,'GDP',1.322,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2030,'GDP',1.409,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2035,'GDP',1.501,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2040,'GDP',1.594,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2045,'GDP',1.695,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2050,'GDP',1.803,'U.S. EIA, International Energy Outlook 2021, 2022');

INSERT INTO "Driver" VALUES ('EU',2005,'GDPP',1.000,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2010,'GDPP',1.000,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2015,'GDPP',1.056,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2020,'GDPP',1.061,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2025,'GDPP',1.209,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2030,'GDPP',1.276,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2035,'GDPP',1.349,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2040,'GDPP',1.424,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2045,'GDPP',1.509,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2050,'GDPP',1.603,'U.S. EIA, International Energy Outlook 2021, 2022');

INSERT INTO "Driver" VALUES ('EU',2005,'GDPPHOU',1.000,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2010,'GDPPHOU',1.028,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2015,'GDPPHOU',1.116,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2020,'GDPPHOU',1.147,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2025,'GDPPHOU',1.322,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2030,'GDPPHOU',1.409,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2040,'GDPPHOU',1.594,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2035,'GDPPHOU',1.501,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2045,'GDPPHOU',1.695,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2050,'GDPPHOU',1.803,'U.S. EIA, International Energy Outlook 2021, 2022');

INSERT INTO "Driver" VALUES ('EU',2005,'HOU',1.000,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2010,'HOU',1.024,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2015,'HOU',1.046,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2020,'HOU',1.065,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2025,'HOU',1.084,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2030,'HOU',1.102,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2035,'HOU',1.121,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2040,'HOU',1.140,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2045,'HOU',1.160,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2050,'HOU',1.176,'U.S. EIA, International Energy Outlook 2021, 2022');

INSERT INTO "Driver" VALUES ('EU',2005,'PAGR',1.000,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2010,'PAGR',1.013,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2015,'PAGR',1.092,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2020,'PAGR',1.114,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2025,'PAGR',1.259,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2030,'PAGR',1.332,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2035,'PAGR',1.409,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2040,'PAGR',1.487,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2045,'PAGR',1.574,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2050,'PAGR',1.665,'U.S. EIA, International Energy Outlook 2021, 2022');

INSERT INTO "Driver" VALUES ('EU',2005,'PCHEM',1.000,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2010,'PCHEM',1.005,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2015,'PCHEM',1.042,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2020,'PCHEM',1.021,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2025,'PCHEM',1.138,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2030,'PCHEM',1.167,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2035,'PCHEM',1.203,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2040,'PCHEM',1.236,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2045,'PCHEM',1.279,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2050,'PCHEM',1.322,'U.S. EIA, International Energy Outlook 2021, 2022');

INSERT INTO "Driver" VALUES ('EU',2005,'PISNF',1.000,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2010,'PISNF',0.991,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2015,'PISNF',0.980,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2020,'PISNF',0.913,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2025,'PISNF',0.989,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2030,'PISNF',0.964,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2035,'PISNF',0.955,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2040,'PISNF',0.943,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2045,'PISNF',0.939,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2050,'PISNF',0.933,'U.S. EIA, International Energy Outlook 2021, 2022');

INSERT INTO "Driver" VALUES ('EU',2005,'POEI',1.000,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2010,'POEI',1.014,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2015,'POEI',1.049,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2020,'POEI',1.025,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2025,'POEI',1.122,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2030,'POEI',1.147,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2035,'POEI',1.180,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2040,'POEI',1.209,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2045,'POEI',1.248,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2050,'POEI',1.287,'U.S. EIA, International Energy Outlook 2021, 2022');

INSERT INTO "Driver" VALUES ('EU',2005,'POI',1.000,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2010,'POI',1.050,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2015,'POI',1.118,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2020,'POI',1.284,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2025,'POI',1.428,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2030,'POI',1.584,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2035,'POI',1.763,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2040,'POI',1.955,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2045,'POI',2.105,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2050,'POI',2.265,'U.S. EIA, International Energy Outlook 2021, 2022');

INSERT INTO "Driver" VALUES ('EU',2005,'POP',1.000,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2010,'POP',1.028,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2015,'POP',1.056,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2020,'POP',1.081,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2025,'POP',1.093,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2030,'POP',1.104,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2035,'POP',1.113,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2040,'POP',1.120,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2045,'POP',1.122,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2050,'POP',1.124,'U.S. EIA, International Energy Outlook 2021, 2022');

INSERT INTO "Driver" VALUES ('EU',2005,'PSER',1.000,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2010,'PSER',1.020,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2015,'PSER',1.130,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2020,'PSER',1.185,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2025,'PSER',1.381,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2030,'PSER',1.519,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2035,'PSER',1.667,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2040,'PSER',1.822,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2045,'PSER',2.000,'U.S. EIA, International Energy Outlook 2021, 2022');
INSERT INTO "Driver" VALUES ('EU',2050,'PSER',2.194,'U.S. EIA, International Energy Outlook 2021, 2022');

CREATE TABLE "Elasticity" (
    "regions"       text,
    "periods"   	integer,
	"demand_comm"	text,
	"elasticity"    real,
	"elaticity_notes"  text,
	PRIMARY KEY("regions", "periods", "demand_comm"),
	FOREIGN KEY("regions") REFERENCES "regions"("regions"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("demand_comm") REFERENCES "commodities"("comm_name")
);
-- Other sectors and dummies (not required in the whole database)
INSERT INTO "Elasticity" VALUES ('IT',2007,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2008,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2010,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2012,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2014,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2016,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2018,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2020,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2022,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2025,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2030,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2035,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2040,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2045,'DMY_OUT',0.00,'');
INSERT INTO "Elasticity" VALUES ('IT',2050,'DMY_OUT',0.00,'');

CREATE TABLE "Demand" (
	"regions"	text,
	"periods"	integer,
	"demand_comm"	text,
	"demand"	real,
	"demand_units"	text,
	"demand_notes"	text,
	PRIMARY KEY("regions","periods","demand_comm"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("demand_comm") REFERENCES "commodities"("comm_name")
);
INSERT INTO "Demand" VALUES ('IT',2007,'ELC_DEM',1129.99,'PJ','IEA');
INSERT INTO "Demand" VALUES ('IT',2008,'ELC_DEM',1148.87,'PJ','IEA');
INSERT INTO "Demand" VALUES ('IT',2010,'ELC_DEM',1087.43,'PJ','IEA');
INSERT INTO "Demand" VALUES ('IT',2012,'ELC_DEM',1077.40,'PJ','IEA');
INSERT INTO "Demand" VALUES ('IT',2014,'ELC_DEM',1007.38,'PJ','IEA');
INSERT INTO "Demand" VALUES ('IT',2016,'ELC_DEM',1043.16,'PJ','IEA');
INSERT INTO "Demand" VALUES ('IT',2018,'ELC_DEM',1042.95,'PJ','IEA');
INSERT INTO "Demand" VALUES ('IT',2020,'ELC_DEM',1009.91,'PJ','IEA');
INSERT INTO "Demand" VALUES ('IT',2022,'ELC_DEM',1022.26,'PJ','IEA');
INSERT INTO "Demand" VALUES ('IT',2025,'ELC_DEM',984.13,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "Demand" VALUES ('IT',2030,'ELC_DEM',1085.99,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "Demand" VALUES ('IT',2035,'ELC_DEM',1191.04,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "Demand" VALUES ('IT',2040,'ELC_DEM',1295.30,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "Demand" VALUES ('IT',2045,'ELC_DEM',1393.12,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "Demand" VALUES ('IT',2050,'ELC_DEM',1432.38,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "Demand" VALUES ('IT',2025,'HET_DEM',203.89,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "Demand" VALUES ('IT',2030,'HET_DEM',214.08,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "Demand" VALUES ('IT',2035,'HET_DEM',224.79,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "Demand" VALUES ('IT',2040,'HET_DEM',236.03,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "Demand" VALUES ('IT',2045,'HET_DEM',247.83,'PJ','Decarbonization Scenario of TEMOA-Italy');
INSERT INTO "Demand" VALUES ('IT',2050,'HET_DEM',260.22,'PJ','Decarbonization Scenario of TEMOA-Italy');
-- Other sectors and dummies (not required in the whole database)
INSERT INTO "Demand" VALUES ('IT',2006,'DMY_OUT',1E6,'PJ','');

CREATE TABLE "CommodityEmissionFactor" (
	"input_comm"    text,
	"emis_comm"     text,
	"ef"            real,
	"emis_unit"     text,
	"ef_notes"      text,
	PRIMARY KEY("input_comm","ef","emis_comm"),
	FOREIGN KEY("input_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("emis_comm") REFERENCES "commodities"("comm_name")
);
-- Upstream
INSERT INTO "CommodityEmissionFactor" VALUES ('UPS_NGA','UPS_CO2',53.06/1.055,'kg/MBtu to kt/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
INSERT INTO "CommodityEmissionFactor" VALUES ('UPS_OIL_LIQ','UPS_CO2',74.54/1.055,'kg/MBtu to kt/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
INSERT INTO "CommodityEmissionFactor" VALUES ('UPS_OIL_GAS','UPS_CO2',61.71/1.055,'kg/MBtu to kt/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
-- Hydrogen
INSERT INTO "CommodityEmissionFactor" VALUES ('H2_NGA','UPS_CO2',53.06/1.055,'kg/MBtu to kt/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
INSERT INTO "CommodityEmissionFactor" VALUES ('H2_COA','UPS_CO2',94.67/1.055,'kg/MBtu to kt/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
INSERT INTO "CommodityEmissionFactor" VALUES ('H2_OIL','UPS_CO2',75.20/1.055,'kg/MBtu to kt/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
-- Electricity sector
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_NGA','ELC_CO2',53.06/1.055,'g/MBtu to t/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_COA','ELC_CO2',94.67/1.055,'g/MBtu to t/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_OIL','ELC_CO2',74.54/1.055,'g/MBtu to t/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
-- Hydrogen
INSERT INTO "CommodityEmissionFactor" VALUES ('H2_NGA','UPS_CH4',1.00/1.055,'g/MBtu to t/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
INSERT INTO "CommodityEmissionFactor" VALUES ('H2_COA','UPS_CH4',11.00/1.055,'g/MBtu to t/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
INSERT INTO "CommodityEmissionFactor" VALUES ('H2_OIL','UPS_CH4',3.00/1.055,'g/MBtu to t/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
INSERT INTO "CommodityEmissionFactor" VALUES ('H2_BIO','UPS_CH4',32.00/1.055,'g/MBtu to t/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
INSERT INTO "CommodityEmissionFactor" VALUES ('H2_ETH','UPS_CH4',1.10/1.055,'g/MBtu to t/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
-- Electricity sector
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_NGA','ELC_CH4',1.00/1.055,'g/MBtu to t/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_COA','ELC_CH4',11.00/1.055,'g/MBtu to t/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_OIL','ELC_CH4',3.00/1.055,'g/MBtu to t/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_MUN','ELC_CH4',32.00/1.055,'g/MBtu to t/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_BIO','ELC_CH4',32.00/1.055,'g/MBtu to t/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_BGS','ELC_CH4',3.20/1.055,'g/MBtu to t/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_CRP','ELC_CH4',32.00/1.055,'g/MBtu to t/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
-- Hydrogen
INSERT INTO "CommodityEmissionFactor" VALUES ('H2_NGA','UPS_N2O',0.10/1.055,'g/MBtu to t/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
INSERT INTO "CommodityEmissionFactor" VALUES ('H2_COA','UPS_N2O',1.60/1.055,'g/MBtu to t/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
INSERT INTO "CommodityEmissionFactor" VALUES ('H2_OIL','UPS_N2O',0.60/1.055,'g/MBtu to t/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
INSERT INTO "CommodityEmissionFactor" VALUES ('H2_BIO','UPS_N2O',4.20/1.055,'g/MBtu to t/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
INSERT INTO "CommodityEmissionFactor" VALUES ('H2_ETH','UPS_N2O',0.11/1.055,'g/MBtu to t/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
-- Electricity sector
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_NGA','ELC_N2O',0.10/1.055,'g/MBtu to t/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_COA','ELC_N2O',1.60/1.055,'g/MBtu to t/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_OIL','ELC_N2O',0.60/1.055,'g/MBtu to t/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_MUN','ELC_N2O',4.20/1.055,'g/MBtu to t/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_BIO','ELC_N2O',4.20/1.055,'g/MBtu to t/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_BGS','ELC_N2O',0.63/1.055,'g/MBtu to t/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
INSERT INTO "CommodityEmissionFactor" VALUES ('ELC_CRP','ELC_N2O',4.20/1.055,'g/MBtu to t/PJ','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');

CREATE TABLE "EmissionAggregation" (
	"emis_comm"	        text,
    "emis_agg"          text,
    "emis_agg_weight"   real,
    "emis_agg_units"     text,
    "emis_agg_notes"    text,
    PRIMARY KEY("emis_comm","emis_agg","emis_agg_weight")
);
INSERT INTO "EmissionAggregation" VALUES ('ELC_CO2','TOT_CO2',1.000,'kt/kt','');
INSERT INTO "EmissionAggregation" VALUES ('UPS_CO2','TOT_CO2',1.000,'kt/kt','');
INSERT INTO "EmissionAggregation" VALUES ('UPS_CO2_PRC','TOT_CO2',1.000,'kt/kt','');
INSERT INTO "EmissionAggregation" VALUES ('UPS_CH4','TOT_CH4',0.001,'kt/t','');
INSERT INTO "EmissionAggregation" VALUES ('ELC_CH4','TOT_CH4',0.001,'kt/t','');
INSERT INTO "EmissionAggregation" VALUES ('UPS_N2O','TOT_N2O',0.001,'kt/t','');
INSERT INTO "EmissionAggregation" VALUES ('ELC_N2O','TOT_N2O',0.001,'kt/t','');
INSERT INTO "EmissionAggregation" VALUES ('ELC_CO2','GWP_100',1.000,'kt/kt','');
INSERT INTO "EmissionAggregation" VALUES ('UPS_CO2','GWP_100',1.000,'kt/kt','');
INSERT INTO "EmissionAggregation" VALUES ('UPS_CO2_PRC','GWP_100',1.000,'kt/kt','');
INSERT INTO "EmissionAggregation" VALUES ('UPS_CH4','GWP_100',0.028,'kt/t','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
INSERT INTO "EmissionAggregation" VALUES ('ELC_CH4','GWP_100',0.028,'kt/t','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
INSERT INTO "EmissionAggregation" VALUES ('UPS_N2O','GWP_100',0.265,'kt/t','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');
INSERT INTO "EmissionAggregation" VALUES ('ELC_N2O','GWP_100',0.265,'kt/t','U.S. EPA, "Emission Factors for Greenhouse Gas Inventories", 2014');

CREATE TABLE "EmissionLimit" (
	"regions"	text,
	"periods"	integer,
	"emis_comm"	text,
	"emis_limit"	real,
	"emis_limit_units"	text,
	"emis_limit_notes"	text,
	PRIMARY KEY("periods","emis_comm"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("emis_comm") REFERENCES "commodities"("comm_name")
);
-- Decarbonization scenario
-- Emission limit are relative to 1990 emissions for OECD Europe countries, taken from https://ourworldindata.org/co2-emissions
INSERT INTO "EmissionLimit" VALUES ('EU',2030,'GWP_100',4.42E+06*(1.00-0.55),'kt','Fit for 55');
INSERT INTO "EmissionLimit" VALUES ('EU',2040,'GWP_100',4.42E+06*(1.00-0.90),'kt','European Climate Law');
INSERT INTO "EmissionLimit" VALUES ('EU',2050,'GWP_100',4.42E+06*(1.00-1.00),'kt','Net-zero Emissions');

CREATE TABLE "EmissionActivity" (
	"regions"	text,
	"emis_comm"	text,
	"input_comm"	text,
	"tech"	text,
	"vintage"	integer,
	"output_comm"	text,
	"emis_act"	real,
	"emis_act_units"	text,
	"emis_act_notes"	text,
	PRIMARY KEY("regions","emis_comm","input_comm","tech","vintage","output_comm"),
	FOREIGN KEY("input_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("output_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("emis_comm") REFERENCES "commodities"("comm_name")
);
-- Upstream sector
-- Dummy
--INSERT INTO "EmissionActivity" VALUES ('EU','TOT_CO2',2010,'DMY_DEM_ANNUAL',2010,1E6,'kt/PJ','');
--INSERT INTO "EmissionActivity" VALUES ('EU','TOT_CO2',2010,'DMY_PHY_ANNUAL',2010,1E4,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','TOT_CO2','ethos','DMY_PHY_NON_ANNUAL',2010,'SYN_DST',1E4,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','TOT_CO2','ethos','DMY_PHY_NON_ANNUAL',2010,'SYN_GSL',1E4,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','TOT_CO2','ethos','DMY_PHY_NON_ANNUAL',2010,'SYN_KER',1E4,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','TOT_CO2','ethos','DMY_PHY_NON_ANNUAL',2010,'SYN_NGA',1E4,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','GWP_100','ethos','DMY_PHY_NON_ANNUAL',2010,'SYN_DST',1E4,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','GWP_100','ethos','DMY_PHY_NON_ANNUAL',2010,'SYN_GSL',1E4,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','GWP_100','ethos','DMY_PHY_NON_ANNUAL',2010,'SYN_KER',1E4,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','GWP_100','ethos','DMY_PHY_NON_ANNUAL',2010,'SYN_NGA',1E4,'kt/PJ','');
-- Secondary transformation
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_CRD','UPS_SEC_REF_FLX',2005,'GAS_RFG',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_FEE','UPS_SEC_REF_FLX',2005,'GAS_RFG',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_ADD','UPS_SEC_REF_FLX',2005,'GAS_RFG',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','GAS_LNG','UPS_SEC_REF_FLX',2005,'GAS_RFG',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','GAS_NGA','UPS_SEC_REF_FLX',2005,'GAS_RFG',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_OIL_LIQ','UPS_SEC_REF_FLX',2005,'GAS_RFG',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_OIL_GAS','UPS_SEC_REF_FLX',2005,'GAS_RFG',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_ELC','UPS_SEC_REF_FLX',2005,'GAS_RFG',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_HET','UPS_SEC_REF_FLX',2005,'GAS_RFG',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_CRD','UPS_SEC_REF_FLX',2005,'GAS_ETH',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_FEE','UPS_SEC_REF_FLX',2005,'GAS_ETH',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_ADD','UPS_SEC_REF_FLX',2005,'GAS_ETH',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','GAS_LNG','UPS_SEC_REF_FLX',2005,'GAS_ETH',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','GAS_NGA','UPS_SEC_REF_FLX',2005,'GAS_ETH',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_OIL_LIQ','UPS_SEC_REF_FLX',2005,'GAS_ETH',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_OIL_GAS','UPS_SEC_REF_FLX',2005,'GAS_ETH',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_ELC','UPS_SEC_REF_FLX',2005,'GAS_ETH',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_HET','UPS_SEC_REF_FLX',2005,'GAS_ETH',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_CRD','UPS_SEC_REF_FLX',2005,'OIL_LPG',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_FEE','UPS_SEC_REF_FLX',2005,'OIL_LPG',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_ADD','UPS_SEC_REF_FLX',2005,'OIL_LPG',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','GAS_LNG','UPS_SEC_REF_FLX',2005,'OIL_LPG',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','GAS_NGA','UPS_SEC_REF_FLX',2005,'OIL_LPG',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_OIL_LIQ','UPS_SEC_REF_FLX',2005,'OIL_LPG',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_OIL_GAS','UPS_SEC_REF_FLX',2005,'OIL_LPG',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_ELC','UPS_SEC_REF_FLX',2005,'OIL_LPG',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_HET','UPS_SEC_REF_FLX',2005,'OIL_LPG',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_CRD','UPS_SEC_REF_FLX',2005,'OIL_GSL',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_FEE','UPS_SEC_REF_FLX',2005,'OIL_GSL',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_ADD','UPS_SEC_REF_FLX',2005,'OIL_GSL',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','GAS_LNG','UPS_SEC_REF_FLX',2005,'OIL_GSL',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','GAS_NGA','UPS_SEC_REF_FLX',2005,'OIL_GSL',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_OIL_LIQ','UPS_SEC_REF_FLX',2005,'OIL_GSL',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_OIL_GAS','UPS_SEC_REF_FLX',2005,'OIL_GSL',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_ELC','UPS_SEC_REF_FLX',2005,'OIL_GSL',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_HET','UPS_SEC_REF_FLX',2005,'OIL_GSL',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_CRD','UPS_SEC_REF_FLX',2005,'OIL_KER',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_FEE','UPS_SEC_REF_FLX',2005,'OIL_KER',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_ADD','UPS_SEC_REF_FLX',2005,'OIL_KER',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','GAS_LNG','UPS_SEC_REF_FLX',2005,'OIL_KER',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','GAS_NGA','UPS_SEC_REF_FLX',2005,'OIL_KER',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_OIL_LIQ','UPS_SEC_REF_FLX',2005,'OIL_KER',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_OIL_GAS','UPS_SEC_REF_FLX',2005,'OIL_KER',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_ELC','UPS_SEC_REF_FLX',2005,'OIL_KER',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_HET','UPS_SEC_REF_FLX',2005,'OIL_KER',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_CRD','UPS_SEC_REF_FLX',2005,'OIL_DST',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_FEE','UPS_SEC_REF_FLX',2005,'OIL_DST',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_ADD','UPS_SEC_REF_FLX',2005,'OIL_DST',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','GAS_LNG','UPS_SEC_REF_FLX',2005,'OIL_DST',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','GAS_NGA','UPS_SEC_REF_FLX',2005,'OIL_DST',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_OIL_LIQ','UPS_SEC_REF_FLX',2005,'OIL_DST',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_OIL_GAS','UPS_SEC_REF_FLX',2005,'OIL_DST',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_ELC','UPS_SEC_REF_FLX',2005,'OIL_DST',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_HET','UPS_SEC_REF_FLX',2005,'OIL_DST',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_CRD','UPS_SEC_REF_FLX',2005,'OIL_HFO',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_FEE','UPS_SEC_REF_FLX',2005,'OIL_HFO',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_ADD','UPS_SEC_REF_FLX',2005,'OIL_HFO',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','GAS_LNG','UPS_SEC_REF_FLX',2005,'OIL_HFO',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','GAS_NGA','UPS_SEC_REF_FLX',2005,'OIL_HFO',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_OIL_LIQ','UPS_SEC_REF_FLX',2005,'OIL_HFO',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_OIL_GAS','UPS_SEC_REF_FLX',2005,'OIL_HFO',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_ELC','UPS_SEC_REF_FLX',2005,'OIL_HFO',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_HET','UPS_SEC_REF_FLX',2005,'OIL_HFO',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_CRD','UPS_SEC_REF_FLX',2005,'OIL_NAP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_FEE','UPS_SEC_REF_FLX',2005,'OIL_NAP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_ADD','UPS_SEC_REF_FLX',2005,'OIL_NAP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','GAS_LNG','UPS_SEC_REF_FLX',2005,'OIL_NAP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','GAS_NGA','UPS_SEC_REF_FLX',2005,'OIL_NAP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_OIL_LIQ','UPS_SEC_REF_FLX',2005,'OIL_NAP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_OIL_GAS','UPS_SEC_REF_FLX',2005,'OIL_NAP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_ELC','UPS_SEC_REF_FLX',2005,'OIL_NAP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_HET','UPS_SEC_REF_FLX',2005,'OIL_NAP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_CRD','UPS_SEC_REF_FLX',2005,'OIL_WSP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_FEE','UPS_SEC_REF_FLX',2005,'OIL_WSP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_ADD','UPS_SEC_REF_FLX',2005,'OIL_WSP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','GAS_LNG','UPS_SEC_REF_FLX',2005,'OIL_WSP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','GAS_NGA','UPS_SEC_REF_FLX',2005,'OIL_WSP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_OIL_LIQ','UPS_SEC_REF_FLX',2005,'OIL_WSP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_OIL_GAS','UPS_SEC_REF_FLX',2005,'OIL_WSP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_ELC','UPS_SEC_REF_FLX',2005,'OIL_WSP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_HET','UPS_SEC_REF_FLX',2005,'OIL_WSP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_CRD','UPS_SEC_REF_FLX',2005,'OIL_LUB',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_FEE','UPS_SEC_REF_FLX',2005,'OIL_LUB',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_ADD','UPS_SEC_REF_FLX',2005,'OIL_LUB',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','GAS_LNG','UPS_SEC_REF_FLX',2005,'OIL_LUB',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','GAS_NGA','UPS_SEC_REF_FLX',2005,'OIL_LUB',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_OIL_LIQ','UPS_SEC_REF_FLX',2005,'OIL_LUB',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_OIL_GAS','UPS_SEC_REF_FLX',2005,'OIL_LUB',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_ELC','UPS_SEC_REF_FLX',2005,'OIL_LUB',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_HET','UPS_SEC_REF_FLX',2005,'OIL_LUB',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_CRD','UPS_SEC_REF_FLX',2005,'OIL_ASP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_FEE','UPS_SEC_REF_FLX',2005,'OIL_ASP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_ADD','UPS_SEC_REF_FLX',2005,'OIL_ASP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','GAS_LNG','UPS_SEC_REF_FLX',2005,'OIL_ASP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','GAS_NGA','UPS_SEC_REF_FLX',2005,'OIL_ASP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_OIL_LIQ','UPS_SEC_REF_FLX',2005,'OIL_ASP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_OIL_GAS','UPS_SEC_REF_FLX',2005,'OIL_ASP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_ELC','UPS_SEC_REF_FLX',2005,'OIL_ASP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_HET','UPS_SEC_REF_FLX',2005,'OIL_ASP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_CRD','UPS_SEC_REF_FLX',2005,'OIL_WAX',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_FEE','UPS_SEC_REF_FLX',2005,'OIL_WAX',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_ADD','UPS_SEC_REF_FLX',2005,'OIL_WAX',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','GAS_LNG','UPS_SEC_REF_FLX',2005,'OIL_WAX',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','GAS_NGA','UPS_SEC_REF_FLX',2005,'OIL_WAX',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_OIL_LIQ','UPS_SEC_REF_FLX',2005,'OIL_WAX',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_OIL_GAS','UPS_SEC_REF_FLX',2005,'OIL_WAX',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_ELC','UPS_SEC_REF_FLX',2005,'OIL_WAX',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_HET','UPS_SEC_REF_FLX',2005,'OIL_WAX',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_CRD','UPS_SEC_REF_FLX',2005,'OIL_PTC',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_FEE','UPS_SEC_REF_FLX',2005,'OIL_PTC',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_ADD','UPS_SEC_REF_FLX',2005,'OIL_PTC',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','GAS_LNG','UPS_SEC_REF_FLX',2005,'OIL_PTC',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','GAS_NGA','UPS_SEC_REF_FLX',2005,'OIL_PTC',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_OIL_LIQ','UPS_SEC_REF_FLX',2005,'OIL_PTC',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_OIL_GAS','UPS_SEC_REF_FLX',2005,'OIL_PTC',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_ELC','UPS_SEC_REF_FLX',2005,'OIL_PTC',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_HET','UPS_SEC_REF_FLX',2005,'OIL_PTC',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_CRD','UPS_SEC_REF_FLX',2005,'OIL_NSP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_FEE','UPS_SEC_REF_FLX',2005,'OIL_NSP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','OIL_ADD','UPS_SEC_REF_FLX',2005,'OIL_NSP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','GAS_LNG','UPS_SEC_REF_FLX',2005,'OIL_NSP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','GAS_NGA','UPS_SEC_REF_FLX',2005,'OIL_NSP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_OIL_LIQ','UPS_SEC_REF_FLX',2005,'OIL_NSP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_OIL_GAS','UPS_SEC_REF_FLX',2005,'OIL_NSP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_ELC','UPS_SEC_REF_FLX',2005,'OIL_NSP',1.6,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2_PRC','UPS_HET','UPS_SEC_REF_FLX',2005,'OIL_NSP',1.6,'kt/PJ','');
-- GHGs emissions assumption for imported biofuels
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2','ethos','UPS_IMP_BIO_DST',2010,'BIO_DST',81.55/1.055,'kg/MBtu to kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2','ethos','UPS_IMP_BIO_WOD',2010,'BIO_WOD',93.80/1.055,'kg/MBtu to kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2','ethos','UPS_IMP_BIO_ETH',2010,'BIO_ETH',68.44/1.055,'kg/MBtu to kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CH4','ethos','UPS_IMP_BIO_DST',2010,'BIO_DST',1.10/1.055,'kg/MBtu to kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CH4','ethos','UPS_IMP_BIO_WOD',2010,'BIO_WOD',7.20/1.055,'kg/MBtu to kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CH4','ethos','UPS_IMP_BIO_ETH',2010,'BIO_ETH',1.10/1.055,'kg/MBtu to kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_N2O','ethos','UPS_IMP_BIO_DST',2010,'BIO_DST',0.11/1.055,'kg/MBtu to kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_N2O','ethos','UPS_IMP_BIO_WOD',2010,'BIO_WOD',3.60/1.055,'kg/MBtu to kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_N2O','ethos','UPS_IMP_BIO_ETH',2010,'BIO_ETH',0.11/1.055,'kg/MBtu to kt/PJ','');
-- CH4 compensation for blended biofuels and hydrogen
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CH4','BIO_GAS','H2_FT_BIO',2050,'H2_BIO',(-32.00+3.20)/1.055,'g/MBtu to t/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','ELC_CH4','BIO_GAS','ELC_FT_BIO',2050,'ELC_BIO',(-32.00+3.20)/1.055,'g/MBtu to t/PJ','');
-- N2O compensation for blended biofuels and hydrogen
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_N2O','BIO_GAS','H2_FT_BIO',2050,'H2_BIO',(-4.2+0.63)/1.055,'g/MBtu to t/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_N2O','BIO_WOD','H2_FT_BIO',2050,'H2_BIO',(-4.2+3.60)/1.055,'g/MBtu to t/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','ELC_N2O','BIO_WOD','ELC_FT_BIO',2050,'ELC_BIO',(-4.2+3.60)/1.055,'g/MBtu to t/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','ELC_N2O','BIO_GAS','ELC_FT_BIO',2050,'ELC_BIO',(-4.2+0.63)/1.055,'g/MBtu to t/PJ','');
-- CO2 compensation for CCS-equipped processes
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2','H2_NGA','CCUS_H2_SR_NGA',2020,'H2',-53.06/1.055/0.55*0.80,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','SNK_CO2_EM','H2_NGA','CCUS_H2_SR_NGA',2020,'H2',53.06/1.055/0.55*0.80,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2','H2_NGA','CCUS_H2_SR_NGA',2030,'H2',-53.06/1.055/0.63*0.80,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','SNK_CO2_EM','H2_NGA','CCUS_H2_SR_NGA',2030,'H2',53.06/1.055/0.63*0.80,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2','H2_COA','CCUS_H2_GS_COA',2020,'H2',-94.67/1.055/0.56*0.80,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','SNK_CO2_EM','H2_COA','CCUS_H2_GS_COA',2020,'H2',94.67/1.055/0.56*0.80,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2','H2_COA','CCUS_H2_GS_COA',2030,'H2',-94.67/1.055/0.60*0.20,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','SNK_CO2_EM','H2_COA','CCUS_H2_GS_COA',2030,'H2',94.67/1.055/0.60*0.80,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','UPS_CO2','H2_BIO','CCUS_H2_GS_BIO',2020,'H2',-93.80/1.055/0.51*0.80,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','SNK_CO2_EM','H2_BIO','CCUS_H2_GS_BIO',2020,'H2',93.80/1.055/0.51*0.80,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','ELC_CO2','ELC_COA','CCUS_ELC_COA',2020,'ELC_CEN',-94.67/1.055/0.32*0.90,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','ELC_CO2','ELC_COA','CCUS_ELC_COA',2035,'ELC_CEN',-94.67/1.055/0.35*0.90,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','SNK_CO2_EM','ELC_COA','CCUS_ELC_COA',2020,'ELC_CEN',94.67/1.055/0.32*0.90,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','SNK_CO2_EM','ELC_COA','CCUS_ELC_COA',2035,'ELC_CEN',94.67/1.055/0.35*0.90,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','ELC_CO2','ELC_NGA','CCUS_ELC_NGA',2020,'ELC_CEN',-53.06/1.055/0.48*0.90,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','ELC_CO2','ELC_NGA','CCUS_ELC_NGA',2035,'ELC_CEN',-53.06/1.055/0.55*0.90,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','SNK_CO2_EM','ELC_NGA','CCUS_ELC_NGA',2020,'ELC_CEN',53.06/1.055/0.48*0.90,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','SNK_CO2_EM','ELC_NGA','CCUS_ELC_NGA',2035,'ELC_CEN',53.06/1.055/0.55*0.90,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','TOT_CO2','ELC_DST','CCUS_DAC',2020,'SNK_CO2',-1.0,'kt/kt','');
INSERT INTO "EmissionActivity" VALUES ('EU','TOT_CO2','HET','CCUS_DAC',2020,'SNK_CO2',-1.0,'kt/kt','');
INSERT INTO "EmissionActivity" VALUES ('EU','GWP_100','ELC_DST','CCUS_DAC',2020,'SNK_CO2',-1.0,'kt/kt','');
INSERT INTO "EmissionActivity" VALUES ('EU','GWP_100','HET','CCUS_DAC',2020,'SNK_CO2',-1.0,'kt/kt','');
INSERT INTO "EmissionActivity" VALUES ('EU','TOT_CO2','ELC_CEN','SF_DSTKER_DAC',2025,'SYN_DST',-73.25/1.055,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','TOT_CO2','ELC_CEN','SF_DSTKER_DAC',2025,'SYN_KER',-72.22/1.055,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','GWP_100','ELC_CEN','SF_DSTKER_DAC',2025,'SYN_DST',-73.25/1.055,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','GWP_100','ELC_CEN','SF_DSTKER_DAC',2025,'SYN_KER',-72.22/1.055,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','TOT_CO2','ELC_CEN','SF_MEOH_DAC',2025,'SYN_GSL',-70.22/1.055,'kt/PJ','');
INSERT INTO "EmissionActivity" VALUES ('EU','GWP_100','ELC_CEN','SF_MEOH_DAC',2025,'SYN_GSL',-70.22/1.055,'kt/PJ','');
-- CCUS
INSERT INTO "EmissionActivity" VALUES ('EU','TOT_CO2','ethos','SEQ_SNK_AFF_1_N',2010,'SNK_AFF_DMY',-1.0,'','');
INSERT INTO "EmissionActivity" VALUES ('EU','TOT_CO2','ethos','SEQ_SNK_AFF_2_N',2010,'SNK_AFF_DMY',-1.0,'','');
INSERT INTO "EmissionActivity" VALUES ('EU','TOT_CO2','ethos','SEQ_SNK_AFF_3_N',2010,'SNK_AFF_DMY',-1.0,'','');
INSERT INTO "EmissionActivity" VALUES ('EU','TOT_CO2','ethos','SEQ_SNK_AFF_4_N',2010,'SNK_AFF_DMY',-1.0,'','');
INSERT INTO "EmissionActivity" VALUES ('EU','TOT_CO2','ethos','SEQ_SNK_CO2_BKS_N',2010,'SNK_BKS_DMY',-1.0,'','');

CREATE TABLE "MaxResource" (
	"regions"	text,
	"tech"	text,
	"maxres"	real,
	"maxres_units"	text,
	"maxres_notes"	text,
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	PRIMARY KEY("regions","tech")
);
-- CCUS - tenere se troviamo dati sulla spagna
INSERT INTO "MaxResource" VALUES ('EU','SEQ_SNK_EOR_ONS_N',10400000,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxResource" VALUES ('EU','SEQ_SNK_EOR_OFF_N',8600000,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxResource" VALUES ('EU','SEQ_SNK_DOF_ONS_N',7500000,'','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "MaxResource" VALUES ('EU','SEQ_SNK_DGF_ONS_N',28300000,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxResource" VALUES ('EU','SEQ_SNK_DOF_OFF_N',1500000,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxResource" VALUES ('EU','SEQ_SNK_DGF_OFF_N',25000000,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxResource" VALUES ('EU','SEQ_SNK_ECB_N',1000000,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxResource" VALUES ('EU','SEQ_SNK_ECB_DEEP_N',1000000,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxResource" VALUES ('EU','SEQ_SNK_DSA_ONS_N',23413636,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxResource" VALUES ('EU','SEQ_SNK_DSA_OFF_N',6886364,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxResource" VALUES ('EU','SEQ_SNK_DOC_N',75000000,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxResource" VALUES ('EU','SEQ_SNK_AFF_1_N',1E+15,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxResource" VALUES ('EU','SEQ_SNK_AFF_2_N',1E+15,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxResource" VALUES ('EU','SEQ_SNK_AFF_3_N',1E+15,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxResource" VALUES ('EU','SEQ_SNK_AFF_4_N',1E+15,'','10.1016/j.fusengdes.2024.114679');

CREATE TABLE "MinCapacity" (
	"regions"	text,
	"periods"	integer,
	"tech"	text,
	"mincap"	real,
	"mincap_units"	text,
	"mincap_notes"	text,
	PRIMARY KEY("regions","periods","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods")
);

CREATE TABLE "MaxCapacity" (
	"regions"	text,
	"periods"	integer,
	"tech"	text,
	"maxcap"	real,
	"maxcap_units"	text,
	"maxcap_notes"	text,
	PRIMARY KEY("regions","periods","tech"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
-- Import, mining and primary renewable resources
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_IMP_ELC_AFR',1.359,'','10.2833/092722');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_IMP_ELC_OEE',4.553+2.094+0.789+3.590+5.040+1.054+1.132+1.073,'','10.2833/092722');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_IMP_ELC_RUS',2.464+0.696+2.490,'','10.2833/092722');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_IMP_ELC_MEA',2.485+1.900,'','10.2833/092722');
INSERT INTO "MaxCapacity" VALUES ('EU',2020,'UPS_IMP_ELC_AFR',1.359,'','10.2833/092722');
INSERT INTO "MaxCapacity" VALUES ('EU',2020,'UPS_IMP_ELC_OEE',4.553+2.094+0.789+3.590+5.040+1.054+1.132+1.073,'','10.2833/092722');
INSERT INTO "MaxCapacity" VALUES ('EU',2020,'UPS_IMP_ELC_RUS',2.464+0.696+2.490,'','10.2833/092722');
INSERT INTO "MaxCapacity" VALUES ('EU',2020,'UPS_IMP_ELC_MEA',2.485+1.900,'','10.2833/092722');
INSERT INTO "MaxCapacity" VALUES ('EU',2025,'UPS_IMP_ELC_AFR',1.359,'','');
INSERT INTO "MaxCapacity" VALUES ('EU',2025,'UPS_IMP_ELC_OEE',0.700+1.054+1.132+1.073,'','');
INSERT INTO "MaxCapacity" VALUES ('EU',2025,'UPS_IMP_ELC_RUS',2.464+0.696+2.490,'','');
INSERT INTO "MaxCapacity" VALUES ('EU',2025,'UPS_IMP_ELC_MEA',2.485+1.900,'','');
--INSERT INTO "MaxCapacity" VALUES ('EU',2030,'UPS_IMP_ELC_AFR',1.359+0.500,'','');
--INSERT INTO "MaxCapacity" VALUES ('EU',2030,'UPS_IMP_ELC_OEE',0.700+1.054+1.132+1.073,'',''); -- GMK Center, Ukraine can increase electricity imports from Europe without daily restrictions, 2023 https://gmk.center/en/news/ukraine-can-increase-electricity-imports-from-europe-without-daily-restrictions/
--INSERT INTO "MaxCapacity" VALUES ('EU',2030,'UPS_IMP_ELC_RUS',2.464+0.696+2.490,'','');
--INSERT INTO "MaxCapacity" VALUES ('EU',2030,'UPS_IMP_ELC_MEA',4.385+1.000,'','');
INSERT INTO "MaxCapacity" VALUES ('EU',2050,'UPS_IMP_ELC_AFR',1.359+0.500+2.000+3.000,'','');
INSERT INTO "MaxCapacity" VALUES ('EU',2050,'UPS_IMP_ELC_OEE',4.553+2.094+0.789+3.590+5.040+1.054+1.132+1.073,'','');
INSERT INTO "MaxCapacity" VALUES ('EU',2050,'UPS_IMP_ELC_RUS',2.464+0.696+2.490,'','');
INSERT INTO "MaxCapacity" VALUES ('EU',2050,'UPS_IMP_ELC_MEA',4.385+1.000,'','');
INSERT INTO "MaxCapacity" VALUES ('EU',2050,'UPS_IMP_ELC_CAC',1.000,'','');
-- 500 MW (Italy-Tunisia) In permitting 2028 https://tyndp2022-project-platform.azurewebsites.net/projectsheets/transmission/29
-- 2000 MW (Italy-Tunisia) Under consideration 2028 https://tyndp2022-project-platform.azurewebsites.net/projectsheets/transmission/283
-- 1000 MW (Greece-Cyprus-Israel) In permitting 2026 https://tyndp2022-project-platform.azurewebsites.net/projectsheets/transmission/219
-- 3000 MW (Greece-Egypt) Under consideration 2028 https://tyndp2022-project-platform.azurewebsites.net/projectsheets/transmission/1041
-- ??? MW (Bulgaria-Turkey) Under consideration 2036 https://tyndp2022-project-platform.azurewebsites.net/projectsheets/transmission/1066
-- ??? MW (Serbia-Hungary) Under consideration 2033 https://tyndp2022-project-platform.azurewebsites.net/projectsheets/transmission/1074
-- 1000 MW (Georgia-Romania) Under consideration 2029 https://tyndp2022-project-platform.azurewebsites.net/projectsheets/transmission/1105
INSERT INTO "MaxCapacity" VALUES ('EU',2020,'UPS_IMP_GAS_PIP_AFR',2778.430,'','');
INSERT INTO "MaxCapacity" VALUES ('EU',2020,'UPS_IMP_GAS_PIP_CAC',457.210,'','');
INSERT INTO "MaxCapacity" VALUES ('EU',2030,'UPS_IMP_GAS_PIP_CAC',703.400,'','');
INSERT INTO "MaxCapacity" VALUES ('EU',2030,'UPS_IMP_GAS_PIP_MEA',703.400,'','');
INSERT INTO "MaxCapacity" VALUES ('EU',2025,'UPS_REP_ADV_PUREX_FR_MOX_E',704000,'','');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_LOC_HOIL_1',96114.274,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_LOC_HOIL_2',57668.565,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_LOC_HOIL_3',38445.710,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_LOC_HSAN_1',478.300,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_LOC_HSAN_2',478.300,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_LOC_HSAN_3',239.150,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_LOC_NGA_1',3335.857,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_LOC_NGA_2',3558.247,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_LOC_NGA_3',2001.514,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_LOC_BCO',144619.242,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_LOC_HCO',54680.751,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_GRO_HOIL_1',47646.307,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_GRO_HOIL_2',28587.784,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_GRO_HOIL_3',19058.523,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_GRO_NGA_1',735.285,'','IEA, "WEO 2011", 2012');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_GRO_NGA_2',980.381,'','IEA, "WEO 2011", 2012');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_GRO_NGA_3',735.285,'','IEA, "WEO 2011", 2012');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_REC_HSAN_1',972.543,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_REC_HSAN_2',972.543,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_REC_HSAN_3',486.272,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_DIS_HOIL_1',192811.853,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_DIS_HOIL_2',115687.112,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_DIS_HOIL_3',77124.741,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_DIS_NGA_1',1084.751,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_DIS_NGA_2',1446.335,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_DIS_NGA_3',1084.751,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_DIS_BCO',971161.167,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_DIS_HCO',367330.132,'','10.1016/j.fusengdes.2024.114679');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_SOL_TH_POT',26.6,'GWth',''); -- 26.6 GWth * 31.536 https://solariseheat.eu/wp-content/uploads/2022/04/Pol-21.2.1-Solar_Thermal_Roadmap-1.pdf
INSERT INTO "MaxCapacity" VALUES ('EU',2050,'UPS_SOL_TH_POT',71,'GWth',''); -- 340 GWth * 31.536 https://solariseheat.eu/wp-content/uploads/2022/04/Pol-21.2.1-Solar_Thermal_Roadmap-1.pdf
-- Hydrogen sector
INSERT INTO "MaxCapacity" VALUES ('EU',2015,'H2_GS_COA',0.00,'','');
INSERT INTO "MaxCapacity" VALUES ('EU',2015,'H2_PO_OIL',0.00,'','');
INSERT INTO "MaxCapacity" VALUES ('EU',2020,'CCUS_H2_GS_COA',0.00,'','');
-- Power sector
INSERT INTO "MaxCapacity" VALUES ('EU',2030,'ELC_NUC_FIS_FR_N',0.03,'10.1007/s10894-015-0012-7','');
INSERT INTO "MaxCapacity" VALUES ('EU',2035,'ELC_NUC_FIS_FR_N',0.20,'10.1007/s10894-015-0012-7','');
INSERT INTO "MaxCapacity" VALUES ('EU',2040,'ELC_NUC_FIS_FR_N',1.24,'10.1007/s10894-015-0012-7','');
INSERT INTO "MaxCapacity" VALUES ('EU',2045,'ELC_NUC_FIS_FR_N',7.72,'10.1007/s10894-015-0012-7','');
INSERT INTO "MaxCapacity" VALUES ('EU',2050,'ELC_NUC_FIS_FR_N',45.52,'10.1007/s10894-015-0012-7','');
INSERT INTO "MaxCapacity" VALUES ('EU',2040,'ELC_NUC_FIS_ABWR_N',0.03,'10.1007/s10894-015-0012-7','');
INSERT INTO "MaxCapacity" VALUES ('EU',2045,'ELC_NUC_FIS_ABWR_N',0.20,'10.1007/s10894-015-0012-7','');
INSERT INTO "MaxCapacity" VALUES ('EU',2050,'ELC_NUC_FIS_ABWR_N',1.24,'10.1007/s10894-015-0012-7','');
INSERT INTO "MaxCapacity" VALUES ('EU',2040,'ELC_NUC_FIS_ADS_TRU_N',0.03,'10.1007/s10894-015-0012-7','');
INSERT INTO "MaxCapacity" VALUES ('EU',2045,'ELC_NUC_FIS_ADS_TRU_N',0.20,'10.1007/s10894-015-0012-7','');
INSERT INTO "MaxCapacity" VALUES ('EU',2050,'ELC_NUC_FIS_ADS_TRU_N',1.24,'10.1007/s10894-015-0012-7','');
INSERT INTO "MaxCapacity" VALUES ('EU',2040,'ELC_NUC_FIS_ADS_MA_N',0.03,'10.1007/s10894-015-0012-7','');
INSERT INTO "MaxCapacity" VALUES ('EU',2045,'ELC_NUC_FIS_ADS_MA_N',0.20,'10.1007/s10894-015-0012-7','');
INSERT INTO "MaxCapacity" VALUES ('EU',2050,'ELC_NUC_FIS_ADS_MA_N',1.24,'10.1007/s10894-015-0012-7','');
INSERT INTO "MaxCapacity" VALUES ('EU',2025,'ELC_HH2_PEMFC_N',0.13/2,'10.1007/s10894-015-0012-7','');
INSERT INTO "MaxCapacity" VALUES ('EU',2030,'ELC_HH2_PEMFC_N',0.80/2,'10.1007/s10894-015-0012-7','');
INSERT INTO "MaxCapacity" VALUES ('EU',2035,'ELC_HH2_PEMFC_N',4.97/2,'10.1007/s10894-015-0012-7','');
INSERT INTO "MaxCapacity" VALUES ('EU',2040,'ELC_HH2_PEMFC_N',30.88/2,'10.1007/s10894-015-0012-7','');
INSERT INTO "MaxCapacity" VALUES ('EU',2045,'ELC_HH2_PEMFC_N',181.96/2,'10.1007/s10894-015-0012-7','');
INSERT INTO "MaxCapacity" VALUES ('EU',2050,'ELC_HH2_PEMFC_N',425.10/2,'10.1007/s10894-015-0012-7','');
-- Upstream sector
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_SEC_L2G_ON',5542.792,'PJ','10.1007/978-3-030-86884-0_2');
INSERT INTO "MaxCapacity" VALUES ('EU',2015,'UPS_SEC_L2G_ON',6211.022,'PJ','10.1007/978-3-030-86884-0_2');
INSERT INTO "MaxCapacity" VALUES ('EU',2020,'UPS_SEC_L2G_ON',6886.286,'PJ','10.1007/978-3-030-86884-0_2');
INSERT INTO "MaxCapacity" VALUES ('EU',2025,'UPS_SEC_L2G_ON',7987.107,'PJ','Gas Infrastructure Europe, 2023');
INSERT INTO "MaxCapacity" VALUES ('EU',2030,'UPS_SEC_L2G_ON',8637.752,'PJ','Gas Infrastructure Europe, 2023');
INSERT INTO "MaxCapacity" VALUES ('EU',2050,'UPS_SEC_L2G_ON',1e6,'PJ','Gas Infrastructure Europe, 2023');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'UPS_SEC_L2G_OFF',316.530,'PJ','10.1007/978-3-030-86884-0_2');
INSERT INTO "MaxCapacity" VALUES ('EU',2015,'UPS_SEC_L2G_OFF',582.064,'PJ','10.1007/978-3-030-86884-0_2');
INSERT INTO "MaxCapacity" VALUES ('EU',2020,'UPS_SEC_L2G_OFF',582.064,'PJ','10.1007/978-3-030-86884-0_2');
INSERT INTO "MaxCapacity" VALUES ('EU',2025,'UPS_SEC_L2G_OFF',2625.441,'PJ','Gas Infrastructure Europe, 2023');
INSERT INTO "MaxCapacity" VALUES ('EU',2030,'UPS_SEC_L2G_OFF',3198.712,'PJ','Gas Infrastructure Europe, 2023');
INSERT INTO "MaxCapacity" VALUES ('EU',2050,'UPS_SEC_L2G_OFF',1e6,'PJ','Gas Infrastructure Europe, 2023');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'BIO_REF1_ETHAMIDE_E',2246.45*0.027,'PJ','10.5281/zenodo.3544900');
INSERT INTO "MaxCapacity" VALUES ('EU',2010,'BIO_REF1_ETHSUG_E',1311.08*0.027,'PJ','10.5281/zenodo.3544900');
INSERT INTO "MaxCapacity" VALUES ('EU',2050,'BIO_REF1_ETHAMIDE_E',1E6,'','10.5281/zenodo.3544900');
INSERT INTO "MaxCapacity" VALUES ('EU',2050,'BIO_REF1_ETHSUG_E',1E6,'','10.5281/zenodo.3544900');

CREATE TABLE "DiscreteCapacity" (
	"tech"			text,
	"dsccap"		real,
	"dsccap_units"	text,
	"dsccap_notes"	text,
	PRIMARY KEY("tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);

CREATE TABLE "MaxActivity" (
	"regions"	text,
	"periods"	integer,
	"tech"	text,
	"maxact"	real,
	"maxact_units"	text,
	"maxact_notes"	text,
	PRIMARY KEY("regions","periods","tech"),
	FOREIGN KEY("periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
-- Existing technologies
INSERT INTO "MaxActivity" VALUES ('EU',2010,'ELC_OIL_E',0.95*38.594*31.536*0.30,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2040,'ELC_OIL_E',0.00*38.594*31.536*0.30,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'ELC_NGA_E',0.95*185.139*31.536*0.35,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2035,'ELC_NGA_E',0.00*185.139*31.536*0.35,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'ELC_COA_E',0.95*230.98*31.536*0.40,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2035,'ELC_COA_E',0.00*230.98*31.536*0.40,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'ELC_BIO_E',0.95*13.940*31.536*0.60,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2035,'ELC_BIO_E',0.00*13.940*31.536*0.60,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'ELC_HYD_GEN_E',0.95*134.758*31.536*1.00,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2045,'ELC_HYD_GEN_E',0.00*134.758*31.536*1.00,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'ELC_HYD_PUM_E',0.95*53.209*31.536*0.25,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2055,'ELC_HYD_PUM_E',0.00*53.209*31.536*0.25,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'ELC_NUC_FIS_E',0.95*134.501*31.536*0.80,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2055,'ELC_NUC_FIS_E',0.00*134.501*31.536*0.80,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'ELC_GEO_E',0.95*0.900*31.536*0.85,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2045,'ELC_GEO_E',0.00*0.900*31.536*0.85,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'ELC_WIN_E',0.95*40.574*31.536*1.00,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2030,'ELC_WIN_E',0.00*40.574*31.536*1.00,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'ELC_SOL_E',0.95*2.334*31.536*1.00,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2025,'ELC_SOL_E',0.00*2.334*31.536*1.00,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'ELC_MAR_E',0.95*1.210*31.536*0.05,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2025,'ELC_MAR_E',0.00*1.210*31.536*0.05,'','');

INSERT INTO "MaxActivity" VALUES ('EU',2010,'ELC_CHP_OIL_E',0.95*(68.47+66.30),'','');
INSERT INTO "MaxActivity" VALUES ('EU',2035,'ELC_CHP_OIL_E',0.00*(68.47+66.30),'','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'ELC_CHP_NGA_E',0.95*(670.18+658.63),'','');
INSERT INTO "MaxActivity" VALUES ('EU',2035,'ELC_CHP_NGA_E',0.00*(670.18+658.63),'','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'ELC_CHP_COA_E',0.95*(839.35+611.91),'','');
INSERT INTO "MaxActivity" VALUES ('EU',2035,'ELC_CHP_COA_E',0.00*(839.35+611.91),'','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'ELC_CHP_BIO_E',0.95*(110.05+155.62),'','');
INSERT INTO "MaxActivity" VALUES ('EU',2035,'ELC_CHP_BIO_E',0.00*(110.05+155.62),'','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'ELC_CHP_GEO_E',0.95*(4.14+8.07),'','');
INSERT INTO "MaxActivity" VALUES ('EU',2035,'ELC_CHP_GEO_E',0.00*(4.14+8.07),'','');

INSERT INTO "MaxActivity" VALUES ('EU',2010,'HET_OIL_E',0.95*262.45*0.31*0.30,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2040,'HET_OIL_E',0.00*262.45*0.31*0.30,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'HET_NGA_E',0.95*2174.25*0.21*0.40,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2040,'HET_NGA_E',0.00*2174.25*0.21*0.40,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'HET_COA_E',0.95*854.46*0.16*0.50,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2040,'HET_COA_E',0.00*854.46*0.16*0.50,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'HET_BIO_E',0.95*(226.767+45.917)*0.38*0.60,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2040,'HET_BIO_E',0.00*(226.767+45.917)*0.38*0.60,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'HET_GEO_E',0.95*23.81*0.21*0.80,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2040,'HET_GEO_E',0.00*23.81*0.21*0.80,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'HET_SOL_E',0.95*0.55*1.00,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2040,'HET_SOL_E',0.00*0.55*1.00,'','');
-- Import
INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_BIO_DST',7013.0*0.0385,'PJ','10.5281/zenodo.3544900');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_BIO_DST',7013.0*0.0385,'PJ','10.5281/zenodo.3544900');
INSERT INTO "MaxActivity" VALUES ('EU',2030,'UPS_IMP_BIO_DST',12181.8*0.0385,'PJ','10.5281/zenodo.3544900');
INSERT INTO "MaxActivity" VALUES ('EU',2040,'UPS_IMP_BIO_DST',16671.0*0.0385,'PJ','10.5281/zenodo.3544900');
INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_IMP_BIO_DST',21160.3*0.0385,'PJ','10.5281/zenodo.3544900');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_BIO_ETH',6573.7*0.027,'kt','10.5281/zenodo.3544900');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_BIO_ETH',6573.7*0.027,'kt','10.5281/zenodo.3544900');
INSERT INTO "MaxActivity" VALUES ('EU',2030,'UPS_IMP_BIO_ETH',22788.8*0.027,'kt','10.5281/zenodo.3544900');
INSERT INTO "MaxActivity" VALUES ('EU',2040,'UPS_IMP_BIO_ETH',50895.1*0.027,'kt','10.5281/zenodo.3544900');
INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_IMP_BIO_ETH',79001.3*0.027,'kt','10.5281/zenodo.3544900');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_BIO_WOD',283.0,'PJ','10.5281/zenodo.3544900');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_BIO_WOD',283.0,'PJ','10.5281/zenodo.3544900');
INSERT INTO "MaxActivity" VALUES ('EU',2030,'UPS_IMP_BIO_WOD',517.0,'PJ','10.5281/zenodo.3544900');
INSERT INTO "MaxActivity" VALUES ('EU',2040,'UPS_IMP_BIO_WOD',731.0,'PJ','10.5281/zenodo.3544900');
INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_IMP_BIO_WOD',914.0,'PJ','10.5281/zenodo.3544900');

-- Import
INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_ELC_AFR',26.4,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_ELC_AFR',30.8,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_IMP_ELC_AFR',30.8*1.5,'PJ','');

INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_ELC_OEE',185.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_ELC_OEE',216.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_IMP_ELC_OEE',216.0*1.5,'PJ','');

INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_ELC_RUS',123.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_ELC_RUS',144.0,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_IMP_ELC_RUS',144.0*1.5,'PJ','');

INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_ELC_MEA',39.5,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_ELC_MEA',59.2,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_IMP_ELC_MEA',59.2*1.5,'PJ','');

INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_OIL_USA',281.869,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_OIL_CAN',45.454,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_OIL_MEX',573.543,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_OIL_OLA',1121.453,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_OIL_BRA',513.146,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_OIL_RUS',18141.907,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_OIL_MEA',8810.889,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_OIL_AFR',7942.354,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_OIL_CHI',5.683,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_OIL_JPN',7.582,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_OIL_ODA',346.636,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_OIL_FEE',1602.423,'PJ','');

INSERT INTO "MaxActivity" VALUES ('EU',2015,'UPS_IMP_OIL_USA',39000.935*7.46E-03*1.05,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2015,'UPS_IMP_OIL_CAN',39000.935*1.20E-03*1.05,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2015,'UPS_IMP_OIL_MEX',39000.935*1.52E-02*1.05,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2015,'UPS_IMP_OIL_OLA',39000.935*2.97E-02*1.05,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2015,'UPS_IMP_OIL_BRA',39000.935*1.36E-02*1.05,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2015,'UPS_IMP_OIL_RUS',39000.935*4.80E-01*1.05,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2015,'UPS_IMP_OIL_MEA',39000.935*2.33E-01*1.05,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2015,'UPS_IMP_OIL_AFR',39000.935*2.10E-01*1.05,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2015,'UPS_IMP_OIL_CHI',39000.935*1.50E-04*1.05,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2015,'UPS_IMP_OIL_JPN',39000.935*2.01E-04*1.05,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2015,'UPS_IMP_OIL_ODA',39000.935*9.17E-03*1.05,'PJ','');

INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_OIL_USA',456.966,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_OIL_CAN',31.521,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_OIL_MEX',397.738,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_OIL_OLA',1166.519,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_OIL_BRA',533.781,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_OIL_RUS',18571.906,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_OIL_MEA',6480.449,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_OIL_AFR',6448.197,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_OIL_CHI',3.941,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_OIL_JPN',15.765,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_OIL_ODA',240.384,'PJ','');

INSERT INTO "MaxActivity" VALUES ('EU',2025,'UPS_IMP_OIL_USA',994.943,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2025,'UPS_IMP_OIL_CAN',68.630,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2025,'UPS_IMP_OIL_MEX',865.987,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2025,'UPS_IMP_OIL_OLA',2539.839,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2025,'UPS_IMP_OIL_BRA',1162.191,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2025,'UPS_IMP_OIL_MEA',14109.755,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2025,'UPS_IMP_OIL_AFR',14039.533,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2025,'UPS_IMP_OIL_CHI',8.581,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2025,'UPS_IMP_OIL_JPN',34.325,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2025,'UPS_IMP_OIL_ODA',523.383,'PJ','');

--INSERT INTO "MaxActivity" VALUES ('EU',2025,'UPS_IMP_OIL_RUS',0,'PJ','');
--INSERT INTO "MaxActivity" VALUES ('EU',2025,'UPS_IMP_OIL_RUS',18571.906*0.285,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2030,'UPS_IMP_OIL_RUS',0,'PJ','');

INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_GAS_PIP_AFR',1633.180*1.01,'PJ','');   --10.1016/j.fusengdes.2024.114679
INSERT INTO "MaxActivity" VALUES ('EU',2015,'UPS_IMP_GAS_PIP_AFR',1783.46*1.01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_GAS_PIP_AFR',1406.800*1.01,'PJ','');  -- Bruegel, Annual Report 2022 (2021 data)
INSERT INTO "MaxActivity" VALUES ('EU',2030,'UPS_IMP_GAS_PIP_AFR',2778.430,'PJ',''); -- Maximum capacity

INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_GAS_PIP_RUS',13298.229*1.01,'PJ',''); -- EUROfusion TIMES Model + IEA statistical difference
INSERT INTO "MaxActivity" VALUES ('EU',2015,'UPS_IMP_GAS_PIP_RUS',14462.654*1.01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_GAS_PIP_RUS',13449.259*1.01,'PJ',''); -- Bruegel, Annual Report 2022 (2021 data) + IEA statistical difference
--INSERT INTO "MaxActivity" VALUES ('EU',2025,'UPS_IMP_GAS_PIP_RUS',13449.259*0.285,'PJ',''); -- RePowerEU
--INSERT INTO "MaxActivity" VALUES ('EU',2025,'UPS_IMP_GAS_PIP_RUS',0.0,'PJ',''); -- RePowerEURePowerEU
--INSERT INTO "MaxActivity" VALUES ('EU',2030,'UPS_IMP_GAS_PIP_RUS',0.0,'PJ',''); -- RePowerEU

INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_GAS_PIP_CAC',25.00*1.01,'PJ','');  --10.1016/j.fusengdes.2024.114679
INSERT INTO "MaxActivity" VALUES ('EU',2015,'UPS_IMP_GAS_PIP_CAC',27.300*1.01,'PJ','');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_GAS_PIP_CAC',281.360*1.01,'PJ',''); -- Bruegel, Annual Report 2022 (2021 data)
INSERT INTO "MaxActivity" VALUES ('EU',2030,'UPS_IMP_GAS_PIP_CAC',703.400,'PJ',''); -- European Commission, EU and Azerbaijan enhance bilateral relations, including energy cooperation, https://ec.europa.eu/commission/presscorner/detail/en/ip_22_4550

INSERT INTO "MaxActivity" VALUES ('EU',2030,'UPS_IMP_GAS_PIP_MEA',386.870,'PJ',''); -- https://www.edison.it/it/il-progetto-eastmed-poseidon
INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_IMP_GAS_PIP_MEA',703.400,'PJ',''); -- https://www.edison.it/it/il-progetto-eastmed-poseidon

INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_GAS_LNG_AFR',1589.52*1.01,'PJ',''); -- International Energy Agency, Natural Gas Information 2012
INSERT INTO "MaxActivity" VALUES ('EU',2015,'UPS_IMP_GAS_LNG_AFR',544.43*1.01,'PJ',''); -- Wood D. A., Natural gas imports to Europe: The frontline of competition between LNG and pipeline supplies, Journ. of Nat. Gas Science and Eng., 2016
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_GAS_LNG_AFR',1010.68*1.01,'PJ',''); -- https://giignl.org/wp-content/uploads/2021/11/GIIGNL_Annual_Report_November2021.pdf
INSERT INTO "MaxActivity" VALUES ('EU',2025,'UPS_IMP_GAS_LNG_AFR',1010.68*2,'PJ','');
--INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_IMP_GAS_LNG_AFR',1010.68*1.5,'PJ','');

INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_GAS_LNG_OLA',209.55*1.01,'PJ',''); -- International Energy Agency, Natural Gas Information 2012
INSERT INTO "MaxActivity" VALUES ('EU',2015,'UPS_IMP_GAS_LNG_OLA',99.88*1.01,'PJ',''); -- Wood D. A., Natural gas imports to Europe: The frontline of competition between LNG and pipeline supplies, Journ. of Nat. Gas Science and Eng., 2016
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_GAS_LNG_OLA',181.99*1.01,'PJ',''); -- https://giignl.org/wp-content/uploads/2021/11/GIIGNL_Annual_Report_November2021.pdf
INSERT INTO "MaxActivity" VALUES ('EU',2025,'UPS_IMP_GAS_LNG_OLA',181.99*2,'PJ','');

INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_GAS_LNG_MEA',1394.83*1.01,'PJ',''); -- International Energy Agency, Natural Gas Information 2012
INSERT INTO "MaxActivity" VALUES ('EU',2015,'UPS_IMP_GAS_LNG_MEA',920.75*1.01,'PJ',''); -- Wood D. A., Natural gas imports to Europe: The frontline of competition between LNG and pipeline supplies, Journ. of Nat. Gas Science and Eng., 2016
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_GAS_LNG_MEA',988.55*1.01,'PJ',''); -- https://giignl.org/wp-content/uploads/2021/11/GIIGNL_Annual_Report_November2021.pdf
INSERT INTO "MaxActivity" VALUES ('EU',2030,'UPS_IMP_GAS_LNG_MEA',988.55+316.12+52.755,'PJ',''); -- Long-term agreements with Qatar (Eni, TotalEnergies, Shell)

INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_GAS_LNG_GLB',294.06*1.01,'PJ',''); -- International Energy Agency, Natural Gas Information 2012
INSERT INTO "MaxActivity" VALUES ('EU',2015,'UPS_IMP_GAS_LNG_GLB',0.00*1.01,'PJ',''); -- Wood D. A., Natural gas imports to Europe: The frontline of competition between LNG and pipeline supplies, Journ. of Nat. Gas Science and Eng., 2016

INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_GAS_LNG_USA',0.00*1.01,'PJ',''); -- International Energy Agency, Natural Gas Information 2012
INSERT INTO "MaxActivity" VALUES ('EU',2015,'UPS_IMP_GAS_LNG_USA',0.00*1.01,'PJ',''); -- Wood D. A., Natural gas imports to Europe: The frontline of competition between LNG and pipeline supplies, Journ. of Nat. Gas Science and Eng., 2016
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_GAS_LNG_USA',835.91*1.01,'PJ',''); -- https://giignl.org/wp-content/uploads/2021/11/GIIGNL_Annual_Report_November2021.pdf
INSERT INTO "MaxActivity" VALUES ('EU',2030,'UPS_IMP_GAS_LNG_USA',2594.41,'PJ',''); -- https://www.edison.it/it/il-progetto-eastmed-poseidon
INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_IMP_GAS_LNG_USA',2594.41,'PJ','Assumption');

INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_GAS_LNG_RUS',568.11*1.01,'PJ',''); -- https://giignl.org/wp-content/uploads/2021/11/GIIGNL_Annual_Report_November2021.pdf
INSERT INTO "MaxActivity" VALUES ('EU',2025,'UPS_IMP_GAS_LNG_RUS',0.00,'PJ',''); -- RePowerEU

INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_COA_AFR',5985.591*0.103,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2015,'UPS_IMP_COA_AFR',6219.416*0.098,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_COA_AFR',3835.112*0.023,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_COA_AUS',5985.591*0.098,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2015,'UPS_IMP_COA_AUS',6219.416*0.133,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_COA_AUS',3835.112*0.151,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_COA_CAC',5985.591*0.004,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2015,'UPS_IMP_COA_CAC',6219.416*0.006,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_COA_CAC',3835.112*0.020,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_COA_CAN',5985.591*0.027,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2015,'UPS_IMP_COA_CAN',6219.416*0.019,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_COA_CAN',3835.112*0.026,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_COA_ODA',5985.591*0.065,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2015,'UPS_IMP_COA_ODA',6219.416*0.050,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_COA_ODA',3835.112*0.001,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_COA_OEE',5985.591*0.027,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2015,'UPS_IMP_COA_OEE',6219.416*0.003,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_COA_OEE',3835.112*0.000,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_COA_OLA',5985.591*0.220,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2015,'UPS_IMP_COA_OLA',6219.416*0.230,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_COA_OLA',3835.112*0.060,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_COA_RUS',5985.591*0.260,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2015,'UPS_IMP_COA_RUS',6219.416*0.314,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_COA_RUS',3835.112*0.549,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_IMP_COA_USA',5985.591*0.196,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2015,'UPS_IMP_COA_USA',6219.416*0.147,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_IMP_COA_USA',3835.112*0.170,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');

INSERT INTO "MaxActivity" VALUES ('EU',2025,'UPS_IMP_COA_AFR',3835.112*0.023*1.5,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2025,'UPS_IMP_COA_AUS',3835.112*0.151*1.5,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2025,'UPS_IMP_COA_CAC',3835.112*0.020*1.5,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2025,'UPS_IMP_COA_CAN',3835.112*0.026*1.5,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2025,'UPS_IMP_COA_ODA',3835.112*0.001*1.5,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2025,'UPS_IMP_COA_OEE',3835.112*0.000*1.5,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2025,'UPS_IMP_COA_OLA',3835.112*0.060*1.5,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2025,'UPS_IMP_COA_USA',3835.112*0.170*1.5,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');

--INSERT INTO "MaxActivity" VALUES ('EU',2025,'UPS_IMP_COA_RUS',0.00,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
--INSERT INTO "MaxActivity" VALUES ('EU',2025,'UPS_IMP_COA_RUS',3835.112*0.549*0.285,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MaxActivity" VALUES ('EU',2030,'UPS_IMP_COA_RUS',0.00,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');

INSERT INTO "MaxActivity" VALUES ('EU',2025,'UPS_IMP_H2',600,'PJ','');
--INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_IMP_H2',3600,'PJ','');

-- Upstream sector
-- Fuel technologies

-- Primary renewable sources
INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_SOL_PV_POT',29019175,'PJ','ENSPRESO - Solar'); 
INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_SOL_CSP_POT',1812154,'PJ','ENSPRESO - Solar'); 
INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_WIN_ON_POT',200181,'PJ','ENSPRESO - Wind'); 
INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_WIN_OFF_POT',147351,'PJ','ENSPRESO - Wind'); 

INSERT INTO "MaxActivity" VALUES ('EU',2025,'UPS_GEO_POT',230,'PJ','Assumption');
INSERT INTO "MaxActivity" VALUES ('EU',2030,'UPS_GEO_POT',265,'PJ','Assumption');
INSERT INTO "MaxActivity" VALUES ('EU',2035,'UPS_GEO_POT',305,'PJ','Assumption');
INSERT INTO "MaxActivity" VALUES ('EU',2040,'UPS_GEO_POT',350,'PJ','Assumption');
INSERT INTO "MaxActivity" VALUES ('EU',2045,'UPS_GEO_POT',405,'PJ','Assumption');
INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_GEO_POT',465,'PJ','Assumption');

--INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_GEO_POT',450,'PJ','');
--INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_GEO_POT',3960,'PJ','10.1016/j.energy.2020.118060');

INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_BIO_CRP_SUG_POT',346.6,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_BIO_CRP_SUG_POT',603.2,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2030,'UPS_BIO_CRP_SUG_POT',882.5,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2040,'UPS_BIO_CRP_SUG_POT',944.5,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_BIO_CRP_SUG_POT',995.1,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');

INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_BIO_RPS_POT',373.6,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_BIO_RPS_POT',670.4,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2030,'UPS_BIO_RPS_POT',949.4,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2040,'UPS_BIO_RPS_POT',995.8,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_BIO_RPS_POT',1033.4,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');

INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_BIO_CRP_STC_POT',172.7,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_BIO_CRP_STC_POT',198.6,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2030,'UPS_BIO_CRP_STC_POT',288.1,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2040,'UPS_BIO_CRP_STC_POT',288.5,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_BIO_CRP_STC_POT',284.8,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');

INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_BIO_CRP_GRS_POT',0.0,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_BIO_CRP_GRS_POT',1527.3,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2030,'UPS_BIO_CRP_GRS_POT',1777.5,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2040,'UPS_BIO_CRP_GRS_POT',1726.1,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_BIO_CRP_GRS_POT',1667.7,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');

INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_BIO_CRP_WOD_1_POT',0.0,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_BIO_CRP_WOD_1_POT',267.4,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2030,'UPS_BIO_CRP_WOD_1_POT',317.6,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2040,'UPS_BIO_CRP_WOD_1_POT',303.0,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_BIO_CRP_WOD_1_POT',285.9,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');

INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_BIO_CRP_WOD_2_POT',0.0,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_BIO_CRP_WOD_2_POT',91.3,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2030,'UPS_BIO_CRP_WOD_2_POT',96.6,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2040,'UPS_BIO_CRP_WOD_2_POT',102.7,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_BIO_CRP_WOD_2_POT',109.0,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');

INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_BIO_GAS_POT',1246.0,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_BIO_GAS_POT',1228.2,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2030,'UPS_BIO_GAS_POT',1238.9,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2040,'UPS_BIO_GAS_POT',1252.6,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_BIO_GAS_POT',1266.2,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');

INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_BIO_AGR_WST_POT',1109.8,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_BIO_AGR_WST_POT',1144.4,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2030,'UPS_BIO_AGR_WST_POT',1120.6,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2040,'UPS_BIO_AGR_WST_POT',1092.6,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_BIO_AGR_WST_POT',1064.2,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');

INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_BIO_WOD_PRD_1_POT',977.3,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_BIO_WOD_PRD_1_POT',933.6,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2030,'UPS_BIO_WOD_PRD_1_POT',946.9,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2040,'UPS_BIO_WOD_PRD_1_POT',943.9,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_BIO_WOD_PRD_1_POT',902.4,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');

INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_BIO_WOD_PRD_2_POT',0.0,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_BIO_WOD_PRD_2_POT',0.0,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2030,'UPS_BIO_WOD_PRD_2_POT',0.0,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2040,'UPS_BIO_WOD_PRD_2_POT',0.0,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_BIO_WOD_PRD_2_POT',0.0,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');

INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_BIO_FOR_1_POT',0.0,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_BIO_FOR_1_POT',0.0,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2030,'UPS_BIO_FOR_1_POT',0.0,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2040,'UPS_BIO_FOR_1_POT',0.0,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_BIO_FOR_1_POT',0.0,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');

INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_BIO_WOD_RES_1_POT',110.6,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_BIO_WOD_RES_1_POT',114.0,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2030,'UPS_BIO_WOD_RES_1_POT',119.5,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2040,'UPS_BIO_WOD_RES_1_POT',136.1,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_BIO_WOD_RES_1_POT',143.3,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');

INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_BIO_WOD_RES_2_POT',156.2,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_BIO_WOD_RES_2_POT',155.5,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2030,'UPS_BIO_WOD_RES_2_POT',155.4,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2040,'UPS_BIO_WOD_RES_2_POT',171.1,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_BIO_WOD_RES_2_POT',175.0,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');

INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_BIO_FOR_2_POT',533.3,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_BIO_FOR_2_POT',310.2,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2030,'UPS_BIO_FOR_2_POT',320.6,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2040,'UPS_BIO_FOR_2_POT',304.8,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_BIO_FOR_2_POT',305.1,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');

INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_BIO_MUN_POT',424.3,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_BIO_MUN_POT',471.0,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2030,'UPS_BIO_MUN_POT',565.0,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2040,'UPS_BIO_MUN_POT',655.3,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_BIO_MUN_POT',758.9,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');

INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_BIO_SLU_POT',24.1,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_BIO_SLU_POT',27.8,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2030,'UPS_BIO_SLU_POT',34.9,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2040,'UPS_BIO_SLU_POT',43.0,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_BIO_SLU_POT',53.6,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');

INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_BIO_LIQ_POT',26.9,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2020,'UPS_BIO_LIQ_POT',69.2,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2030,'UPS_BIO_LIQ_POT',73.6,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2040,'UPS_BIO_LIQ_POT',56.4,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');
INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_BIO_LIQ_POT',56.4,'PJ','10.5281/zenodo.3544900, ENSPRESO - Biomass');

------ Secondary transformation
--INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_SEC_COA_OVC',2129.975,'PJ','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_SEC_COA_OVC',8519.900,'PJ','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_SEC_GAS_TWN',33.497,'PJ','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_SEC_GAS_BFG',862.834,'PJ','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_SEC_LIQ',23.792,'PJ','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_SEC_TRA',13.040,'PJ','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_SEC_TRA',43.465,'PJ','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_SEC_REF_FLX',43128.952,'PJ','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "MaxActivity" VALUES ('EU',2050,'UPS_SEC_REF_FLX',100000,'PJ','10.1016/j.fusengdes.2024.114679');

--INSERT INTO "MaxActivity" VALUES ('EU',2010,'UPS_SEC_REF_FDS',731.475,'PJ','');

--INSERT INTO "MaxActivity" VALUES ('EU',2010,'HET_GEO_N',45.724,'','10.1016/j.fusengdes.2024.114679');
--INSERT INTO "MaxActivity" VALUES ('EU',2050,'HET_GEO_N',771.030,'','10.1016/j.fusengdes.2024.114679');

-- Sequestration
------ Afforestation
INSERT INTO "MaxActivity" VALUES ('EU',2010,'SEQ_SNK_AFF_1_N',0.007,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'SEQ_SNK_AFF_2_N',0.007,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'SEQ_SNK_AFF_3_N',0.014,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2010,'SEQ_SNK_AFF_4_N',0.015,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2050,'SEQ_SNK_AFF_1_N',66667,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2050,'SEQ_SNK_AFF_2_N',66667,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2050,'SEQ_SNK_AFF_3_N',126983,'','');
INSERT INTO "MaxActivity" VALUES ('EU',2050,'SEQ_SNK_AFF_4_N',134047,'','');

-- Tenere se non tornano i dati storici
CREATE table "MinActivity" (
	"regions"	text,
	"periods"	integer,
	"tech"	text,
	"minact"	real,
	"minact_units"	text,
	"minact_notes"	text,
	primary key("regions","periods","tech"),
	foreign key("tech") references "technologies"("tech"),
	foreign key("periods") references "time_periods"("t_periods")
);
-- Import
INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_ELC_AFR',26.4*0.95,'','');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_ELC_AFR',30.8*0.95,'','');
INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_ELC_AFR',0.00,'','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_ELC_OEE',185.0*0.95,'','');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_ELC_OEE',216.0*0.95,'','');
INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_ELC_OEE',0.00,'','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_ELC_RUS',123.0*0.95,'','');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_ELC_RUS',144.0*0.95,'','');
INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_ELC_RUS',0.00,'','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_ELC_MEA',39.5*0.95,'','');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_ELC_MEA',59.2*0.95,'','');
INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_ELC_MEA',0.00,'','');

INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_OIL_USA',281.869,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_OIL_CAN',45.454,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_OIL_MEX',573.543,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_OIL_OLA',1121.453,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_OIL_BRA',513.146,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_OIL_RUS',18141.907,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_OIL_MEA',8810.889,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_OIL_AFR',7942.354,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_OIL_CHI',5.683,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_OIL_JPN',7.582,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_OIL_ODA',346.636,'PJ','');

INSERT INTO "MinActivity" VALUES ('EU',2015,'UPS_IMP_OIL_USA',39000.935*7.46E-03*0.95,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2015,'UPS_IMP_OIL_CAN',39000.935*1.20E-03*0.95,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2015,'UPS_IMP_OIL_MEX',39000.935*1.52E-02*0.95,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2015,'UPS_IMP_OIL_OLA',39000.935*2.97E-02*0.95,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2015,'UPS_IMP_OIL_BRA',39000.935*1.36E-02*0.95,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2015,'UPS_IMP_OIL_RUS',39000.935*4.80E-01*0.95,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2015,'UPS_IMP_OIL_MEA',39000.935*2.33E-01*0.95,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2015,'UPS_IMP_OIL_AFR',39000.935*2.10E-01*0.95,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2015,'UPS_IMP_OIL_CHI',39000.935*1.50E-04*0.95,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2015,'UPS_IMP_OIL_JPN',39000.935*2.01E-04*0.95,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2015,'UPS_IMP_OIL_ODA',39000.935*9.17E-03*0.95,'PJ','');

INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_OIL_USA',456.966,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_OIL_CAN',31.521,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_OIL_MEX',397.738,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_OIL_OLA',1166.519,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_OIL_BRA',533.781,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_OIL_RUS',18571.906,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_OIL_MEA',6480.449,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_OIL_AFR',6448.197,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_OIL_CHI',3.941,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_OIL_JPN',15.765,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_OIL_ODA',240.384,'PJ','');

INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_OIL_USA',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_OIL_CAN',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_OIL_MEX',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_OIL_OLA',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_OIL_BRA',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_OIL_RUS',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_OIL_MEA',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_OIL_AFR',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_OIL_CHI',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_OIL_JPN',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_OIL_ODA',0.00,'PJ','');

INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_COA_AFR',5985.581*0.103,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2015,'UPS_IMP_COA_AFR',6219.416*0.098,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_COA_AFR',3835.112*0.023,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_COA_AUS',5985.581*0.098,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2015,'UPS_IMP_COA_AUS',6219.416*0.133,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_COA_AUS',3835.112*0.151,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_COA_CAC',5985.581*0.004,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2015,'UPS_IMP_COA_CAC',6219.416*0.006,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_COA_CAC',3835.112*0.020,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_COA_CAN',5985.581*0.027,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2015,'UPS_IMP_COA_CAN',6219.416*0.019,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_COA_CAN',3835.112*0.026,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_COA_ODA',5985.581*0.065,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2015,'UPS_IMP_COA_ODA',6219.416*0.050,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_COA_ODA',3835.112*0.001,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_COA_OEE',5985.581*0.027,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2015,'UPS_IMP_COA_OEE',6219.416*0.003,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_COA_OEE',3835.112*0.000,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_COA_OLA',5985.581*0.220,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2015,'UPS_IMP_COA_OLA',6219.416*0.230,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_COA_OLA',3835.112*0.060,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_COA_RUS',5985.581*0.260,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2015,'UPS_IMP_COA_RUS',6219.416*0.314,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_COA_RUS',3835.112*0.549,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_COA_USA',5985.581*0.196,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2015,'UPS_IMP_COA_USA',6219.416*0.147,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_COA_USA',3835.112*0.170,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');

INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_COA_AFR',0.0,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_COA_AUS',0.0,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_COA_CAC',0.0,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_COA_CAN',0.0,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_COA_ODA',0.0,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_COA_OEE',0.0,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_COA_OLA',0.0,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_COA_RUS',0.0,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');
INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_COA_USA',0.0,'PJ','https://ec.europa.eu/eurostat/statistics-explained/index.php?title=Coal_production_and_consumption_statistics');

INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_GAS_PIP_AFR',1633.180*0.99,'','');
INSERT INTO "MinActivity" VALUES ('EU',2015,'UPS_IMP_GAS_PIP_AFR',1783.462*0.99,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_GAS_PIP_AFR',1406.800*0.99,'','');
INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_GAS_PIP_AFR',0.0,'','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_GAS_PIP_RUS',13298.229*0.99,'','');
INSERT INTO "MinActivity" VALUES ('EU',2015,'UPS_IMP_GAS_PIP_RUS',14462.654*0.99,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_GAS_PIP_RUS',13449.259*0.99,'','');
INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_GAS_PIP_RUS',0.0,'','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_GAS_PIP_CAC',25.000*0.99,'','');
INSERT INTO "MinActivity" VALUES ('EU',2015,'UPS_IMP_GAS_PIP_CAC',27.300*0.99,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_GAS_PIP_CAC',281.360*0.99,'','');
INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_GAS_PIP_CAC',0.0,'','');

INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_GAS_LNG_AFR',1589.52*0.99,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2015,'UPS_IMP_GAS_LNG_AFR',544.43*0.99,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_GAS_LNG_AFR',1010.68*0.99,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_GAS_LNG_AFR',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_GAS_LNG_OLA',209.55*0.99,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2015,'UPS_IMP_GAS_LNG_OLA',99.88*0.99,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_GAS_LNG_OLA',181.99*0.99,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_GAS_LNG_OLA',0.0,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_GAS_LNG_MEA',1394.83*0.99,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2015,'UPS_IMP_GAS_LNG_MEA',920.75*0.99,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_GAS_LNG_MEA',988.55*0.99,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_GAS_LNG_MEA',0.0*0.99,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_GAS_LNG_GLB',294.06*0.99,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2015,'UPS_IMP_GAS_LNG_GLB',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_GAS_LNG_USA',835.91*0.99,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_GAS_LNG_USA',0.00,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_GAS_LNG_RUS',568.11*0.99,'PJ','');
INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_GAS_LNG_RUS',0.00,'PJ','');
--Electricity sector
---- Base year technologies
INSERT INTO "MinActivity" VALUES ('EU',2010,'ELC_OIL_E',38.594*31.536*0.5*0.30,'','');
INSERT INTO "MinActivity" VALUES ('EU',2040,'ELC_OIL_E',38.594*31.536*0.000*0.30,'','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'ELC_NGA_E',185.139*31.536*0.5*0.35,'','');
INSERT INTO "MinActivity" VALUES ('EU',2035,'ELC_NGA_E',185.139*31.536*0.000*0.35,'','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'ELC_COA_E',230.98*31.536*0.5*0.40,'','');
INSERT INTO "MinActivity" VALUES ('EU',2035,'ELC_COA_E',230.98*31.536*0.000*0.40,'','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'ELC_BIO_E',13.940*31.536*0.5*0.50,'','');
INSERT INTO "MinActivity" VALUES ('EU',2035,'ELC_BIO_E',13.940*31.536*0.000*0.50,'','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'ELC_HYD_GEN_E',134.758*31.536*0.5*0.50,'','');
INSERT INTO "MinActivity" VALUES ('EU',2045,'ELC_HYD_GEN_E',134.758*31.536*0.00*0.50,'','');
--INSERT INTO "MinActivity" VALUES ('EU',2010,'ELC_HYD_PUM_E',53.209*31.536*0.50*0.25,'','');
--INSERT INTO "MinActivity" VALUES ('EU',2055,'ELC_HYD_PUM_E',53.209*31.536*0.00*0.25,'','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'ELC_NUC_FIS_E',3588.595*0.8,'','');
INSERT INTO "MinActivity" VALUES ('EU',2015,'ELC_NUC_FIS_E',3071.109*0.8,'','');
INSERT INTO "MinActivity" VALUES ('EU',2020,'ELC_NUC_FIS_E',2626.999*0.8,'','');
INSERT INTO "MinActivity" VALUES ('EU',2050,'ELC_NUC_FIS_E',0,'','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'ELC_GEO_E',0.900*31.536*0.9*0.85,'','');
INSERT INTO "MinActivity" VALUES ('EU',2045,'ELC_GEO_E',0.900*31.536*0.0*0.85,'','');
--INSERT INTO "MinActivity" VALUES ('EU',2010,'ELC_WIN_E',0.5*71.613*3.6,'','');
--INSERT INTO "MinActivity" VALUES ('EU',2030,'ELC_WIN_E',0.5*71.613*3.6,'','');
--INSERT INTO "MinActivity" VALUES ('EU',2010,'ELC_SOL_E',0.5*1.487*3.6,'','');
--INSERT INTO "MinActivity" VALUES ('EU',2030,'ELC_SOL_E',0.5*1.487*3.6,'','');

INSERT INTO "MinActivity" VALUES ('EU',2010,'ELC_CHP_OIL_E',0.5*262.45*0.82,'','');
INSERT INTO "MinActivity" VALUES ('EU',2035,'ELC_CHP_OIL_E',0.0*262.45*0.82,'','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'ELC_CHP_NGA_E',0.5*2174.25*0.74,'','');
INSERT INTO "MinActivity" VALUES ('EU',2035,'ELC_CHP_NGA_E',0.0*2174.25*0.74,'','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'ELC_CHP_COA_E',0.5*854.46*0.92,'','');
INSERT INTO "MinActivity" VALUES ('EU',2035,'ELC_CHP_COA_E',0.0*854.46*0.92,'','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'ELC_CHP_BIO_E',0.5*(226.767+45.917)*0.74,'','');
INSERT INTO "MinActivity" VALUES ('EU',2035,'ELC_CHP_BIO_E',0.0*(226.767+45.917)*0.74,'','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'ELC_CHP_GEO_E',0.5*23.81*0.85,'','');
INSERT INTO "MinActivity" VALUES ('EU',2035,'ELC_CHP_GEO_E',0.0*23.81*0.85,'','');

--INSERT INTO "MinActivity" VALUES ('EU',2010,'HET_OIL_E',0.5*262.45*0.31,'','');
--INSERT INTO "MinActivity" VALUES ('EU',2040,'HET_OIL_E',0.0*262.45*0.31,'','');
--INSERT INTO "MinActivity" VALUES ('EU',2010,'HET_NGA_E',0.5*2174.25*0.21,'','');
--INSERT INTO "MinActivity" VALUES ('EU',2040,'HET_NGA_E',0.0*2174.25*0.21,'','');
--INSERT INTO "MinActivity" VALUES ('EU',2010,'HET_COA_E',0.5*854.46*0.16,'','');
--INSERT INTO "MinActivity" VALUES ('EU',2040,'HET_COA_E',0.0*854.46*0.16,'','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'HET_BIO_E',0.5*(226.767+45.917)*0.38,'','');
INSERT INTO "MinActivity" VALUES ('EU',2040,'HET_BIO_E',0.0*(226.767+45.917)*0.38,'','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'HET_GEO_E',0.5*23.81*0.21,'','');
INSERT INTO "MinActivity" VALUES ('EU',2040,'HET_GEO_E',0.0*23.81*0.21,'','');
INSERT INTO "MinActivity" VALUES ('EU',2010,'HET_SOL_E',0.5*0.055,'','');
INSERT INTO "MinActivity" VALUES ('EU',2040,'HET_SOL_E',0.0*0.055,'','');

--INSERT INTO "MinActivity" VALUES ('EU',2010,'UPS_IMP_BIO_WOD',283.0,'PJ','10.5281/zenodo.3544900');
--INSERT INTO "MinActivity" VALUES ('EU',2020,'UPS_IMP_BIO_WOD',283.0,'PJ','10.5281/zenodo.3544900');
--INSERT INTO "MinActivity" VALUES ('EU',2025,'UPS_IMP_BIO_WOD',0,'PJ','10.5281/zenodo.3544900');

CREATE TABLE "GrowthRateSeed" (
	"regions"	text,
	"tech"	text,
	"growthrate_seed"	real,
	"growthrate_seed_units"	text,
	"growthrate_seed_notes"	text,
	PRIMARY KEY("regions","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);

CREATE TABLE "GrowthRateMax" (
	"regions"	text,
	"tech"	text,
	"growthrate_max"	real,
	"growthrate_max_notes"	text,
	PRIMARY KEY("regions","tech"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);

CREATE TABLE "MaxMaterialReserve" (
	"regions"	text,
	"tech"	text,
	"maxres"	real,
	"maxres_units"	text,
	"maxres_notes"	text,
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	PRIMARY KEY("regions","tech")
);

CREATE TABLE "MaterialIntensity" (
	"regions"	text,
	"comm_name" text,
	"tech"	text,
	"vintage"	integer,
	"mat_int"	real,
	"mat_int_units"	text,
	"mat_int_notes"	text,
	PRIMARY KEY("regions","tech","comm_name","vintage"),
	FOREIGN KEY("comm_name") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods")
);
-- Electricity sector
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_CHP_NGA_E',2010,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_CHP_NGA_E',2010,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_CHP_NGA_E',2010,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_CHP_NGA_N',2010,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_CHP_NGA_N',2010,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_CHP_NGA_N',2010,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_CHP_OIL_E',2010,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_CHP_OIL_E',2010,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_CHP_OIL_E',2010,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_NGA_CCY_ADV_N',2010,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_NGA_CCY_ADV_N',2010,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_NGA_CCY_ADV_N',2010,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_NGA_E',2010,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_NGA_E',2010,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_NGA_E',2010,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_NGA_FCE_N',2010,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_NGA_FCE_N',2010,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_NGA_FCE_N',2010,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_NGA_FG_CCS_N',2010,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_NGA_FG_CCS_N',2010,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_NGA_FG_CCS_N',2010,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_NGA_SOFC_CCS_N',2010,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_NGA_SOFC_CCS_N',2010,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_NGA_SOFC_CCS_N',2010,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_OIL_E',2010,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_OIL_E',2010,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_OIL_E',2010,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_OIL_GBL_N',2010,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_OIL_GBL_N',2010,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_OIL_GBL_N',2010,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_OIL_GPL_N',2010,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_OIL_GPL_N',2010,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_OIL_GPL_N',2010,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_OIL_MIX_CCY_N',2010,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_OIL_MIX_CCY_N',2010,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_OIL_MIX_CCY_N',2010,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_OIL_MIX_TUR_N',2010,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_OIL_MIX_TUR_N',2010,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_OIL_MIX_TUR_N',2010,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_CHP_COA_E',2010,3.08E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COB','ELC_CHP_COA_E',2010,2.02E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_CHP_COA_E',2010,1.15E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','MOL','ELC_CHP_COA_E',2010,6.63E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_CHP_COA_E',2010,7.21E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_CHP_COA_N',2010,3.08E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COB','ELC_CHP_COA_N',2010,2.02E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_CHP_COA_N',2010,1.15E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','MOL','ELC_CHP_COA_N',2010,6.63E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_CHP_COA_N',2010,7.21E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_COA_CCO_FG_CCS_N',2030,3.08E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COB','ELC_COA_CCO_FG_CCS_N',2030,2.02E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_COA_CCO_FG_CCS_N',2030,1.15E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','MOL','ELC_COA_CCO_FG_CCS_N',2030,6.63E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_COA_CCO_FG_CCS_N',2030,7.21E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_COA_CCO_IG_CCS_N',2030,3.08E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COB','ELC_COA_CCO_IG_CCS_N',2030,2.02E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_COA_CCO_IG_CCS_N',2030,1.15E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','MOL','ELC_COA_CCO_IG_CCS_N',2030,6.63E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_COA_CCO_IG_CCS_N',2030,7.21E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_COA_CCO_N',2010,3.08E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COB','ELC_COA_CCO_N',2010,2.02E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_COA_CCO_N',2010,1.15E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','MOL','ELC_COA_CCO_N',2010,6.63E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_COA_CCO_N',2010,7.21E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_COA_E',2010,3.08E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COB','ELC_COA_E',2010,2.02E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_COA_E',2010,1.15E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','MOL','ELC_COA_E',2010,6.63E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_COA_E',2010,7.21E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_COA_PFB_N',2010,3.08E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COB','ELC_COA_PFB_N',2010,2.02E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_COA_PFB_N',2010,1.15E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','MOL','ELC_COA_PFB_N',2010,6.63E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_COA_PFB_N',2010,7.21E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_COA_PUL_FG_CCS_N',2030,3.08E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COB','ELC_COA_PUL_FG_CCS_N',2030,2.02E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_COA_PUL_FG_CCS_N',2030,1.15E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','MOL','ELC_COA_PUL_FG_CCS_N',2030,6.63E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_COA_PUL_FG_CCS_N',2030,7.21E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_COA_PUL_N',2010,3.08E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COB','ELC_COA_PUL_N',2010,2.02E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_COA_PUL_N',2010,1.15E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','MOL','ELC_COA_PUL_N',2010,6.63E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_COA_PUL_N',2010,7.21E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_BIO_COM_CCS_N',2030,2.27E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','TIT','ELC_BIO_COM_CCS_N',2030,4.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_BIO_COM_CEN_N',2010,2.27E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','TIT','ELC_BIO_COM_CEN_N',2010,4.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_BIO_COM_DEC_N',2010,2.27E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','TIT','ELC_BIO_COM_DEC_N',2010,4.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_BIO_CRP_COM_CCS_N',2030,2.27E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','TIT','ELC_BIO_CRP_COM_CCS_N',2030,4.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_BIO_CRP_COM_N',2010,2.27E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','TIT','ELC_BIO_CRP_COM_N',2010,4.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_BIO_CRP_GSF_CCS_N',2030,2.27E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','TIT','ELC_BIO_CRP_GSF_CCS_N',2030,4.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_BIO_CRP_GSF_N',2010,2.27E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','TIT','ELC_BIO_CRP_GSF_N',2010,4.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_BIO_E',2010,2.27E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','TIT','ELC_BIO_E',2010,4.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_BIO_GAS_N',2010,2.27E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','TIT','ELC_BIO_GAS_N',2010,4.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_BIO_GSF_CCS_N',2030,2.27E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','TIT','ELC_BIO_GSF_CCS_N',2030,4.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_BIO_GSF_CEN_N',2010,2.27E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','TIT','ELC_BIO_GSF_CEN_N',2010,4.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_BIO_GSF_DEC_N',2010,2.27E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','TIT','ELC_BIO_GSF_DEC_N',2010,4.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_BIO_MUN_INC_N',2010,2.27E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','TIT','ELC_BIO_MUN_INC_N',2010,4.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_CHP_BIO_E',2010,2.27E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','TIT','ELC_CHP_BIO_E',2010,4.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_CHP_BIO_N',2010,2.27E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','TIT','ELC_CHP_BIO_N',2010,4.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_HYD_GEN_DAM_N',2010,1.05E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','MAN','ELC_HYD_GEN_DAM_N',2010,2.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_HYD_GEN_DAM_N',2010,3.00E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_HYD_GEN_E',2010,1.05E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','MAN','ELC_HYD_GEN_E',2010,2.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_HYD_GEN_E',2010,3.00E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_HYD_GEN_RUN_N',2010,1.05E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','MAN','ELC_HYD_GEN_RUN_N',2010,2.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_HYD_GEN_RUN_N',2010,3.00E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_HYD_PUM_E',2010,1.05E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','MAN','ELC_HYD_PUM_E',2010,2.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_HYD_PUM_E',2010,3.00E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_HYD_PUM_N',2010,1.05E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','MAN','ELC_HYD_PUM_N',2010,2.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_HYD_PUM_N',2010,3.00E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','ALU','ELC_MAR_E',2010,6.65E+02,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','BOR','ELC_MAR_E',2010,5.25E+00,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_MAR_E',2010,5.33E+02,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_MAR_E',2010,2.69E+03,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','DYS','ELC_MAR_E',2010,1.54E+01,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','MAN','ELC_MAR_E',2010,7.92E+02,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','MOL','ELC_MAR_E',2010,1.11E+02,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','NEO','ELC_MAR_E',2010,1.61E+02,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_MAR_E',2010,2.70E+02,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','PRA','ELC_MAR_E',2010,3.04E+01,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','TER','ELC_MAR_E',2010,6.10E+00,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','ALU','ELC_MAR_TDL_N',2010,6.65E+02,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','BOR','ELC_MAR_TDL_N',2010,5.25E+00,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_MAR_TDL_N',2010,5.33E+02,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_MAR_TDL_N',2010,2.69E+03,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','DYS','ELC_MAR_TDL_N',2010,1.54E+01,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','MAN','ELC_MAR_TDL_N',2010,7.92E+02,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','MOL','ELC_MAR_TDL_N',2010,1.11E+02,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','NEO','ELC_MAR_TDL_N',2010,1.61E+02,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_MAR_TDL_N',2010,2.70E+02,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','PRA','ELC_MAR_TDL_N',2010,3.04E+01,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','TER','ELC_MAR_TDL_N',2010,6.10E+00,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','ALU','ELC_MAR_WAV_N',2010,6.65E+02,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','BOR','ELC_MAR_WAV_N',2010,5.25E+00,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_MAR_WAV_N',2010,5.33E+02,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_MAR_WAV_N',2010,2.69E+03,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','DYS','ELC_MAR_WAV_N',2010,1.54E+01,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','MAN','ELC_MAR_WAV_N',2010,7.92E+02,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','MOL','ELC_MAR_WAV_N',2010,1.11E+02,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','NEO','ELC_MAR_WAV_N',2010,1.61E+02,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_MAR_WAV_N',2010,2.70E+02,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','PRA','ELC_MAR_WAV_N',2010,3.04E+01,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','TER','ELC_MAR_WAV_N',2010,6.10E+00,'t/GW','Assumption (Equal to Offshore Wind)');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_GEO_E',2010,6.20E+04,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_GEO_E',2010,1.20E+05,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_GEO_FLS_N',2010,6.20E+04,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_GEO_FLS_N',2010,1.20E+05,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_GEO_BNY_N',2010,6.20E+04,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_GEO_BNY_N',2010,1.20E+05,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_GEO_BNY_HIG_N',2010,6.20E+04,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_GEO_BNY_HIG_N',2010,1.20E+05,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_CHP_GEO_E',2010,6.20E+04,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_CHP_GEO_E',2010,1.20E+05,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','ALU','ELC_NUC_FIS_E',2010,7.64E+02,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','BOR','ELC_NUC_FIS_E',2010,5.35E-01,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','CER','ELC_NUC_FIS_E',2010,4.05E+00,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_NUC_FIS_E',2010,4.59E+03,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','COB','ELC_NUC_FIS_E',2010,9.00E+00,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_NUC_FIS_E',2010,1.50E+03,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','DYS','ELC_NUC_FIS_E',2010,2.12E-04,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','EUP','ELC_NUC_FIS_E',2010,1.63E-02,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','FLU','ELC_NUC_FIS_E',2010,4.55E+01,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','GAD','ELC_NUC_FIS_E',2010,5.69E-02,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','GAL','ELC_NUC_FIS_E',2010,2.12E-01,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','GRA','ELC_NUC_FIS_E',2010,9.58E-01,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','IND','ELC_NUC_FIS_E',2010,1.90E-03,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','LAN','ELC_NUC_FIS_E',2010,1.87E+00,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','LIT','ELC_NUC_FIS_E',2010,9.87E-05,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','MAG','ELC_NUC_FIS_E',2010,1.35E+02,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','MAN','ELC_NUC_FIS_E',2010,6.18E+02,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','MOL','ELC_NUC_FIS_E',2010,3.12E+01,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','NEO','ELC_NUC_FIS_E',2010,1.50E+00,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_NUC_FIS_E',2010,3.42E+03,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIO','ELC_NUC_FIS_E',2010,5.07E-01,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','PAL','ELC_NUC_FIS_E',2010,1.92E-03,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','PHO','ELC_NUC_FIS_E',2010,2.13E+01,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','PLA','ELC_NUC_FIS_E',2010,9.83E-04,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','PRA','ELC_NUC_FIS_E',2010,5.02E-01,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','SIL','ELC_NUC_FIS_E',2010,4.88E+02,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','SIV','ELC_NUC_FIS_E',2010,3.47E-01,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','TAN','ELC_NUC_FIS_E',2010,3.89E-03,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','TER','ELC_NUC_FIS_E',2010,6.42E-05,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','TIT','ELC_NUC_FIS_E',2010,6.01E+01,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','VAN','ELC_NUC_FIS_E',2010,2.16E-03,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','YTT','ELC_NUC_FIS_E',2010,1.19E-03,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','ZIR','ELC_NUC_FIS_E',2010,6.13E+00,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','ALU','ELC_NUC_FIS_LWR_N',2010,7.64E+02,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','BOR','ELC_NUC_FIS_LWR_N',2010,5.35E-01,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','CER','ELC_NUC_FIS_LWR_N',2010,4.05E+00,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_NUC_FIS_LWR_N',2010,4.59E+03,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','COB','ELC_NUC_FIS_LWR_N',2010,9.00E+00,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_NUC_FIS_LWR_N',2010,1.50E+03,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','DYS','ELC_NUC_FIS_LWR_N',2010,2.12E-04,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','EUP','ELC_NUC_FIS_LWR_N',2010,1.63E-02,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','FLU','ELC_NUC_FIS_LWR_N',2010,4.55E+01,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','GAD','ELC_NUC_FIS_LWR_N',2010,5.69E-02,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','GAL','ELC_NUC_FIS_LWR_N',2010,2.12E-01,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','GRA','ELC_NUC_FIS_LWR_N',2010,9.58E-01,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','IND','ELC_NUC_FIS_LWR_N',2010,1.90E-03,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','LAN','ELC_NUC_FIS_LWR_N',2010,1.87E+00,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','LIT','ELC_NUC_FIS_LWR_N',2010,9.87E-05,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','MAG','ELC_NUC_FIS_LWR_N',2010,1.35E+02,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','MAN','ELC_NUC_FIS_LWR_N',2010,6.18E+02,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','MOL','ELC_NUC_FIS_LWR_N',2010,3.12E+01,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','NEO','ELC_NUC_FIS_LWR_N',2010,1.50E+00,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_NUC_FIS_LWR_N',2010,3.42E+03,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIO','ELC_NUC_FIS_LWR_N',2010,5.07E-01,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','PAL','ELC_NUC_FIS_LWR_N',2010,1.92E-03,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','PHO','ELC_NUC_FIS_LWR_N',2010,2.13E+01,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','PLA','ELC_NUC_FIS_LWR_N',2010,9.83E-04,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','PRA','ELC_NUC_FIS_LWR_N',2010,5.02E-01,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','SIL','ELC_NUC_FIS_LWR_N',2010,4.88E+02,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','SIV','ELC_NUC_FIS_LWR_N',2010,3.47E-01,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','TAN','ELC_NUC_FIS_LWR_N',2010,3.89E-03,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','TER','ELC_NUC_FIS_LWR_N',2010,6.42E-05,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','TIT','ELC_NUC_FIS_LWR_N',2010,6.01E+01,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','VAN','ELC_NUC_FIS_LWR_N',2010,2.16E-03,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','YTT','ELC_NUC_FIS_LWR_N',2010,1.19E-03,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','ZIR','ELC_NUC_FIS_LWR_N',2010,6.13E+00,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','ALU','ELC_NUC_FIS_EPR_N',2020,7.64E+02,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','BOR','ELC_NUC_FIS_EPR_N',2020,5.35E-01,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','CER','ELC_NUC_FIS_EPR_N',2020,4.05E+00,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_NUC_FIS_EPR_N',2020,4.59E+03,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','COB','ELC_NUC_FIS_EPR_N',2020,9.00E+00,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_NUC_FIS_EPR_N',2020,1.50E+03,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','DYS','ELC_NUC_FIS_EPR_N',2020,2.12E-04,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','EUP','ELC_NUC_FIS_EPR_N',2020,1.63E-02,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','FLU','ELC_NUC_FIS_EPR_N',2020,4.55E+01,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','GAD','ELC_NUC_FIS_EPR_N',2020,5.69E-02,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','GAL','ELC_NUC_FIS_EPR_N',2020,2.12E-01,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','GRA','ELC_NUC_FIS_EPR_N',2020,9.58E-01,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','IND','ELC_NUC_FIS_EPR_N',2020,1.90E-03,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','LAN','ELC_NUC_FIS_EPR_N',2020,1.87E+00,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','LIT','ELC_NUC_FIS_EPR_N',2020,9.87E-05,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','MAG','ELC_NUC_FIS_EPR_N',2020,1.35E+02,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','MAN','ELC_NUC_FIS_EPR_N',2020,6.18E+02,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','MOL','ELC_NUC_FIS_EPR_N',2020,3.12E+01,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','NEO','ELC_NUC_FIS_EPR_N',2020,1.50E+00,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_NUC_FIS_EPR_N',2020,3.42E+03,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIO','ELC_NUC_FIS_EPR_N',2020,5.07E-01,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','PAL','ELC_NUC_FIS_EPR_N',2020,1.92E-03,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','PHO','ELC_NUC_FIS_EPR_N',2020,2.13E+01,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','PLA','ELC_NUC_FIS_EPR_N',2020,9.83E-04,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','PRA','ELC_NUC_FIS_EPR_N',2020,5.02E-01,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','SIL','ELC_NUC_FIS_EPR_N',2020,4.88E+02,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','SIV','ELC_NUC_FIS_EPR_N',2020,3.47E-01,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','TAN','ELC_NUC_FIS_EPR_N',2020,3.89E-03,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','TER','ELC_NUC_FIS_EPR_N',2020,6.42E-05,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','TIT','ELC_NUC_FIS_EPR_N',2020,6.01E+01,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','VAN','ELC_NUC_FIS_EPR_N',2020,2.16E-03,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','YTT','ELC_NUC_FIS_EPR_N',2020,1.19E-03,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','ZIR','ELC_NUC_FIS_EPR_N',2020,6.13E+00,'t/GW','Ecoinvent - PWR');
INSERT INTO "MaterialIntensity" VALUES ('EU','ALU','ELC_NUC_FIS_FR_N',2030,7.64E+02,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','BOR','ELC_NUC_FIS_FR_N',2030,5.35E-01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','CER','ELC_NUC_FIS_FR_N',2030,4.05E+00,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_NUC_FIS_FR_N',2030,4.59E+03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','COB','ELC_NUC_FIS_FR_N',2030,9.00E+00,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_NUC_FIS_FR_N',2030,1.50E+03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','DYS','ELC_NUC_FIS_FR_N',2030,2.12E-04,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','EUP','ELC_NUC_FIS_FR_N',2030,1.63E-02,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','FLU','ELC_NUC_FIS_FR_N',2030,4.55E+01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','GAD','ELC_NUC_FIS_FR_N',2030,5.69E-02,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','GAL','ELC_NUC_FIS_FR_N',2030,2.12E-01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','GRA','ELC_NUC_FIS_FR_N',2030,9.58E-01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','IND','ELC_NUC_FIS_FR_N',2030,1.90E-03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','LAN','ELC_NUC_FIS_FR_N',2030,1.87E+00,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','LIT','ELC_NUC_FIS_FR_N',2030,9.87E-05,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','MAG','ELC_NUC_FIS_FR_N',2030,1.35E+02,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','MAN','ELC_NUC_FIS_FR_N',2030,6.18E+02,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','MOL','ELC_NUC_FIS_FR_N',2030,3.12E+01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','NEO','ELC_NUC_FIS_FR_N',2030,1.50E+00,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_NUC_FIS_FR_N',2030,3.42E+03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIO','ELC_NUC_FIS_FR_N',2030,5.07E-01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','PAL','ELC_NUC_FIS_FR_N',2030,1.92E-03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','PHO','ELC_NUC_FIS_FR_N',2030,2.13E+01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','PLA','ELC_NUC_FIS_FR_N',2030,9.83E-04,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','PRA','ELC_NUC_FIS_FR_N',2030,5.02E-01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','SIL','ELC_NUC_FIS_FR_N',2030,4.88E+02,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','SIV','ELC_NUC_FIS_FR_N',2030,3.47E-01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','TAN','ELC_NUC_FIS_FR_N',2030,3.89E-03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','TER','ELC_NUC_FIS_FR_N',2030,6.42E-05,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','TIT','ELC_NUC_FIS_FR_N',2030,6.01E+01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','VAN','ELC_NUC_FIS_FR_N',2030,2.16E-03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','YTT','ELC_NUC_FIS_FR_N',2030,1.19E-03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','ZIR','ELC_NUC_FIS_FR_N',2030,6.13E+00,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','ALU','ELC_NUC_FIS_ABWR_N',2040,7.64E+02,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','BOR','ELC_NUC_FIS_ABWR_N',2040,5.35E-01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','CER','ELC_NUC_FIS_ABWR_N',2040,4.05E+00,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_NUC_FIS_ABWR_N',2040,4.59E+03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','COB','ELC_NUC_FIS_ABWR_N',2040,9.00E+00,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_NUC_FIS_ABWR_N',2040,1.50E+03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','DYS','ELC_NUC_FIS_ABWR_N',2040,2.12E-04,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','EUP','ELC_NUC_FIS_ABWR_N',2040,1.63E-02,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','FLU','ELC_NUC_FIS_ABWR_N',2040,4.55E+01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','GAD','ELC_NUC_FIS_ABWR_N',2040,5.69E-02,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','GAL','ELC_NUC_FIS_ABWR_N',2040,2.12E-01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','GRA','ELC_NUC_FIS_ABWR_N',2040,9.58E-01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','IND','ELC_NUC_FIS_ABWR_N',2040,1.90E-03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','LAN','ELC_NUC_FIS_ABWR_N',2040,1.87E+00,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','LIT','ELC_NUC_FIS_ABWR_N',2040,9.87E-05,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','MAG','ELC_NUC_FIS_ABWR_N',2040,1.35E+02,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','MAN','ELC_NUC_FIS_ABWR_N',2040,6.18E+02,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','MOL','ELC_NUC_FIS_ABWR_N',2040,3.12E+01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','NEO','ELC_NUC_FIS_ABWR_N',2040,1.50E+00,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_NUC_FIS_ABWR_N',2040,3.42E+03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIO','ELC_NUC_FIS_ABWR_N',2040,5.07E-01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','PAL','ELC_NUC_FIS_ABWR_N',2040,1.92E-03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','PHO','ELC_NUC_FIS_ABWR_N',2040,2.13E+01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','PLA','ELC_NUC_FIS_ABWR_N',2040,9.83E-04,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','PRA','ELC_NUC_FIS_ABWR_N',2040,5.02E-01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','SIL','ELC_NUC_FIS_ABWR_N',2040,4.88E+02,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','SIV','ELC_NUC_FIS_ABWR_N',2040,3.47E-01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','TAN','ELC_NUC_FIS_ABWR_N',2040,3.89E-03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','TER','ELC_NUC_FIS_ABWR_N',2040,6.42E-05,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','TIT','ELC_NUC_FIS_ABWR_N',2040,6.01E+01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','VAN','ELC_NUC_FIS_ABWR_N',2040,2.16E-03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','YTT','ELC_NUC_FIS_ABWR_N',2040,1.19E-03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','ZIR','ELC_NUC_FIS_ABWR_N',2040,6.13E+00,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','ALU','ELC_NUC_FIS_ADS_TRU_N',2040,7.64E+02,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','BOR','ELC_NUC_FIS_ADS_TRU_N',2040,5.35E-01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','CER','ELC_NUC_FIS_ADS_TRU_N',2040,4.05E+00,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_NUC_FIS_ADS_TRU_N',2040,4.59E+03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','COB','ELC_NUC_FIS_ADS_TRU_N',2040,9.00E+00,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_NUC_FIS_ADS_TRU_N',2040,1.50E+03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','DYS','ELC_NUC_FIS_ADS_TRU_N',2040,2.12E-04,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','EUP','ELC_NUC_FIS_ADS_TRU_N',2040,1.63E-02,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','FLU','ELC_NUC_FIS_ADS_TRU_N',2040,4.55E+01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','GAD','ELC_NUC_FIS_ADS_TRU_N',2040,5.69E-02,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','GAL','ELC_NUC_FIS_ADS_TRU_N',2040,2.12E-01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','GRA','ELC_NUC_FIS_ADS_TRU_N',2040,9.58E-01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','IND','ELC_NUC_FIS_ADS_TRU_N',2040,1.90E-03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','LAN','ELC_NUC_FIS_ADS_TRU_N',2040,1.87E+00,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','LIT','ELC_NUC_FIS_ADS_TRU_N',2040,9.87E-05,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','MAG','ELC_NUC_FIS_ADS_TRU_N',2040,1.35E+02,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','MAN','ELC_NUC_FIS_ADS_TRU_N',2040,6.18E+02,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','MOL','ELC_NUC_FIS_ADS_TRU_N',2040,3.12E+01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','NEO','ELC_NUC_FIS_ADS_TRU_N',2040,1.50E+00,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_NUC_FIS_ADS_TRU_N',2040,3.42E+03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIO','ELC_NUC_FIS_ADS_TRU_N',2040,5.07E-01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','PAL','ELC_NUC_FIS_ADS_TRU_N',2040,1.92E-03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','PHO','ELC_NUC_FIS_ADS_TRU_N',2040,2.13E+01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','PLA','ELC_NUC_FIS_ADS_TRU_N',2040,9.83E-04,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','PRA','ELC_NUC_FIS_ADS_TRU_N',2040,5.02E-01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','SIL','ELC_NUC_FIS_ADS_TRU_N',2040,4.88E+02,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','SIV','ELC_NUC_FIS_ADS_TRU_N',2040,3.47E-01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','TAN','ELC_NUC_FIS_ADS_TRU_N',2040,3.89E-03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','TER','ELC_NUC_FIS_ADS_TRU_N',2040,6.42E-05,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','TIT','ELC_NUC_FIS_ADS_TRU_N',2040,6.01E+01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','VAN','ELC_NUC_FIS_ADS_TRU_N',2040,2.16E-03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','YTT','ELC_NUC_FIS_ADS_TRU_N',2040,1.19E-03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','ZIR','ELC_NUC_FIS_ADS_TRU_N',2040,6.13E+00,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','ALU','ELC_NUC_FIS_ADS_MA_N',2040,7.64E+02,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','BOR','ELC_NUC_FIS_ADS_MA_N',2040,5.35E-01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','CER','ELC_NUC_FIS_ADS_MA_N',2040,4.05E+00,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_NUC_FIS_ADS_MA_N',2040,4.59E+03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','COB','ELC_NUC_FIS_ADS_MA_N',2040,9.00E+00,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_NUC_FIS_ADS_MA_N',2040,1.50E+03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','DYS','ELC_NUC_FIS_ADS_MA_N',2040,2.12E-04,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','EUP','ELC_NUC_FIS_ADS_MA_N',2040,1.63E-02,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','FLU','ELC_NUC_FIS_ADS_MA_N',2040,4.55E+01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','GAD','ELC_NUC_FIS_ADS_MA_N',2040,5.69E-02,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','GAL','ELC_NUC_FIS_ADS_MA_N',2040,2.12E-01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','GRA','ELC_NUC_FIS_ADS_MA_N',2040,9.58E-01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','IND','ELC_NUC_FIS_ADS_MA_N',2040,1.90E-03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','LAN','ELC_NUC_FIS_ADS_MA_N',2040,1.87E+00,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','LIT','ELC_NUC_FIS_ADS_MA_N',2040,9.87E-05,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','MAG','ELC_NUC_FIS_ADS_MA_N',2040,1.35E+02,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','MAN','ELC_NUC_FIS_ADS_MA_N',2040,6.18E+02,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','MOL','ELC_NUC_FIS_ADS_MA_N',2040,3.12E+01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','NEO','ELC_NUC_FIS_ADS_MA_N',2040,1.50E+00,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_NUC_FIS_ADS_MA_N',2040,3.42E+03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIO','ELC_NUC_FIS_ADS_MA_N',2040,5.07E-01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','PAL','ELC_NUC_FIS_ADS_MA_N',2040,1.92E-03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','PHO','ELC_NUC_FIS_ADS_MA_N',2040,2.13E+01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','PLA','ELC_NUC_FIS_ADS_MA_N',2040,9.83E-04,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','PRA','ELC_NUC_FIS_ADS_MA_N',2040,5.02E-01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','SIL','ELC_NUC_FIS_ADS_MA_N',2040,4.88E+02,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','SIV','ELC_NUC_FIS_ADS_MA_N',2040,3.47E-01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','TAN','ELC_NUC_FIS_ADS_MA_N',2040,3.89E-03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','TER','ELC_NUC_FIS_ADS_MA_N',2040,6.42E-05,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','TIT','ELC_NUC_FIS_ADS_MA_N',2040,6.01E+01,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','VAN','ELC_NUC_FIS_ADS_MA_N',2040,2.16E-03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','YTT','ELC_NUC_FIS_ADS_MA_N',2040,1.19E-03,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','ZIR','ELC_NUC_FIS_ADS_MA_N',2040,6.13E+00,'t/GW','Assumption (Equal to PWR)');
INSERT INTO "MaterialIntensity" VALUES ('EU','ALU','ELC_WIN_E',2010,1.25E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','BOR','ELC_WIN_E',2010,9.40E-01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_WIN_E',2010,4.92E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_WIN_E',2010,1.80E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','DYS','ELC_WIN_E',2010,4.74E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','MAN','ELC_WIN_E',2010,7.84E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','MOL','ELC_WIN_E',2010,1.03E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NEO','ELC_WIN_E',2010,4.04E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_WIN_E',2010,3.99E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','PRA','ELC_WIN_E',2010,5.84E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','TER','ELC_WIN_E',2010,1.14E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','ALU','ELC_WIN_N',2010,1.25E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','BOR','ELC_WIN_N',2010,9.40E-01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_WIN_N',2010,4.92E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_WIN_N',2010,1.80E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','DYS','ELC_WIN_N',2010,4.74E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','MAN','ELC_WIN_N',2010,7.84E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','MOL','ELC_WIN_N',2010,1.03E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NEO','ELC_WIN_N',2010,4.04E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_WIN_N',2010,3.99E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','PRA','ELC_WIN_N',2010,5.84E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','TER','ELC_WIN_N',2010,1.14E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','ALU','ELC_WIN_OFF_N',2010,6.65E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','BOR','ELC_WIN_OFF_N',2010,5.25E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','ELC_WIN_OFF_N',2010,5.33E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_WIN_OFF_N',2010,2.69E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','DYS','ELC_WIN_OFF_N',2010,1.54E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','MAN','ELC_WIN_OFF_N',2010,7.92E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','MOL','ELC_WIN_OFF_N',2010,1.11E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NEO','ELC_WIN_OFF_N',2010,1.61E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_WIN_OFF_N',2010,2.70E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','PRA','ELC_WIN_OFF_N',2010,3.04E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','TER','ELC_WIN_OFF_N',2010,6.10E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','ALU','ELC_SOL_E',2010,7.50E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_SOL_E',2010,4.60E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','GAL','ELC_SOL_E',2010,4.00E-02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','IND','ELC_SOL_E',2010,1.50E-01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','SIL','ELC_SOL_E',2010,3.80E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','SIV','ELC_SOL_E',2010,1.90E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','ALU','ELC_SOL_PV_CEN_N',2010,7.50E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_SOL_PV_CEN_N',2010,4.60E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','GAL','ELC_SOL_PV_CEN_N',2010,4.00E-02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','IND','ELC_SOL_PV_CEN_N',2010,1.50E-01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','SIL','ELC_SOL_PV_CEN_N',2010,3.80E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','SIV','ELC_SOL_PV_CEN_N',2010,1.90E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','ALU','ELC_SOL_PV_DST_N',2010,7.50E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_SOL_PV_DST_N',2010,4.60E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','GAL','ELC_SOL_PV_DST_N',2010,4.00E-02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','IND','ELC_SOL_PV_DST_N',2010,1.50E-01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','SIL','ELC_SOL_PV_DST_N',2010,3.80E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','SIV','ELC_SOL_PV_DST_N',2010,1.90E+00,'t/GW','10.1016/j.mtener.2025.101805');
-- Storage
INSERT INTO "MaterialIntensity" VALUES ('EU','ALU','ELC_STG_CEN_BTT_N',2020,1.35E+04,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COB','ELC_STG_CEN_BTT_N',2020,6.22E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_STG_CEN_BTT_N',2020,5.05E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','FLU','ELC_STG_CEN_BTT_N',2020,2.31E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','GRA','ELC_STG_CEN_BTT_N',2020,7.31E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','LIT','ELC_STG_CEN_BTT_N',2020,8.68E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','MAN','ELC_STG_CEN_BTT_N',2020,7.03E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_STG_CEN_BTT_N',2020,2.00E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','PHO','ELC_STG_CEN_BTT_N',2020,4.14E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','ALU','ELC_STG_DST_BTT_N',2020,1.35E+04,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COB','ELC_STG_DST_BTT_N',2020,6.22E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','ELC_STG_DST_BTT_N',2020,5.05E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','FLU','ELC_STG_DST_BTT_N',2020,2.31E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','GRA','ELC_STG_DST_BTT_N',2020,7.31E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','LIT','ELC_STG_DST_BTT_N',2020,8.68E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','MAN','ELC_STG_DST_BTT_N',2020,7.03E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','ELC_STG_DST_BTT_N',2020,2.00E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','PHO','ELC_STG_DST_BTT_N',2020,4.14E+03,'t/GW','10.1016/j.mtener.2025.101805');
--INSERT INTO "MaterialIntensity" VALUES ('EU','COP','STG_ELC_CEN_VRFB',2020,2.23E+03,'t/GW','10.1016/j.mtener.2025.101805');
--INSERT INTO "MaterialIntensity" VALUES ('EU','GRA','STG_ELC_CEN_VRFB',2020,1.98E+03,'t/GW','10.1016/j.mtener.2025.101805');
--INSERT INTO "MaterialIntensity" VALUES ('EU','VAN','STG_ELC_CEN_VRFB',2020,2.03E+04,'t/GW','10.1016/j.mtener.2025.101805');
--INSERT INTO "MaterialIntensity" VALUES ('EU','COP','STG_ELC_DST_VRFB',2020,2.23E+03,'t/GW','10.1016/j.mtener.2025.101805');
--INSERT INTO "MaterialIntensity" VALUES ('EU','GRA','STG_ELC_DST_VRFB',2020,1.98E+03,'t/GW','10.1016/j.mtener.2025.101805');
--INSERT INTO "MaterialIntensity" VALUES ('EU','VAN','STG_ELC_DST_VRFB',2020,2.03E+04,'t/GW','10.1016/j.mtener.2025.101805');
-- Hydrogen
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','H2_EL_ALK',2020,3.94,'t/PJ','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','ZIR','H2_EL_ALK',2020,0.49,'t/PJ','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','IRI','H2_EL_PEM',2020,0.000353,'t/PJ','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','PAL','H2_EL_PEM',2020,0.00097,'t/PJ','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','PLA','H2_EL_PEM',2020,0.00097,'t/PJ','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','H2_EL_SOEC',2020,0.6,'t/PJ','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','LAN','H2_EL_SOEC',2020,0.16,'t/PJ','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','YTT','H2_EL_SOEC',2020,0.09,'t/PJ','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','ZIR','H2_EL_SOEC',2020,0.01,'t/PJ','10.1016/j.mtener.2025.101805');
-- CCUS
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','CCUS_ELC_COA',2020,3.26E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COB','CCUS_ELC_COA',2020,7.50E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','CCUS_ELC_COA',2020,6.92E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','MAN','CCUS_ELC_COA',2020,3.76E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','MOL','CCUS_ELC_COA',2020,7.50E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','CCUS_ELC_COA',2020,1.15E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIO','CCUS_ELC_COA',2020,1.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','VAN','CCUS_ELC_COA',2020,1.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','CHR','CCUS_ELC_NGA',2020,3.26E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COB','CCUS_ELC_NGA',2020,7.50E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','COP','CCUS_ELC_NGA',2020,6.92E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','MAN','CCUS_ELC_NGA',2020,3.76E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','MOL','CCUS_ELC_NGA',2020,7.50E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIC','CCUS_ELC_NGA',2020,1.15E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','NIO','CCUS_ELC_NGA',2020,1.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('EU','VAN','CCUS_ELC_NGA',2020,1.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
-- Industrial
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','IND_CHP_NGA_CI_N',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','IND_CHP_NGA_CI_N',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','IND_CHP_NGA_CI_N',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','IND_CHP_NGA_TG_N',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','IND_CHP_NGA_TG_N',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','IND_CHP_NGA_TG_N',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','IND_CHP_NGA_TV_N',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','IND_CHP_NGA_TV_N',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','IND_CHP_NGA_TV_N',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','IND_CHP_BLQ_CI_N',2007,2.27E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','TIT','IND_CHP_BLQ_CI_N',2007,4.00E+02,'t/GW','10.1016/j.mtener.2025.101805');
-- Residential
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','RES_CHP_NGA_CI_N',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','RES_CHP_NGA_CI_N',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','RES_CHP_NGA_CI_N',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','RES_CHP_NGA_MICRO_N',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','RES_CHP_NGA_MICRO_N',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','RES_CHP_NGA_MICRO_N',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','RES_CHP_NGA_CC_N',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','RES_CHP_NGA_CC_N',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','RES_CHP_NGA_CC_N',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','CHR','RES_CHP_NGA_STR_N',2007,4.83E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','COP','RES_CHP_NGA_STR_N',2007,1.10E+03,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','RES_CHP_NGA_STR_N',2007,1.58E+01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','NIC','RES_CHP_NGA_SOFC_N',2020,6.80E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','LAN','RES_CHP_NGA_SOFC_N',2020,1.00E+00,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','YTT','RES_CHP_NGA_SOFC_N',2020,1.28E-01,'t/GW','10.1016/j.mtener.2025.101805');
INSERT INTO "MaterialIntensity" VALUES ('IT','ZIR','RES_CHP_NGA_SOFC_N',2020,1.79E+00,'t/GW','10.1016/j.mtener.2025.101805');

CREATE TABLE "Output_V_Capacity" (
	"regions"	text,
	"scenario"	text,
	"sector"	text,
	"tech"	text,
	"vintage"	integer,
	"capacity"	real,
	FOREIGN KEY("sector") REFERENCES "sector_labels"("sector"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	PRIMARY KEY("regions","scenario","tech","vintage")
);
CREATE TABLE "Output_VFlow_Out" (
	"regions"	text,
	"scenario"	text,
	"sector"	text,
	"t_periods"	integer,
	"t_season"	text,
	"t_day"	text,
	"input_comm"	text,
	"tech"	text,
	"vintage"	integer,
	"output_comm"	text,
	"vflow_out"	real,
	PRIMARY KEY("regions","scenario","t_periods","t_season","t_day","input_comm","tech","vintage","output_comm"),
	FOREIGN KEY("output_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("t_season") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("sector") REFERENCES "sector_labels"("sector"),
	FOREIGN KEY("t_day") REFERENCES "time_of_day"("t_day"),
	FOREIGN KEY("input_comm") REFERENCES "commodities"("comm_name")
);
CREATE TABLE "Output_VFlow_In" (
	"regions"	text,
	"scenario"	text,
	"sector"	text,
	"t_periods"	integer,
	"t_season"	text,
	"t_day"	text,
	"input_comm"	text,
	"tech"	text,
	"vintage"	integer,
	"output_comm"	text,
	"vflow_in"	real,
	PRIMARY KEY("regions","scenario","t_periods","t_season","t_day","input_comm","tech","vintage","output_comm"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("output_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("sector") REFERENCES "sector_labels"("sector"),
	FOREIGN KEY("t_season") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("t_day") REFERENCES "time_of_day"("t_day"),
	FOREIGN KEY("input_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
CREATE TABLE "Output_Objective" (
	"scenario"	text,
	"objective_name"	text,
	"total_system_cost"	real
);
CREATE TABLE "Output_Emissions" (
	"regions"	text,
	"scenario"	text,
	"sector"	text,
	"t_periods"	integer,
	"emissions_comm"	text,
	"tech"	text,
	"vintage"	integer,
	"emissions"	real,
	PRIMARY KEY("regions","scenario","t_periods","emissions_comm","tech","vintage"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("emissions_comm") REFERENCES "EmissionActivity"("emis_comm"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("sector") REFERENCES "sector_labels"("sector"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods")
);
CREATE TABLE "Output_Curtailment" (
	"regions"	text,
	"scenario"	text,
	"sector"	text,
	"t_periods"	integer,
	"t_season"	text,
	"t_day"	text,
	"input_comm"	text,
	"tech"	text,
	"vintage"	integer,
	"output_comm"	text,
	"curtailment"	real,
	PRIMARY KEY("regions","scenario","t_periods","t_season","t_day","input_comm","tech","vintage","output_comm"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("input_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("output_comm") REFERENCES "commodities"("comm_name"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("t_season") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("t_day") REFERENCES "time_of_day"("t_day")
);
CREATE TABLE "Output_Costs" (
	"regions"	text,
	"scenario"	text,
	"sector"	text,
	"output_name"	text,
	"tech"	text,
	"vintage"	integer,
	"output_cost"	real,
	PRIMARY KEY("regions","scenario","output_name","tech","vintage"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("sector") REFERENCES "sector_labels"("sector"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
CREATE TABLE "Output_Duals" (
	"constraint_name"	text,
	"scenario"	text,
	"dual"	real,
	PRIMARY KEY("constraint_name","scenario")
);
CREATE TABLE "Output_CapacityByPeriodAndTech" (
	"regions"	text,
	"scenario"	text,
	"sector"	text,
	"t_periods"	integer,
	"tech"	text,
	"capacity"	real,
	PRIMARY KEY("regions","scenario","t_periods","tech"),
	FOREIGN KEY("sector") REFERENCES "sector_labels"("sector"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("tech") REFERENCES "technologies"("tech")
);
CREATE TABLE "Output_VMat_Cons" (
	"regions"	text,
	"scenario"	text,
	"sector"	text,
	"material_comm"	text,
	"tech"	text,
	"vintage"	integer,
	"vmat_cons"	real,
	PRIMARY KEY("regions","scenario","material_comm","tech","vintage"),
	FOREIGN KEY("vintage") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("sector") REFERENCES "sector_labels"("sector"),
	FOREIGN KEY("material_comm") REFERENCES "commodities"("comm_name")
);
CREATE TABLE "Output_MaterialSupplyRisk" (
    "regions"   text,
	"scenario"	text,
	"t_periods" integer,
	"materialSR"	real,
	PRIMARY KEY("regions","scenario","t_periods"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("regions") REFERENCES "regions"("regions")
);
CREATE TABLE "Output_EnergySupplyRisk" (
    "regions"   text,
	"scenario"	text,
	"t_periods" integer,
	"energySR"	real,
	PRIMARY KEY("regions","scenario","t_periods"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("regions") REFERENCES "regions"("regions")
);
CREATE TABLE "Output_TotalCosts" (
    "regions"   text,
	"scenario"	text,
	"t_periods" integer,
	"total_costs"	real,
	PRIMARY KEY("regions","scenario","t_periods"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("regions") REFERENCES "regions"("regions")
);
CREATE TABLE "Output_TotalEmissions" (
    "regions"   text,
	"scenario"	text,
	"t_periods" integer,
	"total_emissions"	real,
	PRIMARY KEY("regions","scenario","t_periods"),
	FOREIGN KEY("t_periods") REFERENCES "time_periods"("t_periods"),
	FOREIGN KEY("regions") REFERENCES "regions"("regions")
);
CREATE TABLE "Output_VSlack" (
	"scenario"	text,
	"moo_f"		text,
	"slack"		real,
	PRIMARY KEY("scenario","moo_f")
);
COMMIT;