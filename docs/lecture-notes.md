## How-to: Lecture Notes

If you are looking to write lecture notes live in class, generally speaking LaTeX isn't the best format. That being said, for some, perhaps it is. The following are three recommended different ways of taking lecture notes with this repo format, all of which are supported by GitHub automations

### Handwriting: Take notes by hand and upload them as PDFs

If you choose to do this, you will probably be using an iPad, Tablet, or Paper notebook. In this case,  whenever you commit a PDF file to the folder `lectures`, that file will be copied and published on your website under `gh-pages/assets/files/raw-notes`. 

You can reference these files on the `gh-pages` site as you would reference any other PDF asset, but  there is no current automation for this, but it is on the roadmap (see [#issues/21](https://github.com/qwinters/course-repo-template/issues/21)).

### Markdown: Write in `YYYY-MM-DD-lectureNN.md` files

If you choose to write your notes in markdown and publish them as blog posts on the main page of your gh-pages set, you can write them in `lectures` folder using the format `YYYY-MM-DD-title.md`. When you do this lecture notes will automatically be copied into the `gh-pages/_posts` folder. 

### LaTeX (not recommended): Write directly in `notes.tex`

If you are strong enough in LaTeX during lecture, you can simply use the regular `notes` folder. Alternatively, you can write LaTeX notes in the `lectures` folder and **PDF** files will be automatically updated on the website. Note that unlike the notes section, LaTeX files are not compiled from this folder and not posted on the website. 
