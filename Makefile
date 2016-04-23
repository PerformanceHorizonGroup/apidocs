all:
	./node_modules/.bin/hercule src/apiary.apib -o apiary.apib
	./node_modules/.bin/hercule src/internal.apib -o internal.apib
