\documentclass[10pt,b5paper]{uustthesis}

\usepackage{lipsum}

\title{Testing}
\author{Tester}
\supervisor{Supervisor 1 \\ Supervisor 2}

%include lhs2TeX.fmt
\begin{document}
\maketitle

%% Set up the front matter of our book
\frontmatter
\tableofcontents

\chapter{Declaration}
Thanks to family, supervisor, friends and hops!

\chapter{Abstract}
Some amazing abstract should come here.
Some amazing abstract should come here.
Some amazing abstract should come here.
Some amazing abstract should come here.
Some amazing abstract should come here.
Some amazing abstract should come here.
Some amazing abstract should come here.
Some amazing abstract should come here.
Some amazing abstract should come here.
Some amazing abstract should come here.

%% Starts the mainmatter
\mainmatter

\chapter{Introduction}
%include src/chap01.lhs

\chapter{Conclusion}
\input{src/chap02}

\appendix
\chapter{Some Formulas}

\backmatter
\listoffigures
\listoftables

\bibliographystyle{alpha}
\bibliography{references}

\end{document}


