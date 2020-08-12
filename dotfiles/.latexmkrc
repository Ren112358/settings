#!/usr/bin/env perl

# dvi -> pdf
$pdf_mode = 3;

# max times of complies without being edited
$max_rpeat = 5;

# command to compile tex file
$latex        = 'platex -synctex=1 -halt-on-error -file-line-error -interaction=nonstopmode';
$latex_silent = 'platex -synctex=1 -halt-on-error -file-line-error -interaction=nonstopmode';

# for reference
$bibtex = 'pbibtex';

# reference sort
$biber = 'biber -u -U --output_safechars'

# command to generate dvi
$dvipdf = 'dvipdfmx %O -o %D %S';

# to make index
$makeindex = 'mendex %O -o %D %S';

# use Previewer to check PDF
$pdf_previewer = 'open -ga /Application/Preview.app';

# use the same PDF viewer to show the result
$pvc_view_file_via_temporary = 0;
