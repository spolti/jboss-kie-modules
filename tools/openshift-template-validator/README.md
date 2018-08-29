# OpenShift Template Validator




#### How to Use




#### Converting yaml to json



#### Verifying custom annotations



#### Verifying template version



#### Strict mode



#### Dumping template parameters for troubleshooting



#### 



The openshift-template-validator tool have the purpose to help OpenShift Application Template developers to avoid mistakes
like syntax issues, invalid values for a kind of Object parameter

#### Troubleshooting

If you trying to validate the template and a similar issue happens:

```bash
$ openshift-template-validator validate -t /data/dev/sources/rhdm-7-openshift-image/templates/rhdm71-full.yaml 
Validating file /data/dev/sources/rhdm-7-openshift-image/templates/rhdm71-full.yaml
Errors found: {
  "PreValidation-12-*v1.DeploymentConfig": [
    "unrecognized type: int32"
  ]
}

```

try to enable the verbose mode with the flag -vv to get more information about the issue:


```bash
$ openshift-template-validator validate -t /data/dev/sources/rhdm-7-openshift-image/templates/rhdm71-full.yaml --vv
Validating file /data/dev/sources/rhdm-7-openshift-image/templates/rhdm71-full.yaml -> replacing Template apiVersion from v1 to template.openshift.io/v1
Error on converting Unstructured object unrecognized type: int32
A possible error happened on object kind '*v1.DeploymentConfig' and name 'myapp-kieserver' while parsing container ports [{jolokia 0 0  } { 0 0  } { 0 0  }]
recovered from  runtime error: invalid memory address or nil pointer dereference

Errors found: {
  "PreValidation-12-*v1.DeploymentConfig": [
    "unrecognized type: int32"
  ]
}
```

In this case, the issue was a string character in the container port definition on the template:

```yaml
          ports:
          - name: jolokia
            containerPort: 8778s
```