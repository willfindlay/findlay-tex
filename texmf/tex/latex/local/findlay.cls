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
\providecommand{\subtitle}[1]{% add subtitle to \maketitle
  \apptocmd{\@title}{\par \vspace{0.8em} {\large #1 \par}}{}{}
}

% Document will default to being by me
\author{William Findlay}
% Document will default to being untitled
\title{Untitled}

% Pandoc Stuff
\RequirePackage{graphicx}
\def\maxwidth{\ifdim\Gin@nat@width>\linewidth\linewidth\else\Gin@nat@width\fi}
\def\maxheight{\ifdim\Gin@nat@height>\textheight\textheight\else\Gin@nat@height\fi}
% Scale images if necessary, so that they will not overflow the page
% margins by default, and it is still possible to overwrite the defaults
% using explicit options in \includegraphics[width, height, ...]{}
\setkeys{Gin}{width=\maxwidth,height=\maxheight,keepaspectratio}
% Set default figure placement to htb
\def\fps@figure{htb}
\newcommand{\passthrough}[1]{#1}

% Better maketitle
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\LARGE\scshape \@title \par}%
    %\vskip 1em%
    %by
    \vskip 1em%
    {\large\bfseries
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}
  \end{center}%
  \par
  \vskip 2em}

% Margins and paragraph indents
\RequirePackage[margin=1in, columnsep=0.3in, headheight=15pt]{geometry}
\setlength\parindent{15pt}

% Fancy headers
\RequirePackage{fancyhdr}
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
\RequirePackage[bf,font=small]{caption}
\RequirePackage{framed}
\RequirePackage[section]{placeins}
\RequirePackage[dvipsnames,table,svgnames]{xcolor}
\RequirePackage[T1]{fontenc}
\RequirePackage{pifont}
\RequirePackage{tikz}

% Listings and related settings
\RequirePackage{lstautogobble}
\RequirePackage{color}
\RequirePackage{zi4}
\RequirePackage{listings}
\let\lil\lstinputlisting % Short hand for input listing
\let\code\lstinline      % Short hand for inline listing
\newcommand*{\FormatDigit}[1]{\textcolor{Blue}{#1}}
\renewcommand\lstlistlistingname{List of Listings}
\lstset{
    keepspaces=true,
    numbers=left,
    autogobble,
    columns=fullflexible,
    numberstyle=\ttfamily\small\lst@ifdisplaystyle\footnotesize\fi,
    basicstyle=\ttfamily\small\lst@ifdisplaystyle\footnotesize\singlespacing\fi,
    breaklines=true,
    backgroundcolor=\color{gray!10},
    frame=l,
    framerule=0pt,
    framexleftmargin=0.5em,
    framesep=0pt,
    xleftmargin=12pt,
    %xrightmargin=12pt,
    breakatwhitespace=true,
    captionpos=t,
    abovecaptionskip={0.5em},
    belowcaptionskip={0.5em},
    aboveskip=0.5em,
    showstringspaces=false,
    identifierstyle=\color{Black},
    commentstyle={\color{DarkGreen}},
    keywordstyle={\color{OrangeRed}},
    stringstyle=\color{Purple},
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
% define "diff" language for lstlistings
\definecolor{diffstart}{named}{Grey}
\definecolor{diffincl}{named}{Green}
\definecolor{diffrem}{named}{OrangeRed}
\lstdefinelanguage{diff}{
    basicstyle=\ttfamily\small,
    morecomment=[f][\color{diffstart}]{@@},
    morecomment=[f][\color{diffincl}]{+},
    morecomment=[f][\color{diffrem}]{-},
  }
\patchcmd\lst@MakeCaption
  {\ignorespaces}
  {\linespread{1}\selectfont\ignorespaces}
  {}{}

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
\floatplacement{figure}{!htb}
\floatplacement{table}{!htb}

% Subcounters for figures and tables
\RequirePackage{chngcntr}
\counterwithin{figure}{section}
\counterwithin{table}{section}
\AtBeginDocument
{
\counterwithin{lstlisting}{section}
}

% Tight lists in pandoc
\providecommand{\tightlist}{%
  \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}}
% Better bullet points
\renewcommand{\labelitemi}{\raisebox{.05ex}\textbullet}
\renewcommand{\labelitemii}{\raisebox{.25ex}{$\scriptscriptstyle \blacktriangleright$}}
\renewcommand{\labelitemiii}{\raisebox{.05ex}\textopenbullet}
\renewcommand{\labelitemiv}{\raisebox{.25ex}{$\scriptscriptstyle \vartriangleright$}}
% Better spacing for items
\RequirePackage{enumitem}
\setitemize{itemsep=0em}
\setlistdepth{20}
\renewlist{itemize}{itemize}{20}
\renewlist{enumerate}{enumerate}{20}
% Provide default
\setlist[itemize]{label=\raisebox{.05ex}\textbullet}
\setlist[itemize,1]{label=\raisebox{.05ex}\textbullet}
\setlist[itemize,2]{label=\raisebox{.25ex}{$\scriptscriptstyle \blacktriangleright$}}
\setlist[itemize,3]{label=\raisebox{.05ex}\textopenbullet}
\setlist[itemize,4]{label=\raisebox{.25ex}{$\scriptscriptstyle \vartriangleright$}}
\setlist[itemize,5]{label=\raisebox{.05ex}\textbullet}
\setlist[itemize,6]{label=\raisebox{.25ex}{$\scriptscriptstyle \blacktriangleright$}}
\setlist[itemize,7]{label=\raisebox{.05ex}\textopenbullet}
\setlist[itemize,8]{label=\raisebox{.25ex}{$\scriptscriptstyle \vartriangleright$}}
\setlist[itemize,9]{label=\raisebox{.05ex}\textbullet}
\setlist[itemize,10]{label=\raisebox{.25ex}{$\scriptscriptstyle \blacktriangleright$}}
\setlist[itemize,11]{label=\raisebox{.05ex}\textopenbullet}
\setlist[itemize,12]{label=\raisebox{.25ex}{$\scriptscriptstyle \vartriangleright$}}
\setlist[itemize,13]{label=\raisebox{.05ex}\textbullet}
\setlist[itemize,14]{label=\raisebox{.25ex}{$\scriptscriptstyle \blacktriangleright$}}
\setlist[itemize,15]{label=\raisebox{.05ex}\textopenbullet}
\setlist[itemize,16]{label=\raisebox{.25ex}{$\scriptscriptstyle \vartriangleright$}}
\setlist[itemize,17]{label=\raisebox{.05ex}\textbullet}
\setlist[itemize,18]{label=\raisebox{.25ex}{$\scriptscriptstyle \blacktriangleright$}}
\setlist[itemize,19]{label=\raisebox{.05ex}\textopenbullet}
\setlist[itemize,20]{label=\raisebox{.25ex}{$\scriptscriptstyle \vartriangleright$}}

% Paragraph and subparagraph spacing
\titlespacing*{\paragraph}{0pt}{1.3em}{1em}
\titlespacing*{\subparagraph}{0pt}{1.3em}{1em}

% Paragraph heading
\titleformat{\paragraph} % command to change
[runin]                  % shape  (runin, etc.)
{\normalfont\bfseries\color{gray!160}} % format (bfseries, itshape, etc.)
{}                       % label  (thesection, thesubsection, etc.)
{0em}                    % separation between label and body
{#1}                     % before the body
[.]                      % after the body

% Subparagraph heading
\titleformat{\subparagraph} % command to change
[runin]                     % shape  (runin, etc.)
{\normalfont\itshape\color{gray!160}} % format (bfseries, itshape, etc.)
{}                          % label  (thesection, thesubsection, etc.)
{0em}                       % separation between label and body
{#1}                        % before the body
[.]                         % after the body

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

\BeforeBeginEnvironment{tabular}{\begingroup\small}
\AfterEndEnvironment{tabular}{\endgroup}

% References, URLs, etc.
\RequirePackage{url}
\RequirePackage[unicode, breaklinks=true]{hyperref}
% footnotecolor
\makeatletter
\def\@footnotecolor{red}
\define@key{Hyp}{footnotecolor}{%
 \HyColor@HyperrefColor{#1}\@footnotecolor%
}
\def\@footnotemark{%
    \leavevmode
    \ifhmode\edef\@x@sf{\the\spacefactor}\nobreak\fi
    \stepcounter{Hfootnote}%
    \global\let\Hy@saved@currentHref\@currentHref
    \hyper@makecurrent{Hfootnote}%
    \global\let\Hy@footnote@currentHref\@currentHref
    \global\let\@currentHref\Hy@saved@currentHref
    \hyper@linkstart{footnote}{\Hy@footnote@currentHref}%
    \@makefnmark
    \hyper@linkend
    \ifhmode\spacefactor\@x@sf\fi
    \relax
  }%
\makeatother
% Colored links
\hypersetup{colorlinks, allcolors=., urlcolor=blue, citecolor=Green, footnotecolor=Green}
% Disable monospaced font for URLs
\urlstyle{same}
% Prevent overfull lines
\setlength{\emergencystretch}{3em}

% Use biblatex for references
\RequirePackage[backend=biber, style=ieee, citestyle=numeric, sortcites=true, maxbibnames=4, minbibnames=3]{biblatex}
% Sort it properly, no dashes for consecutive authors
\ExecuteBibliographyOptions{sorting=nyt, dashed=false}
\patchcmd{\bibsetup}{\interlinepenalty=5000}{\interlinepenalty=10000}{}{}

% Autorefs for sections
\renewcommand{\sectionautorefname}{Section}
\renewcommand{\subsectionautorefname}{Subsection}
\renewcommand{\subsubsectionautorefname}{Subsection}

% Appendix stuff
\RequirePackage[title, titletoc, page, toc]{appendix}
