send:
	poetry run python gen.py
	git add .
	git commit -m "Update"
	git push
