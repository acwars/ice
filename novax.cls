% Author: ACWars
% E-mail: eternalacwars@gmail.com

% Identification
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{novax}[2021/04/05 v0.1 Standard LaTeX document class]

% Load extra packages

% Load the report class and send it all class options
\LoadClassWithOptions{report}

% Dissertation should be double-spaced throughout nodisplayskipstretch makes
% sure equations are single-spaced. Otherwise array-like objects (say pmatrix)
% look rather ugly.
\RequirePackage[nodisplayskipstretch,doublespacing]{setspace}
% This makes tables single-spaced by default. Since they are supposed to be
% double-spaced unless they are too long, need to set double-spacing for tables
% manually using \renewcommand{\arraystretch}{2} inside the table environment

% Add references, to Table of Contents, but not TOC itself, or list of tables
% and figures
\RequirePackage[nottoc,notlot,notlof]{tocbibind}

% Required and Optional fields
\newcommand\degreename[1]{\renewcommand\@degreename{#1}}
\newcommand\@degreename{\ClassError{novax}{No \noexpand\degreename given}{}}

\newcommand\degreefield[1]{\renewcommand\@degreefield{#1}}
\newcommand\@degreefield{\ClassError{novax}{No \noexpand\degreefield given}{}}

\newcommand\degreemonth[1]{\renewcommand\@degreemonth{#1}}
\newcommand\@degreemonth{\ClassError{novax}{No \noexpand\degreemonth given}{}}

\newcommand\degreeyear[1]{\renewcommand\@degreeyear{#1}}
\newcommand\@degreeyear{\ClassError{novax}{No \noexpand\degreeyear given}{}}

\newcommand\department[1]{\renewcommand\@department{#1}}
\newcommand\@department{\ClassError{novax}{No \noexpand\department given}{}}

\newcommand\principaladvisor[1]{\renewcommand\@principaladvisor{#1}}
\newcommand\@principaladvisor{\ClassError{novax}{No \noexpand\principaladvisor given}{}}

% Optional
\newcommand\secondadvisor[1]{\newcommand\@secondadvisor{#1}}

% (Re)define commands and environments
\newcommand{\thesistitlepage}{%
  \begin{titlepage}
    \thispagestyle{empty}
    \null\vfil
    %\addcontentsline{toc}{section}{Title Page} % seems silly to add it
    \begin{center}
      {\LARGE\bfseries {\@title}}\\[3em]
%      A DISSERTATION\\
%      OF STANFORD UNIVERSITY\\        
%      IN PARTIAL FULFILLMENT OF THE REQUIREMENTS\\
%      FOR THE DEGREE OF\\
%      DOCTOR OF PHILOSOPHY\\
%     {\Large\@department}\\[2em]
%     {\Large\@degreename}\\[2em]
%     {\Large\@degreefield}\\[2em]
      {\Large\@author}\\
      \@degreemonth\ \@degreeyear
    \end{center}
    \vfil\null
  \end{titlepage}
  \addtocounter{page}{1} % titlepage is not numbered by default
}

\newcommand{\copyrightpage}
{
  \thispagestyle{empty}
  \null\vfil
  \begin{center}
    \large
    \copyright\ Copyright\ by \@author\ \@degreeyear\\
    All rights reserved
  \end{center}
  \vfil\null
  \clearpage
}

\renewenvironment{abstract}%
{
  \clearpage
  % Standard spacing for the header
  \begin{spacing}{1.2}
%    \begin{minipage}[t]{0.7\textwidth}
%      \begin{flushleft}
%        \ifx\@secondadvisor\undefined
%        Dissertation Advisor: \@principaladvisor
%        \else
%        Dissertation Advisors: \@principaladvisor, \@secondadvisor
%        \fi
%      \end{flushleft}
%    \end{minipage}
%    \begin{minipage}[t]{0.3\textwidth}
%      \begin{flushright}
%        \@author
%      \end{flushright}
%    \end{minipage}
%    \vspace{2em}
%    \begin{center}
%      {\large\bfseries\@title}
%    \end{center}
%    \vspace{2em}
  \end{spacing}
  \addcontentsline{toc}{section}{Abstract}
  \section*{\centering \abstractname}
}%
{\clearpage}

% Save the latex commands
\let\LaTeXTOC\tableofcontents
\let\LaTeXLOT\listoftables
\let\LaTeXLOF\listoffigures

% Redefine them
\renewcommand{\tableofcontents}%
{
  \begin{spacing}{1.2} % 1.2 looks nicer than 1
    \LaTeXTOC
  \end{spacing}
}
\renewcommand{\listoftables}%
{
  \begin{spacing}{1.2}
    \LaTeXLOT
  \end{spacing}
}
\renewcommand{\listoffigures}%
{
  \begin{spacing}{1.2}
    \LaTeXLOF
  \end{spacing}
}

\newenvironment{acknowledgments}
{
  \clearpage
  \addcontentsline{toc}{section}{Acknowledgments}
  \section*{\centering Acknowledgments}
}
{\clearpage}

\newenvironment{dedication}
{
  \clearpage
  \par\vspace*{.2\textheight}
  \begin{quotation}
}
{\end{quotation}\clearpage}

% Odds and ends

% Quotations should be single-spaced
\expandafter\def\expandafter\quote\expandafter{\quote\singlespacing}
\expandafter\def\expandafter\quotation\expandafter{\quotation\singlespacing}

% Footnotes should single-spaced (setspace default), but there should be
% double-spacing between footnotes.
\setlength{\footnotesep}{0.8\baselineskip}

% Indicate that LaTeX can stop reading this file. LaTeX will ignore anything
% after this line. Not required, but good practice.
\endinput
