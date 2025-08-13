%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% A PhD thesis LaTeX template for Japanese                          %%
%% inspired by https://github.com/kks32/phd-thesis-template/         %%
%%                                                                   %%
%% Version v1.0                                                      %%
%% Author: Soichiro Kumano                                           %%
%% License: MIT License                                              %%
%% Copyright (c) 2025 Soichiro Kumano                                %%
%% GitHub: https://github.com/s-kumano/japanese-phd-thesis-template/ %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2025/08/10 v1.0 PhD Thesis Class for Japanese]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\PassOptionsToClass{12pt,a4paper}{book}
\LoadClass{book}

\RequirePackage{iftex}
\ifLuaTeX\else\ifXeTeX\else\ifPDFTeX\else
  \ClassError{thesis}{This class requires LuaLaTeX, XeLaTeX, or pdfLaTeX}{Use lualatex, xelatex, or pdflatex}
\fi\fi\fi

%%%%%%%%%%%%% Size %%%%%%%%%%%%%

\RequirePackage[
  hmarginratio = 1:1,
  vmarginratio = 1:1,
  scale = 0.75
]{geometry}

%%%%%%%%%%%%% Font %%%%%%%%%%%%%

\ifLuaTeX
  \RequirePackage{luatexja}
  \RequirePackage{luatexja-fontspec}
  \setmainfont{Times New Roman}
  \setmainjfont{Noto Serif CJK JP}
  \ltjsetparameter{jacharrange={-2}}
\else
  \ifXeTeX
    \RequirePackage{zxjatype}
    \setmainfont{Times New Roman}
    \setjamainfont{Noto Serif CJK JP}
  \else
    \ifPDFTeX
      \RequirePackage[T1]{fontenc}
      \RequirePackage{newtxtext}
      \RequirePackage[whole]{bxcjkjatype}
      \setminchofont{ipaexm.ttf}
      \AddToHook{package/after/hyperref}{\hypersetup{CJKbookmarks=true}}
    \fi
  \fi
\fi

%%%%%%%%%%%%% Title %%%%%%%%%%%%%

\RequirePackage{calc}
\RequirePackage{setspace}

