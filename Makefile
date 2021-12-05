panic: export SHELL=$$(which fish)
panic:
	npx --yes tailwindcss --jit -i temp.css -o app.css -w & \
		echo temp.css | entr -s 'echo "New files"'
