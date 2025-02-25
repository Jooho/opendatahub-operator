module github.com/kubeflow/kfctl/v3

require (
	cloud.google.com/go v0.57.0
	github.com/Azure/go-autorest v13.3.3+incompatible // indirect
	github.com/MakeNowJust/heredoc v1.0.0 // indirect
	github.com/Sirupsen/logrus v0.0.0-00010101000000-000000000000 // indirect
	github.com/aws/aws-sdk-go v1.39.2
	github.com/cenkalti/backoff v2.2.1+incompatible
	github.com/chai2010/gettext-go v0.0.0-20170215093142-bf70f2a70fb1 // indirect
	github.com/coreos/prometheus-operator v0.38.1-0.20200424145508-7e176fda06cc // indirect
	github.com/deckarep/golang-set v1.7.1
	github.com/docker/docker v1.13.1 // indirect
	github.com/docker/spdystream v0.0.0-20181023171402-6480d4af844c // indirect
	github.com/elazarl/goproxy v0.0.0-20190711103511-473e67f1d7d2 // indirect
	github.com/elazarl/goproxy/ext v0.0.0-20190711103511-473e67f1d7d2 // indirect
	github.com/fatih/color v1.10.0
	github.com/ghodss/yaml v1.0.1-0.20190212211648-25d852aebe32
	github.com/go-openapi/spec v0.19.5 // indirect
	github.com/go-yaml/yaml v2.1.0+incompatible
	github.com/gogo/protobuf v1.3.1
	github.com/golangplus/testing v0.0.0-20180327235837-af21d9c3145e
	github.com/google/go-cmp v0.4.0
	github.com/google/uuid v1.1.1 // indirect
	github.com/gregjones/httpcache v0.0.0-20190611155906-901d90724c79 // indirect
	github.com/hashicorp/go-getter v1.0.2
	github.com/hashicorp/go-version v1.2.1
	github.com/imdario/mergo v0.3.8
	github.com/jlewi/cloud-endpoints-controller v0.0.0-20200604211613-aff0aaad5602
	github.com/kubernetes-sigs/application v0.8.0
	github.com/onrik/logrus v0.5.1
	github.com/onsi/gomega v1.10.2 // indirect
	github.com/openshift/api v3.9.1-0.20190924102528-32369d4db2ad+incompatible
	github.com/operator-framework/operator-lifecycle-manager v0.0.0-20191115003340-16619cd27fa5
	github.com/operator-framework/operator-sdk v1.2.0
	github.com/otiai10/copy v1.0.2
	github.com/pkg/errors v0.9.1
	github.com/prometheus/client_golang v1.5.1 // indirect
	github.com/prometheus/common v0.9.1
	github.com/sirupsen/logrus v1.6.0
	github.com/spf13/cobra v1.0.0
	github.com/spf13/pflag v1.0.5
	github.com/spf13/viper v1.4.0
	github.com/tektoncd/pipeline v0.10.1
	github.com/tidwall/gjson v1.6.0
	github.com/tidwall/pretty v1.0.1 // indirect
	go.uber.org/zap v1.12.0 // indirect
	golang.org/x/crypto v0.0.0
	golang.org/x/net v0.0.0-20210614182718-04defd469f4e
	golang.org/x/oauth2 v0.0.0-20200107190931-bf48bf16ab8d
	golang.org/x/tools v0.0.0-20200815165600-90abf76919f3 // indirect
	google.golang.org/api v0.25.0
	google.golang.org/genproto v0.0.0-20200430143042-b979b6f78d84
	gopkg.in/airbrake/gobrake.v2 v2.0.9 // indirect
	gopkg.in/gemnasium/logrus-airbrake-hook.v2 v2.1.2 // indirect
	gopkg.in/yaml.v2 v2.3.0
	k8s.io/api v0.18.8
	k8s.io/apiextensions-apiserver v0.18.8
	k8s.io/apimachinery v0.18.8
	k8s.io/cli-runtime v0.0.0
	k8s.io/client-go v12.0.0+incompatible
	k8s.io/kube-aggregator v0.0.0
	k8s.io/kube-openapi v0.0.0-20200410145947-61e04a5be9a6 // indirect
	k8s.io/kubernetes v1.16.2
	sigs.k8s.io/controller-runtime v0.6.3
	sigs.k8s.io/kustomize/v3 v3.2.0
	sigs.k8s.io/yaml v1.1.0
)

