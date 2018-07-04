\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uustthesis}[2018/07/04 Utrecht University Software Technology Thesis Template]

%% Basic Commands

%% We'll build on top of the 'report' class.
\LoadClass{report}

%% Necessary Packags
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{sectsty}
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

%% Our Own Title Page
\renewcommand{\maketitle}{%
  \newpage
  \null
  \vfill
  \begin{center}%
  \includegraphics[scale=.4]{img/logo.pdf}
  \end{center}%
  \vfill
  \begin{center}
  {\LARGE OMG \@title \par}%
  \vskip 1.5em%
  {\large \lineskip .5em%
    \begin{tabular}[t]{c}%
      \@author
     \end{tabular}\par}%
  \vskip 1em%
  {\@date}
  \end{center}%
  \par
  \vfill
  \vfill}
%% End of title page
