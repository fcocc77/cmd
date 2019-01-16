
# ignora todos los archivos nuevos creados
	git ls-files --others --exclude-standard >> .gitignore

# force push
	git push origin master --force

# reset local files
	git reset --hard

# add new files
	git add --all

# clone repository
	cd project folder	
	git init
	git clone "https://user:passwd@bitbucket.org/fcocc77/cats_farm.git"

# get remote repository
	git remote -v

# remove branch
	git branch -d "branch"

# create tag
	git tag -a 1.0 -m "details"
	git push --tags

# guarda credenciales de usuario y password
	git config credential.helper store
