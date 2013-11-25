@echo off
echo -------------------------------------------------------------------------
echo deploying rampart...
echo -------------------------------------------------------------------------

md %WSFC_HOME%\modules\rampart\
copy modules\rampart\mod_rampart.dll %WSFC_HOME%\modules\rampart\
copy modules\rampart\module.xml %WSFC_HOME%\modules\rampart\
copy modules\rampart\mod_rampart.* %WSFC_HOME%\lib\

md %WSFC_HOME%\modules\rahas\
copy modules\rahas\mod_rahas.dll %WSFC_HOME%\modules\rahas\
copy modules\rahas\module.xml %WSFC_HOME%\modules\rahas\module.xml
copy modules\rahas\mod_rahas.* %WSFC_HOME%\lib\

md %WSFC_HOME%\services\sec_echo\
copy bin\samples\services\sec_echo\sec_echo.dll %WSFC_HOME%\services\sec_echo\
copy bin\samples\services\sec_echo\services.xml %WSFC_HOME%\services\sec_echo\

md %WSFC_HOME%\services\secconv_echo\
copy bin\samples\services\secconv_echo\secconv_echo.dll %WSFC_HOME%\services\secconv_echo\
copy bin\samples\services\secconv_echo\services.xml %WSFC_HOME%\services\secconv_echo\

md %WSFC_HOME%\services\saml_sts\
copy bin\samples\services\saml_sts\saml_sts.dll %WSFC_HOME%\services\saml_sts\
copy bin\samples\services\saml_sts\services.xml %WSFC_HOME%\services\saml_sts\

md %WSFC_HOME%\bin\samples\rampart\
md %WSFC_HOME%\bin\samples\rampart\authn_provider\
copy bin\samples\authn_provider\authn.dll %WSFC_HOME%\bin\samples\rampart\authn_provider\

md %WSFC_HOME%\bin\samples\rampart\replay_detector\
copy bin\samples\replay_detector\rdflatfile.dll %WSFC_HOME%\bin\samples\rampart\replay_detector\

md %WSFC_HOME%\bin\samples\rampart\sct_provider\
copy bin\samples\sct_provider\sctprovider.dll %WSFC_HOME%\bin\samples\rampart\sct_provider\
copy bin\samples\sct_provider\sctprovider_hashdb.dll %WSFC_HOME%\bin\samples\rampart\sct_provider\

md %WSFC_HOME%\bin\samples\rampart\data\
copy bin\samples\data\passwords.txt %WSFC_HOME%\bin\samples\rampart\data\

md %WSFC_HOME%\bin\samples\rampart\client\
md %WSFC_HOME%\bin\samples\rampart\client\sec_echo\
copy bin\samples\client\sec_echo\echo.exe %WSFC_HOME%\bin\samples\rampart\client\sec_echo\

md %WSFC_HOME%\bin\samples\rampart\client\saml_echo\
copy bin\samples\client\saml_echo\echo.exe %WSFC_HOME%\bin\samples\rampart\client\saml_echo\

md %WSFC_HOME%\bin\samples\rampart\client\issued_token\
copy bin\samples\client\issued_token\echo.exe %WSFC_HOME%\bin\samples\rampart\client\issued_token\

md %WSFC_HOME%\bin\samples\rampart\callback
copy bin\samples\callback\pwcb.dll %WSFC_HOME%\bin\samples\rampart\callback\

md %WSFC_HOME%\bin\samples\rampart\credential_provider
copy bin\samples\credential_provider\cred_provider.dll %WSFC_HOME%\bin\samples\rampart\credential_provider\

xcopy bin\samples\keys %WSFC_HOME%\bin\samples\rampart\keys\ /E /I /Y /S

copy bin\samples\services\sec_echo\server_axis2.xml %WSFC_HOME%\axis2.xml

echo -------------------------------------------------------------------------
echo Rampart deployed
echo -------------------------------------------------------------------------
@echo on
