dev:
	ENV="development" ghcid -c "stack ghci" --test ":main" & \
	# ENV="development" stack ghci --ghci-options "-e Main.development" & \
	# npx tailwindcss -c tailwind.config.js -i src/styles.css -o public/styles.css --minify --watch & \
	wait
