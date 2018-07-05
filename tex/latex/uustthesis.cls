\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uustthesis}[2018/07/04 Utrecht University Software Technology Thesis Template]

%% Basic Commands

%% We'll build on top of the 'report' class.
\LoadClass{report}

%% Necessary Packags
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{xcolor}
\RequirePackage{titlesec}
\RequirePackage{ccaption}
\RequirePackage{tocloft}
\RequirePackage{graphicx}

%% Declaring our Options

%% Paper sizes are handled by the geometry package.
\DeclareOption{a4paper}{\geometry{a4paper}}
\DeclareOption{a5paper}{\geometry{a5paper}}

%% Here we can pass undeclared options to some class
%% or package
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{report}%
}
\ProcessOptions\relax 
%% This finishes the 'options' section

%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%
%% Our Commands %%
%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%

\newcommand{\HRule}{\rule{\linewidth}{0.5mm}} % Defines a new command for horizontal lines, change thickness here

%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%
%%  Title Page  %%
%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%

%% Declare a supervisor variable for our title page.
\let\@supervisor\@empty
\newcommand{\supervisor}[1]{\gdef\@supervisor{#1}}

\renewcommand{\maketitle}{
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
}
%% End of title page

%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%
%% sectsty conf %%
%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%

\titleformat{\chapter}[block]%
{\bfseries\Large\filleft}%
{\Huge\color{gray}\thechapter}%
{1em}
{\hfill\Huge\scshape}%
[\HRule]