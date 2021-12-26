## How-to: Git Release Workflow

A lot of mathematicians have not worked with git before, but if you are using this repository, it's fairly save to assume that you have done at least the bare minimum in git. Most everything is the same here, but it is worthwhile to highlight some of the major workflow differences that make this important. 

This repository works on a release-based system. Specifically it differentiates how to publish things to your website and when to run certain actions based on if you are creating a release or not. 

#### What happens when you commit to main?

When you commit to the main branch or you open a pull request against the main branch, your code will automatically be checked for LaTeX style issues using [chktex](https://www.nongnu.org/chktex/). There is a configuration file for chktex in the main folder as `.chktexrc`. The workflow here is run automatically using [LaTeX linter GitHub action](https://github.com/marketplace/actions/latex-linter-chktex). It will fail if you have poorly written LaTeX code. You should see this a red "X" by the most recent commit or by checking the "Actions" tab for your repository. 

In addition to checking your LaTeX code, whenever you commit to the main branch, if you have made any changes to the PDF or markdown files in `lectures/`, the changes will be mirrored into the `gh-pages` folder, and subsequently be updated/published on the website for the course (if you have set that up). 

Most importantly, the following **are not done when committing to main**:
* commits to main do not compile homework LaTeX files
* commits to main do not compile notes LaTeX files
* commits to main do not affect the PDFs published in `gh-pages/assets/files/{tex-notes, homework}`

In order to change any of those / do anything you have to use the **release workflow** described below.

#### What happens when you "create a release" and how do you do that?

The idea of a release is to bundle up changes that you have had time to thoroughly review and approve and push them all out the public at once. If your repository is public of course people can see these changes in GitHub, but if your repository is private, changes to LaTeX files are not automatically mirrored to publicly available PDFs 

The full release process is governed by the file `./github/workflows/new-release.yml`, but the basic overview of what happen is as follows:
* A changelog is generated using [generate-changelog action](https://github.com/ScottBrenner/generate-changelog-action) and placed in both the main directory's `CHANGELOG.md` and `gh-pages/CHANGELOG.md`
* Notes are compiled using [texlive action]() + notes compile script; notes are then committed to the `notes` folder and `gh-pages/assets/files/tex-notes` folder
* Homeworks are compiled using [texlive action]() + homework compile script in `homework/homeworkNN` folders. Encrypted copies are generated using the encryption script and put into the `gh-pages/assets/files/homework`. The regular copies are committed to the `homework` directory and the encrypted copies are commited to `gh-pages`
* A release is created on the GitHub repo and all the assets are uploaded as a zip file and the release body is updated with the changelog

Creating a release is extremely easy and done automatically whenever you push up a tag in the format of `#.#.#`. If you have not done this before by yourself, the easiest way to tag a release is to run the following in the git repo on your computer:

```shell 
git tag 1.0.0 # or whatever other tag you want
git push --tags
```

#### What is a changelog and what should I know about it?

As mentioned above, part of the release formula will automatically generate a changelog for your release. A changelog is basically a list of the changes you made to all the files across the repository based on your commit message. Changes can be categorized and organized by the parts of the repo you changed. In order to do that your commits need to be in the format of 

```shell
git commit -m "type(scope): Changes made"
```

For a thorough overview of the formatting requirements, look at the [README for generate-changlog action](https://github.com/ScottBrenner/generate-changelog-action). My recommendation is to use the following types:
* `feat` - Use this for new additions of chapters, sections, problems, proofs, and other additive changes; this includes adding clarity to text
* `fix` - Use this for when you have to go back and correct errors including minor errors in typesetting and major errors in mathematical logic
* `style` - Use this for when you are updating any stylistic aspects of the LaTeX files and blog (e.g. themes, fonts etc)
* `docs` - Use this for changes to how-to's for your self, the read me, and others like that
* `chore` - Use this for minor changes that you have to make that do not deserve to be included in the changelog

I also recommend using the following "scopes":
* `notes` - Changes  in the `notes/` directory along with the `lectures/` directory
* `homework` - Changes or additions to the homework files
* `gh-pages` - Changes related to the website for  the course
* `macros` - Changes to the macros files
* `preamble` - Changes to the preamble (that are NOT macros)
* `ci` - Changes to the GitHub workflows automations
* `changelog` - Changes to the `CHANGELOG.md` files (usually you should not have to change these manually)

For an example of what a changelog looks like, see [CHANGELOG.md](../CHANGELOG.md).
