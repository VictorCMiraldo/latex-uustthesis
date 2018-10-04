%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                            %%
%% Class ``UU Software Tech. Thesis Template''                                %%
%%                                                                            %%
%% A PhD thesis LaTeX template for Cambridge University Engineering Department%%
%%                                                                            %%
%% Version: v0.0.1                                                            %%
%% Authors: Victor Cacciari Miraldo                                           %%
%% License: MIT License (c) 2018 Victor Cacciari Miraldo                      %%
%% GitHub Repo: https://github.com/VictorCMiraldo/latex-uustthesis            %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\fileversion{0.0.1}
\newcommand\filedate{2018/08/01}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uustthesis}[\filedate\space Utrecht University Software Technology Thesis Template (v\fileversion)]
\typeout{https://github.com/VictorCMiraldo/latex-uustthesis}

%% This class file was heavily inspired by:
%%   - https://github.com/suchow/Dissertate commit 58b4f
%%   - https://github.com/kks32/phd-thesis-template/blob/master/Classes/PhDThesisPSnPDF.cls
%%

% Font Size
\DeclareOption{10pt}{\PassOptionsToClass{10pt}{book}}%
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{book}}%
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{book}}%

% Page Size
\newcommand\PHD@papersize{a4paper} % Set Default as a4paper
\DeclareOption{a4paper}{\renewcommand\PHD@papersize{a4paper}}
\DeclareOption{a5paper}{\renewcommand\PHD@papersize{a5paper}}
\DeclareOption{b5paper}{\renewcommand\PHD@papersize{b5paper}}
\DeclareOption{letterpaper}{
  \ClassWarning{uustthesis}{The University of Utrecht
    thesis guidelines recommend using A4 for MSc thesis
    and B5 for PhD thesis.}
  \renewcommand\PHD@papersize{letterpaper}
}
\PassOptionsToClass{\PHD@papersize}{book}%

% Column layout
\newcommand\PHD@numsides{twoside}
\newif\ifPHD@istwosides
\PHD@istwosidestrue
\DeclareOption{oneside}{\renewcommand\PHD@numsides{oneside} \PHD@istwosidesfalse}%
\DeclareOption{twoside}{\renewcommand\PHD@numsides{twoside}}%
\PassOptionsToClass{\CurrentOption}{\PHD@numsides}

%% Here we can pass undeclared options to some class
%% or package
\DeclareOption*{%
  \ClassWarning{uustthesis}{Unknown option '\CurrentOption'.
I'll pass it to 'book' just in case.}
  \PassOptionsToClass{\CurrentOption}{book}%
}
\ProcessOptions\relax 
%% This finishes the 'options' section

%% We'll build on top of the 'book' class.
\LoadClass{book}


%% Necessary Packags
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage{ccaption}
\RequirePackage{graphicx}
\RequirePackage{setspace}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{unicode-math}

%%%%%%%%%%%%%%%%
%% Font setup %%
%%%%%%%%%%%%%%%%

%% Font Confiruation using unicode-math package
%% https://tex.stackexchange.com/questions/30049/how-to-select-math-font-in-document#30066
\defaultfontfeatures{Scale=MatchLowercase}

\setmainfont[
    Path           = ./tex/latex/fonts/,
    BoldFont       = STIXTwoText-Bold.otf,
    ItalicFont     = STIXTwoText-Italic.otf,
    BoldItalicFont = STIXTwoText-BoldItalic.otf,
]{STIXTwoText-Regular.otf}
\usepackage{eulervm}

%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%
%% Our Commands %%
%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%

\newcommand{\HRule}{\rule{\linewidth}{0.5mm}} % Defines a new command for horizontal lines, change thickness here

\newcommand{\dnormalspacing}{1.2}
\newcommand{\dcompressedspacing}{1.0}

% Block quote with compressed spacing
\let\oldquote\quote
\let\endoldquote\endquote
\renewenvironment{quote}
    {\begin{spacing}{\dcompressedspacing}\oldquote}
    {\endoldquote\end{spacing}}

% Itemize with compressed spacing
\let\olditemize\itemize
\let\endolditemize\enditemize
\renewenvironment{itemize}
    {\begin{spacing}{\dcompressedspacing}\olditemize}
    {\endolditemize\end{spacing}}

% Enumerate with compressed spacing
\let\oldenumerate\enumerate
\let\endoldenumerate\endenumerate
\renewenvironment{enumerate}
    {\begin{spacing}{\dcompressedspacing}\oldenumerate}
    {\endoldenumerate\end{spacing}}

%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%
%% Text Layout %%
%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%

\RequirePackage{geometry}
%% Margins and Geomtry config
\geometry{\PHD@papersize}
% https://tex.stackexchange.com/questions/249190/recommended-margin-and-binding-offset
\geometry{textwidth=.666\paperwidth}
\geometry{textheight=.72\paperheight}
\geometry{marginratio={4:6,5:7}}
\geometry{nofoot}
% \geometry{showframe}
\ifPHD@istwosides
  \geometry{\PHD@numsides}
  \geometry{bindingoffset=6mm}
\fi

% Headings and headers.
\RequirePackage{fancyhdr}
\RequirePackage[md, sc]{titlesec}
\setlength{\headheight}{15pt}
\pagestyle{plain}
\RequirePackage{titling}

\RequirePackage{caption}
\captionsetup[table]{labelfont={sc},textfont={sl},justification=RaggedRight}
\captionsetup[figure]{labelfont={sc},textfont={sl},justification=RaggedRight}
% \captionsetup[table]{labelfont={sc},textfont={sl},justification=RaggedRight,singlelinecheck=false}
% \captionsetup[figure]{labelfont={sc},textfont={sl},justification=RaggedRight,singlelinecheck=false}

% Front matter.
\setcounter{tocdepth}{1}
\usepackage[titles]{tocloft}
\usepackage[titletoc]{appendix}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapfont}{\normalsize \scshape}
\renewcommand\listfigurename{Listing of figures}
\renewcommand\listtablename{Listing of tables}

