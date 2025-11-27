@echo off
REM -------------------------------
REM Script de compilation LaTeX + Biber
REM -------------------------------

REM 1. Supprimer les fichiers auxiliaires
del *.aux *.bbl *.blg *.bcf *.log *.run.xml *.toc *.out >nul 2>&1

REM 2. Première compilation pdflatex
echo [1/4] pdflatex...
pdflatex -interaction=nonstopmode main.tex >nul

REM 3. Exécuter Biber
echo [2/4] Biber...
biber main >nul

REM 4. Deuxième compilation pdflatex
echo [3/4] pdflatex...
pdflatex -interaction=nonstopmode main.tex >nul

REM 5. Troisième compilation pdflatex (pour références croisées)
echo [4/4] pdflatex...
pdflatex -interaction=nonstopmode main.tex >nul

echo Compilation terminée ! Vérifiez main.pdf
pause
