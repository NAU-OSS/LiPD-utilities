function c=stringifyCells(c)
%make all cell entries strings

nr=size(c,1);
nc=size(c,2);

for i=1:nr
    for j=1:nc
        if ~ischar(c{i,j})
            
            if isnumeric(c{i,j})
                c{i,j}=num2str(c{i,j});
            elseif isstruct(c{i,j})
                c{i,j}='nested data, can''t represent here';
            elseif iscell(c{i,j})
                tc=[];
                for cc=1:length(c{i,j})
                    if cc==1
                        if iscell(c{i,j}{cc})
                            tc=cell2str(c{i,j}{cc});
                        elseif ischar(c{i,j}{cc})
                            tc=(c{i,j}{cc});
                            
                        elseif isstruct(c{i,j}{cc})
                            tc=cell2str(struct2cell(c{i,j}{cc}));
                        else
                            tc=[];
                        end
                        
                    else
                        
                        %[i j cc]
                        if iscell(c{i,j}{cc})
                            %remove brackets and quotes
                            tc=[tc ' | ' cell2str(c{i,j}{cc})];
                            tc=strrep(tc,'{','');
                            tc=strrep(tc,'}','');
                            tc=strrep(tc,'''','');
                            
                        elseif ischar(c{i,j}{cc})
                            tc=[tc ' | ' c{i,j}{cc}];
                            tc=strrep(tc,'{','');
                            tc=strrep(tc,'}','');
                            tc=strrep(tc,'''','');
                        elseif isstruct(c{i,j}{cc})
                            tc= [tc ' | ' cell2str(struct2cell(c{i,j}{cc}))];
                            tc=strrep(tc,'{','');
                            tc=strrep(tc,'}','');
                            tc=strrep(tc,'''','');
                        end
                    end
                    
                end
                c{i,j}=tc;
            elseif isstruct(inside)
                c{i,j}=cell2str(struct2cell(inside));
            end
        end
    end
    %         if ~isstr(c{i,j})
    %             error([c{i,j} ' is not a string'])
    %         end
    dum=c{i,j};
    if min(size(dum))>1
        dum=reshape([dum repmat(';',size(dum,1),1)]',1,[]);
    end
    %save dum.mat  dum
    %         if isnumeric( c{i,j})
    %             c{i,j}=num2str(c{i,j});
    %         end
    c{i,j}=regexprep(dum,'[''}{]','');
end
end
