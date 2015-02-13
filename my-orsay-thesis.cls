%########################################################################
% 
% Filename : my-orsay-thesis.cls
% Author   : Vincent Feuvrier
% Contact  : vincent.feuvrier@normalesup.org
%
% Simple to use LaTeX class for writing thesis in mathematics at 
% Paris-Sud university.
%
% See included manual files for usage.
%
%########################################################################

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{my-orsay-thesis}[2010/09/09 Custom class for writing thesis in mathematics at Paris-Sud University]

%########################################################################
% Options
%########################################################################

\RequirePackage{ifthen}
\RequirePackage{keyval}

\def\@orsay@language{french}
\def\@orsay@babel@language{frenchb}
\def\@orsay@select@language{%
  \expandafter\expandafter\expandafter\selectlanguage\expandafter\expandafter\expandafter{\@orsay@babel@language}%
}

\define@key{my-orsay-thesis}{mainlanguage}{%
  \gdef\@orsay@language{#1}%
  \ifthenelse{\equal{#1}{french}}{%
    \gdef\@orsay@babel@language{frenchb}%
  }{%
    \gdef\@orsay@babel@language{#1}%
  }%  
}

\def\@orsay@languages{english,frenchb}
\define@key{my-orsay-thesis}{morelanguage}{%
  \edef\@orsay@languages{#1,\@orsay@languages}%
}

\newif\if@orsay@hyperref
\@orsay@hyperreffalse
\define@key{my-orsay-thesis}{hyperref}[]{\@orsay@hyperreftrue}

\newif\if@orsay@parttoc
\@orsay@parttocfalse
\define@key{my-orsay-thesis}{parttoc}[]{\@orsay@parttoctrue}

\newif\if@orsay@minitoc
\@orsay@minitocfalse
\define@key{my-orsay-thesis}{minitoc}[]{\@orsay@minitoctrue}

\newif\if@orsay@logos
\@orsay@logosfalse
\define@key{my-orsay-thesis}{logos}[]{\@orsay@logostrue}

\newif\if@orsay@lists
\@orsay@listsfalse
\define@key{my-orsay-thesis}{lists}[]{\@orsay@liststrue}

\let\@keyval@options@list\@empty
\def\@extract@key#1=#2\@extract@key{#1}

\def\PrKeyvalOptions#1{%
  \let\@tempa\@empty
  \let\@tempb\@empty
  \@for\CurrentOption:=\@keyval@options@list\do{%
    \expandafter\expandafter\expandafter\def\expandafter\expandafter\expandafter\@key\expandafter\expandafter\expandafter{%
      \expandafter\@extract@key\CurrentOption=\@extract@key%
    }%
    \@ifundefined{KV@#1@\@key}{\edef\@tempa{\@tempa,\CurrentOption,}}{\edef\@tempb{\@tempb,\CurrentOption,}}
  }%
  \@for\CurrentOption:=\@tempa\do{%
    \ifx\CurrentOption\@empty%
    \else%
      \PassOptionsToClass{\CurrentOption}{report}%
    \fi%
  }%
  \edef\@tempb{%
    \noexpand\setkeys{#1}{\@tempb}%
  }%
  \@tempb%
  \AtEndOfPackage{%
    \let\@unprocessedoptions\relax%
  }%
}

\DeclareOption*{%
  \expandafter\expandafter\expandafter\def\expandafter\expandafter\expandafter\@keyval@options@list\expandafter\expandafter\expandafter{%
    \expandafter\@keyval@options@list\expandafter,\CurrentOption%
  }%
}

\ProcessOptions\relax
\PrKeyvalOptions{my-orsay-thesis}%

%########################################################################
% Base class and packages
%########################################################################

\LoadClass[a4paper,twoside,12pt]{report}

%hyperref
\if@orsay@hyperref%
  \RequirePackage[pdftitle={PhD Thesis}, pdfauthor={Oscar BLANCO}, pdfsubject={Accelerator Physics}, pdfcreator={Oscar BLANCO}, pdfproducer={Oscar BLANCO}, colorlinks=true, breaklinks=true, linkcolor=blue, urlcolor=black, citecolor=red, bookmarks=true, pdftoolbar=true, pdfmenubar=true, bookmarksnumbered=true, pdffitwindow=false, pdfstartview={FitH}]{hyperref}%
\fi

%Language
\RequirePackage[\@orsay@languages,\@orsay@babel@language]{babel}
\RequirePackage{textcomp}
\RequirePackage[autolanguage]{numprint}

%Page setup
\RequirePackage[hmargin={3cm,2.3cm},vmargin={3cm,2cm}]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

%Part table of contents
\def\@finalize@parttoc{%
  \if@orsay@doneparttoc%
  \else%
    \doparttoc%
    \faketableofcontents%
  \fi%
}
\if@orsay@parttoc%
  \AtEndDocument{\@finalize@parttoc}
  \RequirePackage{minitoc}
  \mtcselectlanguage{\@orsay@language}%
  \renewcommand\ptctitle{\summaryname}
  \mtcsetdepth{parttoc}{3}
  \setcounter{tocdepth}{2}
  \newif\if@orsay@doneparttoc
  \@orsay@doneparttocfalse
  \let\@old@tableofcontents=\tableofcontents
  \def\tableofcontents{%
    \@orsay@doneparttoctrue%
    \doparttoc%
    \@old@tableofcontents%
  }
\fi

%Chapter table of contents
\def\@finalize@minitoc{%
  \if@orsay@doneminitoc%
  \else%
    \dominitoc%
    \faketableofcontents%
  \fi%
}
\if@orsay@minitoc%
  \AtEndDocument{\@finalize@minitoc}
  \RequirePackage{minitoc}
  \mtcselectlanguage{\@orsay@language}%
  \renewcommand\ptctitle{\summaryname}
  \mtcsetdepth{minitoc}{3}
  \setcounter{tocdepth}{2}
  \newif\if@orsay@doneminitoc
  \@orsay@doneminitocfalse
  \let\@old@tableofcontents=\tableofcontents
  \def\tableofcontents{%
    \@orsay@doneminitoctrue%
    \dominitoc%
    \@old@tableofcontents%
  }
\fi

%Logos
\if@orsay@logos
\usepackage{graphicx}
\RequirePackage{ifpdf}
\fi

%Math
\RequirePackage{amsmath,amssymb,amsfonts}

%Misc
\RequirePackage{tabularx}

%########################################################################
% Lists and parts setup
%########################################################################

\newlength\defparindent
\newlength\defitemsep
\newlength\itemizesep
\newlength\itemizeparskip

\setlength\defparindent{20pt}
\setlength\parskip{0.5\baselineskip}
\setlength\itemizesep{0.3333\baselineskip}
\setlength\defitemsep\itemizesep
\setlength\itemizeparskip{0.25\baselineskip}

\AtBeginDocument{%
  \if@orsay@lists%
    \setlength\parindent\defparindent%
    \let\olditemize=\itemize%
    \renewenvironment{itemize}{%
      \olditemize%
      \addvspace{\itemizesep}%
      \setlength\itemindent{9pt}%
      \setlength\itemsep\defitemsep%
      \addtolength\itemsep{-\itemizeparskip}%
      \setlength\parskip\itemizeparskip%
      \setlength\parindent\defparindent%
    }{%
      \endlist%
      \addvspace{\itemizesep}%
    }%
    \let\oldenumerate=\enumerate%
    \renewenvironment{enumerate}{%
      \olditemize%
      \addvspace{\itemizesep}%
      \setlength\itemindent{8pt}%
      \setlength\itemsep\defitemsep%
      \addtolength\itemsep{-\itemizeparskip}%
      \setlength\parskip\itemizeparskip%
      \setlength\parindent\defparindent%
    }{%
      \endlist%
      \addvspace{\itemizesep}%
    }%
    \renewcommand\labelitemi{$\diamond$}%
    \renewcommand\labelitemii{$\star$}%
    \renewcommand\labelitemiii{-}%
  \fi%
  \let\@orsay@old@part=\@part%
  \def\@part[#1]#2{%
    \newpage%
    \@orsay@old@part[#1]{#2}%
    \if@orsay@parttoc\vfill\parttoc\fi%
    \vfill%
    \newpage%
    \setcounter{section}{0}%
  }%
  \let\@orsay@old@chapter=\@chapter
  \def\@chapter[#1]#2{%
    \cleardoublepage%
    \@orsay@old@chapter[#1]{#2}%
%    \if@orsay@minitoc\vfill\minitoc\vfill\newpage\fi%
  }
%   \renewcommand{\thesection}{\thechapter.\arabic{section}}
  \renewcommand\sectionmark[1]{\markright{#1}\gdef\@orsay@current@section{#1}}%
  \renewcommand\subsectionmark[1]{\markboth{\thesubsection\ -\ \emph{#1}}{\@orsay@current@section}}%
}

%########################################################################
% Page setup
%########################################################################

\tolerance=10000
\hbadness=10000

\pagestyle{fancy}
\fancyhf{}
\fancyhead[RO,LE]{\footnotesize\textbf{\thepage}}
\fancyhead[RE]{\footnotesize\scshape\rightmark}
\fancyhead[LO]{\footnotesize\leftmark}

\setlength\headheight{16pt}
\setlength\headsep{\baselineskip}

%########################################################################
% Title page
%########################################################################

\renewcommand\title[2][\@orsay@language]{%
  \expandafter\gdef\csname @title@#1\endcsname{#2}%
}

\newcommand\keywords[2][\@orsay@language]{%
  \expandafter\gdef\csname @keywords@#1\endcsname{#2}%
}

\newcommand\ordernumber[1]{%
  \gdef\@ordernumber{#1}%
}

\newcounter{@member}
\newcounter{@referee}

\newcommand\addcommissionmember[4][]{%
  \stepcounter{@member}%
  \ifthenelse{\equal{#1}{}}{%
    \expandafter\def\csname @member@\the@member\endcsname{#2&#3&\textsc{#4}&}%
  }{%
    \expandafter\def\csname @member@\the@member\endcsname{#2&#3&\textsc{#4}&(#1)}%
  }%
}

\newcommand\addreferee[3]{%
  \stepcounter{@referee}%
  \expandafter\def\csname @referee@\the@referee\endcsname{#1&#2&#3&}%
}

\newcommand\includelogo[2][]{%
  \ifpdf%
    \includegraphics[#1]{logos/#2.png}%
  \else%
    \includegraphics[#1]{logos/#2.eps}%
  \fi%
}

\renewcommand\maketitle{%
  \selectlanguage{frenchb}%
  \setcounter{page}{1}%
  \thispagestyle{empty}%
  \Large%
  \if@orsay@logos%
    \noindent%
    \raisebox{0ex}{\includelogo[height=2cm]{logoUPS}}%
    \hfill%
    \includelogo[height=2.5cm]{ED517}%
    {\normalsize\\}%
  \else%
    \begin{center}%
      \begin{tabular}{|c|}%
        \hline\\[-1.5\medskipamount]%
        UNIVERSIT\'E PARIS-SUD 11\\%
        FACULT\'E DES SCIENCES D'ORSAY\\[\smallskipamount]%
        \hline%
      \end{tabular}%
    \end{center}%
  \fi%
  {\normalsize\No d'ordre~: \@ordernumber}%
  \\[\bigskipamount]%
  \begin{center}%
    \textbf{TH\`ESE}%
    \\[\bigskipamount]%
    \large%
    Pr\'esent\'ee pour obtenir%
    \\[1.5\bigskipamount]%
    \begin{minipage}{0.65\textwidth}%
      \large%
      \centering%
      LE GRADE DE DOCTEUR EN SCIENCES DE L'UNIVERSIT\'E PARIS-SUD XI%
    \end{minipage}%
    \\[1.5\bigskipamount]%
    \large%
    Discipline : Physique%
    \\[\medskipamount]%
    par%
    \\[\medskipamount]%
    \@author%
    \\[4\bigskipamount]%
    \begin{minipage}{0.9\textwidth}%
      \LARGE%
      \bfseries%
      \centering%
      \@orsay@select@language%
      \csname @title@\@orsay@language\endcsname%
      \selectlanguage{frenchb}%
    \end{minipage}%
  \end{center}%
  \vfill%
  \ifnum\the@member=0\relax%
    \ClassWarning{my-orsay-thesis}{No commission member have been given}{You can provide members using the command \string\addcommissionmember.}%
  \else%
    \normalsize%
    \@ifundefined{c@@tempa}{\newcounter{@tempa}}{}%
    \setcounter{@tempa}{0}%
    \begin{tabular}{>{\hspace{0.08\textwidth}}cr@{ }ll}%
      \multicolumn{4}{l}{\large Soutenue le \@date{} devant la Commission d'examen:}\\[\medskipamount]%
      \whiledo{\value{@tempa}<\value{@member}}{%
        \stepcounter{@tempa}%
        \csname @member@\the@tempa\endcsname%
        \ifnum\value{@tempa}<\value{@member}\relax%
          \\%
        \fi%
      }%
      \ifnum\value{@referee}>0\relax
        \setcounter{@tempa}{0}%
        \\[\bigskipamount]%
        \multicolumn{4}{l}{\large Rapporteurs:}\\[\medskipamount]%
        \whiledo{\value{@tempa}<\value{@referee}}{%
          \stepcounter{@tempa}%
          \csname @referee@\the@tempa\endcsname\\%
        }%
      \fi
    \end{tabular}
  \fi%
  \newpage%
  \null%
  \vfill%
  \thispagestyle{empty}%
  \footnotesize%
  \def\@temp{
    \begin{tabular}{l}%
      Th\`ese pr\'epar\'ee au\\%
            \textbf{Laboratoire de L'acc\'el\'erateur Lin\'eaire (LAL)}\\%
%       UMR8607\\%
      Le Centre Scientifique d'Orsay, B\^atiment 200 BP 34\\%
      \numprint{91898} Orsay CEDEX, France\\%
      \vspace*{0.4cm}\\%
      financ\'e par,\\%
      \vspace*{0.4cm}\\%
      \textbf{Centre National de la Recherche Scientifique (CNRS)}\\%
%       et,\\%
      \textbf{Organisation Europ\'eenne pour la Recherche Nucl\'eaire (CERN)}\\%
      \vspace*{0.4cm}\par
    \end{tabular}%
  }%
  \if@orsay@logos%
    \noindent%
    \raisebox{10ex}{\hspace*{0.4cm}\includelogo[width=0.19\textwidth]{LAL}}\\%
    \raisebox{0.5ex}{\includelogo[width=0.112\textwidth]{CNRS}}\;%
    \includelogo[width=0.12\textwidth]{CERN}%
  \else%
    \null%
  \fi%
  \hfill%
  \@ifundefined{@orsay@templena}{\newlength\@orsay@templena}{}%
  \settoheight\@orsay@templena{\@temp}%
  \addtolength\@orsay@templena{-0.9\bigskipamount}%
  \raisebox{\@orsay@templena}[0pt][0pt]{\@temp}%
  \normalsize%
  \newpage%
  \@orsay@select@language%
}

%########################################################################
% Multilingual abstracts
%########################################################################

\def\keywordsname{Keywords:}
\def\summaryname{Summary}

\addto\captionsfrench{%
  \renewcommand\keywordsname{Mots-clefs~:}%
  \renewcommand\summaryname{Sommaire}%
}

\addto\captionsenglish{%
  \renewcommand\keywordsname{Keywords:}%
  \renewcommand\summaryname{Summary}%
}

\addto\captionsgerman{%
  \renewcommand\keywordsname{Schlagworte:}%
  \renewcommand\summaryname{Inhaltsverzeichnis}%
}

\addto\captionsitalian{%
  \renewcommand\keywordsname{Keywords~:}%
  \renewcommand\summaryname{Indice}%
}

\renewenvironment{abstract}[1][\@orsay@language]{%
  \edef\@orsay@current@abstract@language{#1}%
  \expandafter\expandafter\expandafter\selectlanguage\expandafter\expandafter\expandafter{#1}%
  \small%
  \setlength\parskip{0pt}%
  \parindent=\defparindent%
  \begin{center}%
    \ifthenelse{\equal{#1}{\@orsay@language}}{}{%
      \textsc{%
        \normalsize%
        \@ifundefined{@title@#1}{%
          \ClassError{my-orsay-thesis}{No title given for language "#1"}{Title for language "#1" is mandatory for this class. You should provide one using the title command.}%
        }{%
          \csname @title@#1\endcsname%
          \nopagebreak[4]%
          \\[1ex]%
        }%
      }%
    }%
    {\bfseries\abstractname}%
  \end{center}%
  \unskip%
  \medskip%
  \nopagebreak[4]%
  \par%
}{%
  \nopagebreak[4]%
  \\[\smallskipamount]%
  \nopagebreak[4]%
  \textbf{\uppercase{\keywordsname}} %
  \@ifundefined{@keywords@\@orsay@current@abstract@language}{%
    \ClassError{my-orsay-thesis}{No keywords given for language "\@orsay@current@abstract@language"}{Keywords for language "\@orsay@current@abstract@language" are mandatory for this class. You should provide them using the keywords command.}%
  }{%
    \csname @keywords@\@orsay@current@abstract@language\endcsname.%
  }%
  \par%
  \@orsay@select@language%
}

%########################################################################
% Initialization
%########################################################################

\def\@title@french{???\ClassError{my-orsay-thesis}{No French title given}{French title is mandatory for this class. You should provide one using the \protect\title command.}}
\def\@title@english{???\ClassError{my-orsay-thesis}{No English thesis title given}{English title is mandatory for this class. You should provide one using the \protect\title command.}}
\def\@keywords@french{???\ClassError{my-orsay-thesis}{No French keywords given}{English keywords are mandatory for this class. You should provide them using the \protect\keywords command.}}
\def\@keywords@english{???\ClassError{my-orsay-thesis}{No English keywords given}{English keywords are mandatory for this class. You should provide them using the \protect\keywords command.}}
\def\@author{???\ClassError{my-orsay-thesis}{No author given}{The author is mandatory for this class. You should provide one using the \protect\author command.}}
\def\@date{??/??/??\ClassError{my-orsay-thesis}{No defense date given}{The defense date is mandatory for this class. You should provide one using the \protect\date command.}}
\def\@ordernumber{\ClassWarning{my-orsay-thesis}{No order number given}{The order number was not specified. You should provide one using the \protect\order command.}}





