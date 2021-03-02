yarn upgrade identic-bounce
git add .
git commit -m "identic-bounce обновлена до последней версии"
git push

# Эта строка предполагает что
# ссылка (link) ИЗ папки, где разрабатывается непосредственно identic-bounce,
# уже сделана.
npm link identic-bounce
