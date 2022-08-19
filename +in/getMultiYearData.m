function [D,modelD] = getMultiYearData()

%% Raw Data
L = load(fullfile('+in','MultiYearRatingData.mat'));
D = L.D;

%% Model Data
modelD    = table();
modelD.EL = D.Mean_EL;
modelD.LM = D.Mean_LM;
modelD.BL = D.Mean_BL;
modelD.EVBV = D.LOG_Mean_TEV_BV;
modelD.Vol  = D.EBITDA_SD_TEV;
modelD.EVBV_hi = (D.LOG_Mean_TEV_BV > mean(D.LOG_Mean_TEV_BV,'omitnan'));
modelD.Vol_hi  = (modelD.Vol > mean(D.EBITDA_SD_TEV,'omitnan'));
modelD.EVBV_lo = (D.LOG_Mean_TEV_BV <= mean(D.LOG_Mean_TEV_BV,'omitnan'));
modelD.Vol_lo = (modelD.Vol <= mean(D.LOG_EBITDA_SD_TEV,'omitnan'));
modelD.Industry = D.Industry;
modelD.Rating   = D.Rating;
modelD.AR       = 1 - modelD.EVBV;
modelD.AP       = modelD.EVBV;

%% Clean dataset
Inan = isnan(sum(modelD{:,{'EL','BL','LM','EVBV','Vol'}},2));
modelD = modelD(~Inan,:);