%%%%%%%%%%%%%%%%
%% Page style %%
%%%%%%%%%%%%%%%%

%% Adds the uppercase title of the current chapter to
%% the top of the page, centered. Numbers go alternating
%% left to right or centered, depending on oneside or twoside options.
\pagestyle{fancy}
\fancypagestyle{UUCSstyle}{
  \renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{##1}}{}}
  \renewcommand{\sectionmark}[1]{\markright{\MakeUppercase{##1}}{}}
  \fancyhead{}
  \fancyfoot{}
  \renewcommand{\headrulewidth}{0pt}
  \fancyhead[RO, LE]{\thepage}
  \fancyhead[CO]{\leftmark}
  \fancyhead[CE]{\rightmark}
}

\pagestyle{UUCSstyle}

\fancypagestyle{plain}{
  \fancyhead{}
  \renewcommand{\headrulewidth}{0pt}
}

%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%
%%  Title Page  %%
%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%

\let\@promotor\@empty
\newcommand{\promotor}[1]{\gdef\@promotor{#1}}

\let\@copromotor\@empty
\newcommand{\copromotor}[1]{\gdef\@copromotor{#1}}

\let\@NWOproject\@empty
\newcommand{\NWOproject}[1]{\gdef\@NWOproject{#1}}

\let\@NWOgrantnumber\@empty
\newcommand{\NWOgrantnumber}[1]{\gdef\@NWOgrantnumber{#1}}

\let\@defensedate\@empty
\newcommand{\defensedate}[1]{\gdef\@defensedate{#1}}

\let\@authorbirthdate\@empty
\newcommand{\authorbirthdate}[1]{\gdef\@authorbirthdate{#1}}

\let\@authorbirthplace\@empty
\newcommand{\authorbirthplace}[1]{\gdef\@authorbirthplace{#1}}

\let\@titleDUTCH\@empty
\newcommand{\titleDUTCH}[1]{\gdef\@titleDUTCH{#1}}

\renewcommand{\maketitle}{
%%%%%%%%%%%%%
%% Custom title page geometry
\newgeometry{left=0.17\paperwidth,right=0.17\paperwidth,bindingoffset=6mm}
\thispagestyle{empty}
\begingroup
% \fontsize{9pt}{7pt}\selectfont
\begin{center}
%%%%%%%%%%%%%
%% Headings
  \vspace*{0.12\paperheight} % 2cm on b5
  \begin{LARGE}
  {\bf \@title}
  \end{LARGE}
  \vspace*{0.08\paperheight} % 1.5cm on b5
  
  \begin{Large}
  \@titleDUTCH
  \vspace{0.008\paperheight} % 0.2cm on b5

  (met een samenvatting in het Nederlands)
  \end{Large}

  \vspace{0.2\paperheight} % 4.7cm on b5
  
  Proefschrift

  \

  \begin{tabular}{p{0.8\textwidth}}
  ter verkrijging van de graad van doctor aan de Universiteit Utrecht op
  gezag van de rector magnificus, prof. dr. G.J. van der Zwaan, ingevolge
  het besluit van het college voor promoties in het openbaar te verdedigen
  op \@defensedate
  % op maandag 23 april 2018 des ochtends te 10.30 uur
  \end{tabular}

  \

  door

  \

  {\Large \@author}

  \

  geboren op \@authorbirthdate \\
  te \@authorbirthplace
\end{center}
\newpage
\thispagestyle{empty}
\noindent
\begin{tabular}{ll}
Promotor: & \@promotor \\
Copromotor: & \@copromotor
\end{tabular}

\vspace{0.588\paperheight}

\noindent Dit proefschrift werd (mede) mogelijk gemaakt met financiële
steun van de \\
Nederlandse Organisatie voor Wetenschappelijk Onderzoek (NWO), \\
project \@NWOproject{} (\@NWOgrantnumber).
\endgroup
%%%%%%%%%%%%
%% Restore our previous geometry
\restoregeometry
}

%% End of title page

%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%
%% sectsty conf %%
%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%

\titleformat%
%Command to change
{\chapter}%
%Style to use
[block]%
% Format
{\bfseries\Large}%
% The chapter label
% {\Huge\color{gray}\thechapter}%
{
\begin{flushright}
\begin{tikzpicture}
  \draw[fill,color=black] (0,0) rectangle (2cm,2cm);
  \draw[color=white] (1cm,1cm) node { \fontsize{105}{130}\selectfont\thechapter };
\end{tikzpicture}
\end{flushright}
}%
% Separation between label and title body
{1em}%
% Before command
{\Huge\scshape}%

%%%%%%%%%%%%%%%%%%%%%%
%% General Packages %%
%%%%%%%%%%%%%%%%%%%%%%

\usepackage{booktabs}
\usepackage{multirow}

% hyperref MUST be loaded first. Check section 14.1 of cleveref manual.
\usepackage{hyperref}
\usepackage{cleveref}

%% Recommented to give more professionally-looking tables.
\renewcommand{\arraystretch}{1.3}