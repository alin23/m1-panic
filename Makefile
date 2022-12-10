panic: export SHELL=$$(which fish)
panic:
	node ./test.js & \
		echo test.js | entr -s 'echo "New files"'
