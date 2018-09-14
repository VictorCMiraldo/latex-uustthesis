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
\DeclareOption{10pt}{
  \ClassWarning{uustthesis}{A fontsize of 10pt is very small. Consider 11pt or 12pt.}
  \PassOptionsToClass{10pt}{book}%
}
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
\geometry{inner=.15\paperwidth , outer=.15\paperwidth}
\ifPHD@istwosides
  \geometry{\PHD@numsides}
  \geometry{bindingoffset=.05\paperwidth}
\fi
% \geometry{rmargin=.12\textwidth}
% \geometry{tmargin=.15\textheight}
% \geometry{twoside,bindingoffset=1cm}
% \savegeometry{uustthesis-geometry}

% Headings and headers.
\RequirePackage{fancyhdr}
\RequirePackage[md, sc]{titlesec}
\setlength{\headheight}{15pt}
\pagestyle{plain}
\RequirePackage{titling}

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
  \fancyfoot[RE, LO]{\thepage}
  \fancyfoot[CO]{\leftmark}
  \fancyfoot[CE]{\rightmark}
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

%% Declare a supervisor variable for our title page.
\let\@supervisor\@empty
\newcommand{\supervisor}[1]{\gdef\@supervisor{#1}}

\renewcommand{\maketitle}{
%%%%%%%%%%%%%
%% Custom title page geometry
\newgeometry{left=3cm,right=3cm}
\thispagestyle{empty}
\begin{center}
%%%%%%%%%%%%%
%% Headings
  \begin{minipage}{0.25\textwidth}%
  \includegraphics[width=.8\textwidth]{img/logo.pdf}%
  \end{minipage}
  ~
  \begin{minipage}{0.7\textwidth}%
  \begin{flushleft}
  \textsc{\huge Universiteit Utrecht}\vskip 1.5em
  \textsc{\Large Faculty of Science}\vskip 0.5em
  \textsc{\large Dept. of Information and Computing Sciences}%
  \end{flushleft}
  \end{minipage}
%%%%%%%%%%%
%% Title
  \vfill
  \HRule\vskip 1.5em
  {\huge\bfseries \@title }
  \vskip 1em \HRule
  \vfill
%%%%%%%%%%
%% Author(s)
  \begin{minipage}{0.4\textwidth}
    \begin{flushleft}\large
    \textit{Author}\vskip .5em
    \@author
    \end{flushleft}
  \end{minipage}
  ~
  \begin{minipage}{0.4\textwidth}
  \begin{flushright}\large
  \textit{Supervisor}\vskip .5em
  \@supervisor
  \end{flushright}
  \end{minipage}
  \vfill\vfill\vfill
%%%%%%%%%%%%
%% Date
  {\large\@date} 
  \vfill\newpage
\end{center}
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
  \draw[color=white] (1cm,1cm) node { \fontsize{40}{70}\selectfont\thechapter };
\end{tikzpicture}
\end{flushright}
}%
% Separation between label and title body
{1em}%
% Before command
{\hfill\Huge\scshape}%

% \titleformat%
% %Command to change
% {\section}%
% % Format
% {\large}%
% % The chapter label
% % {\Huge\color{gray}\thechapter}%
% {
% \begin{tikzpicture}
%   \draw[fill,color=black] (0,0) rectangle (0.5cm,0.5cm);
%   \draw[color=white] (0.25cm,0.25cm) node { \fontsize{10}{40}\selectfont\thesection };
% \end{tikzpicture}
% }%
% % Separation between label and title body
% {.5em}%
% % Before command
% {\large\scshape}%

%%%%%%%%%%%%%%%%%%%%%%
%% General Packages %%
%%%%%%%%%%%%%%%%%%%%%%

\usepackage{cleveref}
\usepackage{booktabs}
\usepackage{multirow}
\usepackage{hyperref}

%% Recommented to give more professionally-looking tables.
\renewcommand{\arraystretch}{1.3}