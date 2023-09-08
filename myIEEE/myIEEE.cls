% ##############
% Nomrbe de la clase y opciones predeterminadas de article
% ##############
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myIEEE}[16/05/2023, v1.0]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

% ##############
% Codificación para el idioma español
% ##############
\RequirePackage[utf8]{inputenc} % input
\RequirePackage[T1]{fontenc} % output
%\RequirePackage[spanish,english]{babel} % idioma español para tablas, figuras, secciones, etc.
\RequirePackage[style=spanish]{csquotes} % Cuando se usa el paquete 'babel' o 'polyglossia' con 'biblatex', es recomendado cargar 'csquotes'  para asegurar que la tipografía de las comillas este correcta de acuerdo al idioma a utilizar.

% Traducciones
\renewcommand{\abstractname}{Resumen}
\newcommand{\keywordsname}{Palabras Clave}
\AtBeginDocument{%
    \renewcommand{\tablename}{\MakeUppercase{Tabla}}
    \renewcommand{\figurename}{Fig}
    \renewcommand{\refname}{Referencias}
}

% ##############
% Dimensiones del documento
% ##############
\RequirePackage{geometry}
\geometry{
    letterpaper,
    margin = 0.6805555556in,
    marginparsep = 0.1in,
    marginparwidth = 0.47in,
    headsep = 18pt,
}
%\setlength{\columnsep}{5mm}
\setlength{\columnwidth}{88.9mm}

% ##############
% Modificar el estilo de texto del documento
% ##############

% Estilo de texto para cada familia
\renewcommand{\rmdefault}{ptm}
\renewcommand{\sfdefault}{phv}
\renewcommand{\ttdefault}{pcr}

% Estilo de texto para las ecuaciones
\RequirePackage[cmintegrals]{newtxmath} % ecuaciones en times new roman

% Estilo de texto para las url
\RequirePackage{url}
\renewcommand{\UrlFont}{\rmfamily}

% ##############
% Escala del Font size
% ##############
\RequirePackage{scalefnt}

% ##############
% Formato de parrafos
% ##############
%\RequirePackage[skip=0pt,indent=3.5mm]{parskip}
\setlength{\parskip}{0pt}
\setlength{\parindent}{3.5mm}
%\RequirePackage{indentfirst}

% ##############
% Color
% ##############
\RequirePackage[dvipsnames]{xcolor}
\definecolor{myorange}{RGB}{230, 110, 10}

