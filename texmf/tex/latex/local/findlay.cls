\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{findlay}[2020/01/11 William's Custom Article Class]

\def\@@ptsize{12pt}
\DeclareOption{10pt}{\def\@@ptsize{10pt}}
\DeclareOption{11pt}{\def\@@ptsize{11pt}}
\DeclareOption{12pt}{\def\@@ptsize{12pt}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax

% Load article class
\LoadClass[letterpaper, oneside, onecolumn, final, \@@ptsize]{article}

% Patch maketitle to retain @author, @date, and @title
\RequirePackage{etoolbox}
\patchcmd\maketitle
{
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
}{}{}{}

% Document will default to being by me
\author{William Findlay}
% Document will default to being untitled
\title{Untitled}

% Better maketitle
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\LARGE\scshape \@title \par}%
    \vskip 0.5em%
    {\large\bfseries
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 0.5em%
    {\large \@date}
  \end{center}%
  \par
  \vskip 2em}

% Margins and paragraph indents
\RequirePackage[margin=1in]{geometry}
\setlength\parindent{15pt}

% Fancy headers
\RequirePackage{fancyhdr}
\setlength{\headheight}{15pt}
\renewcommand{\headrulewidth}{0.4pt}
% Header
\lhead{\small\scshape\nouppercase\leftmark}
\chead{}
\rhead{\small\itshape \@author}
% Footer
\lfoot{}
\cfoot{\thepage}
\rfoot{}
\pagestyle{fancy}

% Some generic packages
\RequirePackage{siunitx}
\RequirePackage{setspace}
\RequirePackage{changepage}
\RequirePackage[explicit]{titlesec}
\RequirePackage{aliascnt}
\RequirePackage{float}
\RequirePackage[hang,bf,font=small]{caption}
\RequirePackage{framed}
\RequirePackage[section]{placeins}
\RequirePackage[dvipsnames,table]{xcolor}
\RequirePackage[T1]{fontenc}
\RequirePackage{pifont}
\RequirePackage{tikz}

% Listings and related settings
\RequirePackage{listings}
\let\lil\lstinputlisting % Short hand for input listing
\let\code\lstinline      % Short hand for inline listing
\newcommand*{\FormatDigit}[1]{\textcolor{Blue}{#1}}
\renewcommand\lstlistlistingname{List of Listings}
\lstset{numbers=left,
numberstyle=\ttfamily\small\lst@ifdisplaystyle\footnotesize\fi,
basicstyle=\ttfamily\small\lst@ifdisplaystyle\footnotesize\singlespacing\fi,
breaklines=true,
backgroundcolor=\color{gray!20},
frame=ltb,
framerule=0pt,
framexleftmargin=0.5em,
xleftmargin=20pt,
%xrightmargin=10pt,
%framesep=10pt,
captionpos=t,
abovecaptionskip={0.5em},
belowcaptionskip={0.5em},
aboveskip=0.5em,
showstringspaces=false,
identifierstyle=\color{black},
commentstyle={\color{OliveGreen!100}},
keywordstyle={\color{Orange}},
stringstyle=\color{Plum!80},
% This used to make numbers blue but I think I want to turn it off...
%literate={0}{{\FormatDigit{0}}}{1}%
%             {1}{{\FormatDigit{1}}}{1}%
%             {2}{{\FormatDigit{2}}}{1}%
%             {3}{{\FormatDigit{3}}}{1}%
%             {4}{{\FormatDigit{4}}}{1}%
%             {5}{{\FormatDigit{5}}}{1}%
%             {6}{{\FormatDigit{6}}}{1}%
%             {7}{{\FormatDigit{7}}}{1}%
%             {8}{{\FormatDigit{8}}}{1}%
%             {9}{{\FormatDigit{9}}}{1}%
%             {.0}{{\FormatDigit{.0}}}{2}% Following is to ensure that only periods
%             {.1}{{\FormatDigit{.1}}}{2}% followed by a digit are changed.
%             {.2}{{\FormatDigit{.2}}}{2}%
%             {.3}{{\FormatDigit{.3}}}{2}%
%             {.4}{{\FormatDigit{.4}}}{2}%
%             {.5}{{\FormatDigit{.5}}}{2}%
%             {.6}{{\FormatDigit{.6}}}{2}%
%             {.7}{{\FormatDigit{.7}}}{2}%
%             {.8}{{\FormatDigit{.8}}}{2}%
%             {.9}{{\FormatDigit{.9}}}{2}%
%             %{,}{{\FormatDigit{,}}{1}% depends if you want the "," in color
%             {\ }{{ }}{1}% handle the space
%             ,
}
% define "none" language for lstlistings
\lstdefinelanguage{none}{
  identifierstyle=
}

% Use math packages
\RequirePackage{amsmath, amsfonts, amssymb, amsthm}
% Allow display breaks in math
\allowdisplaybreaks
% XOR operator
\let\xor\oplus
% Better forall
\let\oldforall\forall
\let\forall\undefined
\DeclareMathOperator{\forall}{\oldforall}
% Better exists
\let\oldexists\exists
\let\exists\undefined
\DeclareMathOperator{\exists}{\oldexists}
% Absolute value
\newcommand{\abs}[1]{\ensuremath{\lvert #1 \rvert}}
% Black box for proofs
\newcommand{\blackbox}{\hfill$\blacksquare$}
% Circled numbers
\newcommand*\circled[1]{\tikz[baseline=(char.base)]{
          \node[shape=circle,draw,inner sep=2pt] (char) {#1};}}

% Center floats by default
\makeatletter
\g@addto@macro\@floatboxreset{\centering}
\makeatother

% Default to intelligent float placement
\floatplacement{figure}{!htbp}
\floatplacement{table}{!htbp}

% Subcounters for figures and tables
\RequirePackage{chngcntr}
\counterwithin{figure}{section}
\counterwithin{table}{section}
\AtBeginDocument
{
\counterwithin{lstlisting}{section}
}

% Better bullet points
\renewcommand{\labelitemi}{\raisebox{.05ex}\textbullet}
\renewcommand{\labelitemii}{\raisebox{.25ex}{$\scriptscriptstyle \blacktriangleright$}}
\renewcommand{\labelitemiii}{\raisebox{.05ex}\textopenbullet}
\renewcommand{\labelitemiv}{\raisebox{.25ex}{$\scriptscriptstyle \vartriangleright$}}
% Better spacing for items
\RequirePackage{enumitem}
\setitemize{itemsep=0em}

% Paragraph and subparagraph spacing
\titlespacing*{\paragraph}{0pt}{1.3em}{1em}
\titlespacing*{\subparagraph}{0pt}{1.3em}{1em}

% Paragraph heading
\titleformat{\paragraph} % command to change
[runin]                  % shape  (runin, etc.)
{\normalfont\bfseries\color{gray!160}}              % format (bfseries, itshape, etc.)
{}                       % label  (thesection, thesubsection, etc.)
{0em}                    % separation between label and body
{#1}                     % before the body
[.]                      % after the body

% Subparagraph heading
\titleformat{\subparagraph} % command to change
[runin]                     % shape  (runin, etc.)
{\normalfont\itshape\color{gray!160}}                  % format (bfseries, itshape, etc.)
{}                          % label  (thesection, thesubsection, etc.)
{0em}                       % separation between label and body
{#1}                        % before the body
[.]                         % after the body

% References, URLs, etc.
\RequirePackage{hyperref}
% Colored links
\hypersetup{colorlinks, allcolors=., urlcolor=blue, citecolor=green}

% Autorefs for sections
\renewcommand{\sectionautorefname}{Section}
\renewcommand{\subsectionautorefname}{Subsection}
\renewcommand{\subsubsectionautorefname}{Subsection}

% Table stuff
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{array}
\RequirePackage{multirow}
\RequirePackage{wrapfig}
\RequirePackage{float}
\RequirePackage{colortbl}
\RequirePackage{pdflscape}
\RequirePackage{tabu}
\RequirePackage{threeparttable}
\RequirePackage{threeparttablex}
\RequirePackage[normalem]{ulem}
\RequirePackage{makecell}

% Use biblatex for references
\RequirePackage[backend=biber, style=ieee]{biblatex}
% Sort it properly, no dashes for consecutive authors
\ExecuteBibliographyOptions{sorting=nyt, dashed=false}

% Appendix stuff
\newcommand{\appendixnumberline}[1]{Appendix\space}
\let\oldappendix\appendix
\renewcommand{\appendix}{%
  \addtocontents{toc}{\let\protect\numberline\protect\appendixnumberline}%
  \renewcommand{\@seccntformat}[1]{Appendix~\csname the##1\endcsname\quad}%
  \oldappendix
}
