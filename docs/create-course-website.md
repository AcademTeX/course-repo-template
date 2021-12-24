## How-to: Create course website

If you have never created a GitHub pages website before, it's recommended that you first create your own personal GitHub pages site and to make the themes match. If you want an example, you can see [qwinters/qwinters.github.io](https://github.com/qwinters/qwinters.github.io). GitHub also provides [excellent documentation](https://docs.github.com/en/pages)

To set up this website for GitHub pages use, you simply need to complete the following checklist:
- [ ] Change the name and description of the site in `gh-pages/_config.yml`
- [ ] Upload an image file for your log to `gh-pages/assets/img` and change the image in `gh-pages/_config.yml`
- [ ] Update `gh-pages/index.md` as you like
- [ ] (Optional) Tweak any MathJax settings in `gh-pages/_includes/head-custom.html`
- [ ] (Optional) Add custom heading information to `gh-pages/_includes/head-custom.html`
- [ ] (Optional) Tweak the layouts and the themes to match your personal GitHub pages site
- [ ] Tag a release (e.g. 0.0.1) by running 
```shell
git tag 0.0.1
git push --tags 
```
and wait for the actions to build and deploy `gh-pages` to the branch `website`
- [ ] Navigate to repo settings > pages and enable GitHub pages based off of the root of `website`
- [ ] Navigate to `{username}.github.io/{repo-name}` and behold your website
