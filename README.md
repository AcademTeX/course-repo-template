# Course Repo Template

This template helps you organize your coursework in a GitHub repo. The idea here is that 1 class = 1 repo and that each 
class will have a document for notes, and individual documents for each homework assignment both with a shared preamble.
The LaTeX documents all share a _highly opinionated_ [preamble](./common/preamble.tex). Additionally, there are a number
of nice [GitHub workflows](./.github/workflows) that make working with repos from this template easier. 

Contributions in the form of PRs are always welcome! 

## Basic Setup Procedure

To set yourself up for basic usage, do the following: 
- [ ] [Setup the template](https://github.com/qwinters/course-repo-template/generate) using GitHub's template feature
- [ ] Replace ''University Name'', ''Course Name/Number/Title'', ''Your Lecture'', ''Your Name'' in `notes/notes.tex`
- [ ] Replace ''Course Title'', ''Student Name'' and ''Student Identifier'' in `homework/homework01/hwk01.tex`
- [ ] If you want to setup publishing via a gh-pages project website, then setup publishing to come from branch `gh-pages` folder `gh-pages`
- [ ] If you want to modify how notes are compiled/published, modify the [notes compilation workflow](./.github/workflows/build-latex-notes.yml)
- [ ] If you want to modify how homeworks are compiled/published, modify the [homework compilation workflow](./.github/workflows/build-latex-homework.yml)

## CI/CD Features

This repo has a number of workflows setup to make it easier to use and publish information for your course. In particular,

### Issues Workflow(s)
- !!! CURRENTLY BROKEN AND BLOCKED ON [THIS PR](https://github.com/alstr/todo-to-issue-action/pull/96) !!! Isuses are automatically created in comments using [alstr/todo-to-issue-action](https://github.com/alstr/todo-to-issue-action) 
- Issues that are created on this repo are automatically assigned to whoever files them 
- By adding your project information in [the workflow config](.github/workflows/auto-assign-issues-projects.yml), issues created on this repo are also automatically added to a project of your choice 
<!-- TODO: Fix the issue => project integration for Projects Beta -->
### Publishing Workflow(s) - Notes
- Notes are linted via `chktex` whenever a commit is pushed to `main` or `gh-pages`
- When a commit is pushed to `gh-pages`, the notes are compiled using a [simple workflow](./.github/workflows/build-latex-notes.yml)
- The compiled notes are uploaded as an artifact to the action run 
- When the compiling of notes is finished, the PDF file is also moved to `./gh-pages/{notes-name}.pdf`
- 
### Publishing Workflow(s) - Homework 
- Homeworks are linted via `chktex` whenever a commit is pushed to `main` or `gh-pages`
- When a commit is pushed to `gh-pages`, the homeworks are compiled using a [simple workflow](./.github/workflows/build-latex-homework.yml)
- The compiled homeworks are uploaded as an artifact to the action run 
- The compiled homeworks ARE NOT by default placed into `gh-pages`


<!-- TODO: Add a tools used / acknowledgements section to the README -->



