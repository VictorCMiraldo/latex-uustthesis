\documentclass[10pt,a4paper]{uustthesis}

\usepackage{lipsum}

\title{Testing}
\author{Tester}
\supervisor{Supervisor 1 \\ Supervisor 2}

%include lhs2TeX.fmt
\begin{document}
  \maketitle
  \tableofcontents

\chapter{Introduction}
%include src/chap01.lhs

\chapter{Conclusion}
\input{src/chap02}

\bibliographystyle{alpha}
\bibliography{references}

\end{document}


