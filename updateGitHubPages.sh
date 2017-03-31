#
# Fix the GitHubPages mess (when branch gh-pages is activated)
# http://stackoverflow.com/questions/11577147/how-to-fix-page-404-on-github-page
#

git push origin --delete gh-pages && \
git branch -D gh-pages && \
git init && \
git branch gh-pages && \
git push origin gh-pages
