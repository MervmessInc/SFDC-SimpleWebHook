# SimpleWebHook (SFDX)

Example force.com project to integrate with IFTTT webhooks (https://ifttt.com/maker_webhooks).

## Useful SFDX commands

$> sfdx force:auth:web:login
    ~ Authorize SFDX to access an org.

$> sfdx force:project:create --projectname MyDevOrg
    ~ Create new SFDX project. CD into project folder.

$> sfdx force:config:set defaultusername=<USERNMAE>
    ~ Set the default user name to be used with the Org.

$> sfdx force:org:open
    ~ Open the default force.com org in a browser

$> sfdx force:mdapi:retrieve -s -r .\mdapipkg -u <USERNAME> -p <PACKAGENAME>
    ~ Get a package's metadata from the Org. Downloads a Zip file needs to be unzipped.

$> sfdx force:mdapi:convert -r .\mdapipkg
    ~ Convert metadata package to SFDX project format.

$> sfdx force:source:convert -d mdapipkg_output/ --packagename <PACKAGENAME>
    ~ Convert SFDX project format to metadata package.

$> sfdx force:apex:test:run
    ~ Run all tests

$> sfdx force:apex:test:run -n <CLASSNAME,CLASSNAME>
    ~ Run named tests

$> sfdx force:apex:test:report -i <TESTRUNID> -r <human|tap|json|junit>
    ~ Get test report in format human, tap, json, or junit.

$> sfdx force:mdapi:deploy -c -d .\mdapipkg_output -l RunSpecifiedTests -r <CLASSNAME,CLASSNAME>
    ~ Metadata deploy to org check only.

$> sfdx force:mdapi:deploy -d .\mdapipkg_output -l RunSpecifiedTests -r <CLASSNAME,CLASSNAME>
    ~ Metadata deploy to org.    

$> sfdx force:mdapi:deploy:report
    ~ Get deploy report.

## Resources


## Description of Files and Directories


## Issues


