all:
	./node_modules/.bin/hercule src/apiary.apib -o apiary.apib

publish:
	@apiary publish --api-name=performancehorizon

clean:
	@rm -fr apiary.apib
