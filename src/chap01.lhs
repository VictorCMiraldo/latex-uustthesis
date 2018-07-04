
Some lhs testing

\begin{code}
fat :: Int -> Int
fat 0  = 1
fat n  = n * fat (n-1)
\end{code}