---
title: Compiler Optimization Notes
author: Mac Radigan
header-includes:
 - \usepackage{graphicx}
 - \usepackage{amsmath}
 - \usepackage{mathrsfs}
 - \usepackage{amsthm}
 - \bibliographystyle{IEEEtran}
---
[//]: # Compiler-Optimization.md
[//]: # Mac Radigan

[//]: # huge, LARGE, Large, large, normalsize, small, footnotesize, scriptsize, tiny

# Compiler Optimization

## Variable Declaration

### declared in base scope

  \renewenvironment{Shaded} {\begin{snugshade}\normalsize} {\end{snugshade}}

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~{.cpp .numberLines}
{% include 'src/variable_stack_1.cc' %}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  \renewenvironment{Shaded} {\begin{snugshade}\footnotesize} {\end{snugshade}}

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~{.asm .numberLines}
{% include 'asm/variable_stack_1.asm' %}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### declared within statement block

  \renewenvironment{Shaded} {\begin{snugshade}\normalsize} {\end{snugshade}}

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~{.cpp .numberLines}
{% include 'src/variable_stack_2.cc' %}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  \renewenvironment{Shaded} {\begin{snugshade}\footnotesize} {\end{snugshade}}

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~{.asm .numberLines}
{% include 'asm/variable_stack_2.asm' %}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### implementation difference (side-by-side diff, no suppression)

  \renewenvironment{Shaded} {\begin{snugshade}\tiny} {\end{snugshade}}

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~{.asm .numberLines}
{% include 'results/variable_stack_1_2.diff' %}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Memory Initialization

### declared in .BSS segment

  \renewenvironment{Shaded} {\begin{snugshade}\normalsize} {\end{snugshade}}

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~{.cpp .numberLines}
{% include 'src/segments_1.cc' %}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  \renewenvironment{Shaded} {\begin{snugshade}\footnotesize} {\end{snugshade}}

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~{.asm .numberLines}
{% include 'asm/segments_1.asm' %}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### declared in .DATA segment

  \renewenvironment{Shaded} {\begin{snugshade}\normalsize} {\end{snugshade}}

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~{.cpp .numberLines}
{% include 'src/segments_2.cc' %}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  \renewenvironment{Shaded} {\begin{snugshade}\footnotesize} {\end{snugshade}}

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~{.asm .numberLines}
{% include 'asm/segments_2.asm' %}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### implementation difference (side-by-side diff, with suppression)

  \renewenvironment{Shaded} {\begin{snugshade}\tiny} {\end{snugshade}}

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~{.asm .numberLines}
{% include 'results/segments_1_2.diff' %}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

