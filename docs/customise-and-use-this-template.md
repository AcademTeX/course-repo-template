## How-to: Customize and use this template

Because its virtually impossible to offer a universal setup that works for everyone, I recommend that every person fork this template for their own needs and then customize the template to fit their personal workflow. 

#### Forking and Customization
Every time you fork this template here's what I would recommend changing: 
- [ ] Personal information in the `notes.tex` and `homework01/hwk01.tex` files (e.g. author, university, student identifier)
- [ ] GitHub pages config and theme (in particular, it's nice when you have your template match your website)
- [ ] Issue auto assign settings in `.github/configs/auto-assign-config.yml`
- [ ] Compile scripts in `.github/scripts/compile.sh` to fit your personal LaTeX compilation preferences
- [ ] Macros in `preamble/macros.tex` to match your personal macro setup
- [ ] Packages and theme in `preamble/packages.tex` to match your personal style preferences (e.g. adding a university logo, tweaking colors etc)

#### Changes required for each time you use the template
When you use your customized template, you will still have to tweak individual small settings for each repo. Here's a list of what's usually a best practice to change
- [ ] Any additional changes from the list above that you want to make only for a specific course repo instance
- [ ] Course information in `notes.tex` and `homework01/hwk01.tex`
- [ ] Preface information in `notes/frontmatter/preamble.tex`
- [ ] Macros for your specific course in `preamble/macros.tex` (e.g. Quantum macros that aren't needed frequently)
- [ ] Information for the specif course on `gh-pages/index.md` and `gh-pages/_config.yml`

