%%
%% This is file `ejpecp.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ejpecp.dtx  (with options: `class')
%% 
%% This is a generated file.
%% 
%% Copyright (c) 2019-2021 by Edgaras SAKURAS, VTeX, Lithuania for EJP-ECP
%% Copyright (c) 2018 by Deimantas GALCIUS, VTeX, Lithuania for EJP-ECP
%% Copyright (c) 2016-2017 by Eimantas GUMBAKIS, VTeX, Lithuania for EJP-ECP
%% Copyright (c), 2011-2015 by Krzysztof BURDZY and Djalil CHAFAI for EJP-ECP
%% 
%% This file may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, either version 1.2 of this license
%% or (at your option) any later version.  The latest version of this
%% license is in:
%% 
%%    https://www.latex-project.org/lppl.txt
%% 
%% and version 1.2 or later is part of all distributions of LaTeX version
%% 1999/12/01 or later.
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{ejpecp}
    [2021/11/04 v1.11.3 class for EJP and ECP journals]
\ClassInfo{ejpecp}{Copyright (c) 2019-2021 Edgaras SAKURAS, VTeX, Lithuania.}
\ClassInfo{ejpecp}{Copyright (c) 2018 Deimantas GALCIUS, VTeX, Lithuania.}
\ClassInfo{ejpecp}{Copyright (c) 2016-2017 Eimantas GUMBAKIS, VTeX, Lithuania for EJP-ECP.}
\ClassInfo{ejpecp}{Copyright (c), 2011-2015 BURDZY and CHAFAI for EJP-ECP.}
%% We declare and handle our class options
\DeclareOption{EJP}{%
  \newcommand{\@EJP}{}
  \newcommand{\@JOURNAL}{EJP}
  \newcommand{\@JOURNALA}{Electron. J. Probab.}
  \newcommand{\@JOURNALL}{Electronic Journal of Probability}
  \newcommand{\@ISSN}{1083-6489}
  \newcommand{\@URL}{www.imstat.org/ejp}
  \newcommand{\@FULLURL}{https://imstat.org/journals-and-publications/electronic-journal-of-probability/}
  }
\DeclareOption{ECP}{%
  \newcommand{\@ECP}{}
  \newcommand{\@JOURNAL}{ECP}
  \newcommand{\@JOURNALA}{Electron. Commun. Probab.}
  \newcommand{\@JOURNALL}{Electronic Communications in Probability}
  \newcommand{\@ISSN}{1083-589X}
  \newcommand{\@URL}{www.imstat.org/ecp}
  \newcommand{\@FULLURL}{https://imstat.org/journals-and-publications/electronic-communications-in-probability/}
  }
\DeclareOption{NOAMS}{% prevents the load of AMS packages
  \newcommand{\@NOAMS}{}
  }
\DeclareOption{NODS}{% asks to avoid renaming \mathbb into \mathds
  \newcommand{\@NODS}{}
  }
\DeclareOption{PSTRICKS}{% pstricks and pspicture.
  % File must be compiled with "latex --shell-escape", then use dvipdf
  \newcommand{\@PSTRICKS}{}
  }
\DeclareOption{draft}{%
  \PassOptionsToClass{draft}{article}
  }
\DeclareOption{final}{%
  \PassOptionsToClass{final}{article}
  }
\newif\if@ejpecp@preprint \@ejpecp@preprintfalse
\DeclareOption{preprint}{\@ejpecp@preprinttrue}
\newif\if@ejpecp@nofontexpansion \@ejpecp@nofontexpansionfalse
\DeclareOption{nofontexpansion}{\@ejpecp@nofontexpansiontrue}
\newif\if@ejpecp@nobera \@ejpecp@noberafalse
\DeclareOption{nobera}{\@ejpecp@noberatrue}
\DeclareOption*{%
  \PackageWarning{ejpecp}{Unknown option ‘\CurrentOption’}%
  }
\ProcessOptions\relax
%% We use the standard article class
\LoadClass[a4paper,10pt,twoside]{article}
%% Packages and their options
\RequirePackage{graphicx}
\ifx\@PSTRICKS\undefined
  \DeclareGraphicsExtensions{.pdf,.PDF,.eps,.EPS,.png,.PNG,.jpg,.JPG,.jpeg,.JPEG}
\else
  \RequirePackage[pdf]{pstricks}
  \RequirePackage{auto-pst-pdf}
\fi
\RequirePackage{mathtools}
\RequirePackage{microtype}
\if@ejpecp@nofontexpansion
    \microtypesetup{expansion=false}
\fi
\RequirePackage{latexsym}
\ifx\@NODS\undefined
  \RequirePackage{dsfont}
\fi
\ifx\@NOAMS\undefined
  \RequirePackage{amsmath,amsfonts,amssymb,amsthm}
\fi
\RequirePackage{geometry}
\geometry{a4paper,portrait,left=3.5cm,right=3.5cm,top=3.5cm,bottom=3.5cm}
\if@ejpecp@nobera
\else
    \RequirePackage{bera} % beware that the logo is sensitive to default font change
\fi
\RequirePackage{hyperref}
\hypersetup{
  pagebackref=false,
  pdfborder={0 0 0},
  pdfstartview={FitH},
  hypertexnames=false,
  breaklinks,
}
\def\UrlFont{}
%%%% Macros et Environments
%% General macros
\newcommand{\@TITLE}{FIXME!}
\newcommand{\@SHORTTITLE}{FIXME!}
\newcommand{\@KEYWORDS}{FIXME!}
\newcommand{\@AMSSUBJ}{FIXME!}
\newcommand{\@ABSTRACT}{FIXME!}
\newcommand{\@VOLUME}{0}
\newcommand{\@PAPERNUM}{0}
\newcommand{\@YEAR}{2012}
\newcommand{\@PAGESTART}{1}
\newcommand{\@PAGEEND}{\@ifundefined{ejpecp@lastpage}{\@PAGESTART}{\ejpecp@lastpage}}
\newcommand{\@SUBMITTED}{FIXME!}
\newcommand{\@ACCEPTED}{FIXME!}
\newcommand{\TITLE}[1]{\renewcommand{\@TITLE}{#1}}
\newcommand{\SHORTTITLE}[1]{\renewcommand{\@SHORTTITLE}{#1}}
\newcommand{\DEDICATORY}[1]{\gdef\@DEDICATORY{#1}}
\newcommand{\AUTHORS}[1]{\author{#1}}
\let\FIRSTNAMES\@firstofone
\let\SURNAME\@firstofone
\newcommand{\KEYWORDS}[1]{\renewcommand{\@KEYWORDS}{#1}}
\newcommand{\AMSSUBJ}[1]{\renewcommand{\@AMSSUBJ}{#1}}
\newcommand{\AMSSUBJSECONDARY}[1]{\gdef\@AMSSUBJSECONDARY{#1}}
\newcommand{\ABSTRACT}[1]{\renewcommand{\@ABSTRACT}{#1}}
\newcommand{\VOLUME}[1]{\renewcommand{\@VOLUME}{#1}}
\newcommand{\PAPERNUM}[1]{\renewcommand{\@PAPERNUM}{#1}}
\newcommand{\YEAR}[1]{\renewcommand{\@YEAR}{#1}}
\newcommand{\PAGESTART}[1]{\renewcommand{\@PAGESTART}{#1}}
\newcommand{\PAGEEND}[1]{%
    \let\write@ejpecp@lastpage\relax
    \renewcommand{\@PAGEEND}{#1}%
    }
\newcommand{\SUBMITTED}[1]{\renewcommand{\@SUBMITTED}{#1}}
\newcommand{\ACCEPTED}[1]{\renewcommand{\@ACCEPTED}{#1}}
\newcommand{\DOI}[1]{\gdef\@DOI{#1}}
\newcommand{\ARXIVID}[1]{\gdef\@ARXIVID{#1}}
\newcommand{\HALID}[1]{\gdef\@HALID{#1}}
\newcommand{\ACKNO}[1]{\noindent\textbf{Acknowledgments.} #1}
\def\acknowledgementsname{Acknowledgments}
\newenvironment{acks}[1][\acknowledgementsname]{\noindent\textbf{#1.}\space\ignorespaces}{\par}
\def\EMAIL#1{E-mail:~\texttt{\href{mailto:#1}{\nolinkurl{#1}}}}
\newcommand{\BEMAIL}[1]{\newline\hspace*{1.8em}\EMAIL{#1}} % useful in ftnotes
%% Logos
\newcommand{\@EJPLOGO}{% designed by KB.
  % This version is for bera 10pt (depends on the font via "em" and "ex")
  \centerline{%
    \hbox{%
      \vrule  height -0.4 pt depth 0.8 pt width 27.7 em\space
      \kern   -27.8 em\space
      \raise   0.03ex  \hbox {\bf  E}\space
      \raise   0.06ex \hbox {l}\space
      \raise  .13ex \hbox {e}\space
      \raise  .24ex \hbox {c}\space
      \raise  .45ex \hbox {t}\space
      \raise  .78ex \hbox {r}\space
      \raise  1.31ex \hbox {o}\space
      \raise  2.08ex \hbox {n}\space
      \raise  3.14ex \hbox {i}\space
      \raise  4.53ex \hbox {c}\space
      \kern    1em\space
      \raise  8.15ex \hbox {\bf  J}\space
      \raise  10.15ex \hbox {o}\space
      \raise  12.04ex \hbox {u}\space
      \raise  13.60ex \hbox {r}\space
      \raise  14.64ex \hbox {n}\space
      \kern  .3 em\space
      \vrule  depth 0.8pt height 14.5ex \space
      \kern  -.3em\space
      \raise  15ex \hbox {a}\space
      \raise  14.64ex \hbox {l}\space
      \kern    1em\space
      \raise  12.04ex \hbox {o}\space
      \raise  10.15ex \hbox {f}\space
      \kern    1em\space
      \raise  6.23ex \hbox {\bf  P}\space
      \raise  4.53ex \hbox {r}\space
      \raise  3.14ex \hbox {o}\space
      \raise  2.08ex \hbox {b}\space
      \raise  1.31ex \hbox {a}\space
      \raise  .78ex \hbox {b}\space
      \raise  .45ex \hbox {i}\space
      \raise  .24ex \hbox {l}\space
      \raise  .13ex \hbox {i}\space
      \raise  .06ex \hbox {t}\space
      \raise  .03ex \hbox {y}%
      }%
    }%
  }%EJPLOGO
\newcommand{\@ECPLOGO}{% designed when Ren\'e Carmona was in charge of ECP
  \raisebox{0.3cm}{\parbox[t]{1.3in}{\noindent\rule{1.3in}{1.6pt}\\
      \textbf{ ELECTRONIC}\\
      \textbf{ COMMUNICATIONS}\\
      \textbf{ in PROBABILITY}\\
      \rule[.08in]{1.3in}{1.6pt}}}%
  }%ECPLOGO
\def\@doiprefix{https://doi.org/}
\def\printdoi{\texttt{\href{\@doiprefix\@DOI}{\@doiprefix\@DOI}}}
\def\msc@url{https://ams.org/mathscinet/msc/msc2020.html}
%% for multiple thanks/support in title
\def\title@makefnmark{%
    \setbox\@tempboxa\hbox{\@textsuperscript{\normalfont\@thefnmark}}%
    \@ifundefined{prev@makefnmark@wd}%
        {\edef\prev@makefnmark@wd{0pt}}%
        {\edef\prev@makefnmark@wd{\the\dimexpr\prev@makefnmark@wd+\wd\@tempboxa\relax}}%
    \rlap{\hskip\prev@makefnmark@wd\unhbox\@tempboxa}%
    }
\def\title@thanks#1{\unskip\unkern\orig@thanks{#1}\ignorespaces}%
%% make title long
\renewcommand\title[1]{\gdef\@title{#1}}
%% Macro handling the first page
\def\papernum@name{no.}
\newcommand{\FIRSTPAGE}{%
  \setcounter{page}{\@PAGESTART}%
  \title{\small
    \let\orig@thanks\thanks
    \ifx\@EJP\undefined\else
      \if@ejpecp@preprint
        \phantom{\@EJPLOGO}\par
      \else
        \@EJPLOGO
      \fi
      \bigskip
      \if@ejpecp@preprint
        \null\null
      \else
        \centerline{\@JOURNALA\ \textbf{\@VOLUME} (\@YEAR),\
          \papernum@name\ \@PAPERNUM, \,\@PAGESTART--\@PAGEEND.}%
        \centerline{ISSN:\ \texttt{\href{\@FULLURL}{\@ISSN}} %
          \ifx\@DOI\undefined\else
            \ \printdoi
          \fi}%
      \fi
      \bigskip
      \bigskip
      \bgroup
        \@ifundefined{no@title@thanks@support}{%
            \let\thanks\title@thanks
            \let\@makefnmark\title@makefnmark
            \let\support\thanks
          }{}%
        \Large\bfseries\@TITLE\par
      \egroup
    \fi
    \ifx\@ECP\undefined
    \else
      \parbox[t]{9cm}{%
        \if@ejpecp@preprint
        \else
          \@JOURNALA\ \textbf{\@VOLUME} (\@YEAR),
          \papernum@name\ \@PAPERNUM, \@PAGESTART--\@PAGEEND.\\
          \ifx\@DOI\undefined
          \else
            \ \printdoi
          \fi \\
          ISSN:\ \texttt{\href{\@FULLURL}{\@ISSN}}%
        \fi
        }%
      \hfill
      \if@ejpecp@preprint
        \phantom{\@ECPLOGO}%
      \else
        \@ECPLOGO
      \fi\\
      \bigskip
      \bigskip
      \bgroup
        \@ifundefined{no@title@thanks@support}{%
            \let\thanks\title@thanks
            \let\@makefnmark\title@makefnmark
            \let\support\thanks
          }{}%
        \Large\@TITLE\par
      \egroup
    \fi
    }% end title
  \date{%
    \ifx\@DEDICATORY\undefined
    \else
      \noindent
      \emph{\small\sffamily\@DEDICATORY}%
    \fi}%
  \maketitle\thispagestyle{empty}%
  \begin{abstract}%
    \noindent
    \@ABSTRACT\par\vskip 1em\relax
    {\footnotesize
      \noindent\textbf{Keywords: }\@KEYWORDS.\par
      \noindent\href\msc@url{\textbf{MSC2020 subject classifications: }}%
      \ifx\@AMSSUBJSECONDARY\undefined
        \noindent
        \@AMSSUBJ.\par
      \else
        \noindent
        Primary \@AMSSUBJ, Secondary \@AMSSUBJSECONDARY.\par
      \fi
      \if@ejpecp@preprint
        \mbox{}\par
      \else
        \noindent
        Submitted to \@JOURNAL\ on \@SUBMITTED,
        final version accepted on \@ACCEPTED.\par
      \fi
      \ifx\@ARXIVID\undefined
      \else
        \noindent
        Supersedes
        \texttt{\href{https://arXiv.org/abs/\@ARXIVID}{arXiv:\@ARXIVID}}.%
      \fi\par
      \ifx\@HALID\undefined
      \else
        \noindent
        Supersedes
        \texttt{\href{https://hal.archives-ouvertes.fr/\@HALID}{HAL:\@HALID}}.%
      \fi\par
    }%footnotesize
  \end{abstract}

  \smallskip

  }%END-FIRSTPAGE
%% Macro setting the PDF title
\newcommand{\PDFFIELDS}{%
  \if@ejpecp@preprint
  \else
    \hypersetup{%
      pdftitle={\@JOURNALA\ \@VOLUME\ (\@YEAR), \papernum@name\ \@PAPERNUM, \@doiprefix\@DOI}}%
    \hypersetup{pdfproducer={\@JOURNAL\ Managing Editor https://\@URL}}%
    \hypersetup{pdfauthor={Please see \@doiprefix\@DOI}}%
  \fi
  \hypersetup{pdfkeywords={\@KEYWORDS}}%
  \hypersetup{pdfcreator={LaTeX with ejpecp.cls \@nameuse{ver@ejpecp.cls}}}%
  \hypersetup{pdfsubject={Probability Theory}}%
  }%END-PDFFIELDS

%% Supplement
\def\supplement@name{Supplementary Material}
\def\stitle#1{\def\@stitle{#1}}
\def\stitle@fmt#1{\textbf{#1.}\ }
\def\sdescription#1{\def\@sdescription{#1}}
\def\suppsection@fmt{\section*{\supplement@name}}
\long\def\supplement{\@ifnextchar[{\@supplement}{\@supplement[]}}
\long\def\@supplement[#1]{%
    \suppsection@fmt
    \global\let\suppsection@fmt\smallskip
    }
\def\endsupplement{%
    \@ifundefined{@stitle}%
        {}%
        {\stitle@fmt{\@stitle}}%
    %
    \@ifundefined{@sdescription}{}{\@sdescription}%
    \par
    }

%% Bibliography
\def\@MRExtract#1 #2!{#1}     % thanks, Martin!
\newcommand{\MR}[1]{% we need to strip the "(...)"
  \xdef\@MRSTRIP{\@MRExtract#1 !}%
  \href{https://mathscinet.ams.org/mathscinet-getitem?mr=\@MRSTRIP}{MR\@MRSTRIP}}
\newcommand{\ARXIV}[1]{\href{https://arXiv.org/abs/#1}{arXiv:#1}}
\def\bibliography@size{\small}
\renewenvironment{thebibliography}[1]
  {%
    \section*{\refname
      \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}}%
    \phantomsection
    \addcontentsline{toc}{section}{\refname}%
    \list{\@biblabel{\@arabic\c@enumiv}}%
    {\settowidth\labelwidth{\@biblabel{#1}}%
      \bibliography@size
      \setlength{\labelsep}{0.4em}%
      \setlength{\leftmargin}{\labelwidth}%
      \addtolength{\leftmargin}{\labelsep}%
      \setlength{\itemsep}{-.25em}%
      \@openbib@code
      \usecounter{enumiv}%
      \let\p@enumiv\@empty
      \renewcommand\theenumiv{\@arabic\c@enumiv}}%
    \sloppy\clubpenalty4000\@clubpenalty\clubpenalty\widowpenalty4000%
    \sfcode`\.\@m
  }{%
    \def\@noitemerr{%
      \@latex@warning{Empty `thebibliography' environment}}%
    \endlist
   }
%% Theorem styles
\ifx\@NOAMS\undefined
  \newtheoremstyle{ejpecpbodyit}% name % cf. thmtest.tex of AMSLaTeX
      {3pt}                     % Space above
      {3pt}                     % Space below
      {\itshape}                % Body font
      {}                        % Indent amount (empty = no indent,
                                %        \parindent = para indent)
      {\bfseries\sffamily}      % Thm head font
      {.}                       % Punctuation after thm head
      { }                       % Space after thm head: " " = normal interword space;
                                %                       \newline = linebreak
      {}                        % Thm head spec (can be left empty, meaning `normal')
      \newtheoremstyle{ejpecpbodyrm}% name % cf. thmtest.tex of AMSLaTeX
      {3pt}                     % Space above
      {3pt}                     % Space below
      {}                        % Body font
      {}                        % Indent amount (empty = no indent,
                                %        \parindent = para indent)
      {\bfseries\sffamily}      % Thm head font
      {.}                       % Punctuation after thm head
      { }                       % Space after thm head: " " = normal interword space;
                                %                       \newline = linebreak
      {}                        % Thm head spec (can be left empty, meaning `normal')
\fi
%%
\ifx\@NOAMS\undefined
  \theoremstyle{ejpecpbodyit}
\fi
\newtheorem{theorem}{Theorem}[section]
\newtheorem{assumptions}[theorem]{Assumptions}
\newtheorem{assumption}[theorem]{Assumption}
\newtheorem{claim}[theorem]{Claim}
\newtheorem{condition}[theorem]{Condition}
\newtheorem{conjecture}[theorem]{Conjecture}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{definitions}[theorem]{Definitions}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{facts}[theorem]{Facts}
\newtheorem{fact}[theorem]{Fact}
\newtheorem{heuristics}[theorem]{Heuristics}
\newtheorem{hypothesis}[theorem]{Hypothesis}
\newtheorem{hypotheses}[theorem]{Hypotheses}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{notations}[theorem]{Notations}
\newtheorem{notation}[theorem]{Notation}
\newtheorem{proposition}[theorem]{Proposition}
\ifx\@NOAMS\undefined
  \theoremstyle{ejpecpbodyrm}
\fi
\newtheorem{example}[theorem]{Example}
\newtheorem{exercise}[theorem]{Exercise}
\newtheorem{problem}[theorem]{Problem}
\newtheorem{question}[theorem]{Question}
\newtheorem{remark}[theorem]{Remark}
%% Numbering
\ifx\@NOAMS\undefined
  \numberwithin{equation}{section}
\fi
%% Itemize and enumerate for bera
\newcommand{\@reduceitemsep}{\addtolength{\itemsep}{-0.5\baselineskip}}
\let\OLD@itemize\itemize
\renewcommand\itemize{\OLD@itemize\@reduceitemsep}
\let\OLD@enumerate\enumerate
\renewcommand\enumerate{\OLD@enumerate\@reduceitemsep}
%% Replace \mathbb by \mathds except if we require the contrary
\ifx\@NODS\undefined
  \let\realmathbb=\mathbb
  \let\mathbb=\mathds
\fi
%% Headings
\def\write@ejpecp@lastpage{\immediate\write\@auxout{\string\xdef\string\ejpecp@lastpage{\the\c@page}}}
\newcommand{\@HBLOB}{%
  \href{\@doiprefix\@DOI}%
    {\@JOURNAL\ \textbf{\@VOLUME}\, (\@YEAR),\ paper \@PAPERNUM.}}
\renewcommand{\@evenfoot}{%
  \normalfont\footnotesize\if@ejpecp@preprint\mbox{}\else\@HBLOB\fi\hfil
  \small
  \write@ejpecp@lastpage
  \raisebox{-1em}{Page \thepage/\@PAGEEND}\hfil
  \footnotesize\if@ejpecp@preprint\mbox{}\else\href{\@FULLURL}{https://\@URL}\fi}
\renewcommand{\@oddfoot}{\@evenfoot}
\renewcommand{\@evenhead}{\hfil\@SHORTTITLE\hfil}
\renewcommand{\@oddhead}{\@evenhead}
%% smaller sections titles
\renewcommand{\section}{%
  \@startsection
      {section}
      {1}
      {0em}
      {\baselineskip}
      {0.5\baselineskip}
      {\normalfont\large\bfseries}}
\renewcommand{\subsection}{%
  \@startsection
      {subsection}
      {2}
      {0em}
      {\baselineskip}
      {0.25\baselineskip}
      {\normalfont\bfseries}}
\RequirePackage{afterpackage}
\AfterPackage{natbib}
{%
  \def\bibcleanup{\vskip-\lastskip\vskip10\p@}%
  \renewcommand{\bibfont}{\small}%
  \newlength{\standard@parsep}%
  \newlength{\standard@itemsep}%
  \setlength{\standard@parsep}{4.0pt plus 2.0pt minus 1.0pt}%
  \setlength{\standard@itemsep}{-2.02498pt}%
  \setlength{\bibsep}{\standard@parsep}%
  \addtolength{\bibsep}{\standard@itemsep}%
  \renewcommand\NAT@bibsetnum[1]%
  {%
    \settowidth\labelwidth{\@biblabel{#1}}%
    \setlength{\leftmargin}{\labelwidth}\addtolength{\leftmargin}{\labelsep}%
    \setlength{\labelsep}{3pt}%
    \setlength{\itemsep}{\bibsep}\setlength{\parsep}{\z@}%
    \ifNAT@openbib
    \addtolength{\leftmargin}{\bibindent}%
    \setlength{\itemindent}{-\bibindent}%
    \setlength{\listparindent}{\itemindent}%
    \setlength{\parsep}{0pt}%
    \fi
  }%
}%
\def\amp{&}%
\InputIfFileExists{ejpecp.cfg}
    {}
    {\def\papernum@name{article no.}}
%% Macros
\AtBeginDocument{\FIRSTPAGE\PDFFIELDS}
\AtEndDocument{\vfill}
\endinput
%%
%% End of file `ejpecp.cls'.
