build:
	docker build -t my-landing:latest .

run:
	docker run -it --rm my-landing:latest

push:
	docker tag my-landing:latest localhost:32000/my-landing:latest
	docker push localhost:32000/my-landing:latest