% ##############
% Author Ref Mark
% ##############
\newcounter{authorrefmarkcounter}
\renewcommand{\theauthorrefmarkcounter}{\fnsymbol{authorrefmarkcounter}}
\newcommand{\authorrefmark}[1]{%
    \setcounter{authorrefmarkcounter}{#1}
    \ignorespaces
    \textsuperscript{\theauthorrefmarkcounter}
    \ignorespaces
}

% ##############
% Modificar el titulo del documento
% ##############
\newcommand{\logo}[1]{\def\@logo{#1}}
\newcommand{\titlehead}[1]{\def\@titlehead{#1}}
\newcommand{\authorA}[1]{\def\@authorA{#1}}
\renewcommand{\@maketitle}{%
    %\setlength{\parindent}{0pt}
    %\vskip\baselineskip
    \begin{minipage}{\textwidth}
        \begin{center}
            \begin{minipage}{0.48\textwidth}
                \@logo
            \end{minipage}
            \begin{minipage}{0.48\textwidth}
                \color{myorange} \raggedleft 
                {\Large \@titlehead} \\
                {\large \@date} \\
            \end{minipage}
        \end{center}
    \end{minipage}
    \\[\baselineskip]
    \rule{\textwidth}{1pt}
    \\[2\baselineskip]
    \begin{minipage}{\textwidth}
        \begin{center}
            {\fontsize{24pt}{28.8}\selectfont \@title} 
            \\[1.5\baselineskip]
            {\setlength{\baselineskip}{1.1\baselineskip}
                {\scalefont{1.095} \@author} \\
                \@authorA \\
            }
        \end{center}
    \end{minipage}
    \\[2\baselineskip]
}

% ##############
% Header y Footer
% ##############
\newcommand{\lname}[1]{\def\@lname{#1}}
\AtBeginDocument{%
    \makeatletter
        \let\titlesave\@title        % Document title saved in command
        %\let\authorsave\@author
        \let\datesave\@date
    \makeatother
}
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhead[RE]{\scriptsize \MakeUppercase{\@titlehead, No. \datesave}}
\fancyhead[LE]{\scriptsize \MakeUppercase{\thepage}}
\fancyhead[LO]{\scriptsize \MakeUppercase{\@lname:~\titlesave}}
\fancyhead[RO]{\scriptsize \MakeUppercase{\thepage}}
\fancyfoot{}
\renewcommand{\headrulewidth}{0pt} % Elimina el rude del header

% ##############
% Abstract Environments
% ##############
\renewenvironment{abstract}
{% begin def
    \small \bfseries \textit{\abstractname}---\ignorespaces
}
{% end def
    \par
}

% ##############
% Keywords Environments
% ##############
\newenvironment{keywords}
{% begin def
    \small \bfseries \textit{\keywordsname}---\ignorespaces
}
{% end def
    \par
}

% ##############
% Comandos de Secciones
% ##############
\RequirePackage{titlesec}
\setcounter{secnumdepth}{4}

% Section
\renewcommand{\thesection}{\Roman{section}} % tipo de número
\titleformat
    {\section} % command
    {\centering \scshape} % format
    {\thesection.\space\space} % label
    {0pt} % sep
    {} % before-code
    [] % after-code
\titlespacing{\section}
    {0pt} % left
    {\baselineskip} % before-sep
    {0.5\baselineskip} % after-sep

% Subsection
\renewcommand{\thesubsection}{\thesection-\Alph{subsection}} % tipo de número
\titleformat
    {\subsection} % command
    {\itshape} % format
    {\renewcommand*{\thesubsection}{\Alph{subsection}}
    \thesubsection.\space\space} % label
    {0pt} % sep
    {} % before-code
    [] % after-code
\titlespacing{\subsection}
    {0pt} % left
    {0.5\baselineskip} % before-sep
    {0.25\baselineskip} % after-sep

% Subsubsection
\renewcommand{\thesubsubsection}{\thesubsection\arabic{subsubsection}} % tipo de número
\titleformat
    {\subsubsection} % command
    [runin] % shape
    {\itshape} % format
    {\renewcommand*{\thesubsubsection}{\arabic{subsubsection}}
    \thesubsubsection)\space} % label
    {0pt} % sep
    {} % before-code
    [:] % after-code
\titlespacing{\subsubsection}
    {\parindent} % left
    {\parskip} % before-sep
    {1ex} % after-sep

% Paragraph
\renewcommand{\theparagraph}{\thesubsubsection\alph{paragraph}} % tipo de número
\titleformat
    {\paragraph} % command
    [runin] % shape
    {\itshape} % format
    {\renewcommand*{\theparagraph}{\alph{paragraph}}
    \theparagraph)\space} % label
    {0pt} % sep
    {} % before-code
    [:] % after-code
\titlespacing{\paragraph}
    {2\parindent} % left
    {\parskip} % before-sep
    {1ex} % after-sep

% ##############
% Itemize changing layout
% ##############
\RequirePackage{enumitem}

\setlist[itemize]{
    topsep = 0pt,
    %before = {\parskip = 0pt},
    before = {\partopsep = 0pt},
    label = \mbox{\textsf{\tiny$\blacksquare$}}\space,
    %labelsep = 0pt,
    labelwidth = 1ex,
    leftmargin = 2\parindent,
    %itemindent = 1em,
    %listparindent = 1em,
    parsep = \parskip,
    itemsep = 0pt,
}

\renewcommand{\labelenumi}{\textit{\arabic{enumi})}}
\setlist[enumerate]{
    topsep = 0pt,
    %before = {\parskip = 0pt},
    before = {\partopsep = 0pt},
    %label = \mbox{\textit{\arabic{enumi})}}\space,
    %labelsep = 0pt,
    labelwidth = 2ex,
    leftmargin = 2\parindent,
    %itemindent = 1em,
    %listparindent = 1em,
    parsep = \parskip,
    itemsep = 0pt,
}

% ##############
% Caption de Tablas y Figuras
% ##############
\RequirePackage{caption}

% Caption de tablas
\renewcommand{\thetable}{\Roman{table}}
\captionsetup[table]{
    format = plain,
    labelformat = simple,
    labelsep = newline,
    textformat = simple,
    justification = centering,
    font = footnotesize,
    textfont = sc,
    %width = \columnwidth,
    skip = \baselineskip,
    %name = \MakeUppercase{\tablesave},
}

% Caption de Figuras
\captionsetup[figure]{
    format = plain,
    labelformat = simple,
    labelsep = period,
    textformat = simple,
    justification = centering,
    font = footnotesize,
    %width = \columnwidth,
    skip = \baselineskip,
    %name = \figuresave,
}

% ##############
% Font size de tabular
% ##############
%\AtBeginEnvironment{tabular}{\centering}
\RequirePackage{etoolbox}
\def\@floatboxreset{%
  \reset@font
  \footnotesize
  \@setminipage
}%

% ##############
% Start Párrafo
% ##############
\RequirePackage{lettrine}
\newcommand{\startPar}[2]{%
    \lettrine[%
        loversize = 0,
        %lraise = 0.1,
        findent = 0.1em,
        nindent = 0em,
        loversize = 0.06,
        ]{\rmfamily \bfseries \MakeUppercase{#1}}{\rmfamily \MakeUppercase{#2}}
}%

% ##############
% Comando BibTeX
% ##############
% Comando Bibtex para generar el texto igual al comando \LaTeX
\def\BibTeX{{\rm B\kern-.05em{\sc i\kern-.025em b}\kern-.08em
    T\kern-.1667em\lower.7ex\hbox{E}\kern-.125emX}}