replace (
	git.apache.org/thrift.git => github.com/apache/thrift v0.0.0-20180902110319-2566ecd5d999
	github.com/Sirupsen/logrus => github.com/sirupsen/logrus v1.0.5
	github.com/coreos/prometheus-operator => github.com/coreos/prometheus-operator v0.34.0
	github.com/go-openapi/jsonpointer => github.com/go-openapi/jsonpointer v0.17.0
	github.com/go-openapi/jsonreference => github.com/go-openapi/jsonreference v0.17.0
	github.com/go-openapi/spec => github.com/go-openapi/spec v0.18.0
	github.com/go-openapi/swag => github.com/go-openapi/swag v0.17.0
	github.com/mitchellh/go-homedir => github.com/mitchellh/go-homedir v1.0.0
	github.com/openshift/api => github.com/openshift/api v0.0.0-20171215170046-3922a2604003
	github.com/operator-framework/operator-sdk => github.com/operator-framework/operator-sdk v0.13.0
	github.com/otiai10/copy => github.com/otiai10/copy v1.0.2
	github.com/otiai10/mint => github.com/otiai10/mint v1.3.0
	github.com/russross/blackfriday => github.com/russross/blackfriday v1.5.2-0.20180428102519-11635eb403ff // indirect
	golang.org/x/crypto => golang.org/x/crypto v0.0.0-20181203042331-505ab145d0a9
	k8s.io/api => k8s.io/api v0.0.0-20190620084959-7cf5895f2711
	k8s.io/apiextensions-apiserver => k8s.io/apiextensions-apiserver v0.0.0-20190620085554-14e95df34f1f
	k8s.io/apimachinery => k8s.io/apimachinery v0.0.0-20190612205821-1799e75a0719
	k8s.io/apiserver => k8s.io/apiserver v0.0.0-20190620085212-47dc9a115b18
	k8s.io/cli-runtime => k8s.io/cli-runtime v0.0.0-20190620085706-2090e6d8f84c
	k8s.io/client-go => k8s.io/client-go v0.0.0-20190620085101-78d2af792bab
	k8s.io/cloud-provider => k8s.io/cloud-provider v0.0.0-20190620090043-8301c0bda1f0
	k8s.io/cluster-bootstrap => k8s.io/cluster-bootstrap v0.0.0-20190620090013-c9a0fc045dc1
	k8s.io/code-generator => k8s.io/code-generator v0.0.0-20190612205613-18da4a14b22b
	k8s.io/component-base => k8s.io/component-base v0.0.0-20190620085130-185d68e6e6ea
	k8s.io/cri-api => k8s.io/cri-api v0.0.0-20190531030430-6117653b35f1
	k8s.io/csi-translation-lib => k8s.io/csi-translation-lib v0.0.0-20190620090116-299a7b270edc
	k8s.io/kube-aggregator => k8s.io/kube-aggregator v0.0.0-20190620085325-f29e2b4a4f84
	k8s.io/kube-controller-manager => k8s.io/kube-controller-manager v0.0.0-20190620085942-b7f18460b210
	k8s.io/kube-proxy => k8s.io/kube-proxy v0.0.0-20190620085809-589f994ddf7f
	k8s.io/kube-scheduler => k8s.io/kube-scheduler v0.0.0-20190620085912-4acac5405ec6
	k8s.io/kubectl => k8s.io/kubectl v0.0.0-20191016120415-2ed914427d51
	k8s.io/kubelet => k8s.io/kubelet v0.0.0-20190620085838-f1cb295a73c9
	k8s.io/kubernetes => k8s.io/kubernetes v1.15.0
	k8s.io/legacy-cloud-providers => k8s.io/legacy-cloud-providers v0.0.0-20190620090156-2138f2c9de18
	k8s.io/metrics => k8s.io/metrics v0.0.0-20190620085625-3b22d835f165
	k8s.io/sample-apiserver => k8s.io/sample-apiserver v0.0.0-20190620085408-1aef9010884e
	sigs.k8s.io/application => sigs.k8s.io/application v0.0.0-20190404151855-67ae7f915d4e
	sigs.k8s.io/controller-runtime => sigs.k8s.io/controller-runtime v0.2.0
	sigs.k8s.io/kustomize/v3 => sigs.k8s.io/kustomize/v3 v3.2.0
)

go 1.13
