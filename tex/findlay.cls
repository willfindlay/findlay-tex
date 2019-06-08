% --------------------------------
% My custom article class file.
% Copyright 2019 William Findlay.
% Licensed under MIT license.
% --------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{findlay}
[2019/06/08 v0.1 William Findlay's article class]

\RequirePackage{fancyhdr}

% Get rid of some article.cls options
\DeclareOption{a4paper}{\OptionNotUsed}
\DeclareOption{a5paper}{\OptionNotUsed}
\DeclareOption{b5paper}{\OptionNotUsed}
\DeclareOption{letterpaper}{\OptionNotUsed}
\DeclareOption{legalpaper}{\OptionNotUsed}
\DeclareOption{executivepaper}{\OptionNotUsed}
\DeclareOption{landscape}{\OptionNotUsed}
\DeclareOption{twoside}{\OptionNotUsed}
\DeclareOption{titlepage}{\OptionNotUsed}
\DeclareOption{onecolumn}{\OptionNotUsed}
\DeclareOption{10pt}{\OptionNotUsed}
\DeclareOption{12pt}{\OptionNotUsed}

% vim: syntax=tex
