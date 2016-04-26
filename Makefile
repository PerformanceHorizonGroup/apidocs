all:
	./node_modules/.bin/hercule src/apiary.apib -o apiary.apib
	./node_modules/.bin/hercule src/internal.apib -o internal.apib

publish:
	@apiary publish --api-name=performancehorizon
	@apiary publish --path=internal.apib --api-name=performancehorizoninternal

clean:
	@rm -fr apiary.apib internal.apib
