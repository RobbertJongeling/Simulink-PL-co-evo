p='C:\Users\rjongeli\Desktop\SimoneTest\ConQAT_output\simulink-analysis_matlab-colorm-file-writer_Clone_0.m';
handles = [];

f = fopen(p, 'r');
    line = fgetl(f);
    while ischar(line)
        %prepare line to be in form get_param('id','handle');
        %but only for lines with another color than white, and only lines
        %in the variant
        if (~contains(line, "white") & ~contains(line, "intakeAirflow_org"))
            line = strrep(line, "set_param", "get_param");
            line = extractBefore(line, "BackgroundColor");
            line = strcat(line,"handle');");
            
            %evaluate line to get handle
            handles = [handles, eval(line)];
        end
        line = fgetl(f);
    end
fclose(f);
