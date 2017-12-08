# SimpleWebHook (SFDX)

Example force.com project to integrate with IFTTT webhooks (https://ifttt.com/maker_webhooks).

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


## Description of Files and Directories


## Issues


