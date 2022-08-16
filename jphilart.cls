%% This is file `jphilart.cls',
%% 
%% LaTeX 2e class file for articles in the journal:
%%   The Journal of Philosophy
%% published by The Journal of Philosophy, Inc.
%% https://www.journalofphilosophy.org/
%%
%% Macros written by Edgaras \v{S}akuras and Lolita Tolen\.{e}, 
%% VTeX Ltd., Lithuania for The Journal of Philosophy, Inc.
%% Please submit bugs or your comments to latex-support@vtex.lt
%%
%% You are free to use this class file as you see fit, provided 
%% that you do not make changes to the file. 
%% If you DO make changes, you are required to rename this file.
%%
%% It may be distributed under the terms of the LaTeX Project Public
%% License, as described in lppl.txt in the base LaTeX distribution.
%% Either version 1.0 or, at your option, any later version.
%% 
\NeedsTeXFormat{LaTeX2e}[2009/09/24]
\ProvidesClass{jphilart}
    [2022/08/16 v1.1.7 Typesetting articles for The Journal of Philosophy]
\ClassInfo{jphilart}{Copyright (c) 2020 Edgaras Sakuras and Lolita Tolene, 
    VTeX Ltd., Lithuania for JPHIL.}
\@input{jphilart-vtex.cfg}
\newif\if@leadarticle \@leadarticlefalse
\DeclareOption{leadarticle}{\@leadarticletrue}
\newif\if@noaug \@noaugfalse
\DeclareOption{noaug}{\@noaugtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[10pt,twoside]{article}
%%
%%  ======= LIB =======
%%
\RequirePackage{etoolbox}
\csuse{jphilart@ltxext}
\RequirePackage{ifpdf}
\RequirePackage{graphicx}
\csuse{jphilart@graphicx}
\ifcsundef{jobstart@date@info}%
    {\xdef\jobstart@date@info{\the\year\two@digits{\the\month}\two@digits{\the\day}}}%
    {}%
%%
%%  ======= INFO =======
%%
\def\@journal{The Journal of Philosophy}
\def\@issn{0022-362X}
\def\@eissn{1939-8549}
\def\@publisher{The Journal of Philosophy, Inc.}
%%
%%  ======= FONTS =======
%%
\csuse{jphilart@itcnbpro@addons}
\usepackage[T1]{fontenc}
\IfFileExists{t1pnb.fd}
    {
        \renewcommand{\rmdefault}{pnb}
        \xdef\jphilart@newbaskerville@alternative{0}
    }
    {
        \IfFileExists{Baskervaldx.sty}
            {
                \RequirePackage{Baskervaldx}
                \xdef\jphilart@newbaskerville@alternative{1}
            }
            {
                \ClassWarning{jphilart}{package Baskervaldx not found, using baskervald [and qtm for sc(it)] instead}
                \RequirePackage{baskervald}
                \xdef\jphilart@newbaskerville@alternative{2}
            }
    }
\ifcsundef{scitdefault}
    {\def\scitdefault{scit}}
    {}
\ifcsundef{scitshape}
    {
        \DeclareRobustCommand\scitshape{\not@math@alphabet\scitshape\relax
            \fontshape\scitdefault\selectfont}
    }
    {}
\ifcsundef{textscit}
    {\DeclareTextFontCommand{\textscit}{\scitshape}}
    {}
\ifcsundef{scshapepro}
    {\let\scshapepro\scshape}
    {\DeclareTextFontCommand{\textsc}{\scshapepro}}
\ifcsundef{addfontfeature}
    {\let\addfontfeature\@gobble}
    {}
\renewcommand{\sfdefault}{lmss}
\renewcommand{\ttdefault}{lmtt}
\RequirePackage{textcomp}
\RequirePackage[overload]{textcase}
\renewcommand\normalsize{%
    \@setfontsize\normalsize\@xpt\@xiipt
    \abovedisplayskip=10\p@ \@plus2\p@ \@minus5\p@
    \abovedisplayshortskip=\z@ \@plus3\p@
    \belowdisplayshortskip=6\p@ \@plus3\p@ \@minus3\p@
    \belowdisplayskip=\abovedisplayskip
    \let\@listi\@listI
    \@setfontsize\small\@xpt{12\p@ \@plus 0.3\p@ \@minus 0.3\p@}%
    }
\normalsize
\renewcommand\small{%
    \@setfontsize\small\@ixpt{11\p@ \@plus 0.2\p@ \@minus 0.2\p@}%
    \abovedisplayskip=8\p@ \@plus 3\p@ \@minus 3\p@
    \abovedisplayshortskip=\z@ \@plus2\p@
    \belowdisplayshortskip=4\p@ \@plus2\p@ \@minus2\p@
    \belowdisplayskip=\abovedisplayskip
    }
\renewcommand\footnotesize{%
    \@setfontsize\footnotesize\@viiipt{9\p@ \@plus 0.1\p@ \@minus 0.1\p@}%
    \abovedisplayskip=7\p@ \@plus3\p@ \@minus3\p@
    \abovedisplayshortskip=\z@ \@plus\p@
    \belowdisplayshortskip=3\p@ \@plus\p@ \@minus2\p@
    \belowdisplayskip=\abovedisplayskip
    \def\jphilart@display@size{%
        \def\@nomath####1{\let\@nomath\jphilart@save@nomath}\footnotesize
        }%
    }
%%  Increasing the first article letter
\ifcsundef{jphilart@lettrine@pkg}%
    {\def\jphilart@lettrine@pkg{lettrine}}%
    {}%
\RequirePackage\jphilart@lettrine@pkg
\setcounter{DefaultLines}{3}
\setlength{\DefaultNindent}{0pt}
\setlength{\DefaultFindent}{0.2em}
\ifcsundef{LettrineRealHeightfalse}
    {}
    {\LettrineRealHeightfalse}
\def\LettrineTextFont{\normalfont}
\def\LettrineSecondString{l}

%%  Math fonts
%  Set operators fonts with New Baskerville:
\DeclareSymbolFont{baskervaldxoperators}{T1}{\rmdefault}{m}{n}
\SetSymbolFont{baskervaldxoperators}{normal}{T1}{\rmdefault}{m}{n}
\SetSymbolFont{baskervaldxoperators}{bold}{T1}{\rmdefault}{b}{n}
%  Replace letters with New Baskerville:
\DeclareSymbolFont{baskervaldxletters}{T1}{\rmdefault}{m}{n}
\SetSymbolFont{baskervaldxletters}{normal}{T1}{\rmdefault}{m}{it}
\SetSymbolFont{baskervaldxletters}{bold}{T1}{\rmdefault}{b}{it}
%
%  Redefine math alphabets (\mathrm is set to operators)
\SetMathAlphabet{\mathrm}{normal}{T1}{\rmdefault}{m}{n}
\SetMathAlphabet{\mathrm}{bold}{T1}{\rmdefault}{b}{n}
\SetMathAlphabet{\mathit}{normal}{T1}{\rmdefault}{m}{it}
\SetMathAlphabet{\mathit}{bold}{T1}{\rmdefault}{b}{it}
\SetMathAlphabet{\mathbf}{normal}{T1}{\rmdefault}{b}{n}
\SetMathAlphabet{\mathsf}{normal}{T1}{\sfdefault}{m}{n}
\SetMathAlphabet{\mathtt}{normal}{T1}{\ttdefault}{m}{n}
%%  Set up letters:
\DeclareMathSymbol{a}{\mathalpha}{baskervaldxletters}{`a}
\DeclareMathSymbol{b}{\mathalpha}{baskervaldxletters}{`b}
\DeclareMathSymbol{c}{\mathalpha}{baskervaldxletters}{`c}
\DeclareMathSymbol{d}{\mathalpha}{baskervaldxletters}{`d}
\DeclareMathSymbol{e}{\mathalpha}{baskervaldxletters}{`e}
\DeclareMathSymbol{f}{\mathalpha}{baskervaldxletters}{`f}
\DeclareMathSymbol{g}{\mathalpha}{baskervaldxletters}{`g}
\DeclareMathSymbol{h}{\mathalpha}{baskervaldxletters}{`h}
\DeclareMathSymbol{i}{\mathalpha}{baskervaldxletters}{`i}
\DeclareMathSymbol{j}{\mathalpha}{baskervaldxletters}{`j}
\DeclareMathSymbol{k}{\mathalpha}{baskervaldxletters}{`k}
\DeclareMathSymbol{l}{\mathalpha}{baskervaldxletters}{`l}
\DeclareMathSymbol{m}{\mathalpha}{baskervaldxletters}{`m}
\DeclareMathSymbol{n}{\mathalpha}{baskervaldxletters}{`n}
\DeclareMathSymbol{o}{\mathalpha}{baskervaldxletters}{`o}
\DeclareMathSymbol{p}{\mathalpha}{baskervaldxletters}{`p}
\DeclareMathSymbol{q}{\mathalpha}{baskervaldxletters}{`q}
\DeclareMathSymbol{r}{\mathalpha}{baskervaldxletters}{`r}
\DeclareMathSymbol{s}{\mathalpha}{baskervaldxletters}{`s}
\DeclareMathSymbol{t}{\mathalpha}{baskervaldxletters}{`t}
\DeclareMathSymbol{u}{\mathalpha}{baskervaldxletters}{`u}
\DeclareMathSymbol{v}{\mathalpha}{baskervaldxletters}{`v}
\DeclareMathSymbol{w}{\mathalpha}{baskervaldxletters}{`w}
\DeclareMathSymbol{x}{\mathalpha}{baskervaldxletters}{`x}
\DeclareMathSymbol{y}{\mathalpha}{baskervaldxletters}{`y}
\DeclareMathSymbol{z}{\mathalpha}{baskervaldxletters}{`z}
\DeclareMathSymbol{A}{\mathalpha}{baskervaldxletters}{`A}
\DeclareMathSymbol{B}{\mathalpha}{baskervaldxletters}{`B}
\DeclareMathSymbol{C}{\mathalpha}{baskervaldxletters}{`C}
\DeclareMathSymbol{D}{\mathalpha}{baskervaldxletters}{`D}
\DeclareMathSymbol{E}{\mathalpha}{baskervaldxletters}{`E}
\DeclareMathSymbol{F}{\mathalpha}{baskervaldxletters}{`F}
\DeclareMathSymbol{G}{\mathalpha}{baskervaldxletters}{`G}
\DeclareMathSymbol{H}{\mathalpha}{baskervaldxletters}{`H}
\DeclareMathSymbol{I}{\mathalpha}{baskervaldxletters}{`I}
\DeclareMathSymbol{J}{\mathalpha}{baskervaldxletters}{`J}
\DeclareMathSymbol{K}{\mathalpha}{baskervaldxletters}{`K}
\DeclareMathSymbol{L}{\mathalpha}{baskervaldxletters}{`L}
\DeclareMathSymbol{M}{\mathalpha}{baskervaldxletters}{`M}
\DeclareMathSymbol{N}{\mathalpha}{baskervaldxletters}{`N}
\DeclareMathSymbol{O}{\mathalpha}{baskervaldxletters}{`O}
\DeclareMathSymbol{P}{\mathalpha}{baskervaldxletters}{`P}
\DeclareMathSymbol{Q}{\mathalpha}{baskervaldxletters}{`Q}
\DeclareMathSymbol{R}{\mathalpha}{baskervaldxletters}{`R}
\DeclareMathSymbol{S}{\mathalpha}{baskervaldxletters}{`S}
\DeclareMathSymbol{T}{\mathalpha}{baskervaldxletters}{`T}
\DeclareMathSymbol{U}{\mathalpha}{baskervaldxletters}{`U}
\DeclareMathSymbol{V}{\mathalpha}{baskervaldxletters}{`V}
\DeclareMathSymbol{W}{\mathalpha}{baskervaldxletters}{`W}
\DeclareMathSymbol{X}{\mathalpha}{baskervaldxletters}{`X}
\DeclareMathSymbol{Y}{\mathalpha}{baskervaldxletters}{`Y}
\DeclareMathSymbol{Z}{\mathalpha}{baskervaldxletters}{`Z}
%  Digits are from operators
\DeclareMathSymbol{0}{\mathalpha}{baskervaldxoperators}{`0}
\DeclareMathSymbol{1}{\mathalpha}{baskervaldxoperators}{`1}
\DeclareMathSymbol{2}{\mathalpha}{baskervaldxoperators}{`2}
\DeclareMathSymbol{3}{\mathalpha}{baskervaldxoperators}{`3}
\DeclareMathSymbol{4}{\mathalpha}{baskervaldxoperators}{`4}
\DeclareMathSymbol{5}{\mathalpha}{baskervaldxoperators}{`5}
\DeclareMathSymbol{6}{\mathalpha}{baskervaldxoperators}{`6}
\DeclareMathSymbol{7}{\mathalpha}{baskervaldxoperators}{`7}
\DeclareMathSymbol{8}{\mathalpha}{baskervaldxoperators}{`8}
\DeclareMathSymbol{9}{\mathalpha}{baskervaldxoperators}{`9}

%%  Settings for paragraph breaking
\pretolerance=100
\tolerance=800
\hbadness=800
%%
%%  ======= PAGE LAYOUT =======
%%
\setlength{\paperwidth}{6in}
\setlength{\paperheight}{9in}
\ifpdf
    \ifcsundef{pdfpagewidth}
    {\pagewidth=\paperwidth \pageheight=\paperheight}
    {\pdfpagewidth=\paperwidth \pdfpageheight=\paperheight}
\else
    \AtBeginDvi{\special{papersize=\the\paperwidth,\the\paperheight}}
\fi
\hoffset=-1in
\voffset=-1in
\setlength{\textwidth}{4.15in}
\setlength{\textheight}{42\baselineskip}% 43 lines
\addtolength\textheight{\topskip}
\setlength\oddsidemargin{66pt}
\setlength\evensidemargin{67.6pt}
\setlength\topmargin{42pt}
\setlength\headheight{10\p@}
\setlength\headsep{16\p@}
%  Font size of all environment types is set to 9 pt (\small).
%  Also their left/right margins are set to the \parindent size.
\parindent=10pt
\csuse{jphilart@outputpage}
%%
%%  ======= PREAMBLE =======
%%
% macros for custom numeration system
\def\setvaluelist#1#2{%
  \@tempcnta=0\relax
  \expandafter\protected@xdef\csname #1@item@0\endcsname{\the\@tempcnta}%
  \@for\@curr@val:=#2\do{%
     \advance\@tempcnta by1\relax
     \expandafter\protected@xdef\csname #1@item@\the\@tempcnta\endcsname{\@curr@val}%
     }%
}
\xdef\getitemvalue#1#2{\noexpand\csname #1@item@#2\endcsname}

\def\pubyear#1{\gdef\@pubyear{#1}\gdef\@copyrightyear{#1}}
\def\@pubyear{0}
\def\@copyrightyear{0}

\setvaluelist{month}{January,February,March,April,May,June,July,August,September,October,November,December}

% get multi value separated by comma
% currently used for issue and pubmonth
\def\get@and@set@multi@value#1#2{%
    \csundef{multi@#1@first}%
    \csundef{multi@#1@last}%
    \def\do##1{%
        \ifcsundef{multi@#1@first}%
            {%
                \csxdef{multi@#1@first}{##1}%
            }%
            {%
                \csxdef{multi@#1@last}{##1}%
                \ifnum\temp@multi@prev<\csuse{multi@#1@last}%
                \else
                    \@latex@error{wrong order of #1 numbers: current value \csuse{multi@#1@last} is equal or 
                        less than previous \temp@multi@prev}{}%
                \fi
            }%
            \edef\temp@multi@prev{##1}%
        }%
    \docsvlist{#2}%
    \ifcsundef{multi@#1@last}%
        {\csxdef{@#1}{\csuse{multi@#1@first}}}%
        {\csxdef{@#1}{\csuse{multi@#1@first}\csuse{multi@#1@sep}\csuse{multi@#1@last}}}%
    }

\def\multi@pubmonth@sep{/}

\def\pubmonth#1{\get@and@set@multi@value{pubmonth}{#1}}
\def\@pubmonth{0}

\def\volume#1{\gdef\@volume{#1}}
\gdef\@volume{0}

\def\multi@issue@sep{/}

\def\issue#1{\get@and@set@multi@value{issue}{#1}}
\gdef\@issue{0}

\newcounter{firstpage}
\newcounter{lastpage}
\def\firstpage#1{%
    \def\@tempa{#1}%
    \ifx\@tempa\@empty
    \else
        \global\c@firstpage=#1
        \global\c@lastpage=#1
        \global\c@page=#1
        \ignorespaces
    \fi
    }
\def\lastpage#1{%
    \def\@tempa{#1}%
    \ifx\@tempa\@empty
    \else
        \global\c@lastpage=#1
        \ignorespaces
    \fi
    }
\def\pagerange@sep{--}
\def\set@pagerange{%
  \ifnum\c@firstpage=0%
  \else%
     \ifnum\c@firstpage=\c@lastpage%
        \gdef\@pagerange{\thefirstpage}%
     \else%
        \gdef\@pagerange{\thefirstpage\pagerange@sep\thelastpage}%
     \fi%
   \fi}
\def\@pagerange{0}

\def\pagenumbering#1{%
    \gdef\thefirstpage{\csname @#1\endcsname\c@firstpage}%
    \gdef\thelastpage{\csname @#1\endcsname\c@lastpage}%
    \gdef\thepage{\csname @#1\endcsname\c@page}%
    }
\csuse{jphilart@checklpage}

\def\startlocaldefs{\makeatletter}
\def\endlocaldefs{\makeatother}
%%
%%  >>>>>>> FRONTMATTER >>>>>>>
%%
\def\frontmatter{%
    \parindent=\z@
    \def\fnms##1{##1}%
    \def\snm##1{##1}%
    \let\@fntextsuperscript\fm@fntextsuperscript
    \let\@@fntextsuperscript\fm@@fntextsuperscript
    \global\let\maketitle\relax
    \protected\def\thanks{\@latex@error{\noexpand\thanks outside \noexpand\title command argument}{}}%
    \ignorespaces
    }
\def\endfrontmatter{%
    \ignorespacesafterend
    \global\@topnum\z@  % Prevents figures from going at top of page.
    \set@pagerange
    \thispagestyle{copyright}%
    \enlargethispage{-35\p@}%
    \emergencystretch=1pc
    \@thanks
    \global\c@footnote\z@
    \global\let\@thanks\@empty
    \let\title\relax
    \let\author\relax
    \let\frontmatter\relax
    \let\endfrontmatter\relax
    \let\@maketitle\relax
    \let\@@maketitle\relax
    \bgroup
        \def\pagerange@sep{-}%
        \hypersetup{%
            pdftitle={\metadata@title},%
            pdfauthor={\metadata@authors},%
            pdfsubject={\@journal, \@pubyear, volume \@volume, no. \@issue, \@pagerange},%
            pdfkeywords={},%
            }%
    \egroup
    \aftergroup\frontmatter@cmd
    }

\def\frontmatter@cmd{\@afterindentfalse\@afterheading}
%%
%%  ======= FOOTNOTES =======
%%
\setlength{\footnotesep}{6.45\p@}
\gdef\split@prev@footnote{0}
\def\footnoterule{\relax
    \ifnum\split@prev@footnote=\z@
    \else
        \kern-16\p@ \hrule \@height .5\p@\kern15.5\p@
    \fi
    \xdef\split@prev@footnote{\the\insertpenalties}%
  }%
\setlength{\skip\footins}{24\p@ \@plus 8\p@ \@minus 4\p@}
\def\@fntextsuperscript#1{{\m@th\raisebox{.95ex}[\z@][\z@]{\mbox{\fontsize{.6em}\z@#1}}}}
\def\fm@fntextsuperscript#1{{\m@th\raisebox{.52ex}[\z@][\z@]{\mbox{#1}}}}
\def\@@fntextsuperscript#1{{\m@th\raisebox{.9ex}[\z@][\z@]{\mbox{\fontsize{.6125em}\z@#1}}}}
\def\fm@@fntextsuperscript#1{{\m@th\raisebox{.52ex}[\z@][\z@]{\mbox{#1}}}}
\def\@makefnmark{\mbox{\@fntextsuperscript{\normalfont\@thefnmark}}}
\def\@makefntextmark{\mbox{\@@fntextsuperscript{\normalfont\@thefnmark}}}
\renewcommand\@makefntext[1]{%
    \parindent=10\p@
    \csuse{jphil@footnote@hook}%
    \@makefntextmark\hskip.15em#1%
    }
%%
%%  ======= RUNNING HEAD =======
%%
\def\runtitle#1{\gdef\@runtitle{#1}}
\def\@runtitle{}
\def\runauthor#1{\gdef\@runauthor{#1}}
\def\@runauthor{}
%%
%%  ======= TITLE =======
%%
\newcounter{thanks}
\def\thethanks{\@fnsymbol\c@thanks}
\def\freefootnotetext[#1]{\begingroup\unrestored@protected@xdef\@thefnmark{#1}\endgroup\@footnotetext}
\protected\def\jphilart@thanks#1{%
    \stepcounter{thanks}%
    \def\thefootnote{\thethanks}%
    \footnotemark
    \protected@xdef\@thanks{\@thanks
        \protect\freefootnotetext[\thethanks]{#1}}%
}
\def\metadata@title{}
\def\title#1{%
    \gdef\metadata@title{#1}%
    \vspace*{\pretitle@skip}%% gives ~6.8mm
    \bgroup
        \title@style
        \def\thanks##1{\NoCaseChange{\jphilart@thanks{##1}}}%
        \MakeUppercase{#1}%
        \par
    \egroup
    \vspace*{\posttitle@skip}%% gives ~6.3mm
    }
\csdef{title@ends@with@\detokenize{?}@symbol}{1}
\csdef{title@ends@with@\detokenize{!}@symbol}{1}
\def\check@title@end@symbol#1#2\@nil{%
    \ifx&#2&%
        \ifcsundef{title@ends@with@\detokenize{#1}@symbol}%
            {}%
            {\edef\title@ends@with@symbol{1}}%
    \else
        \check@title@end@symbol#2\@nil
    \fi
    }
\def\subtitle#1{%
    \bgroup
        \no@harm
        \xdef\jphilart@tmp@title{\metadata@title}%
    \egroup
    \expandafter\check@title@end@symbol\jphilart@tmp@title\@nil
    \@ifundefined{title@ends@with@symbol}%
        {\gappto\metadata@title{. #1}}%
        {\gappto\metadata@title{\space #1}}%
    \vspace*{\presubtitle@skip}%
    \bgroup
        \title@style
        \def\thanks##1{\NoCaseChange{\jphilart@thanks{##1}}}%
        \MakeUppercase{#1}%
        \par
    \egroup
    \vspace*{\postsubtitle@skip}
    }

\if@leadarticle
    \def\pretitle@skip{83.2\p@}
    \def\posttitle@skip{2\p@}
    \def\presubtitle@skip{3.9\p@}
    \def\postsubtitle@skip{3.5\p@}
\else
    \def\pretitle@skip{-12\p@}
    \def\posttitle@skip{3.5\p@}
    \def\presubtitle@skip{2.4\p@}
    \def\postsubtitle@skip{3.5\p@}
\fi
\def\title@style{\centering}
%%
%%  ======= AUTHOR GROUP =======
%%
\def\smart@par{\ifhmode\par\fi}

\newcounter{jphil@aug}
\newenvironment{aug}%
    {%
        \stepcounter{jphil@aug}%
        \expandafter\newbox\csname jphil@aug@\arabic{jphil@aug}\endcsname
        \expandafter\expandafter\expandafter\global
            \expandafter\setbox\csname jphil@aug@\arabic{jphil@aug}\endcsname=\vbox
            \bgroup
                \hsize=\textwidth
    }{%
                \format@single@aug@addresses
            \egroup
        \setcounter{jphil@author}{0}%
        \setcounter{jphil@address}{0}%
        \smart@par
    }

%  Print author and address by number: \printaddressnum{1}
\def\printauthornum#1{%
    \xdef\@tmp{#1}%
    \bgroup
        \@ifundefined{@jphil@author@#1}%
            {%
                 \@latex@error{Error: there is no author with number '#1'!}{??}%
            }{%
                \scshapepro
                \MakeLowercase{%
                    \expandafter\expandafter\expandafter\the\csname @jphil@author@\@tmp\endcsname
                    }%
            }%
    \egroup
    }
\def\printaddressnum#1{%
    \xdef\@tmp{#1}%
    \bgroup
        \@ifundefined{@jphil@address@#1}%
            {%
                 \@latex@error{Error: there is no address with number '#1'!}{??}%
            }{%
                 \expandafter\expandafter\expandafter\the\csname @jphil@address@\@tmp\endcsname
            }%
    \egroup
    }

\def\format@single@aug@addresses{%
    \@tempcnta=0%
    \bgroup
        \parindent\z@
        \@whilenum{\@tempcnta<\c@jphil@author}\do{%
            \advance\@tempcnta\@ne
            \hfill
            \expandafter\printauthornum{\the\@tempcnta}%
            \par
            }%
    \egroup
    \bgroup
        \parindent\z@
        \@whilenum{\@tempcnta<\c@jphil@address}\do{%
            \advance\@tempcnta\@ne
            \expandafter\printaddressnum{\the\@tempcnta}%
            \par
            }%
    \egroup
    }

\def\printaddresses{%
    \smart@par
    \if@noaug
    \else
        \newcount\local@counter
        \loop
            \advance\local@counter+1\relax
            \bigskip
            \expandafter\unvbox\csname jphil@aug@\the\local@counter\endcsname
        \ifnum \local@counter<\c@jphil@aug
        \repeat
    \fi
    }
\AtEndDocument{\printaddresses}
%%
%%  ======= AUTHORS =======
%%
\newcounter{jphil@author}
\def\author{\@ifnextchar[{\author@fmt}{\author@fmt[]}}
\def\metadata@authors{}

\def\author@fmt[#1]#2{%
    \stepcounter{jphil@author}%
    \ifnum\c@jphil@author>\@ne
        \gappto\metadata@authors{, #2}%
    \else
        \gappto\metadata@authors{#2}%
    \fi
    \expandafter\protected@xdef\csname jphil@author@ref@#1\endcsname{\the\c@jphil@author}%
    \expandafter\newtoks\csname @jphil@author@\the\c@jphil@author\endcsname
    \expandafter\expandafter\expandafter\global\csname @jphil@author@\the\c@jphil@author\endcsname={#2}%
    }
%%
%%  ======= ADDRESS =======
%%
\newcounter{jphil@address}
\def\address{\@ifnextchar[{\address@fmt}{\address@fmt[default]}}

\def\address@fmt[#1]#2{%
    \stepcounter{jphil@address}%
    \expandafter\protected@xdef\csname jphil@address@ref@#1\endcsname{\the\c@jphil@address}%
    \expandafter\newtoks\csname @jphil@address@\the\c@jphil@address\endcsname
    \expandafter\expandafter\expandafter\global\csname @jphil@address@\the\c@jphil@address\endcsname={#2}%
    }
%%
%%  <<<<<<< FRONTMATTER <<<<<<<
%%
%%
%%  ======= FLOATS =======
%%
\gappto\@floatboxreset{\footnotesize\centering}
\tabcolsep=4pt
\preto\@tabular{\renewcommand{\arraystretch}{1.33}}
\setlength\abovecaptionskip{9\p@}
\def\empty@makecaption{\ignorespaces }
\long\def\@makecaption#1#2{%
    \def\@tmp{#2}%
    \vskip\abovecaptionskip
    \bgroup
        \footnotesize
        \parindent=9\p@
        \narrower
        \noindent #1%
        \ifx\@tmp\empty@makecaption\else. #2\fi
        \par
    \egroup
    \vskip\belowcaptionskip
    }
%%
%%  ======= SECTIONING =======
%%
%  The following two definitions are taken from amsthm package
%  for optional punctuation after section title
\def\@addpunct#1{%
    \relax
    \ifhmode
        \ifnum\spacefactor>\@m%
        \else
            #1%
        \fi
    \fi
    }
\def\frenchspacing{%
    \sfcode`\.1006%
    \sfcode`\?1005%
    \sfcode`\!1004%
    \sfcode`\:1003%
    \sfcode`\;1002%
    \sfcode`\,1001%
    }
%%  Mandatory punctuation after section counter
\renewcommand{\@seccntformat}[1]{\csname the#1\endcsname.\space}

\def\thesection{\Roman{section}}
\def\thesection@for@ref{{\scshapepro\roman{section}}}

%% Subsections etc. must be indented
\newif\if@subsection@@indent
\def\check@if@after@section{%
    \if@nobreak
        %%  After \section no indent is required
        \@subsection@@indentfalse
    \else
        \@subsection@@indenttrue
    \fi
    }
\def\@subsection@indent{%
    \if@subsection@@indent
        \indent
    \fi
    }
%%  A negative value in the 5th argument to \@startsection means "run in" and
%%  insert its absolute value as horizontal space between the heading and the next word of the paragraph
\def\hspace@after@section{%
    -\fontdimen2\font \@plus -\fontdimen3\font \@minus -\fontdimen4\font
    \check@if@after@section
    }

%%  First section level
%%  A negative value in the 4th argument to \@startsection means that first paragraph after the heading will not be indented,
%%  and the absolute value of the length is inserted before the heading
\def\section@prefix{}
\def\section@style{\normalfont\normalsize\scshapepro\MakeLowercase}
\newcommand\jphil@section{%
    \@startsection{section}%
                  {1}%
                  {\z@}%
                  {-0.67\baselineskip \@plus-.1ex \@minus -.2ex}%
                  {0.25\baselineskip \@plus.2ex}%
                  {\centering\section@prefix\section@style}%
    }
\let\section\jphil@section                                      

%%  Formatting the appendix section 
\newif\ifappendix@star@ 
\def\jphil@appsectionstar{\global\appendix@star@true\jphil@section}
\def\jphil@appsectionnostar{\global\appendix@star@false\jphil@section}
\def\jphil@appsection{\@ifnextchar*{\jphil@appsectionstar}{\jphil@appsectionnostar}}
\appto\appendix{%
    \def\section@prefix{\section@style{\appendixname\ifappendix@star@.\fi\space}}%
    \let\section\jphil@appsection
    \def\thesection@for@ref{{\scshapepro\@alph\c@section}}%
    }

%%  Second etc. section levels
\renewcommand\subsection{%
    \@startsection{subsection}%
                  {2}%
                  {\z@}
                  {\z@}%
                  {\hspace@after@section}%
                  {\@subsection@indent\raggedright\normalfont\normalsize\itshape}%
    }
\let\article@subsection\subsection
\def\subsection{\secdef{\article@asubsection}{\article@bsubsection}}
\def\article@asubsection[#1]#2{\article@subsection[#1]{#2\@addpunct{.}}}
\def\article@bsubsection#1{\article@subsection*{#1\@addpunct{.}}}
\renewcommand\subsubsection{%
    \@startsection{subsubsection}%
                  {3}%
                  {\z@}%
                  {\z@}%
                  {\hspace@after@section}%
                  {\@subsection@indent\normalfont\normalsize\itshape}%
    }
\let\article@subsubsection\subsubsection
\def\subsubsection{\secdef{\article@asubsubsection}{\article@bsubsubsection}}
\def\article@asubsubsection[#1]#2{\article@subsubsection[#1]{#2\@addpunct{.}}}
\def\article@bsubsubsection#1{\article@subsubsection*{#1\@addpunct{.}}}
\renewcommand\paragraph{%
    \@startsection{paragraph}%
                  {4}%
                  {\z@}%
                  {\z@}%
                  {\hspace@after@section}%
                  {\@subsection@indent\normalfont\normalsize\itshape}%
    }
\let\article@paragraph\paragraph
\def\paragraph{\secdef{\article@aparagraph}{\article@bparagraph}}
\def\article@aparagraph[#1]#2{\article@paragraph[#1]{#2\@addpunct{.}}}
\def\article@bparagraph#1{\article@paragraph*{#1\@addpunct{.}}}
\renewcommand\subparagraph{%
    \@startsection{subparagraph}%
                  {5}%
                  {\z@}%
                  {\z@}%
                  {\hspace@after@section}%
                  {\@subsection@indent\normalfont\normalsize\itshape}%
    }
\let\article@subparagraph\subparagraph
\def\subparagraph{\secdef{\article@asubparagraph}{\article@bsubparagraph}}
\def\article@asubparagraph[#1]#2{\article@subparagraph[#1]{#2\@addpunct{.}}}
\def\article@bsubparagraph#1{\article@subparagraph*{#1\@addpunct{.}}}
% 
% from source2e.pdf, todo: not necessary for >=TL2020
\CheckCommand*\refstepcounter[1]{%
    \stepcounter{#1}%
    \protected@edef\@currentlabel{\csname p@#1\endcsname\csname the#1\endcsname}%
    }
\renewcommand*\refstepcounter[1]{%
    \stepcounter{#1}%
    \protected@edef\@currentlabel{\csname p@#1\expandafter\endcsname\csname the#1\endcsname}%
    }
% Reference to a first-level section outputs in small caps
\def\p@section#1{\csname thesection@for@ref\endcsname}
\AtBeginDocument{\csuse{jphilart@sectionref}}
%%
%%  ======= MATH =======
%%
%  Font size of all display math environments is set to 9 pt (\small).
%  Also their left/right margins are set to the \parindent size.
\RequirePackage[leqno,fleqn,tbtags]{amsmath}
\allowdisplaybreaks[2]
\RequirePackage{amssymb}
\let\jphilart@save@nomath\@nomath
\def\jphilart@display@size{\def\@nomath##1{\let\@nomath\jphilart@save@nomath}\small}
\everydisplay\expandafter{\the\everydisplay\jphilart@display@size}
%  Indent display math
\setlength{\mathindent}{\parindent}
\appto\jphil@footnote@hook{\setlength{\mathindent}{\parindent}}
%  Indent display math tag but not a reference
%  in case \tag{<tag>}
\def\tagform@#1{\maketag@@@{\protect\indent(\ignorespaces#1\unskip\@@italiccorr)}}
\renewcommand{\eqref}[1]{\textup{\let\indent\@empty\tagform@{\ref{#1}}}}
%  in case \tag*{<tag>}
\def\make@df@tag@@#1{%
    \gdef\df@tag{\maketag@@@{\protect\indent#1}\def\@currentlabel{#1}}%
    }
%%
%%  >>>>>>> ENVIRONMENTS >>>>>>>
%%
%  Font size of all environment types is set to 9 pt (\small).
%  Also their left/right margins are set to the \parindent size.
%%
%%  ======= LIST ENVIRONMENTS =======
%%
%  Items are indented with parindent and aligned on the left
\setlength\labelsep{.5\parindent}
\setlength{\leftmargini}{3\parindent}
\setlength{\leftmarginii}{2\parindent}
\setlength{\labelwidth}{1.5\parindent}
\def\list@rightmargin{\parindent}
\def\list@itemindent{\z@}
\def\list@size{\small}
\def\list@topsep{8.0\p@ \@plus 3.0\p@ \@minus 2.0\p@}
\appto\jphil@footnote@hook{%
    \def\list@size{\footnotesize}%
    \def\list@topsep{6.0\p@ \@plus 3.0\p@ \@minus 2.0\p@}%
    }
\def\list@settings{%
    \list@size
    \def\makelabel##1{\nobreak ##1\hfill}%
    \itemindent=\list@itemindent
    \rightmargin=\list@rightmargin
    \itemsep=\z@
    \parsep=\z@
    %%  In text math alignes with text parindent.
    %%  Text in lists does not have it,
    %%  therefore math is not indented either
    \setlength{\mathindent}{\z@}%
    }
\def\@labelwidthexceeded{0pt}
\def\do#1{%
    \csletcs{jphilart@save@#1}{#1}%
    \csletcs{jphilart@save@end#1}{end#1}%
    \renewenvironment{#1}[1][]%
        {%
            \settowidth\@tempdima{##1}%
            \ifdim\@tempdima>\labelwidth
                \edef\@labelwidthexceeded{\the\dimexpr\@tempdima-\labelwidth\relax}%
                \labelwidth=\@tempdima
            \else
                \edef\@labelwidthexceeded{0pt}%
            \fi
            \preto\@trivlist{%
                \edef\saved@leftskip{\the\leftskip}%
                }%
            \appto\@trivlist{%
                \advance\leftmargin\saved@leftskip
                \list@settings
                \ifdim\@labelwidthexceeded>\z@
                    \advance\leftmargin by \@labelwidthexceeded
                \fi
                }%
            \csuse{jphilart@save@#1}%
        }%
        {%
            \csuse{jphilart@save@end#1}%
        }%
    }
\docsvlist{itemize,enumerate}
\def\@listI{%
    \leftmargin=\leftmargini
    \topsep=\list@topsep
    }
\def\do#1{%
    \csappto{@list#1}{%
        \topsep=\z@
        }%
    }
\docsvlist{ii,iii,iv}

%  to \ref{lab1} enumerate items: \item[aaa]\label{lab1}
\let\jphilart@save@item\@item
\def\@item[#1]{%
    \if@noitemarg
    \else
        \if@nmbrlist
            \protected@edef\@currentlabel{#1}%
        \fi
    \fi
    \jphilart@save@item[#1]%
    }
%%
%%  ======= QUOTE ENVIRONMENTS =======
%%
\def\quote{%
    \list{}{\listparindent\quote@indent
            \itemindent\listparindent
            \rightmargin\quote@rightmargin
            \leftmargin\quote@leftmargin
            \partopsep\z@
            \parsep\z@
            \topsep=\list@topsep
            }%
    \item\relax
    \list@size
    \@listdepth=\z@
    }
\def\endquote{%
    \@listdepth=\@ne
    \endlist
    }

\def\quote@indent{\z@}
\def\quote@leftmargin{\parindent}
\def\quote@rightmargin{\parindent}
\appto\jphil@footnote@hook{%
    \def\quote@leftmargin{\parindent}%
    \def\quote@rightmargin{\parindent}%
    }

\let\quotation\quote
\let\endquotation\endquote
%%
%%  ======= ENUNCIATIONS =======
%%
\RequirePackage{amsthm}

\def\before@thm@skip{7.0pt plus 2.0pt minus 4.0pt}
\def\after@thm@skip{6.0pt plus 2.0pt minus 4.0pt}
\newtheoremstyle{romantheorem}%
    {\before@thm@skip}%
    {\after@thm@skip}%
    {\narrower\list@size}%
    {}%
    {\itshape}%
    {.}%
    { }%
    {\thmname{#1}\thmnumber{ #2}\thmnote{ {\itshape(#3)}}}%
\theoremstyle{romantheorem}%
\gappto\@endtheorem{\@endpetrue}

\def\before@proof@skip{4.0pt plus 2.0pt minus 4.0pt}
\def\after@proof@skip{\medskipamount}
\renewenvironment{proof}[1][\proofname]%
    {%
        \par
        \list@size
        \bgroup
            \topsep\before@proof@skip
            \trivlist
                \narrower
                \item\relax
                {\itshape#1\@addpunct{.}}\
                \ignorespaces
    }{%
                \qedsymbol
                \let\@topsepadd\after@proof@skip
            \endtrivlist
        \egroup
        \@endpefalse
    }
\appto\trivlist{%
    \setlength{\labelwidth}{1.5\parindent}%
}
%%  <<<<<<< ENVIRONMENTS <<<<<<<
%%
%%
%%  ======= SETTINGS =======
%%
\ifnum\jobstart@date@info>20220420\relax
    \brokenpenalty=0
\else
    \brokenpenalty=10000
\fi
\clubpenalty=10000
\widowpenalty=10000
\def\header@size{\normalsize}
\def\headernumber@size{\normalsize}
\def\copyright@size{\footnotesize}
\def\copyright@symbol{{\usefont{U}{psy}{m}{n}\selectfont\symbol{'343}}}
%%
%%  ======= HEADER =======
%%
\def\ps@headings{%
    \let\@oddfoot\@empty
    \let\@evenfoot\@empty
    \def\@oddhead{{\header@size\hfill
        {\scshapepro\MakeLowercase{\@runtitle}}%
    \hfill\llap{\headernumber@size\thepage}}}%
    \def\@evenhead{{\header@size\rlap{\headernumber@size\thepage}\hfill
        {\scshapepro\MakeLowercase{\@journal}}\hfill}}%
    \let\@mkboth\@gobbletwo
    \let\sectionmark\@gobble
    \let\subsectionmark\@gobble
    }
% range 0-9999
\def\two@digits@lasttwo#1{%
    \@tempcnta=#1
    \ifnum\@tempcnta>\m@ne
        \ifnum\@tempcnta>9
            \ifnum\@tempcnta>99
                \ifnum\@tempcnta>999
                    \ifnum\@tempcnta>9999
                    !!%
                    \else
                        \expandafter\@gobbletwo\the\@tempcnta
                    \fi
                \else
                    \expandafter\@gobble\the\@tempcnta
                \fi
            \else
                \the\@tempcnta
            \fi
        \else
            0\the\@tempcnta%
        \fi
    \else
        !!%
    \fi
    }
\def\copyrightholder#1{\gdef\copyright@holder{#1}}
\@onlypreamble\copyrightholder
\def\copyright@text{%
    \raisebox{15mm}[\z@][\z@]{\hb@xt@\textwidth{\copyright@size
        \@issn/\two@digits@lasttwo\@pubyear/%
        \two@digits@lasttwo\@volume%
        \@ifundefined{multi@issue@last}
            {\two@digits@lasttwo{\@issue}}
            {\two@digits@lasttwo{\csuse{multi@issue@first}}-\two@digits@lasttwo{\csuse{multi@issue@last}}}/%
        \@pagerange
        \hfill
        \copyright@symbol\hskip.33em\@copyrightyear\ \@ifundefined{copyright@holder}{\@publisher}{\copyright@holder}%
        }}%
    }
\if@leadarticle
\def\ps@copyright{%
    \def\@oddfoot{%
        \rlap{\raisebox{28.6\p@}[\z@][\z@]{\hb@xt@\textwidth{\hfill\normalsize\thepage\hfill}}}%
        \copyright@text}%
    \let\@evenfoot\@oddfoot
    \def\@oddhead{{%
        \setlength{\unitlength}{0.01bp}%
        \begin{picture}(29880,9760)%
            \newsavebox{\jphilart@lead@thick@rule}%
            \savebox{\jphilart@lead@thick@rule}(13160,297)[bl]{%
                \linethickness{2.97bp}%
                \put(0,0){\line(1,0){13160}}%
                }%
            \put(0,0){\usebox{\jphilart@lead@thick@rule}}%
            \put(16759,0){\usebox{\jphilart@lead@thick@rule}}%
            \put(0,9159){\usebox{\jphilart@lead@thick@rule}}%
            \put(16759,9159){\usebox{\jphilart@lead@thick@rule}}%
            \newsavebox{\jphilart@lead@thin@rule}%
            \savebox{\jphilart@lead@thin@rule}(13160,50)[bl]{%
                \linethickness{0.5bp}%
                \put(0,0){\line(1,0){13160}}
                }%
            \put(0,640){\usebox{\jphilart@lead@thin@rule}}%
            \put(16759,640){\usebox{\jphilart@lead@thin@rule}}%
            \put(0,8767){\usebox{\jphilart@lead@thin@rule}}%
            \put(16759,8767){\usebox{\jphilart@lead@thin@rule}}%
            \newsavebox{\jphilart@lead@circle}%
            \savebox{\jphilart@lead@circle}(400,400)[bl]{\put(0,0){\circle*{400}}}%
            \put(14960,490){\usebox{\jphilart@lead@circle}}%
            \put(14960,8960){\usebox{\jphilart@lead@circle}}%
            \newsavebox{\jphilart@lead@left@cross}%
            \savebox{\jphilart@lead@left@cross}(788,404)[bl]{%
                \linethickness{0.65bp}%
                \put(0,202){\line(1,0){788}}%
                \put(200,0){\line(0,1){404}}%
                }%
            \put(13470,285){\usebox{\jphilart@lead@left@cross}}%
            \put(13470,8760){\usebox{\jphilart@lead@left@cross}}%
            \newsavebox{\jphilart@lead@right@cross}%
            \savebox{\jphilart@lead@right@cross}(788,404)[bl]{%
                \linethickness{0.65bp}%
                \put(0,202){\line(1,0){788}}%
                \put(588,0){\line(0,1){404}}%
                }%
            \put(15660,285){\usebox{\jphilart@lead@right@cross}}%
            \put(15660,8760){\usebox{\jphilart@lead@right@cross}}%
            \newsavebox{\jphilart@lead@thin@hrule}%
            \savebox{\jphilart@lead@thin@hrule}(29880,50)[bl]{%
                \linethickness{0.5bp}%
                \put(0,0){\line(1,0){29880}}%
                }
            \put(0,1840){\usebox{\jphilart@lead@thin@hrule}}%
            \put(0,7570){\usebox{\jphilart@lead@thin@hrule}}%
            \put(0,2990){\hb@xt@\textwidth{%
                \edef\@tmp@romvol{\romannumeral\@volume}%
                \hfill
                \large \scshapepro \spaceskip=.295em%
                volume \@tmp@romvol, no. \@issue,
                \@ifundefined{multi@pubmonth@last}%
                    {%
                        \@ifundefined{month@item@\@pubmonth}%
                            {???}%
                            {\MakeLowercase{\csuse{month@item@\@pubmonth}}}%
                    }%
                    {%
                        \@ifundefined{month@item@\multi@pubmonth@first}%
                            {???}%
                            {\MakeLowercase{\csuse{month@item@\multi@pubmonth@first}}}%
                        \multi@pubmonth@sep%
                        \@ifundefined{month@item@\multi@pubmonth@last}%
                            {???}%
                            {\MakeLowercase{\csuse{month@item@\multi@pubmonth@last}}}%
                    }\ 
                \@pubyear
                \hfill
                }}%
            \put(0,4785){\hb@xt@\textwidth{%
                \hfill
                \fontsize{13.9bp}{13.9bp}\selectfont
                \scshapepro \spaceskip=.443em\addfontfeature{LetterSpace=4}%
                THE JOURNAL OF PHILOSOPHY%
                \hfill
                }}%
        \end{picture}%
        }}%
    \let\@evenhead\@oddhead
    \let\@mkboth\@gobbletwo
    \let\sectionmark\@gobble
    \let\subsectionmark\@gobble
}
\else
\def\ps@copyright{%
    \def\@oddfoot{\copyright@text}%
    \let\@evenfoot\@oddfoot
    \def\@oddhead{{\header@size\hfill
        {\scshapepro\MakeLowercase{\@runtitle}}%
        \hfill\llap{\headernumber@size\thepage}}}%
    \def\@evenhead{{\header@size\rlap{\headernumber@size\thepage}\hfill
        {\scshapepro\MakeLowercase{\@journal}}\hfill}}%
    \let\@mkboth\@gobbletwo
    \let\sectionmark\@gobble
    \let\subsectionmark\@gobble
}
\fi
%%
%%  ======= REVIEW/BOOK REVIEW =======
%%
\newenvironment{review}{%
    \vskip5\p@
    \def\title##1{\textit{##1}}%
    \def\author##1{{\scshapepro\MakeLowercase{##1}}}%
    \aftergroup\ignorespaces}
    {%
        \vskip8\p@
    }
%%
%%  ======= INITiALIZATION =======
%%
\ifnum\jphilart@newbaskerville@alternative=\tw@
    % TeX Gyre Termes small caps shape is used
    \begingroup
        \nfss@catcodes
        \input{t1ybv.fd}
        \DeclareFontShape{T1}{ybv}{m}{sc}{<-> ec-qtmr-sc}{}
        \DeclareFontShape{T1}{ybv}{b}{sc}{<-> ec-qtmb-sc}{}
        \DeclareFontShape{T1}{ybv}{b}{scit}{<-> ec-qtmbi-sc}{}
        \DeclareFontShape{T1}{ybv}{m}{scit}{<-> ec-qtmri-sc}{}
    \endgroup
\fi
\pagenumbering{arabic}
\frenchspacing
\pagestyle{headings}
% 
\ifcsundef{jphilart@hyperref@pdfpagelabels@opt}%
    {\def\jphilart@hyperref@pdfpagelabels@opt{pdfpagelabels}}%
    {}%
\expandafter\RequirePackage\expandafter[\jphilart@hyperref@pdfpagelabels@opt]{hyperref}
\expandafter\hypersetup\expandafter{%
    bookmarks=true,%
    bookmarksopen=true,%
    hypertexnames=false,%
    pdfpagemode=UseOutlines,%
    setpagesize=false%
    }
\csuse{jphilart@hyperref}
\setcounter{tocdepth}{3}
\def\no@harm{%
    \let~\space
    \let\\=\@empty
    \def\querymark##1##{\@gobble}%
    \def\thanks##1##{\@gobble}%
    \def\protect{\noexpand\protect\noexpand}%
    }
\gappto\pdfstringdefPreHook{%
    \def\thanks#1#{\@gobble}%
    \def\querymark#1#{\@gobble}%
    }
%
\csuse{jphilart@multi@footnotemark}
\AtBeginDocument{%
    \@ifpackageloaded{gb4e}%
        {%
            \def\exe{\@ifnextchar [{\@exe}{\@exe[]}}%
            \def\@exe[#1]{%
                \ifnum\@xnumdepth>0%
                    \if@xrec
                        \@exrecwarn
                    \fi
                    \if@noftnote
                        \@exrecwarn
                    \fi
                    \@xnumdepth0%
                    \@listdepth0%
                    \@xrectrue
                    \save@counters
                \fi
                \advance\@xnumdepth by \@ne
                \@@xsi
                \begin{list}%
                    {(\thexnumi)}%
                    {%
                        \usecounter{xnumi}%
                        \if@noftnote
                            \setcounter{xnumi}{\value{exx}}%
                        \else
                            \setcounter{xnumi}{\value{fnx}}%
                        \fi
                        \ifx&#1&%
                            \@subex{(\thexnumi)}{0.5em}%
                        \else
                            \@subex{#1}{0.5em}%
                        \fi
                    }%
                }
            \def\endexe{%
                \if@noftnote
                    \setcounter{exx}{\value{xnumi}}%
                \else
                    \setcounter{fnx}{\value{xnumi}}%
                    \reset@counters
                    \@xrecfalse
                \fi
                \end{list}%
                }%
            %
            \def\xlist{\@ifnextchar [{\@xlist{}}{\@xlist{}[]}}%
            \def\@xlist#1[#2]{%
                \ifnum\@xnumdepth>3%
                    \@toodeep
                \else
                    \advance\@xnumdepth by \@ne
                    \edef\@xnumctr{xnum\romannumeral\the\@xnumdepth}%
                    \def\@bla{#1}%
                    \ifx\@bla\empty
                        \xs@default{\romannumeral\the\@xnumdepth}%
                    \else
                        \expandafter\let\csname @xs\romannumeral\the\@xnumdepth\endcsname#1%
                    \fi
                    \begin{list}%
                        {\csname the\@xnumctr\endcsname.}%
                        {%
                            \usecounter{\@xnumctr}%
                            \@subex{#2}{0.25em}%
                        }%
                \fi
                }%
            \def\@subex#1#2{%
                \if@noftnote
                    \small
                \else
                    \footnotesize
                \fi
                \def\makelabel##1{{%
                    ##1%
                    \hfill
                    }}%
                \settowidth{\labelwidth}{#1}%
                \labelsep#2%
                \itemindent=\labelwidth
                \advance\itemindent by \labelsep
                \advance\itemindent by \parindent
                \leftmargin=\the\itemindent
                \itemindent=\z@
                \ifnum\the\@xnumdepth=1\relax
                    \topsep=7\p@ plus2\p@ minus3\p@
                    \itemsep=3\p@ plus2\p@
                \else
                    \topsep=1.5\p@ plus\p@
                    \itemsep=1.5\p@ plus\p@
                \fi
                \parsep=\p@ plus.5\p@ minus.5\p@
                \rightmargin\parindent
                }%
        }%
        {}%
    }
\endinput
