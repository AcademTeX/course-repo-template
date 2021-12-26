## How-to: Write LaTeX Notes and Homework

If you are using this repo, there's a good chance that you already know how to write LaTeX notes effectively. That being said there are still somethings worth going over to make sure that your style of writing LaTeX notes matches the format of this repo

#### Premable and Macro files

There are two main common LaTeX files that are shared across homework, notes, and the website blog posts. The `preamble/packages.tex` file defines theorem environments, imports important packages, setups the references and bibliographies, and overall governs the LaTeX-specific parts of writing documents. 

The `preamble/macros.tex` file on the other hand defines macros that are shared across the system. These macros are of course highly opinionated and do not fit everyone's style. It is recommended that if your style does not match the defaults of the repo, that you fork the repo and change the template to your own liking before deploying. Note that these macros are also automatically imported into every `lecture/*.md` file (that have the [marker seen here](https://github.com/qwinters/course-repo-template/blob/1ce0f2894887e1e229be0cc103cf0a6f53b551b6/lectures/YYYY-MM-DD-lecture01.md?plain=1#L8)) before publishing, so you should feel free to use the macros while writing lecture note blog posts. 

#### Subfiles Organization

The actual notes are all developed in `notes/notes.tex`. You can change this filename as you like. The file itself contains minimal content. Most of the content is structured in subfiles using the `subfile` package. The directory structure for notes looks like this: 

```yaml
notes: 
    appendix:
        - appendix.tex          # Include knowledge from previous classes here
    
        - references.tex        # Bibliography is automatically generated here

    chapters:
        - chapter01:            # Folder for section by section notes
            - section01.tex     #  Each section here includes raw notes directly

        - chapter01.tex         # In addition to a folder per chapter, each chapter
                                # has a chapter file which just sources individual 
                                # sections (and optionally includes references)
    frontmatter:
        - notation.tex          # An optional list of notation for a book
        - preface.tex           # A preface chapter to include information about 
                                #  the course

    references.bib              # A BibTeX file that includes all the references 
                                # you plan to use across your notes (compiled 
                                # with biber)

    notes.tex                   # Notes file where you source individual chapters
```

Generally all the main content will go into the `notes/chapter/chapterNN/sectionMM.tex`  files and then you will simply add `\subfile{chapterNN/sectionMM.tex}` as a line in `chapterNN.tex` to source the file in your chapter properly. Likewise add `\subfile{chapters/chapterNN.tex}` to `notes.tex` to source new chapter properly. 

In general, you can follow the existing files as a template. When starting a new repo, just remember to remove all the boilerplate material, including in the headers. 

#### Bibliography

The collected bibliography for all the notes is put in `notes/references.bib`. If you want to change how the bibliography is organized, you can modify the appropriate section in `notes/preamble.tex`. To add more BibTeX files, you simply need to use the `\addbibresource{file.bib}` command in the `notes/notes.tex` file. 

The bibliography is tracked by chapter. By default, only a collected set of resources is printed at the end, however by adding the lines
```TeX
\addcontentsline{toc}{section}{References}
\printbibliography
``` 
at the end of your `notes/chapter/chapterNN.tex` file before the `\end{refsegment}`, then you will print out the references for the specific chapter in a new section called "References."

#### Automated Compilation

Notes are not compiled automatically by default. In order to compile and publish your notes, you must create a release. This is accomplished by pushing a new tag to the `main` branch via a command like the following: 
```shell 
git tag 1.0.0
git push --tags
```
The command will run only on semantic tags, so make sure your tag complies to the semantic naming scheme. After you push up the tag, the GitHub workflows configured in `./github/workflows` will compile the notes and upload them as an artifact to your release. They will also be made available to anyone who has access to the repo in `notes/notes.pdf` and on the website published via the folder `gh-pages/assets/files/tex-notes/notes.pdf`. 

If you want to change how the notes are compiled, then modify the `.github/scripts/compile.sh` script and if you want to change the way that the notes are published, modify the (some-what complicated)`./github/workflows/new-release.yml` workflow configuration. 

#### Homework 
First, if you have not read about how to setup a website and keep your homework private, make sure to read the other articles in this documentation folder first. This how-to does not include information on how to keep your homework safe and secure. Only how the homework files are structured.

Just like the lecture notes, the homework files are structured problem by problem using the `subfile` package. The general directory structure is as follows:
```yaml
homework01:
    problems: 
        - problem01.tex
    hwk01.tex
```

If you separate each homework problem to its own file, it gives you the ability to compile these files separately which might be helpful depending on how you have to submit homework. 

