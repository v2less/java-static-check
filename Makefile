include make_env

NS ?= sgwilbur
VERSION ?= latest

IMAGE_NAME ?= java-preflight-checks
CONTAINER_NAME ?= java-preflight-checks
CONTAINER_INSTANCE ?= default

WORK_DIR ?= target
TARGET_DIR ?= $(WORK_DIR)/opt

.PHONY: build push shell run start stop rm release clean

clean:
		rm -rf $(WORK_DIR)

$(WORK_DIR):
		mkdir -p $(WORK_DIR) $(TARGET_DIR)

$(TARGET_DIR)/checkstyle.jar: $(WORK_DIR)
		test -f $@ || wget -O $(TARGET_DIR)/checkstyle.jar $(CHECKSTYLE_RELEASE_URL)

checkstyle: $(TARGET_DIR)/checkstyle.jar

$(WORK_DIR)/pmd-bin-6.15.0.zip: $(WORK_DIR)
		test -f $@ || wget -O $(WORK_DIR)/pmd-bin-6.15.0.zip $(PMD_RELEASE_URL)

$(TARGET_DIR)/pmd: $(WORK_DIR)/pmd-bin-6.15.0.zip
		cd $(TARGET_DIR) && unzip ../pmd-bin-6.15.0.zip && mv pmd-bin-6.15.0 pmd

pmd: $(TARGET_DIR)/pmd

build: Dockerfile checkstyle pmd
		docker build -t $(NS)/$(IMAGE_NAME):$(VERSION) -f Dockerfile .

push:
		docker push $(NS)/$(IMAGE_NAME):$(VERSION)

shell:
		docker run --rm --name $(CONTAINER_NAME)-$(CONTAINER_INSTANCE) -i -t $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(IMAGE_NAME):$(VERSION) /bin/sh

# run:
# 		docker run --rm --name $(CONTAINER_NAME)-$(CONTAINER_INSTANCE) $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(IMAGE_NAME):$(VERSION)
#
# start:
# 		docker run -d --name $(CONTAINER_NAME)-$(CONTAINER_INSTANCE) $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(IMAGE_NAME):$(VERSION)
#
# stop:
# 		docker stop $(CONTAINER_NAME)-$(CONTAINER_INSTANCE)

rm:
		docker rm $(CONTAINER_NAME)-$(CONTAINER_INSTANCE)

default: build
