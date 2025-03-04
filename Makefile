NAMESPACE ?= registry-system

resource:
	sed "s/__NAMESPACE__/${NAMESPACE}/g" kustomization.template > kustomization.yaml
	sed -i "s/__REG__/${REGISTRY}/g" kustomization.yaml
	kubectl kustomize . > resource.yml

deploy: resource
	kubectl apply -f resource.yml

clean:
	-kubectl delete -f resource.yml
	-rm -rf kustomization.yaml resource.yml