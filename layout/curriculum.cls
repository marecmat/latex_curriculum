\ProvidesClass{layout/curriculum}[resume template]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[10pt, a4paper]{article}
\hbadness=20000
\RequirePackage{xcolor}
\RequirePackage{enumitem}
\RequirePackage{graphicx}
\RequirePackage{xifthen}
\RequirePackage{amsmath}
\RequirePackage{indentfirst}
\RequirePackage{layout/jsonparse}
\RequirePackage{pgffor}
\RequirePackage[left=1cm,top=3cm,right=.5cm,bottom=1.5cm]{geometry}
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{accent}{HTML}{381c80}
% Required snippets from the fontawesome package
\RequirePackage{fontspec}
\newfontfamily{\FA}{FontAwesome}
\newcommand*{\faicon}[1]{{\FA\csname faicon@#1\endcsname}}
\expandafter\def\csname faicon@mobile\endcsname {\symbol{"F10B}} \def\faMobile {{\FA\csname faicon@mobile\endcsname}}
\expandafter\def\csname faicon@map-marker\endcsname {\symbol{"F041}} \def\faMapMarker {{\FA\csname faicon@map-marker\endcsname}}
\expandafter\def\csname faicon@envelope\endcsname {\symbol{"F0E0}} \def\faEnvelope {{\FA\csname faicon@envelope\endcsname}}
\expandafter\def\csname faicon@link\endcsname {\symbol{"F0C1}} \def\faLink {{\FA\csname faicon@link\endcsname}}
%%%%%%%
\pagenumbering{gobble}
\setlength\parindent{0pt}
\renewcommand{\labelitemi}{\textcolor{accent}{•}}
\newcommand{\bulletsep}{\kern-.7em\raisebox{-.5em}{\scalebox{2.5}{\textperiodcentered}}\kern-.5em}
\newcommand{\checkemptylabel}[3]{\ifthenelse{\isempty{#1}}{#3}{#2}}
\makeatletter\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}
\makeatother
\newenvironment{small_column}{\begin{minipage}[t][24cm]{0.35\linewidth}}{\end{minipage}~\hfill}
\newenvironment{big_column}{\begin{minipage}[t][24cm]{0.62\linewidth}}{\end{minipage}~\hfill}
\newcommand{\name}[2]{{\Huge{\textsf{#1 \textbf{\textcolor{accent}{#2}}}}}}
\newcommand{\header}[4]{\vspace*{-1.6cm}\begin{center}\name{#1}{#2}\\ \textcolor{lightgray}{#3}\\[2em]\end{center}\small{#4}\vspace*{1cm}\\}
\newcommand{\contact}[6]{\small \begin{center} \vspace*{-1.6cm} 
	\includegraphics[width=120pt]{#6}\\[2em] \section{Contact}{\vspace{1mm}\begin{tabular}{cl}
		% website
	\text{\faLink}:& 				\quad \texttt{#1} \\
	\resizebox{7pt}{!}{\textcolor{accent}{\faEnvelope}}& \,\,\, {#2}\\[.3em]
	\textcolor{accent}{\faMobile}& \,\,\,{#3}\\[.3em]
	\textcolor{accent}{\faMapMarker}& \,\,\, {#4}\\[-1pt] & \,\,\, {#5} 
	\end{tabular}}{}\end{center}}
\renewcommand{\section}[2]{\textsf{\Large{\textbf{\textcolor{accent}{#1}}}}\textcolor{accent}{\vhrulefill{1pt}}\vspace*{1mm}\\ #2}
\renewcommand{\subsection}[5]{
	\checkemptylabel{#1}{\large{\textbf{#1}}\hfill\vspace*{2pt}}{} 										 %Intitulé
	\checkemptylabel{#3}{\normalsize \textsf{\textcolor{accent}{#3}}\\[-4pt]}{} 						 %Lieu 
	\checkemptylabel{#2}{\textcolor{gray}{\textsf{\normalsize{#2}}}\hfill}{} 							  %Entreprise/Infrastructure 
	\checkemptylabel{#4}{\textsf{\normalsize{#4}}\\[-7pt]}{\\[-15pt]}  											  % Dates		
	\checkemptylabel{#5}{\begin{itemize}[leftmargin=2ex, nosep]\small{#5}\end{itemize}\vspace*{12pt}}{}   %Contenu
}