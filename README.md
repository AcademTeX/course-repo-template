# Course Repo Template

This template helps you organize your coursework in a GitHub repo. The idea here is that 1 class = 1 repo and that each class will have a document for notes, and individual documents for each homework assignment both with a shared preamble.The LaTeX documents all share [package configuration](./preamble/packages.tex) and [macros](./preamble/macros.tex). Additionally, there are a number of nice [GitHub workflows](./.github/workflows) that make working with repos from this template easier. 

## Overview of workflows
The main workflows for the repos, in brief, are best described as follows:
* **Setting up a website for your coursework**: Automation is already setup, so just add a password for your homework in `Repository > Settings > Secrets` and make sure to call the repository secret `HOMEWORK_PASSWORD` and then navigate to `Repository > Settings > Pages` to enable the website feature
* **Taking notes in lecture**: Take notes in lecture and then commit the markdown or PDF to the folder `lectures`. If you have the website setup, these files will automatically be published in `gh-pages/_posts` (for markdown files), and `gh-pages/assets/files/raw-notes` (for PDF files). 
* **Writing up homework**: Write up homework in the `homeworkNN` folders. If you need to make a new assignment, just copy one of the old ones and change the content for your new assignment. Homeworks are only compiled and published when you tag a version. Note: you can rename the `homeworkNN/hwk01.tex` file to be whatever you like
* **Writing up formal notes**: Write up formal notes (e.g. a lecture script or something for broader distribution) in a `notes/notes.tex` file. Notes are only compiled and published when you tag a version. Note: you can rename the `notes/notes.tex` files to be whatever you like
* **Publish your notes and homework online**: If you have the 

For a more thorough overview of all the workflows for the repo, see the [docs](./docs) folder. 
## Customization and usage

Generally, if you are looking at using this repo, I would recommend forking the repository and setting it up with your personal settings first. There's a [checklist of things to consider](./docs/customise-and-use-this-template.md) for customization.
If you want an example, take a look at the [changes I've made for my own repo](https://github.com/qwinters/qwinters-tum-template/pull/1/files)
## Contributions

Contributions are always welcome, but due to the fact that this is merely a side project for me, maintenance will likely be few and far between after getting the templates up and running. If you want something specific and cannot / do not know how to build the feature yourself, use the button below to file an issue: 
<a href="https://github.com/qwinters/qwinters/issues/new/choose/">
  <img alt="GitHub issues" src="https://img.shields.io/github/issues/qwinters/qwinters?color=orange&label=%E2%9C%85%20%20%20File%20an%20issue&style=flat-square">
</a>

If you are looking to make a contribution, but don't know where to start, please take a look through the [Course Repo Template Project](https://github.com/users/qwinters/projects/11). Specifically any issue that is marked as "prioritized" but not marked as in-progress is a good one to take on. If you want to take on one of those issues, please just comment on the issue. 

Generally speaking, other ideas not in the issues are welcome as well, but not all ideas are equal priority. In general here's the how I'm prioritizing pull requests:

#### High priority
* Improvements for automation workflows
* Improvements for editing markdown files (e.g. converting with Pandoc, better support for macros, etc)
* Additional TeX formats (e.g. Beamer templates)
* Major publishing improvements (e.g. adding additional export formats for notes/homework)
* Support for programming assignments (esp. ipynb which would ideally be rendered for the GitHub pages sites)
* Any major issues with TeX files

#### Low priority / highly unlikely to be merged
* Specific requests for macros
* Stylistic changes to the TeX templates (unless there's a really really good reason)
