set executable=.\modules\openapi-generator-cli\target\openapi-generator-cli.jar

If Not Exist %executable% (
  mvn clean package
)

REM set JAVA_OPTS=%JAVA_OPTS% -Xmx1024M
set ags=generate -i modules\openapi-generator\src\test\resources\2_0\petstore-with-fake-endpoints-models-for-testing.yaml -g swift3-deprecated -c bin\swift3-petstore-rxswift.json -o samples\client\petstore\swift3\rxswift

java %JAVA_OPTS% -jar %executable% %ags%
