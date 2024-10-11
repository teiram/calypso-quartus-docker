VERSION = 0.1

build:
	docker build -t calypso-quartus-docker .

upload:
	echo $(CR_PAT) | docker login ghcr.io -u teiram --password-stdin
	docker tag calypso-quartus-docker:latest ghcr.io/teiram/calypso-quartus-docker:0.1
	docker push ghcr.io/teiram/calypso-quartus-docker:$(VERSION)
