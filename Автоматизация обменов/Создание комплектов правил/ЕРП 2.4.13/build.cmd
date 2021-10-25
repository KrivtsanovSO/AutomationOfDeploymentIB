chcp 1251

del toir\toir.zip
del erp\erp.zip

copy Rules\toir_erp.xml erp\CorrespondentExchangeRules.xml
copy Rules\erp_toir.xml erp\ExchangeRules.xml

copy Rules\toir_erp.xml toir\ExchangeRules.xml
copy Rules\erp_toir.xml toir\CorrespondentExchangeRules.xml

copy Rules\erp_RegistrationRules.xml erp\RegistrationRules.xml
copy Rules\toir_RegistrationRules.xml toir\RegistrationRules.xml

"C:\Program Files\7-Zip\7z" a .\toir\toir.zip .\toir\*
"C:\Program Files\7-Zip\7z" a .\erp\erp.zip .\erp\*