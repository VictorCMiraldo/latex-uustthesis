\documentclass[a4paper]{uustthesis}

\title{Testing}
\author{Tester}
\supervisor{Supervisor 1 \\ Supervisor 2}

%include lhs2TeX.fmt
\begin{document}
  \maketitle
  \tableofcontents

\chapter{Introduction}
%include src/chap01.lhs

\begin{savequote}
---When shall we three meet again
in thunder, lightning, or in rain?
---When the hurlyburly’s done,
when the battle’s lost and won.
\qauthor{Shakespeare, Macbeth}
Cookies! Give me some cookies!
\qauthor{Cookie Monster}
\end{savequote}

\chapter{Conclusion}
\input{src/chap02}

\bibliography{references}

\end{document}