\newcommand{\@thesisclass}{}
\newcommand{\thesisclass}[1]{\renewcommand{\@thesisclass}{#1}}

\newcommand{\@japanesetitle}{}
\newcommand{\japanesetitle}[1]{\renewcommand{\@japanesetitle}{#1}}

\newcommand{\@studentnumber}{}
\newcommand{\studentnumber}[1]{\renewcommand{\@studentnumber}{#1}}

\newcommand{\@supervisor}{}
\newcommand{\supervisor}[1]{\renewcommand{\@supervisor}{#1}}

\newcommand{\@dept}{}
\newcommand{\dept}[1]{\renewcommand{\@dept}{#1}}

\newcommand{\@submissiontext}{}
\newcommand{\submissiontext}[1]{\renewcommand{\@submissiontext}{#1}}

\newcommand{\@degreetitle}{}
\newcommand{\degreetitle}[1]{\renewcommand{\@degreetitle}{#1}}

\newcommand{\computeTitlePageSpacing}{

\newsavebox{\BOX@thesisclass}
\begin{lrbox}{\BOX@thesisclass}
  \begin{minipage}[c]{\textwidth}
    \centering \Huge \@thesisclass
  \end{minipage}
\end{lrbox}

\newsavebox{\BOX@title}
\begin{lrbox}{\BOX@title}
  \begin{minipage}[c]{\textwidth}
    \centering \Huge \textbf{\@title}
  \end{minipage}
\end{lrbox}

\newsavebox{\BOX@japanesetitle}
\begin{lrbox}{\BOX@japanesetitle}
  \begin{minipage}[c]{\textwidth}
    \centering \Huge \@japanesetitle
  \end{minipage}
\end{lrbox}

\newsavebox{\BOX@student}
\begin{lrbox}{\BOX@student}
  \begin{minipage}[c]{\textwidth}
    \centering \Large
    \@studentnumber\\
    [0.1em]
    \textbf{\@author}
  \end{minipage}
\end{lrbox}

\newsavebox{\BOX@supervisordept}
\begin{lrbox}{\BOX@supervisordept}
  \begin{minipage}[c]{\textwidth}
    \centering \large
    \@supervisor\\
    [0.1em]
    \@dept
  \end{minipage}
\end{lrbox}

\newsavebox{\BOX@submission}
\begin{lrbox}{\BOX@submission}
  \begin{minipage}[c]{\textwidth}
    \centering \large
    \@submissiontext\\
    [0.1em]
    \textit{\@degreetitle}
  \end{minipage}
\end{lrbox}

\newsavebox{\BOX@date}
\begin{lrbox}{\BOX@date}
  \begin{minipage}[c]{\textwidth}
    \centering \large \@date
  \end{minipage}
\end{lrbox}

\newlength{\BOX@titlepagespacing}
\setlength{\BOX@titlepagespacing}{
  \textheight
  - \totalheightof{\usebox{\BOX@thesisclass}}
  - \totalheightof{\usebox{\BOX@title}}
  - \totalheightof{\usebox{\BOX@japanesetitle}}
  - \totalheightof{\usebox{\BOX@student}}
  - \totalheightof{\usebox{\BOX@supervisordept}}
  - \totalheightof{\usebox{\BOX@submission}}
  - \totalheightof{\usebox{\BOX@date}}
}
}

\renewcommand{\maketitle}{
  \computeTitlePageSpacing
  
  \thispagestyle{empty}
  
  \begin{singlespace}
  \begin{center}

  \usebox{\BOX@thesisclass}
  \vspace{.05\BOX@titlepagespacing}

  \usebox{\BOX@title}
  \vspace{.05\BOX@titlepagespacing}

  \usebox{\BOX@japanesetitle}
  \vspace{.4\BOX@titlepagespacing}

  \usebox{\BOX@student}
  \vspace{.1\BOX@titlepagespacing}

  \usebox{\BOX@supervisordept}
  \vspace{.2\BOX@titlepagespacing}

  \usebox{\BOX@submission}

  \vfill
  \usebox{\BOX@date}

  \end{center}
  \end{singlespace}
}

%%%%%%%%%%%%% Acknowledgements / Abstract %%%%%%%%%%%%%

\newenvironment{acknowledgements}{
  \cleardoublepage
  \chapter*{\Large\centering Acknowledgements}
  \thispagestyle{empty}
}{}

\newenvironment{abstract}{
  \cleardoublepage
  \chapter*{\Large\centering Abstract}
  \thispagestyle{empty}
}{}

%%%%%%%%%%%%% ToC / LoF / LoT %%%%%%%%%%%%%

\RequirePackage[nottoc]{tocbibind}

\renewcommand{\contentsname}{Table of Contents}

\AddToHook{package/after/hyperref}{
  \let\orig@tableofcontents\tableofcontents
  \renewcommand{\tableofcontents}{
    {
      \hypersetup{linkcolor = black, linktoc = all}
      \orig@tableofcontents
    }
  }
  
  \let\orig@listoffigures\listoffigures
  \renewcommand{\listoffigures}{
    {
      \hypersetup{linkcolor = black, linktoc = all}
      \orig@listoffigures
    }
  }

  \let\orig@listoftables\listoftables
  \renewcommand{\listoftables}{
    {
      \hypersetup{linkcolor = black, linktoc = all}
      \orig@listoftables
    }
  }
}

%%%%%%%%%%%%% References %%%%%%%%%%%%%

\renewcommand{\bibname}{References}

\AddToHook{package/after/biblatex}{
  \DefineBibliographyStrings{english}{
    bibliography = {References}
  }
}

%%%%%%%%%%%%% Appendix %%%%%%%%%%%%%

\let\orig@appendix\appendix
\renewcommand{\appendix}{
  \cleardoublepage
  \renewcommand{\theequation}{\Alph{chapter}.\arabic{equation}}
  \renewcommand{\thefigure}{\Alph{chapter}.\arabic{figure}}
  \renewcommand{\thetable}{\Alph{chapter}.\arabic{table}}
  \orig@appendix
}