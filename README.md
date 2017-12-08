# SimpleWebHook ([SFDX](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm))

Example force.com project to integrate with IFTTT webhooks ([maker webhooks](https://ifttt.com/maker_webhooks)).

## Installation
```
sfdx force:auth:web:login
sfdx force:source:convert -d mdapipkg_output/ --packagename <PACKAGENAME>
sfdx force:mdapi:deploy -c -d ./mdapipkg_output -u <sfdc.USERNAME>
```

Configure [Process Builder](Workflow.png) flow to trigger POST to Webhook.

## Tests
```
sfdx force:apex:test:run -u <sfdc.USERNAME> -r human -w 2 -n SimpleWebHookTest
```

## Description of Files and Directories

##### All the Apex is here
[force-app/main/default/classes](/force-app/main/default/classes)

##### Callout to URL, does most of the work
[SimpleWebHook.cls](/force-app/main/default/classes/SimpleWebHook.cls)

##### Async wrapper for the Callout
[SimpleWebHookQueueable.cls](/force-app/main/default/classes/SimpleWebHookQueueable.cls)

##### Invocable wrapper for the Callout
[SimpleWebHookInvocable.cls](/force-app/main/default/classes/SimpleWebHookInvocable.cls)

##### Unit test
[SimpleWebHookTest.cls](/force-app/main/default/classes/SimpleWebHookTest.cls)

## Useful SFDX commands

##### Authorize SFDX to access an org.
```
$> sfdx force:auth:web:login
```
##### Create new SFDX project. CD into project folder.
```
$> sfdx force:project:create --projectname <PROJECT NAME>
```
##### Set the default user name to be used with the Org.
```
$> sfdx force:config:set defaultusername=<USERNMAE>
```
##### Open the default force.com org in a browser
```
$> sfdx force:org:open
```
##### Get a package's metadata from the Org. Downloads a Zip file needs to be unzipped.
```
$> sfdx force:mdapi:retrieve -s -r .\mdapipkg -u <USERNAME> -p <PACKAGENAME>
```
##### Convert metadata package to SFDX project format.
```
$> sfdx force:mdapi:convert -r .\mdapipkg
```
##### Convert SFDX project format to metadata package.
```
$> sfdx force:source:convert -d mdapipkg_output/ --packagename <PACKAGENAME>
```
##### Run all tests
```
$> sfdx force:apex:test:run
```
##### Run named tests
```
$> sfdx force:apex:test:run -n <CLASSNAME,CLASSNAME>
```
##### Get test report in format human, tap, json, or junit.
```
$> sfdx force:apex:test:report -i <TESTRUNID> -r <human|tap|json|junit>
```
##### Metadata deploy to org check only.
```
$> sfdx force:mdapi:deploy -c -d .\mdapipkg_output -l RunSpecifiedTests -r <CLASSNAME,CLASSNAME>
```
##### Metadata deploy to org.
```
$> sfdx force:mdapi:deploy -d .\mdapipkg_output -l RunSpecifiedTests -r <CLASSNAME,CLASSNAME>
```
##### Get deploy report.
```
$> sfdx force:mdapi:deploy:report
```

## Resources


## Issues


