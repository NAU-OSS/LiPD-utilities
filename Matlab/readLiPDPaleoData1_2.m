function C=readLiPDPaleoData1_2(I,dirname)


toct=NaN;
if isfield(I,'paleoData')
    C=I.paleoData;
    toct=1:length(I.paleoData);
end



if ~isnan(toct) %if there are paleo tables, load em in
    for i = toct; %go through each paleoology
        if isfield(I.paleoData{i},'paleoMeasurementTable')
            %%%%%paleo MEASUREMENT TABLE
            %Go through paleoMeasurementTable first
            for pmt=1:length(I.paleoData{i}.paleoMeasurementTable)
                cT = I.paleoData{i}.paleoMeasurementTable{pmt};
                
                cT=readLiPDTable(cT,dirname);
                cT=processLiPDColumns(cT);
                if size(I.paleoMeasMD5,1)>=i
                    if iscell(I.paleoMeasMD5)
                        cT.paleoMeasurementTableMD5 = I.paleoMeasMD5{i,2};
                    end
                end
                C{i}.paleoMeasurementTable{pmt}=cT;
            end
        end
        %%%%%%END paleo MEASUREMENT TABLE
        
        
        
        %%%%%%%START paleo MODELS
        if isfield(I.paleoData{i},'paleoModel')
            for cm=1:length(I.paleoData{i}.paleoModel)
                CMS = I.paleoData{i}.paleoModel{cm};
                
                %%%%% paleo SUMMARY TABLE
                if isfield(CMS,'summaryTable')
                    CMT=readLiPDTable(CMS.summaryTable,dirname);
                    CMT=processLiPDColumns(CMT);
                    if size(I.paleoSummaryTableMD5,1)>=i
                        CMT.summaryTableMD5=I.paleoSummaryTableMD5{i,2};
                    end
                    
                    C{i}.paleoModel{cm}.summaryTable=CMT;
                end
                
                %%%%% paleo ENS TABLE
                if isfield(CMS,'ensembleTable')
                    CME=readLiPDTable(CMS.ensembleTable,dirname);
                    CME=processLiPDColumns(CME);
                    if size(I.paleoEnsTableMD5,1)>=i
                        CME.paleoEnsembleMD5=I.paleoEnsMD5{i,2};
                    end
                    C{i}.paleoModel{cm}.ensembleTable=CME;
                    
                end
                
                %%%%% CALIBRATED AGE DATA
                if isfield(CMS,'distributionTable')
                    C{i}.paleoModel{cm}.distributionTable=cell(1,1);
                    for ca = 1:length(CMS.distributionTable)
                        CASA=readLiPDTable(CMS.distributionTable{ca},dirname);
                        CASA=processLiPDColumns(CASA);
                        C{i}.paleoModel{cm}.distributionTable(ca)={CASA};
                    end
                end
                
            end
        end
    end
else
    C=NaN;
    
end